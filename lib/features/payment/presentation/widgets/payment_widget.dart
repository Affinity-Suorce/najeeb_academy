import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/payment/models/payment.dart';

class PaymentWidget extends StatelessWidget {
  final Payment payment;
  const PaymentWidget({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(payment.toString()),
    );
  }
}
