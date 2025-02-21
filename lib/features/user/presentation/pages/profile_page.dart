import 'package:flutter/material.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.marginM),
          child: Column(
            children: [
              // Profile Picture and Name
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE0E0E0),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/profile_avatar.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.marginS),
                    const Text(
                      'GFXAgency',
                      style: TextStyle(
                        fontSize: AppFontSize.labelLarge,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.marginM),
                  ],
                ),
              ),

              // Profile Fields
              _buildProfileField(
                icon: Icons.email_outlined,
                title: 'Email',
                value: 'g***m',
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.marginM),
              _buildProfileField(
                icon: Icons.person_outline,
                title: 'Display Name',
                value: 'Dito',
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.marginM),
              _buildProfileField(
                icon: Icons.phone_outlined,
                title: 'Phone Number',
                value: '+***50',
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.marginM),
              _buildProfileField(
                icon: Icons.lock_outline,
                title: 'Password',
                value: '•••',
                onTap: () {},
              ),

              const SizedBox(height: AppSpacing.marginXL),

              // Logout Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primary),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.paddingL,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusS),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: AppFontSize.labelLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusS),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey, size: 20),
            const SizedBox(width: AppSpacing.marginS),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: AppFontSize.bodyMedium,
                  color: Colors.grey,
                ),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: AppFontSize.bodyMedium,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: AppSpacing.marginS),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
          ],
        ),
      ),
    );
  }
}
