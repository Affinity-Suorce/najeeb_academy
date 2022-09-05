import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/extensions/bottom_sheet_widget.dart';
import 'package:najeeb_academy/app/widgets/bottom_sheet_container.dart';
import 'package:najeeb_academy/app/widgets/button.dart';
import 'package:najeeb_academy/app/widgets/nav_bar.dart';
import 'package:najeeb_academy/app/widgets/text_form_field.dart';
import 'package:najeeb_academy/features/payment/presentation/widgets/my_payments_widget.dart';

const TextStyle textStyle1 = TextStyle(
  color: AppColors.purple,
  height: 1.4,
  fontSize: 18,
  fontWeight: FontWeight.normal,
);
const TextStyle textStyle2 = TextStyle(
  color: AppColors.red600,
  fontSize: 18,
  height: 1.4,
  fontWeight: FontWeight.normal,
);

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
                child: Navbar(
                  title: "مدفوعاتي",
                  color: Colors.black,
                  withdrawer: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TabBar(
                indicatorColor: AppColors.purple,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 84),
                tabs: [
                  Tab(
                    child: Text(
                      'الأقساط',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'الإشتراكات',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.74,
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      listViewWidget(context, 6, 1),
                      listViewWidget(context, 2, 2),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listViewWidget(context, count, type) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        children: [
          searchField(context),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) => type == 1
                    ? MyPaymentsWidget()
                    : MyPaymentsWidget(
                        isSubscription: true,
                      ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 0,
                    ),
                itemCount: count),
          ),
        ],
      ),
    );
  }
}

Widget searchField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
    child: CustomTextFormField(
      textInputAction: TextInputAction.done,
      validator: (p0) => null,
      fillColor: AppColors.searchField,
      textColor: AppColors.purple,
      fontSize: 19,
      prefix: const Padding(
        padding: EdgeInsets.fromLTRB(12, 8, 14, 8),
        child: Icon(
          CupertinoIcons.search,
          color: AppColors.purple100,
          size: 30,
        ),
      ),
      suffix: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 12, 8),
        child: GestureDetector(
          onTap: () async {
            final filter = await BottomSheetContainer(
              draggable: false,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(13)),
                      child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                          ),
                          value: "التاسع",
                          onChanged: (type) {
                            // onSelect(type);
                          },
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                          items: const [
                            DropdownMenuItem(
                              value: "التاسع",
                              child: Text(
                                "التاسع",
                              ),
                            ),
                            DropdownMenuItem(
                              value: "بكالوريا",
                              child: Text(
                                "بكالوريا",
                              ),
                            ),
                            DropdownMenuItem(
                              value: "توفل",
                              child: Text(
                                "توفل",
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    CustomElevatedButton(
                      buttonColor: AppColors.indigo,
                      title: "اختيار",
                      verticalPadding: 6,
                      horizantalPadding:
                          MediaQuery.of(context).size.width * 0.4,
                    )
                  ],
                ),
              ),
            ).showAsBottomSheet(context);
          },
          child: Image.asset(
            "assets/icons/filter.png",
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(14, 0, 10, 14),
      hintText: "ابحث عن فاتورة",
      hintColor: AppColors.purple100,
      textDirection: TextDirection.rtl,
    ),
  );
}
