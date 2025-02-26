import 'package:flutter/material.dart';

import '../../../../cores/constants/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/presentations/widgets/default_app_bar.dart';
import '../../domain/entities/food_category.dart';
import '../../domain/entities/food_entity.dart';
import '../../domain/entities/food_flavor.dart';
import '../../domain/entities/food_ingredient.dart';
import '../../domain/entities/food_region.dart';
import '../../domain/entities/ingredient_unit.dart';
import '../widgets/food_filter_section.dart';
import '../widgets/food_item.dart';

final List<FoodEntity> _foodEntities = [
  FoodEntity(
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
  ),
  FoodEntity(
    foodId: "food_002",
    foodName: "Bánh Mì",
    foodDesc:
        "A Vietnamese sandwich filled with savory meats, pickled vegetables, and fresh herbs.",
    foodHistory:
        "A Vietnamese sandwich filled with savory meats, pickled vegetables, and fresh herbs.",
    foodRegion: FoodRegion.north,
    foodCategory: FoodCategory.riceDishes,
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
    flavors: [FoodFlavor.sour, FoodFlavor.sweet],
    isFavorite: false,
    rating: 4.3,
  ),
  FoodEntity(
    foodId: "food_003",
    foodName: "Sushi",
    foodDesc:
        "Classic Japanese dish of vinegared rice with various fresh seafood toppings.",
    foodHistory:
        "Classic Japanese dish of vinegared rice with various fresh seafood toppings.",
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
    flavors: [FoodFlavor.sour],
    isFavorite: true,
    rating: 4.8,
  ),
  FoodEntity(
    foodId: "food_004",
    foodName: "Pizza Margherita",
    foodDesc:
        "Iconic Italian pizza topped with fresh tomatoes, mozzarella, and basil.",
    foodHistory:
        "Iconic Italian pizza topped with fresh tomatoes, mozzarella, and basil.",
    foodRegion: FoodRegion.south,
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
    flavors: [FoodFlavor.sweet],
    isFavorite: true,
    rating: 4.5,
  ),
  FoodEntity(
    foodId: "food_005",
    foodName: "Spaghetti Carbonara",
    foodDesc:
        "Classic Italian pasta dish with eggs, cheese, pancetta, and black pepper.",
    foodHistory:
        "Classic Italian pasta dish with eggs, cheese, pancetta, and black pepper.",
    foodRegion: FoodRegion.south,
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
    flavors: [FoodFlavor.sour],
    isFavorite: false,
    rating: 4.4,
  ),
  FoodEntity(
    foodId: "food_006",
    foodName: "Pad Thai",
    foodDesc:
        "Famous Thai stir-fried rice noodle dish with shrimp, tofu, peanuts, and bean sprouts.",
    foodHistory:
        "Famous Thai stir-fried rice noodle dish with shrimp, tofu, peanuts, and bean sprouts.",
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
    flavors: [FoodFlavor.sour, FoodFlavor.spicy, FoodFlavor.sweet],
    isFavorite: true,
    rating: 4.6,
  ),
  FoodEntity(
    foodId: "food_007",
    foodName: "Cheeseburger",
    foodDesc:
        "An American classic featuring a juicy beef patty, melted cheese, and fresh vegetables.",
    foodHistory:
        "An American classic featuring a juicy beef patty, melted cheese, and fresh vegetables.",
    foodRegion: FoodRegion.central,
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
    flavors: [FoodFlavor.sour, FoodFlavor.sweet],
    isFavorite: false,
    rating: 4.2,
  ),
  FoodEntity(
    foodId: "food_008",
    foodName: "Tacos",
    foodDesc:
        "Traditional Mexican dish with soft corn tortillas and a variety of savory fillings.",
    foodHistory:
        "Traditional Mexican dish with soft corn tortillas and a variety of savory fillings.",
    foodRegion: FoodRegion.central,
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
    flavors: [FoodFlavor.spicy, FoodFlavor.sour],
    isFavorite: true,
    rating: 4.3,
  ),
  FoodEntity(
    foodId: "food_009",
    foodName: "Chicken Curry",
    foodDesc:
        "Rich and aromatic curry made with tender chicken pieces and a blend of spices.",
    foodHistory:
        "Rich and aromatic curry made with tender chicken pieces and a blend of spices.",
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
    flavors: [FoodFlavor.spicy, FoodFlavor.sour],
    isFavorite: false,
    rating: 4.7,
  ),
  FoodEntity(
    foodId: "food_010",
    foodName: "Chocolate Cake",
    foodDesc:
        "Decadent dessert with rich chocolate flavor and creamy frosting.",
    foodHistory:
        "Decadent dessert with rich chocolate flavor and creamy frosting.",
    foodRegion: FoodRegion.south,
    foodCategory: FoodCategory.soup,
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
    flavors: [FoodFlavor.sweet],
    isFavorite: true,
    rating: 4.9,
  ),
];

class FavoriteFoodPage extends StatefulWidget {
  const FavoriteFoodPage({super.key});

  @override
  State<FavoriteFoodPage> createState() => _FavoriteFoodPageState();
}

class _FavoriteFoodPageState extends State<FavoriteFoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(
          context: context,
          title: S.current.favorite_food_title,
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.marginL,
          ).copyWith(top: AppSpacing.marginS),
          child: Column(
            children: [
              const FoodFilterSection(),
              const SizedBox(height: AppSpacing.marginM),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      FoodItem(food: _foodEntities[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSpacing.marginS),
                  itemCount: _foodEntities.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
