import 'package:flutter/material.dart';

import '../../../../cores/constants/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/presentations/widgets/default_app_bar.dart';
import '../../domain/entities/food_entity.dart';
import '../widgets/food_filter_section.dart';
import '../widgets/food_item.dart';

final List<FoodEntity> _foodEntities = [];

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
