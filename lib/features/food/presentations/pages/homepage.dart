import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
import '../widgets/food_item.dart';
import '../widgets/home_appbar.dart';
import 'food_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double _borderRadius = 40;
  static const double _appBarHeightRatio = 0.3;
  static const double _extendedAppBarHeightRatio = 0.06;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: FoodCategory.values.length,
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
                                  .map((category) =>
                                      Tab(text: category.normalizedName))
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
                                      const FoodEntity(
                                        foodId: '00',
                                        foodName: 'ABC-',
                                        foodDesc: 'DESC-',
                                        foodHistory: 'HIST-',
                                        foodRegion: FoodRegion.central,
                                        foodCategory: FoodCategory.riceDishes,
                                        imageUrl: '',
                                        ingredients: [
                                          FoodIngredient(
                                              ingredientName: 'Salt',
                                              ingredientQuantity: 2,
                                              ingredientUnit:
                                                  IngredientUnit.teaspoon),
                                        ],
                                        flavors: [FoodFlavor.salty],
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
                                            ingredientUnit:
                                                IngredientUnit.teaspoon,
                                          ),
                                        ],
                                        flavors: const [FoodFlavor.salty],
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
