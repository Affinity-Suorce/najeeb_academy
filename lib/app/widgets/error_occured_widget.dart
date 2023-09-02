import 'package:flutter/material.dart';

class ErrorOccuredTextWidget extends StatelessWidget {
  const ErrorOccuredTextWidget(
      {Key? key, this.message = "حدث خطأ ما", this.fun})
      : super(
          key: key,
        );
  final String message;
  final Future<void> Function()? fun;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$message!!",
              style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 20),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                if (fun != null) fun!();
              },
              child: const Text(
                "أعد المحاولة",
                style: TextStyle(color: Colors.indigo, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
