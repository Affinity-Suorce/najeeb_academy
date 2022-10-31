import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/widgets/button.dart';
import 'package:najeeb_academy/app/widgets/text_form_field.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
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
                      child: const Icon(
                        CupertinoIcons.arrow_left,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: CustomTextFormField(
                    validator: (s) {
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    fillColor: AppColors.searchField,
                    hintText: '11******',
                  ),
                ),
                const SizedBox(height: 28),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
      ),
    );
  }
}
