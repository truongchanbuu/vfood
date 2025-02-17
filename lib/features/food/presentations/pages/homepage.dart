import 'package:flutter/material.dart';

import '../widgets/home_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  double _scrollHeight = 0;

  void _onScroll() {
    setState(() {
      _scrollHeight = _scrollController.offset;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            HomeAppBar(scrollHeight: _scrollHeight),
            ...List.generate(
              100,
              (index) => SliverToBoxAdapter(child: Text('$index')),
            ),
          ],
        ),
      ),
    );
  }
}
