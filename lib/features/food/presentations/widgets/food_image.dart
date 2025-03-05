import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

import '../../../../cores/helpers/image_helper.dart';
import '../../../shared/presentations/widgets/error_image.dart';

class FoodImage extends StatelessWidget {
  final String photoUrl;
  final String? cacheKey;

  const FoodImage({
    super.key,
    required this.photoUrl,
    this.cacheKey,
  });

  static const double itemImageHeight = 250;
  @override
  Widget build(BuildContext context) {
    final double itemImageWidth = MediaQuery.of(context).size.width;

    if (ImageHelper.isNetworkImage(photoUrl)) {
      return CachedNetworkImage(
        imageUrl: photoUrl,
        cacheKey: cacheKey,
        width: itemImageWidth,
        height: itemImageHeight,
        fit: BoxFit.cover,
        placeholder: (context, url) => ClipRect(
          child: Lottie.asset(
            'assets/shared/json/loading/image_food_loading.json',
            fit: BoxFit.contain,
            height: itemImageHeight,
            width: itemImageWidth,
          ),
        ),
        errorWidget: _buildErrorImage,
      );
    }

    if (ImageHelper.isFile(photoUrl)) {
      return Image.file(
        File(photoUrl),
        width: itemImageWidth,
        height: itemImageHeight,
        fit: BoxFit.cover,
        cacheHeight: itemImageHeight.toInt(),
        cacheWidth: itemImageWidth.toInt(),
        errorBuilder: _buildErrorImage,
      );
    }

    return Image.asset(
      photoUrl,
      fit: BoxFit.cover,
      width: itemImageWidth,
      height: itemImageHeight,
      cacheWidth: itemImageWidth.toInt(),
      cacheHeight: itemImageHeight.toInt(),
      errorBuilder: _buildErrorImage,
    );
  }

  Widget _buildErrorImage(context, error, stackTrace) => ErrorImage(
        width: MediaQuery.of(context).size.width,
        height: itemImageHeight,
      );
}
