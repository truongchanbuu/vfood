import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../cores/constants/colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  final String assetName;

  const AppLoadingIndicator({
    super.key,
    this.assetName = 'food_bowl_loading',
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.3;
    return Center(
      child: Lottie.asset(
        'assets/shared/json/loading/$assetName.json',
        key: ValueKey('loading_indicator_$assetName'),
        width: size,
        height: size,
        fit: BoxFit.cover,
        repeat: true,
        renderCache: RenderCache.raster,
        errorBuilder: (context, error, stackTrace) =>
            const CircularProgressIndicator(color: AppColors.primary),
      ),
    );
  }
}
