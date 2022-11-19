import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/snack_bar_build_context.dart';
import 'package:najeeb_academy/app/widgets/button.dart';
import 'package:najeeb_academy/app/widgets/text_form_field.dart';
import 'package:najeeb_academy/features/courses/services/create_classes_order_service.dart';
import 'package:provider/provider.dart';

class PaymentDialog extends StatefulWidget {
  const PaymentDialog(
      {Key? key,
      required this.myClassesIds,
      required this.subjectsIds,
      required this.paidAmount})
      : super(key: key);
  final List<int> myClassesIds;
  final List<int> subjectsIds;
  final String paidAmount;

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  TextEditingController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DI.createClassedOrderServiceFactory(),
      builder: (context, child) => Center(
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
                      controller: _controller,
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
                    child: context.watch<CreateClassedOrderService>().isLoaded
                        ? CustomElevatedButton(
                            onPressed: () {
                              context
                                  .read<CreateClassedOrderService>()
                                  .addCourse(
                                      subjectIds: widget.subjectsIds,
                                      classesIds: widget.myClassesIds,
                                      paidAmount: widget.paidAmount,
                                      billNumber: _controller!.text)
                                  .then((value) {
                                if (value) {
                                  Navigator.pop(context);
                                  context.showSuccessSnackBar(
                                      'تم إنشاء الطلب ينجاح');
                                } else {
                                  context.showFailSnackBar(
                                      'هناك مشكلة أعد المحاولة لاحقاً');
                                }
                              });
                            },
                            buttonColor: AppColors.indigo,
                            title: "أدخل الفاتورة",
                            verticalPadding: 12,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
