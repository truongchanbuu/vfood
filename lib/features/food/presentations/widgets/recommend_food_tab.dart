import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ep.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/commons.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/food_category.dart';
import '../../domain/entities/food_entity.dart';
import '../../domain/entities/food_flavor.dart';
import '../../domain/entities/food_ingredient.dart';
import '../../domain/entities/food_region.dart';
import '../../domain/entities/ingredient_unit.dart';
import '../pages/food_detail_page.dart';
import 'food_item.dart';

class RecommendFoodTab extends StatelessWidget {
  const RecommendFoodTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.paddingSM),
          decoration: BoxDecoration(
            color:
                context.isDarkMode ? AppColors.primaryDark : AppColors.primary,
            borderRadius: BorderRadius.circular(AppSpacing.radiusS),
          ),
          child: Row(
            children: [
              const Iconify(
                Ep.knife_fork,
                color: Colors.white,
              ),
              const SizedBox(width: AppSpacing.marginS),
              Text(
                S.current.recommended_food_title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.h4,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.marginL),

        // TODO: SAMPLES
        Column(
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () => _onFoodItemTap(
                context,
                FoodEntity(
                  foodId: '00',
                  foodName: 'ABC-',
                  foodDesc: 'DESC-',
                  foodHistory: 'HIST-',
                  foodRegion: FoodRegion.central,
                  foodCategory: FoodCategory.riceDishes,
                  imageUrl: '',
                  ingredients: const [
                    FoodIngredient(
                        ingredientName: 'Salt',
                        ingredientQuantity: 2,
                        ingredientUnit: IngredientUnit.teaspoon),
                  ],
                  flavors: const [FoodFlavor.salty],
                ),
              ),
              child: FoodItem(
                food: FoodEntity(
                  foodId: '00$index',
                  foodName: 'ABC-$index',
                  foodDesc: 'DESC-$index',
                  foodHistory: 'HIST-$index',
                  foodRegion: FoodRegion.central,
                  foodCategory: FoodCategory.riceDishes,
                  imageUrl: '',
                  ingredients: const [
                    FoodIngredient(
                        ingredientName: 'Salt',
                        ingredientQuantity: 2,
                        ingredientUnit: IngredientUnit.teaspoon),
                  ],
                  flavors: const [FoodFlavor.salty],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onFoodItemTap(BuildContext context, FoodEntity food) {
    Navigator.push(
      context,
      PageTransition(
        duration: AppCommons.pageTransitionDuration,
        reverseDuration: AppCommons.pageTransitionDuration,
        type: PageTransitionType.scale,
        alignment: Alignment.center,
        child: FoodDetailPage(),
      ),
    );
  }
}
