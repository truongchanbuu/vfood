import 'package:flutter/material.dart';

import '../../../shared/presentations/widgets/default_app_bar.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: DefaultAppBar(),
        body: Column(),
      ),
    );
  }
}
