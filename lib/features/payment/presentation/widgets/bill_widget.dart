import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/payment/models/payment.dart';
import 'package:najeeb_academy/features/payment/presentation/payments_page.dart';

class BillWidget extends StatelessWidget {
  const BillWidget({Key? key, required this.payment}) : super(key: key);
  final Payment payment;
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
                      // !isSubscription
                      //     ? const Text('القسط:', style: textStyle1)
                      //     : const SizedBox.shrink(),
                      const Text('رقم الفاتورة:', style: textStyle1),
                      const Text('الدورة:', style: textStyle1),
                      const Text('المبلغ المدفوع:', style: textStyle1),
                      const Text('المبلغ المتبقي:', style: textStyle1),
                      const Text('تاريخ:', style: textStyle1),
                      // const Text('إلى تاريخ', style: textStyle1),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // !isSubscription
                      //     ? Text(installment.toString(), style: textStyle2)
                      //     : const SizedBox.shrink(),
                      Text(
                        payment.id.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        payment.studentMyClassId.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        payment.amtPaid.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        payment.balance.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        payment.createdAt.toString(),
                        style: textStyle2,
                      ),
                      // Text(
                      //   payment.,
                      //   style: textStyle2,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
