import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/constants/text_styles.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../cores/extensions/num_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/presentations/pages/full_screen_image_page.dart';
import '../../domain/entities/food_category.dart';
import '../../domain/entities/food_entity.dart';
import '../../domain/entities/food_flavor.dart';
import '../../domain/entities/food_ingredient.dart';
import '../../domain/entities/food_region.dart';
import '../../domain/entities/ingredient_unit.dart';
import '../widgets/food_category_chip_wrap.dart';
import '../widgets/food_flavor_chip_wrap.dart';
import '../widgets/recommend_food_tab.dart';

const FoodEntity _foodEntity = FoodEntity(
  foodId: "food_001",
  foodName: "Phở Bò",
  foodDesc:
      "Traditional Vietnamese beef noodle soup with aromatic herbs and a balanced broth.",
  foodHistory:
      "Traditional Vietnamese beef noodle soup with aromatic herbs and a balanced broth.",
  foodRegion: FoodRegion.north,
  foodCategory: FoodCategory.noodles,
  imageUrl:
      "https://th.bing.com/th?id=OIP.6R9VrPEw-I5FIpdkB5fDowHaKX&w=211&h=295&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
  ingredients: [
    FoodIngredient(
      ingredientName: 'Noodles',
      ingredientQuantity: 200,
      ingredientUnit: IngredientUnit.g,
    ),
    FoodIngredient(
      ingredientName: 'Beef',
      ingredientQuantity: 200,
      ingredientUnit: IngredientUnit.g,
    ),
    FoodIngredient(
      ingredientName: 'Salt',
      ingredientQuantity: 2,
      ingredientUnit: IngredientUnit.teaspoon,
    ),
  ],
  flavors: [FoodFlavor.sour, FoodFlavor.spicy],
  isFavorite: true,
  rating: 4.7,
);

class FoodDetailPage extends StatelessWidget {
  // final FoodEntity food;
  const FoodDetailPage({
    super.key,
    // required this.food,
  });

  static const Color _appBarIconColor = Colors.black38;
  static const int limitLine = 5;
  static const SizedBox _spacing = SizedBox(height: AppSpacing.marginM);
  static const double _historySectionDividerIntent = 100;
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
                    _buildTitle(
                      context,
                      S.current.food_ingredients,
                      Icons.restaurant_menu,
                    ),
                    _spacing,
                    _buildIngredientsList(context),
                    _spacing,
                    _buildTitle(
                      context,
                      S.current.food_history,
                      Icons.history_edu,
                    ),
                    _spacing,
                    Container(
                      decoration: BoxDecoration(
                        color: context.isDarkMode
                            ? AppColors.textDark
                            : Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppSpacing.radiusS),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.marginL,
                        vertical: AppSpacing.marginM,
                      ),
                      child: Column(
                        children: [
                          const Divider(
                            color: AppColors.primary,
                            thickness: 5,
                            indent: _historySectionDividerIntent,
                            endIndent: _historySectionDividerIntent,
                          ),
                          const SizedBox(height: AppSpacing.marginS),
                          ReadMoreText(
                            _foodEntity.foodHistory,
                            trimMode: TrimMode.Line,
                            trimLines: limitLine,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: AppFontSize.bodyLarge,
                              fontWeight: FontWeight.w500,
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
      children: _foodEntity.ingredients
          .asMap()
          .entries
          .map((entry) => _buildIngredientItem(context, entry.key))
          .toList(),
    );
  }

  Widget _buildIngredientItem(BuildContext context, int index) {
    final baseColor =
        context.isDarkMode ? AppColors.textLight : AppColors.textDark;
    final ingredient = _foodEntity.ingredients[index];

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
          '${ingredient.ingredientName} - ${ingredient.ingredientQuantity.toStringAsFixedWithoutZero()} ${ingredient.ingredientUnit.unitName}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: baseColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String title, IconData iconData) {
    return Row(
      children: [
        Icon(
          iconData,
          color: context.isDarkMode ? AppColors.textLight : AppColors.primary,
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
}
