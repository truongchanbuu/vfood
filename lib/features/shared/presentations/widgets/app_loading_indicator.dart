import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../cores/constants/colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.3;
    return Center(
      child: Lottie.asset(
        'assets/shared/json/food-bowl.json',
        key: const ValueKey('food_bowl_loading_indicator'),
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
