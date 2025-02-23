import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:lottie/lottie.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../cores/helpers/image_helper.dart';

class UserAvatar extends StatefulWidget {
  final String email;
  final String username;
  final String? photoUrl;
  final DateTime? updatedAt;

  const UserAvatar({
    super.key,
    this.email = '',
    this.username = '',
    this.photoUrl,
    this.updatedAt,
  });

  @override
  State<UserAvatar> createState() => UserAvatarState();
}

class UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdvancedAvatar(
          name: formattedUsername,
          style: const TextStyle(
            fontSize: AppFontSize.h1,
            fontWeight: FontWeight.bold,
          ),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          size: MediaQuery.of(context).size.width * 0.3,
          child: _buildImage(),
        ),
        const SizedBox(height: AppSpacing.marginS),
        Text(
          widget.username,
          style: TextStyle(
            color:
                context.isDarkMode ? AppColors.textLight : AppColors.textDark,
            fontSize: AppFontSize.h3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String get formattedUsername =>
      widget.username.isNotEmpty ? widget.username : 'User';

  Widget? _buildImage() {
    if (widget.photoUrl?.isEmpty ?? true) return null;

    final size = MediaQuery.of(context).size.width * 0.3;
    if (ImageHelper.isNetworkImage(widget.photoUrl!)) {
      return CachedNetworkImage(
        imageUrl: widget.photoUrl!,
        cacheKey: '${widget.email}_${widget.username}_${widget.updatedAt}',
        fit: BoxFit.cover,
        width: size,
        height: size,
      );
    }

    if (ImageHelper.isFile(widget.photoUrl!)) {
      return Image.file(
        File(widget.photoUrl!),
        fit: BoxFit.cover,
        height: size,
        width: size,
        errorBuilder: (context, error, stackTrace) => _defaultImage(size),
      );
    }

    return _defaultImage(size);
  }

  Widget _defaultImage([double size = 50]) => Lottie.asset(
        'assets/shared/json/default_avatar.json',
        fit: BoxFit.cover,
        height: size,
        width: size,
      );
}
