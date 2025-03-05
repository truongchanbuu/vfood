import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/commons.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../search/presentations/bloc/food_search/food_search_cubit.dart';
import '../../domain/entities/food_category.dart';
import '../../domain/entities/food_entity.dart';
import '../../domain/entities/food_flavor.dart';
import '../../domain/entities/food_ingredient.dart';
import '../../domain/entities/food_recipe.dart';
import '../../domain/entities/food_region.dart';
import '../../domain/entities/ingredient_unit.dart';
import '../../domain/entities/recipe_instruction.dart';
import '../widgets/food_item.dart';
import '../widgets/home_appbar.dart';
import 'food_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  late final TabController _buttonTabController;

  @override
  void initState() {
    super.initState();
    _buttonTabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _buttonTabController.dispose();
  }

  static const double _borderRadius = 40;
  static const double _appBarHeightRatio = 0.3;
  static const double _extendedAppBarHeightRatio = 0.06;
  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodSearchCubit, FoodSearchState>(
      listener: (context, state) {
        if (state is FoodSearching) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              const HomeAppBar(heightRatio: _appBarHeightRatio),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        (_appBarHeightRatio - _extendedAppBarHeightRatio),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.isDarkMode
                            ? AppColors.textDark
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(_borderRadius),
                          topRight: Radius.circular(_borderRadius),
                        ),
                      ),
                      padding: const EdgeInsets.all(AppSpacing.marginL)
                          .copyWith(bottom: 0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Popular Vietnamese Food
                            _SectionHeader(
                              S.current.popular_vietnamese_food_title,
                            ),
                            ButtonsTabBar(
                              controller: _buttonTabController,
                              radius: AppSpacing.radiusS,
                              elevation: 2,
                              contentCenter: true,
                              unselectedBackgroundColor: context.isDarkMode
                                  ? AppColors.textDark
                                  : Colors.white,
                              height: 60,
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                              ),
                              tabs: FoodCategory.values
                                  .map((category) => Tab(
                                        child: Flexible(
                                          child: Text(
                                            category.normalizedName,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: AppFontSize.bodySmall,
                                              color: _isTabSelected(category)
                                                  ? Colors.white
                                                  : context.isDarkMode
                                                      ? AppColors.textLight
                                                      : AppColors.textDark,
                                              fontWeight:
                                                  _isTabSelected(category)
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: AppSpacing.marginS),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  100,
                                  (index) => _buildFoodTile('$index', '$index'),
                                ),
                              ),
                            ),

                            const SizedBox(height: AppSpacing.marginL),

                            // Wonder Food Every Day
                            _SectionHeader(
                              S.current.wonderful_food_every_day_title,
                            ),
                            // TODO: SAMPLES
                            const SizedBox(height: AppSpacing.marginS),
                            Column(
                              children: List.generate(
                                5,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(
                                    top: AppSpacing.marginM,
                                  ),
                                  child: GestureDetector(
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
                                              stepTitle:
                                                  '${S.current.step_title} 1',
                                              stepDescription:
                                                  S.current.pho_recipe_step_1,
                                              duration:
                                                  const Duration(minutes: 10),
                                              imageUrls: const [
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-7.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-9.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-8.jpg',
                                              ],
                                            ),
                                            RecipeInstruction(
                                              step: 2,
                                              stepTitle:
                                                  '${S.current.step_title} 2',
                                              stepDescription:
                                                  S.current.pho_recipe_step_2,
                                              duration:
                                                  const Duration(minutes: 10),
                                              imageUrls: const [
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-8.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-9.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-10.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-11.jpg',
                                              ],
                                            ),
                                            RecipeInstruction(
                                              step: 3,
                                              stepTitle:
                                                  '${S.current.step_title} 3',
                                              stepDescription:
                                                  S.current.pho_recipe_step_3,
                                              duration:
                                                  const Duration(minutes: 40),
                                              imageUrls: const [
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-20.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-19.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-21.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-17.jpg',
                                              ],
                                            ),
                                            RecipeInstruction(
                                              step: 4,
                                              stepTitle:
                                                  '${S.current.step_title} 4',
                                              stepDescription:
                                                  S.current.pho_recipe_step_4,
                                              duration:
                                                  const Duration(minutes: 5),
                                              imageUrls: const [
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-358.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-359.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-360.jpg',
                                              ],
                                            ),
                                          ],
                                          foodIngredients: [
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.beef_leg_bones,
                                              ingredientQuantity: 2,
                                              ingredientUnit: IngredientUnit.kg,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.beef_tenderloin,
                                              ingredientQuantity: 1,
                                              ingredientUnit: IngredientUnit.kg,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.beef_brisket,
                                              ingredientQuantity: 1,
                                              ingredientUnit: IngredientUnit.g,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.onion,
                                              ingredientQuantity: 3,
                                              ingredientUnit:
                                                  IngredientUnit.bulb,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.green_onion,
                                              ingredientQuantity: 5,
                                              ingredientUnit:
                                                  IngredientUnit.stalk,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.ginger,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.bulb,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.shallot,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.bulb,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  'Pho ${S.current.noodles}',
                                              ingredientQuantity: 1,
                                              ingredientUnit: IngredientUnit.kg,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.rock_sugar,
                                              ingredientQuantity: 200,
                                              ingredientUnit: IngredientUnit.g,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.salt,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.teaspoon,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.msg,
                                              ingredientQuantity: 1 / 4,
                                              ingredientUnit:
                                                  IngredientUnit.teaspoon,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.herb,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.pinch,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.vegetable,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.pinch,
                                            ),
                                          ],
                                          preparationTime:
                                              const Duration(minutes: 25),
                                          cookingTime: const Duration(
                                              hours: 1, minutes: 15),
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
                                              stepTitle:
                                                  '${S.current.step_title} 1',
                                              stepDescription:
                                                  S.current.pho_recipe_step_1,
                                              duration:
                                                  const Duration(minutes: 10),
                                              imageUrls: const [
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-7.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-9.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-va-chan-thit-8.jpg',
                                              ],
                                            ),
                                            RecipeInstruction(
                                              step: 2,
                                              stepTitle:
                                                  '${S.current.step_title} 2',
                                              stepDescription:
                                                  S.current.pho_recipe_step_2,
                                              duration:
                                                  const Duration(minutes: 10),
                                              imageUrls: const [
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-8.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-9.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-10.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/so-che-nguyen-lieu-khac-11.jpg',
                                              ],
                                            ),
                                            RecipeInstruction(
                                              step: 3,
                                              stepTitle:
                                                  '${S.current.step_title} 3',
                                              stepDescription:
                                                  S.current.pho_recipe_step_3,
                                              duration:
                                                  const Duration(minutes: 40),
                                              imageUrls: const [
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-20.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-19.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-21.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/nau-nuoc-dung-17.jpg',
                                              ],
                                            ),
                                            RecipeInstruction(
                                              step: 4,
                                              stepTitle:
                                                  '${S.current.step_title} 4',
                                              stepDescription:
                                                  S.current.pho_recipe_step_4,
                                              duration:
                                                  const Duration(minutes: 5),
                                              imageUrls: const [
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-358.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-359.jpg',
                                                'https://cdn.tgdd.vn/2021/11/CookRecipe/GalleryStep/thanh-pham-360.jpg',
                                              ],
                                            ),
                                          ],
                                          foodIngredients: [
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.beef_leg_bones,
                                              ingredientQuantity: 2,
                                              ingredientUnit: IngredientUnit.kg,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.beef_tenderloin,
                                              ingredientQuantity: 1,
                                              ingredientUnit: IngredientUnit.kg,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.beef_brisket,
                                              ingredientQuantity: 1,
                                              ingredientUnit: IngredientUnit.g,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.onion,
                                              ingredientQuantity: 3,
                                              ingredientUnit:
                                                  IngredientUnit.bulb,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.green_onion,
                                              ingredientQuantity: 5,
                                              ingredientUnit:
                                                  IngredientUnit.stalk,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.ginger,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.bulb,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.shallot,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.bulb,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  'Pho ${S.current.noodles}',
                                              ingredientQuantity: 1,
                                              ingredientUnit: IngredientUnit.kg,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.rock_sugar,
                                              ingredientQuantity: 200,
                                              ingredientUnit: IngredientUnit.g,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.salt,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.teaspoon,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.msg,
                                              ingredientQuantity: 1 / 4,
                                              ingredientUnit:
                                                  IngredientUnit.teaspoon,
                                            ),
                                            FoodIngredient(
                                              ingredientName: S.current.herb,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.pinch,
                                            ),
                                            FoodIngredient(
                                              ingredientName:
                                                  S.current.vegetable,
                                              ingredientQuantity: 1,
                                              ingredientUnit:
                                                  IngredientUnit.pinch,
                                            ),
                                          ],
                                          preparationTime:
                                              const Duration(minutes: 25),
                                          cookingTime: const Duration(
                                              hours: 1, minutes: 15),
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
                            ),

                            const SizedBox(height: AppSpacing.marginM),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodTile(String name, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusS),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSpacing.radiusS),
                topRight: Radius.circular(AppSpacing.radiusS),
              ),
            ),
            padding: const EdgeInsets.all(AppSpacing.marginS),
            child: Lottie.asset(
              'assets/shared/json/loading/food_bowl_loading.json',
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.marginS)
                .copyWith(top: AppSpacing.marginM),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.bodyLarge,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
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
        child: const FoodDetailPage(),
      ),
    );
  }

  bool _isTabSelected(FoodCategory category) {
    return FoodCategory.fromIndex(_buttonTabController.index) == category;
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.paddingM),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.radiusS),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: AppFontSize.h4,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
