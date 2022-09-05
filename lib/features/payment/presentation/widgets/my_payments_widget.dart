import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/features/payment/presentation/payments_page.dart';

class MyPaymentsWidget extends StatelessWidget {
  const MyPaymentsWidget({
    Key? key,
    this.isSubscription = false,
    this.installment = 1,
    this.billId = 111111,
    this.course = 'الصف التاسع',
    this.paidAmount = 125000,
    this.remaining = 50000,
    this.fromDate = "2/2/2020",
    this.toDate = "2/2/2021",
  }) : super(key: key);
  final bool isSubscription;
  final int billId;
  final int installment;
  final String course;
  final int paidAmount;
  final int remaining;
  final String fromDate;
  final String toDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 3),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      !isSubscription
                          ? Text('القسط:', style: textStyle1)
                          : SizedBox.shrink(),
                      Text('رقم الفاتورة:', style: textStyle1),
                      Text('الدورة:', style: textStyle1),
                      Text('المبلغ المدفوع:', style: textStyle1),
                      Text('المبلغ المتبقي:', style: textStyle1),
                      Text('من تاريخ:', style: textStyle1),
                      Text('إلى تاريخ', style: textStyle1),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      !isSubscription
                          ? Text(installment.toString(), style: textStyle2)
                          : SizedBox.shrink(),
                      Text(
                        billId.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        course,
                        style: textStyle2,
                      ),
                      Text(
                        paidAmount.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        remaining.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        fromDate,
                        style: textStyle2,
                      ),
                      Text(
                        toDate,
                        style: textStyle2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
