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
            stepDescription: S.current.bun_bo_hue_recipe_step_1,
            duration: const Duration(hours: 2),
            imageUrls: const [
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-chan-gio-nam-bo.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-chan-gio-nam-bo-1.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-chan-gio-nam-bo-2.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-chan-gio-nam-bo-3.jpg',
            ],
          ),
          RecipeInstruction(
            step: 2,
            stepTitle: '${S.current.step_title} 2',
            stepDescription: S.current.bun_bo_hue_recipe_step_2,
            imageUrls: const [
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-cac-nguyen-lieu-khac-66.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-cac-nguyen-lieu-khac-67.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-cac-nguyen-lieu-khac-68.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-cac-nguyen-lieu-khac-69.jpg',
            ],
          ),
          RecipeInstruction(
            step: 3,
            stepTitle: '${S.current.step_title} 3',
            stepDescription: S.current.bun_bo_hue_recipe_step_3,
            imageUrls: const [
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/nau-bun-bo-hue.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/nau-bun-bo-hue-1.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/nau-bun-bo-hue-2.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/nau-bun-bo-hue-3.jpg',
            ],
          ),
          RecipeInstruction(
            step: 4,
            stepTitle: '${S.current.step_title} 4',
            stepDescription: S.current.bun_bo_hue_recipe_step_4,
            imageUrls: const [
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/nau-bun-bo-hue-3.jpg',
              'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/hoan-thanh-34.jpg',
            ],
          ),
        ],
        foodIngredients: [
          FoodIngredient(
            ingredientName: S.current.pork_trotters,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.kg,
          ),
          FoodIngredient(
            ingredientName: S.current.beef_brisket,
            ingredientQuantity: 500,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.thick_rice_vermicelli_noodles,
            ingredientQuantity: 200,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.congealed_pork,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.cup,
            optional: true,
          ),
          FoodIngredient(
            ingredientName: S.current.beef_blood,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.cup,
            optional: true,
          ),
          FoodIngredient(
            ingredientName: S.current.beef_sausage,
            ingredientQuantity: 200,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.annatto_oil,
            ingredientQuantity: 3,
            ingredientUnit: IngredientUnit.tablespoon,
          ),
          FoodIngredient(
            ingredientName: S.current.lemon_grass,
            ingredientQuantity: 7,
            ingredientUnit: IngredientUnit.stalk,
          ),
          FoodIngredient(
            ingredientName: S.current.onion,
            ingredientQuantity: 2,
            ingredientUnit: IngredientUnit.bulb,
          ),
          FoodIngredient(
            ingredientName: S.current.green_onion,
            ingredientQuantity: 2,
            ingredientUnit: IngredientUnit.slice,
          ),
          FoodIngredient(
            ingredientName: S.current.garlic,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.bulb,
          ),
          FoodIngredient(
            ingredientName: S.current.garlic,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.bulb,
          ),
          FoodIngredient(
            ingredientName: S.current.ginger,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.bulb,
          ),
          FoodIngredient(
            ingredientName: S.current.fermented_shrimp_paste,
            ingredientQuantity: 2,
            ingredientUnit: IngredientUnit.tablespoon,
          ),
          FoodIngredient(
            ingredientName: S.current.bean_sprout,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.pinch,
          ),
          FoodIngredient(
            ingredientName: S.current.cilantro,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.pinch,
          ),
          FoodIngredient(
            ingredientName: S.current.banana_blossoms,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.pinch,
          ),
          FoodIngredient(
            ingredientName: S.current.lime,
            ingredientQuantity: 1,
            ingredientUnit: IngredientUnit.fruit,
          ),
        ],
        preparationTime: const Duration(minutes: 10),
        cookingTime: const Duration(hours: 2, minutes: 30),
        difficulty: FoodDifficulty.easy,
        serving: 4,
        createdAt: DateTime.now(),
      ),
      flavors: const [
        FoodFlavor.savory,
        FoodFlavor.salty,
        FoodFlavor.spicy,
        FoodFlavor.sour,
      ],
    ),
  ];

  static final List<FoodEntity> riceCategoryFood = [
    FoodEntity(
      foodId: '$prefixId-${FoodCategory.riceDishes.name}-0',
      foodName: 'Cơm Tấm Long Xuyên',
      foodDesc: S.current.com_tam_long_xuyen_desc,
      foodHistory: S.current.com_tam_long_xuyen_history,
      foodRegion: FoodRegion.south,
      foodCategory: FoodCategory.riceDishes,
      imageUrl: 'assets/food/com_tam_long_xuyen.jpg',
      foodRecipe: FoodRecipe(
        recipeId: 'com-tam-long-xuyen-recipe-0',
        recipeName: 'Cơm Tấm Long Xuyên',
        recipeInstruction: [
          RecipeInstruction(
            step: 1,
            stepTitle: '${S.current.step_title} 1',
            stepDescription: S.current.com_tam_long_xuyen_step_1,
            duration: const Duration(minutes: 30),
            imageUrls: const [
              'https://cdn.tgdd.vn/Files/2019/06/14/1173090/hapcom.jpg',
            ],
          ),
          RecipeInstruction(
            step: 2,
            stepTitle: '${S.current.step_title} 2',
            stepDescription: S.current.com_tam_long_xuyen_step_2,
            duration: const Duration(minutes: 30),
            imageUrls: const [
              'https://cdn.tgdd.vn/Files/2019/06/14/1173090/uopthit.jpg'
            ],
          ),
          RecipeInstruction(
            step: 3,
            stepTitle: '${S.current.step_title} 3',
            stepDescription: S.current.com_tam_long_xuyen_step_3,
            imageUrls: const [
              'https://cdn.tgdd.vn/Files/2019/06/14/1173090/khotrung.jpg'
            ],
          ),
          RecipeInstruction(
            step: 4,
            stepTitle: '${S.current.step_title} 4',
            stepDescription: S.current.com_tam_long_xuyen_step_4,
            imageUrls: const [
              'https://cdn.tgdd.vn/Files/2019/06/14/1173090/com-tam-dun-hon-hop-mam-duong.jpg'
            ],
          ),
          RecipeInstruction(
            step: 5,
            stepTitle: '${S.current.step_title} 5',
            stepDescription: S.current.com_tam_long_xuyen_step_5,
            imageUrls: const [
              'https://cdn.tgdd.vn/Files/2019/06/14/1173090/760.jpg'
            ],
          ),
        ],
        foodIngredients: [
          FoodIngredient(
            ingredientName: S.current.broken_rice,
            ingredientQuantity: 500,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.pork,
            ingredientQuantity: 300,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.duck_egg,
            ingredientQuantity: 4,
          ),
          FoodIngredient(
            ingredientName: S.current.pandan_leaves,
            ingredientQuantity: 30,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.honey,
            ingredientQuantity: 60,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.coconut_milk,
            ingredientQuantity: 30,
            ingredientUnit: IngredientUnit.ml,
          ),
          FoodIngredient(
            ingredientName: S.current.lime_juice,
            ingredientQuantity: 10,
            ingredientUnit: IngredientUnit.ml,
          ),
          FoodIngredient(
            ingredientName: S.current.five_spice_powder,
            ingredientQuantity: 2,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.palm_sugar,
            ingredientQuantity: 30,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.shallot,
            ingredientQuantity: 10,
            ingredientUnit: IngredientUnit.g,
          ),
          FoodIngredient(
            ingredientName: S.current.star_anise,
            ingredientQuantity: 20,
            ingredientUnit: IngredientUnit.g,
          ),
        ],
        preparationTime: const Duration(minutes: 60),
        cookingTime: const Duration(minutes: 60),
        difficulty: FoodDifficulty.medium,
        serving: 5,
        createdAt: DateTime.now(),
      ),
      flavors: const [
        FoodFlavor.savory,
        FoodFlavor.sweet,
      ],
    )
  ];
}
