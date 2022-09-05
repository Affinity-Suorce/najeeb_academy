import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/widgets/nav_bar.dart';
import 'package:najeeb_academy/features/payment/presentation/widgets/my_payments_widget.dart';
import 'package:najeeb_academy/features/payment/presentation/widgets/subscription_widget.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
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
                    'الدفعات',
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
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.76,
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      listViewWidget(10, 1),
                      listViewWidget(10, 2),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listViewWidget(count, type) {
    return Padding(
      padding: EdgeInsets.only(top: 18),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>
              type == 1 ? MyPaymentsWidget() : SubscriptionWidget(),
          separatorBuilder: (context, index) => SizedBox(
                height: 0,
              ),
          itemCount: count),
    );
  }
}
