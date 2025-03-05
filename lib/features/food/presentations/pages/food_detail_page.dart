import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/bx.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/constants/text_styles.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../cores/extensions/string_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection_container.dart';
import '../../../shared/presentations/pages/full_screen_image_page.dart';
import '../../domain/entities/food_category.dart';
import '../../domain/entities/food_entity.dart';
import '../../domain/entities/food_flavor.dart';
import '../../domain/entities/food_ingredient.dart';
import '../../domain/entities/food_recipe.dart';
import '../../domain/entities/food_region.dart';
import '../../domain/entities/ingredient_unit.dart';
import '../../domain/entities/recipe_instruction.dart';
import '../bloc/find_restaurant/find_restaurant_bloc.dart';
import '../widgets/food_category_chip_wrap.dart';
import '../widgets/food_flavor_chip_wrap.dart';
import '../widgets/food_history_detail.dart';
import '../widgets/food_instruction.dart';
import '../widgets/recommend_food_tab.dart';
import 'find_restaurant_page.dart';

FoodEntity _foodEntity = FoodEntity(
  foodId: 'POPULAR-noodles-0',
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
);

// TODO: Implement Instruction Widget
class FoodDetailPage extends StatefulWidget {
  // final FoodEntity food;
  const FoodDetailPage({
    super.key,
    // required this.food,
  });

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  bool _isIngredientExpanded = true;

  static const Color _appBarIconColor = Colors.black38;
  static const int limitLine = 5;
  static const SizedBox _spacing = SizedBox(height: AppSpacing.marginM);
  static const int dropDownDuration = 200;
  @override
  Widget build(BuildContext context) {
    final imageHeight = MediaQuery.of(context).size.height * 0.3;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              leading: const BackButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(_appBarIconColor),
                ),
                color: Colors.white,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(_appBarIconColor),
                  ),
                  color: Colors.white,
                  icon: _foodEntity.isFavorite
                      ? const Icon(Icons.favorite, color: Colors.pink)
                      : const Icon(Icons.favorite_border_outlined),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: AppSpacing.marginXS),
                )
              ],
              backgroundColor: Colors.black12,
              expandedHeight: imageHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: GestureDetector(
                  onTap: () => _onViewFullScreenImage(context),
                  child: CachedNetworkImage(
                    imageUrl: _foodEntity.imageUrl,
                    cacheKey: _foodEntity.foodId,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) => Container(),
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.marginL),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Food Title
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        _foodEntity.foodName,
                        style: AppTextStyle.h1,
                        maxLines: 2,
                        semanticsLabel: _foodEntity.foodName,
                      ),
                      trailing: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSpacing.radiusS),
                          ),
                        ),
                        padding: const EdgeInsets.all(AppSpacing.paddingSM),
                        child: Text(
                          '${_foodEntity.rating} / 5.0',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          semanticsLabel: '${_foodEntity.rating} / 5.0',
                        ),
                      ),
                    ),

                    // Food Info
                    FoodCategoryChipWrap(
                      category: [_foodEntity.foodCategory],
                    ),
                    _spacing,
                    FoodFlavorChipWrap(flavors: _foodEntity.flavors),
                    _spacing,
                    ReadMoreText(
                      _foodEntity.foodDesc,
                      trimLines: limitLine,
                      trimMode: TrimMode.Line,
                      textAlign: TextAlign.justify,
                      semanticsLabel: _foodEntity.foodDesc,
                      style: const TextStyle(
                        fontSize: AppFontSize.bodyLarge,
                        fontWeight: FontWeight.w500,
                      ),
                      trimCollapsedText: ' ${S.current.show_more_text}',
                      trimExpandedText: ' ${S.current.show_less_text}',
                      colorClickableText: AppColors.primary,
                    ),
                    _spacing,

                    // Food History
                    _buildTitle(
                      context,
                      S.current.food_history,
                      Icons.history_edu,
                    ),
                    _spacing,
                    FoodHistoryDetail(foodHistory: _foodEntity.foodHistory),
                    _spacing,

                    // Ingredient
                    _buildTitle(
                      context,
                      S.current.food_ingredients,
                      Icons.restaurant_menu,
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Iconify(Mdi.person_group),
                          const SizedBox(width: AppSpacing.marginS),
                          Text(
                            _foodEntity.foodRecipe.serving.toString(),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(
                        () => _isIngredientExpanded = !_isIngredientExpanded,
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(30),
                      ),
                      child: _isIngredientExpanded
                          ? const Icon(Icons.keyboard_arrow_up)
                          : const Icon(Icons.keyboard_arrow_down),
                    ),
                    AnimatedSwitcherPlus.translationBottom(
                      reverseDuration:
                          const Duration(milliseconds: dropDownDuration ~/ 2),
                      duration: const Duration(milliseconds: dropDownDuration),
                      child: _isIngredientExpanded
                          ? _buildIngredientsList(context)
                          : null,
                    ),

                    _spacing,

                    // Instruction
                    _buildTitle(
                      context,
                      S.current.food_instruction,
                      Icons.menu_book,
                      suffix: Container(
                        decoration: BoxDecoration(
                          color: _foodEntity.foodRecipe.difficulty.color,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(AppSpacing.radiusS),
                          ),
                        ),
                        padding: const EdgeInsets.all(AppSpacing.paddingS),
                        child: Text(
                          _foodEntity.foodRecipe.difficulty.name
                              .toUpperCaseFirstLetter,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    _spacing,
                    FoodInstruction(
                      recipeId: _foodEntity.foodRecipe.recipeId,
                      recipeInstruction:
                          _foodEntity.foodRecipe.recipeInstruction,
                    ),

                    const SizedBox(height: AppSpacing.marginL),

                    // Find Food Feature
                    ElevatedButton(
                      onPressed: () => _onFindRestaurant(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Iconify(
                            Bx.restaurant,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: AppSpacing.marginS),
                          Text(
                            S.current.find_nearby_restaurant_button,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFontSize.h4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.marginL),

                    // Recommend Food
                    const RecommendFoodTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsList(BuildContext context) {
    return Column(
      children: _foodEntity.foodRecipe.foodIngredients
          .asMap()
          .entries
          .map((entry) => _buildIngredientItem(context, entry.key))
          .toList(),
    );
  }

  Widget _buildIngredientItem(BuildContext context, int index) {
    final baseColor =
        context.isDarkMode ? AppColors.textLight : AppColors.textDark;
    final ingredient = _foodEntity.foodRecipe.foodIngredients[index];

    return Container(
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(
            color: AppColors.textGray,
            width: 0.5,
          ),
        ),
        color: context.isDarkMode
            ? AppColors.textDark
            : (index % 2 != 0 ? Colors.grey.shade100 : Colors.white),
      ),
      padding: const EdgeInsets.all(AppSpacing.marginS),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: AppSpacing.marginM),
        leading: Text("•", style: TextStyle(fontSize: 20, color: baseColor)),
        title: Text(
          '${ingredient.ingredientName} - ${ingredient.ingredientQuantityString} ${ingredient.ingredientUnit.unitName}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: baseColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(
    BuildContext context,
    String title,
    IconData iconData, {
    Widget? suffix,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color:
                  context.isDarkMode ? AppColors.textLight : AppColors.primary,
            ),
            const SizedBox(width: AppSpacing.marginS),
            Text(
              title,
              style: const TextStyle(
                fontSize: AppFontSize.h1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if (suffix != null) suffix
      ],
    );
  }

  void _onViewFullScreenImage(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.scale,
        alignment: Alignment.center,
        child: FullScreenImagePage(
          collectionId: _foodEntity.foodId,
          imageUrls: [_foodEntity.imageUrl],
        ),
      ),
    );
  }

  void _onFindRestaurant(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.scale,
        alignment: Alignment.center,
        child: BlocProvider(
          create: (_) =>
              getIt.get<FindRestaurantBloc>()..add(RequestLocation()),
          child: const FindRestaurantPage(),
        ),
      ),
    );
  }
}
