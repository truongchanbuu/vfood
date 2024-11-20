import 'package:flutter/material.dart';

extension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}