import 'package:flutter/material.dart';

class ErrorOccuredTextWidget extends StatelessWidget {
  const ErrorOccuredTextWidget({Key? key, this.message = "Error Occured"})
      : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Center(
        child: Text(
          message + "!!",
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
      ),
    );
  }
}
