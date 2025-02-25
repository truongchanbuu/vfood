import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/string_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/presentations/widgets/app_search_bar.dart';
import '../../domain/entities/food_category.dart';
import '../../domain/entities/food_flavor.dart';
import '../../domain/entities/food_region.dart';

class FoodFilterSection extends StatefulWidget {
  const FoodFilterSection({super.key});

  @override
  State<FoodFilterSection> createState() => _FoodFilterSectionState();
}

class _FoodFilterSectionState extends State<FoodFilterSection> {
  late final TextEditingController _searchController;
  bool _isFilterDisplayed = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: AppSearchBar(searchController: _searchController),
            ),
            const SizedBox(width: AppSpacing.marginS),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () => setState(
                  () => _isFilterDisplayed = !_isFilterDisplayed,
                ),
                icon: const Iconify(AntDesign.filter_outline),
              ),
            ),
          ],
        ),
        AnimatedSwitcherPlus.translationLeft(
          duration: const Duration(milliseconds: 500),
          child: _isFilterDisplayed
              ? Column(
                  children: [
                    const SizedBox(height: AppSpacing.marginM),
                    MultiDropdown<FoodCategory>(
                      items: FoodCategory.values
                          .map((e) =>
                              DropdownItem(label: e.normalizedName, value: e))
                          .toList(),
                      itemBuilder: (item, index, onTap) => ListTile(
                        onTap: onTap,
                        title: Text(item.value.normalizedName),
                        leading: Iconify(item.value.icon),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.paddingM,
                        ),
                        trailing: item.selected
                            ? const Icon(Icons.check, color: AppColors.primary)
                            : null,
                      ),
                      fieldDecoration: FieldDecoration(
                        hintText: S.current.food_category_title,
                      ),
                      chipDecoration: const ChipDecoration(
                        backgroundColor: AppColors.primary,
                        labelStyle: TextStyle(color: AppColors.textLight),
                        deleteIcon: Icon(Icons.close,
                            color: AppColors.textLight, size: 15),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.marginM),
                    MultiDropdown<FoodRegion>(
                      items: FoodRegion.values
                          .map((e) => DropdownItem(
                                label: e.name.toUpperCaseFirstLetter,
                                value: e,
                              ))
                          .toList(),
                      fieldDecoration: FieldDecoration(
                        hintText: S.current.food_region_title,
                      ),
                      itemBuilder: (item, index, onTap) => ListTile(
                        onTap: onTap,
                        title: Text(item.value.name.toUpperCaseFirstLetter),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.paddingM,
                        ),
                        trailing: item.selected
                            ? const Icon(Icons.check, color: AppColors.primary)
                            : null,
                      ),
                      chipDecoration: const ChipDecoration(
                        backgroundColor: AppColors.primary,
                        labelStyle: TextStyle(color: AppColors.textLight),
                        deleteIcon: Icon(Icons.close,
                            color: AppColors.textLight, size: 15),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.marginM),
                    MultiDropdown<FoodFlavor>(
                      items: FoodFlavor.values
                          .map((e) => DropdownItem(
                                label: e.normalizedName,
                                value: e,
                              ))
                          .toList(),
                      fieldDecoration: FieldDecoration(
                        hintText: S.current.food_flavor_title,
                      ),
                      itemBuilder: (item, index, onTap) => ListTile(
                        onTap: onTap,
                        leading: Iconify(item.value.icon),
                        title: Text(item.value.normalizedName),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.paddingM,
                        ),
                        trailing: item.selected
                            ? const Icon(Icons.check, color: AppColors.primary)
                            : null,
                      ),
                      chipDecoration: const ChipDecoration(
                        backgroundColor: AppColors.primary,
                        labelStyle: TextStyle(color: AppColors.textLight),
                        deleteIcon: Icon(Icons.close,
                            color: AppColors.textLight, size: 15),
                      ),
                    ),
                  ],
                )
              : null,
        ),
      ],
    );
  }
}
