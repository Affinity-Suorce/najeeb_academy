import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/dialog_build_context.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/features/auth/ui/login/login_page.dart';
import 'package:najeeb_academy/features/home/presentation/privacy_poilcy.dart';
import 'package:najeeb_academy/features/profile/presentation/widgets/user_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    DI.userInfoService.updateUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final student = DI.userInfo.student;
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          await DI.userInfoService.updateUserInfo();
          setState(() {});
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: UserImage(image: student?.image),
            ),
            // const Padding(
            //   padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
            //   child: Navbar(
            //     title: "حسابي",
            //     color: Colors.black,
            //   ),
            // ),
            // const SizedBox(
            //   height: 44,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: const [
            //     GoToWidget(
            //       title: "مدفوعاتي",
            //     ),
            //     GoToWidget(
            //       title: "الرئيسية",
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 34,
            // ),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 31),
            //   decoration: const BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.all(Radius.circular(13)),
            //       boxShadow: [
            //         BoxShadow(
            //             color: Color(0x669e9e9e),
            //             spreadRadius: 1,
            //             blurRadius: 6,
            //             offset: Offset(6, 6))
            //       ]),
            //   child: ClipRRect(
            //     borderRadius: const BorderRadius.all(Radius.circular(13)),
            //     child: DropdownButtonFormField<String>(
            //         decoration: const InputDecoration(
            //           border: InputBorder.none,
            //           fillColor: Colors.white,
            //           filled: true,
            //           contentPadding:
            //               EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            //         ),
            //         value: "العربية",
            //         onChanged: (type) {
            //           // onSelect(type);
            //         },
            //         style: const TextStyle(color: Colors.black, fontSize: 18),
            //         items: const [
            //           DropdownMenuItem(
            //             value: "العربية",
            //             child: Text(
            //               "العربية",
            //             ),
            //           ),
            //           DropdownMenuItem(
            //             value: "الانكليزية",
            //             child: Text(
            //               "الانكليزية",
            //             ),
            //           ),
            //         ]),
            //   ),
            // ),
            // const SizedBox(
            //   height: 12,
            // ),
            Container(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 25, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      child: ListTile(
                        title: const Text('الاسم الكامل'),
                        subtitle: Text(student?.name ?? ''),
                      ),
                    ),
                    // rowWidget('الاسم الكامل:', student?.name ?? ''),
                    // rowWidget('الاسم الكامل:', 'Adnan Kuzaiz'),
                    const SizedBox(height: 12),
                    // rowWidget('اسم المتسخدم:', student?.username ?? ''),
                    Card(
                      child: ListTile(
                        title: const Text('اسم المتسخدم'),
                        subtitle: Text(student?.username ?? ''),
                      ),
                    ),
                    // rowWidget('الإيميل:', 'adnankuza@gmail.com'),
                    if (student?.phone != null) ...[
                      const SizedBox(height: 12),
                      Card(
                        child: ListTile(
                          title: const Text('الجوال'),
                          subtitle: Text(student?.phone ?? ''),
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.privacy_tip_outlined),
                        title: const Text('سياسة الخصوصية'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PrivacyPolicy(isInLogin: true,)));
                        },
                      ),
                    ),
                    const SizedBox(height: 12),Card(
                      child: ListTile(
                        leading: const Icon(Icons.logout_outlined),
                        title: const Text('تسجيل الخروج'),
                        onTap: () async {
                          await context.showDialog(const AreYouLogOut());
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
class AreYouLogOut extends StatelessWidget {
  const AreYouLogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),borderSide: BorderSide(width: 0.0)),
      title:Row(
          children: [
        const Icon(Icons.info_outline_rounded,color: Colors.black38),
        const SizedBox(width: 10.0,),
        Text("تسجيل خروج",style: GoogleFonts.varela(color: Colors.redAccent),)
      ]),
      content: Text("لن تستطيع تسجيل الدخول لمدة يوم كامل\n\n هل انت متأكد من تسجيل الخروج ؟",style: GoogleFonts.varela(fontSize: 16),),
      actions: [
      SizedBox(
      height: 35.0,
      width: 60.0,
      child:ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              backgroundColor: MaterialStateProperty.all(Colors.redAccent)
            ),
            onPressed: () {
              DI.userInfo.logout();
              DI.router.replaceAll([const LoginRoute()]);
            },
            child: Text("نعم",style: GoogleFonts.varela(),))),
        SizedBox(
          height: 35.0,
        width: 60.0,
        child:ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.all(Colors.green)
            ),
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("لا",style: GoogleFonts.varela()))),
      ],
      actionsAlignment: MainAxisAlignment.spaceAround,
    );
  }
}
