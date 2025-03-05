import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../domain/entities/food_entity.dart';
import 'food_category_chip_wrap.dart';
import 'food_flavor_chip_wrap.dart';
import 'food_image.dart';

class FoodItem extends StatefulWidget {
  final FoodEntity food;
  const FoodItem({super.key, required this.food});

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  bool isFavorite = false;

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
              FoodImage(
                photoUrl: widget.food.imageUrl,
                cacheKey: widget.food.foodId,
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
                SizedBox(
                  height: AppFontSize.bodyLarge * maxLines,
                  child: Text(
                    widget.food.foodDesc,
                    style: const TextStyle(
                      fontSize: AppFontSize.bodyLarge,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                  ),
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
