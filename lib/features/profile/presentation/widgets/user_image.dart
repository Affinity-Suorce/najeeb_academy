import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserImage extends StatelessWidget {
  final NetworkImage? image;
  final double? dimension;
  const UserImage({
    super.key,
    this.image,
    this.dimension,
  });

  @override
  Widget build(BuildContext context) {
    final double defaultDimension = 250.r;
    final userImage = image;
    if (userImage != null) {
      return Image(
        image: userImage,
        width: dimension ?? defaultDimension,
        height: dimension ?? defaultDimension,
        
      );
    }
    return Icon(
      CupertinoIcons.person_fill,
      size: dimension ?? defaultDimension,
    );
  }
}
