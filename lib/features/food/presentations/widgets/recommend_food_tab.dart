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
import '../../domain/entities/food_recipe.dart';
import '../../domain/entities/food_region.dart';
import '../../domain/entities/ingredient_unit.dart';
import '../../domain/entities/recipe_instruction.dart';
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
                  foodId: '0-noodles-0',
                  foodName: 'Phở',
                  foodDesc: S.current.pho_desc,
                  foodHistory: S.current.pho_history,
                  foodRegion: FoodRegion.north,
                  foodCategory: FoodCategory.noodles,
                  imageUrl: 'assets/food/pho.jpg',
                  foodRecipe: FoodRecipe(
                    recipeId: 'pho-recipe-0',
                    recipeName: 'Pho Bo',
                    recipeInstruction: [
                      RecipeInstruction(
                        step: 1,
                        stepTitle: '${S.current.step_title} 1',
                        stepDescription: S.current.pho_recipe_step_1,
                        duration: const Duration(minutes: 10),
                        imageUrls: const [
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-7.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-9.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-8.jpg',
                        ],
                      ),
                      RecipeInstruction(
                        step: 2,
                        stepTitle: '${S.current.step_title} 2',
                        stepDescription: S.current.pho_recipe_step_2,
                        duration: const Duration(minutes: 10),
                        imageUrls: const [
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-8.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-9.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-10.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-11.jpg',
                        ],
                      ),
                      RecipeInstruction(
                        step: 3,
                        stepTitle: '${S.current.step_title} 3',
                        stepDescription: S.current.pho_recipe_step_3,
                        duration: const Duration(minutes: 40),
                        imageUrls: const [
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-20.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-19.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-21.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-17.jpg',
                        ],
                      ),
                      RecipeInstruction(
                        step: 4,
                        stepTitle: '${S.current.step_title} 4',
                        stepDescription: S.current.pho_recipe_step_4,
                        duration: const Duration(minutes: 5),
                        imageUrls: const [
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-358.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-359.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-360.jpg',
                        ],
                      ),
                    ],
                    foodIngredients: [
                      FoodIngredient(
                        ingredientName: S.current.beef_leg_bones,
                        ingredientQuantity: 2,
                        ingredientUnit: IngredientUnit.kg,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.beef_tenderloin,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.kg,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.beef_brisket,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.g,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.onion,
                        ingredientQuantity: 3,
                        ingredientUnit: IngredientUnit.bulb,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.green_onion,
                        ingredientQuantity: 5,
                        ingredientUnit: IngredientUnit.stalk,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.ginger,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.bulb,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.shallot,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.bulb,
                      ),
                      FoodIngredient(
                        ingredientName: 'Pho ${S.current.noodles}',
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.kg,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.rock_sugar,
                        ingredientQuantity: 200,
                        ingredientUnit: IngredientUnit.g,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.salt,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.teaspoon,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.msg,
                        ingredientQuantity: 1 / 4,
                        ingredientUnit: IngredientUnit.teaspoon,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.herb,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.pinch,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.vegetable,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.pinch,
                      ),
                    ],
                    preparationTime: const Duration(minutes: 25),
                    cookingTime: const Duration(hours: 1, minutes: 15),
                    difficulty: FoodDifficulty.easy,
                    serving: 6,
                    createdAt: DateTime.now(),
                  ),
                  flavors: const [
                    FoodFlavor.savory,
                    FoodFlavor.salty,
                  ],
                ),
              ),
              child: FoodItem(
                food: FoodEntity(
                  foodId: '0-noodles-0',
                  foodName: 'Phở',
                  foodDesc: S.current.pho_desc,
                  foodHistory: S.current.pho_history,
                  foodRegion: FoodRegion.north,
                  foodCategory: FoodCategory.noodles,
                  imageUrl: 'assets/food/pho.jpg',
                  foodRecipe: FoodRecipe(
                    recipeId: 'pho-recipe-0',
                    recipeName: 'Pho Bo',
                    recipeInstruction: [
                      RecipeInstruction(
                        step: 1,
                        stepTitle: '${S.current.step_title} 1',
                        stepDescription: S.current.pho_recipe_step_1,
                        duration: const Duration(minutes: 10),
                        imageUrls: const [
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-7.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-9.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-8.jpg',
                        ],
                      ),
                      RecipeInstruction(
                        step: 2,
                        stepTitle: '${S.current.step_title} 2',
                        stepDescription: S.current.pho_recipe_step_2,
                        duration: const Duration(minutes: 10),
                        imageUrls: const [
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-8.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-9.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-10.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-11.jpg',
                        ],
                      ),
                      RecipeInstruction(
                        step: 3,
                        stepTitle: '${S.current.step_title} 3',
                        stepDescription: S.current.pho_recipe_step_3,
                        duration: const Duration(minutes: 40),
                        imageUrls: const [
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-20.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-19.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-21.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-17.jpg',
                        ],
                      ),
                      RecipeInstruction(
                        step: 4,
                        stepTitle: '${S.current.step_title} 4',
                        stepDescription: S.current.pho_recipe_step_4,
                        duration: const Duration(minutes: 5),
                        imageUrls: const [
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-358.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-359.jpg',
                          'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-360.jpg',
                        ],
                      ),
                    ],
                    foodIngredients: [
                      FoodIngredient(
                        ingredientName: S.current.beef_leg_bones,
                        ingredientQuantity: 2,
                        ingredientUnit: IngredientUnit.kg,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.beef_tenderloin,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.kg,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.beef_brisket,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.g,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.onion,
                        ingredientQuantity: 3,
                        ingredientUnit: IngredientUnit.bulb,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.green_onion,
                        ingredientQuantity: 5,
                        ingredientUnit: IngredientUnit.stalk,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.ginger,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.bulb,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.shallot,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.bulb,
                      ),
                      FoodIngredient(
                        ingredientName: 'Pho ${S.current.noodles}',
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.kg,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.rock_sugar,
                        ingredientQuantity: 200,
                        ingredientUnit: IngredientUnit.g,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.salt,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.teaspoon,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.msg,
                        ingredientQuantity: 1 / 4,
                        ingredientUnit: IngredientUnit.teaspoon,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.herb,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.pinch,
                      ),
                      FoodIngredient(
                        ingredientName: S.current.vegetable,
                        ingredientQuantity: 1,
                        ingredientUnit: IngredientUnit.pinch,
                      ),
                    ],
                    preparationTime: const Duration(minutes: 25),
                    cookingTime: const Duration(hours: 1, minutes: 15),
                    difficulty: FoodDifficulty.easy,
                    serving: 6,
                    createdAt: DateTime.now(),
                  ),
                  flavors: const [
                    FoodFlavor.savory,
                    FoodFlavor.salty,
                  ],
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
