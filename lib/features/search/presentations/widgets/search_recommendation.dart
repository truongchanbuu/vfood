import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';

import '../../../shared/presentations/widgets/expanded_button.dart';
import 'search_item.dart';

class SearchRecommendations extends StatefulWidget {
  const SearchRecommendations({super.key});

  @override
  State<SearchRecommendations> createState() => _SearchRecommendationsState();
}

class _SearchRecommendationsState extends State<SearchRecommendations> {
  bool _isExpanded = false;
  int minLines = 2;
  late int maxLines = minLines;

  List<String> recommendations = [];

  @override
  void initState() {
    super.initState();
    recommendations = [
      'Phở',
      'Bún Bò Huế',
      'Bún Chả',
      'Bánh Mì',
      'Gỏi cuốn',
      'Bánh Xèo',
      'Bánh Canh',
    ];
  }

  static const double spacing = 10;
  @override
  Widget build(BuildContext context) {
    return ExtendedWrap(
      direction: Axis.horizontal,
      runSpacing: spacing,
      spacing: spacing,
      minLines: minLines,
      maxLines: maxLines,
      overflowWidget: ExpandedButton(
        isExpanded: _isExpanded,
        onPressed: () => setState(() {
          _isExpanded = !_isExpanded;
          maxLines = _isExpanded ? recommendations.length : minLines;
        }),
      ),
      children: recommendations.map(_buildRecommendationItem).toList(),
    );
  }

  // TODO: ON TAP ITEM
  Widget _buildRecommendationItem(String recommendation) {
    return SearchItem(title: recommendation);
  }
}
