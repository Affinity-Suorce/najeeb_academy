import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
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
                        leading: const Icon(Icons.logout),
                        title: const Text('تسجيل الخروج'),
                        onTap: () {
                          DI.userInfo.logout().then((success) {
                            if (success) {
                              DI.router.replaceAll([
                                WelcomeRoute(
                                    service: DI.welcomeServiceFactory(),
                                    lastPage: true)
                              ]);
                            }
                          });
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
