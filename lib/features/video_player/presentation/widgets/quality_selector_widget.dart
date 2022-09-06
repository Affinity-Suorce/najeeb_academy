import 'package:flutter/material.dart';

class QualitySelectorWidget extends StatelessWidget {
  const QualitySelectorWidget({Key? key, required this.changeVideo})
      : super(key: key);
  final Function(int index)? changeVideo;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      insetPadding: const EdgeInsets.fromLTRB(1, 20, 1, 24),
      contentPadding: const EdgeInsets.fromLTRB(1, 20, 1, 24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              changeVideo!(10);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'منخفضة',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  '360p',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              changeVideo!(20);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'متوسطة',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  '480p',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              changeVideo!(30);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'عالية',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  '720p',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
