import 'package:flutter/material.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../generated/l10n.dart';

class ExpandedButton extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onPressed;
  const ExpandedButton({
    super.key,
    required this.isExpanded,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const Color iconColor = Colors.white;

    return IconButton(
      onPressed: onPressed,
      tooltip: isExpanded ? S.current.show_less_text : S.current.show_more_text,
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
      ),
      icon: isExpanded
          ? const Icon(
              Icons.arrow_upward,
              color: iconColor,
            )
          : const Icon(
              Icons.arrow_downward,
              color: iconColor,
            ),
    );
  }
}
