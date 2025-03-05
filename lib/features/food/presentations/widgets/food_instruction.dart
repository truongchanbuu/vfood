import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/bi.dart';
import 'package:moment_dart/moment_dart.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../cores/extensions/string_extension.dart';
import '../../../shared/presentations/widgets/error_image.dart';
import '../../domain/entities/recipe_instruction.dart';

class FoodInstruction extends StatefulWidget {
  final String recipeId;
  final List<RecipeInstruction> recipeInstruction;

  const FoodInstruction({
    super.key,
    required this.recipeId,
    required this.recipeInstruction,
  });

  @override
  State<FoodInstruction> createState() => _FoodInstructionState();
}

class _FoodInstructionState extends State<FoodInstruction> {
  Map<int, bool> _expandedValues = {};

  @override
  void initState() {
    super.initState();
    _expandedValues = {
      for (var instruction in widget.recipeInstruction) instruction.step: false
    };
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        if (_expandedValues[panelIndex] != isExpanded) {
          setState(() => _expandedValues[panelIndex] = isExpanded);
        }
      },
      children: widget.recipeInstruction
          .map(
            (instruction) => _buildExpansionPanel(
              isExpanded: _expandedValues[instruction.step - 1] ?? false,
              headerBuilder: (context, isExpanded) => _buildHeader(instruction),
              body: _buildBody(instruction),
            ),
          )
          .toList(),
    );
  }

  ExpansionPanel _buildExpansionPanel({
    required Widget Function(BuildContext context, bool isExpanded)
        headerBuilder,
    required bool isExpanded,
    required Widget body,
  }) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: isExpanded,
      headerBuilder: headerBuilder,
      body: body,
    );
  }

  Widget _buildHeader(RecipeInstruction instruction) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          padding: const EdgeInsets.all(AppSpacing.marginS),
          margin: const EdgeInsets.all(AppSpacing.marginM).copyWith(right: 0),
          child: Text(
            instruction.step.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.h4,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.marginS),
        Text(
          instruction.stepTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.h3,
          ),
          maxLines: 5,
        ),
      ],
    );
  }

  static const double imageHeight = 200;
  Widget _buildBody(RecipeInstruction recipeInstruction) {
    final double imageWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlutterCarousel(
          items: recipeInstruction.imageUrls
              .map((imgUrl) => CachedNetworkImage(
                    imageUrl: imgUrl,
                    fit: BoxFit.cover,
                    width: imageWidth,
                    height: imageHeight,
                    cacheKey:
                        '${widget.recipeId}-${recipeInstruction.step}-${recipeInstruction.stepTitle}-$imgUrl',
                    errorWidget: (context, url, error) => ErrorImage(
                      width: imageWidth,
                      height: imageHeight,
                    ),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ))
              .toList(),
          options: FlutterCarouselOptions(
            enlargeCenterPage: true,
            enlargeFactor: 1,
            aspectRatio: 1,
            viewportFraction: 1,
          ),
        ),
        if (recipeInstruction.duration != null)
          Padding(
            padding:
                const EdgeInsets.all(AppSpacing.marginM).copyWith(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Iconify(
                  Bi.clock,
                  color: context.isDarkMode ? Colors.white : Colors.purple,
                ),
                const SizedBox(width: AppSpacing.marginS),
                Text(
                  recipeInstruction.duration!
                      .toDurationString()
                      .toUpperCaseFirstLetter,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.marginM),
          child: Text(
            recipeInstruction.stepDescription,
            style: const TextStyle(
              fontSize: AppFontSize.h4,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        )
      ],
    );
  }
}
