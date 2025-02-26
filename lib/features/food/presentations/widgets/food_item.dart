import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moment_dart/moment_dart.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../shared/presentations/widgets/error_image.dart';
import '../../domain/entities/food_entity.dart';
import 'food_category_chip_wrap.dart';
import 'food_flavor_chip_wrap.dart';

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
  static const _spacing = SizedBox(height: AppSpacing.marginS);
  static const int maxLines = 3;

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
                errorWidget: (context, error, stackTrace) => const ErrorImage(
                  width: itemImageWidth,
                  height: itemImageHeight,
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
                    if (widget.food.rating != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.paddingS,
                          vertical: AppSpacing.paddingXS,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.textGray.withValues(alpha: 0.1),
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusM),
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
                _spacing,
                Text(
                  widget.food.foodDesc,
                  style: const TextStyle(
                    fontSize: AppFontSize.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: maxLines,
                ),
                _spacing,
                FoodCategoryChipWrap(category: [widget.food.foodCategory]),
                _spacing,
                FoodFlavorChipWrap(flavors: widget.food.flavors),
                _spacing,
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
