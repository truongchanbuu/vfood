import 'package:flutter/material.dart';

import '../../../../cores/constants/colors.dart';

class ErrorImage extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;

  const ErrorImage({
    super.key,
    required this.width,
    required this.height,
    this.iconSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12.withValues(alpha: 0.1),
      width: width,
      height: height,
      child: Icon(
        Icons.image_not_supported,
        size: iconSize,
        color: AppColors.textGray,
      ),
    );
  }
}
