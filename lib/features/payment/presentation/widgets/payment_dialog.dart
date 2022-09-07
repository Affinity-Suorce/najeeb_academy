import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/widgets/button.dart';
import 'package:najeeb_academy/app/widgets/text_form_field.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.001),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
        ),
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 325,
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                const Text(
                  'أدخل رقم الفاتورة',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ]),
              const Spacer(),
              CustomTextFormField(
                validator: (s) {
                  return null;
                },
                keyboardType: TextInputType.number,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                fillColor: AppColors.searchField,
                hintText: '11******',
              ),
              const Spacer(),
              SizedBox(
                width: 300,
                child: CustomElevatedButton(
                  onPressed: () {},
                  buttonColor: AppColors.indigo,
                  title: "أدخل الفاتورة",
                  verticalPadding: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
