import 'package:flutter/material.dart';
import 'package:najeeb_academy/core/ui/nav_bar.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 55, 12, 0),
            child: Navbar(
              title: "مدفوعاتي",
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}
