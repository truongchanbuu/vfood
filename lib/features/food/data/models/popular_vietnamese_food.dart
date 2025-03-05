import '../../../../generated/l10n.dart';
import '../../domain/entities/food_category.dart';
import '../../domain/entities/food_entity.dart';
import '../../domain/entities/food_flavor.dart';
import '../../domain/entities/food_ingredient.dart';
import '../../domain/entities/food_recipe.dart';
import '../../domain/entities/food_region.dart';
import '../../domain/entities/ingredient_unit.dart';
import '../../domain/entities/recipe_instruction.dart';

class PopularVietnameseFood {
  static const String prefixId = 'POPULAR';
  static final List<FoodEntity> noodleCategoryFood = [
    FoodEntity(
      foodId: '$prefixId-${FoodCategory.noodles.name}-0',
      foodName: 'Phở',
      foodDesc: S.current.pho_desc,
      foodHistory: S.current.pho_history,
      foodRegion: FoodRegion.north,
      foodCategory: FoodCategory.noodles,
      imageUrl: 'assets/food/pho.jpg',
      foodRecipe: FoodRecipe(
        recipeId: 'pho-recipe-0',
        recipeName: 'Phở Bò',
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
    FoodEntity(
      foodId: '$prefixId-${FoodCategory.noodles.name}-1',
      foodName: 'Bún bò Huế',
      foodDesc: S.current.bun_bo_hue_desc,
      foodHistory: S.current.bun_bo_hue_history,
      foodRegion: FoodRegion.central,
      foodCategory: FoodCategory.noodles,
      imageUrl: 'assets/food/bun-bo-hue.jpg',
      foodRecipe: FoodRecipe(
        recipeId: 'bun-bo-hue-recipe-0',
        recipeName: 'Bún Bò Huế',
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
        preparationTime: const Duration(minutes: 10),
        cookingTime: const Duration(hours: 2, minutes: 30),
        difficulty: FoodDifficulty.easy,
        serving: 6,
        createdAt: DateTime.now(),
      ),
      flavors: const [
        FoodFlavor.savory,
        FoodFlavor.salty,
      ],
    ),
  ];
}
