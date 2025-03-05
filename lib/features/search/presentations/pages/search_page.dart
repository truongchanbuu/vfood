import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:flutter/material.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../search/presentations/widgets/recent_search.dart';
import '../../../search/presentations/widgets/search_recommendation.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final FocusNode _searchFocusNode;
  late final TextEditingController _searchController;
  List<String> _recentSearches = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode()..requestFocus();
  }

  static const double _toolBarHeight = kToolbarHeight + 30;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _searchFocusNode.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor:
          context.isDarkMode ? AppColors.primaryDark : AppColors.primary,
      shape: const Border(
        bottom: BorderSide(width: 0.5, color: AppColors.textGray),
      ),
      title: AnimatedTextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        hintTexts: const [
          'Phở',
          'Bún Bò Huế',
          'Bún Chả',
          'Bánh Mì',
          'Gỏi cuốn',
          'Bánh Xèo',
          'Bánh Canh',
        ],
        onSubmitted: (value) => _onSearch(),
        animationType: Animationtype.slide,
      ),
      toolbarHeight: _toolBarHeight,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: _onSearch,
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  static const SizedBox _spacing = SizedBox(height: 10);
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.marginL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_recentSearches.isNotEmpty) ...[
              SearchTitle(
                title: S.current.recent_searches_section_title,
                suffix: GestureDetector(
                  onTap: () {},
                  child: Text(
                    S.current.clear_button,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.isDarkMode
                          ? AppColors.textLight
                          : AppColors.primary,
                    ),
                  ),
                ),
              ),
              _spacing,
              RecentSearch(recentSearches: _recentSearches),
              _spacing,
            ],
            SearchTitle(title: S.current.recommended_food_title),
            _spacing,
            const SearchRecommendations(),
          ],
        ),
      ),
    );
  }

  void _onSearch() {}
}

class SearchTitle extends StatelessWidget {
  final String title;
  final Widget? suffix;
  const SearchTitle({
    super.key,
    required this.title,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.bodyLarge,
            ),
            semanticsLabel: title,
          ),
          if (suffix != null) suffix!,
        ],
      ),
    );
  }
}
