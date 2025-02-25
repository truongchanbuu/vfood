import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:moment_dart/moment_dart.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../domain/entities/food_entity.dart';

class FoodItem extends StatefulWidget {
  final FoodEntity food;
  const FoodItem({super.key, required this.food});

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  bool isFavorite = false;

  static const double itemImageHeight = 250;
  static const double itemImageWidth = double.infinity;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.marginL),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.food.imageUrl,
                cacheKey: widget.food.foodId,
                width: itemImageWidth,
                height: itemImageHeight,
                fit: BoxFit.cover,
                placeholder: (context, url) => ClipRect(
                  child: Lottie.asset(
                    'assets/shared/json/image_food_loading.json',
                    fit: BoxFit.contain,
                    height: itemImageHeight,
                    width: itemImageWidth,
                  ),
                ),
                errorWidget: (context, error, stackTrace) => Container(
                  color: Colors.black12.withValues(alpha: 0.1),
                  width: itemImageWidth,
                  height: itemImageHeight,
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 30,
                    color: AppColors.textGray,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ),
            ],
          ),
          const Divider(color: AppColors.textGray, thickness: 0.5, height: 0.5),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.marginL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.food.foodName,
                      style: const TextStyle(
                        fontSize: AppFontSize.bodyLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.paddingS,
                        vertical: AppSpacing.paddingXS,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.textGray.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusM),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: AppSpacing.marginXS),
                          Text(
                            '${widget.food.rating}/5.0',
                            style: TextStyle(
                              color: context.isDarkMode
                                  ? AppColors.textLight
                                  : AppColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.marginS),
                Wrap(
                  spacing: 8,
                  children: widget.food.flavors.map((flavor) {
                    return Chip(
                      shape: StadiumBorder(
                        side: BorderSide(width: 1, color: flavor.color),
                      ),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Iconify(flavor.icon, color: flavor.color),
                          const SizedBox(width: AppSpacing.marginS),
                          Text(
                            flavor.normalizedName,
                            style: TextStyle(
                              color: context.isDarkMode
                                  ? AppColors.textLight
                                  : AppColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSpacing.marginS),
                if (widget.food.viewedAt != null)
                  Text(
                    widget.food.viewedAt!.toMoment().formatDateTimeShort(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
