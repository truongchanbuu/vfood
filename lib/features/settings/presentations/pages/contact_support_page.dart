import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/commons.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/constants/text_styles.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../bloc/contact/contact_cubit.dart';

class ContactSupportPage extends StatefulWidget {
  const ContactSupportPage({super.key});

  @override
  State<ContactSupportPage> createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _subject = '';
  String _message = '';
  String? _selectedIssueType;
  String? _attachedImageUrl;

  final List<String> _issueTypes = [
    S.current.technical_issue_option,
    S.current.incorrect_food_detection_option,
    S.current.incomplete_food_information_option,
    S.current.payment_option,
    S.current.suggest_new_food_option,
    S.current.others_option,
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedIssueType != null) {
      _formKey.currentState!.save();
    } else if (_selectedIssueType == null) {
      CherryToast.error(
        description: Text(S.current.issues_empty),
        animationType: AnimationType.fromRight,
        animationDuration: AppCommons.toastAnimationDuration,
        toastDuration: AppCommons.toastDuration,
      ).show(context);
    }
  }

  void _resetForm() {
    setState(() {
      _name = '';
      _email = '';
      _subject = '';
      _message = '';
      _selectedIssueType = null;
      _attachedImageUrl = null;
    });
    _formKey.currentState?.reset();
  }

  void _mockAttachImage() {
    setState(() {
      _attachedImageUrl = 'https://via.placeholder.com/100';
    });
  }

  void _removeAttachedImage() {
    setState(() {
      _attachedImageUrl = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state is ContactFailure) {
          CherryToast.error(
            description: Text(state.errorMessage),
            animationDuration: AppCommons.toastAnimationDuration,
            animationType: AnimationType.fromRight,
            toastDuration: AppCommons.toastDuration,
          ).show(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: context.isDarkMode
              ? AppColors.backgroundDark
              : AppColors.background,
          body: CustomScrollView(
            slivers: [
              // App Bar
              SliverAppBar(
                iconTheme: const IconThemeData(color: AppColors.textLight),
                expandedHeight: 120,
                pinned: true,
                backgroundColor: context.isDarkMode
                    ? AppColors.primaryDark
                    : AppColors.primary,
                title: Text(
                  S.current.support_title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textLight,
                  ),
                ),
                centerTitle: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: context.isDarkMode
                        ? AppColors.primaryDark
                        : AppColors.primary,
                    alignment: Alignment.bottomLeft,
                    padding:
                        const EdgeInsets.only(left: 16, bottom: 30, right: 16),
                    child: Text(
                      S.current.support_response_time_desc,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: AppFontSize.h4,
                      ),
                      maxLines: 5,
                    ),
                  ),
                ),
              ),

              // FAQ Section
              SliverToBoxAdapter(
                child: _buildFAQSection(),
              ),

              // Contact Form
              SliverToBoxAdapter(
                child: _buildContactForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQSection() {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.marginM),
      padding: const EdgeInsets.all(AppSpacing.paddingM),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.textDark : AppColors.textLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.faqs_title,
            style: TextStyle(
              fontSize: AppFontSize.labelLarge,
              fontWeight: FontWeight.bold,
              color:
                  context.isDarkMode ? AppColors.textLight : AppColors.textGray,
            ),
          ),
          const SizedBox(height: AppSpacing.marginS),
          _buildFAQItem('Làm thế nào để chụp ảnh món ăn tốt nhất?'),
          _buildFAQItem('Tại sao ứng dụng không nhận diện được món ăn?'),
          _buildFAQItem('Làm thế nào để thêm món ăn vào cơ sở dữ liệu?'),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.paddingS),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.textGray,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: TextStyle(
                  fontSize: AppFontSize.labelLarge,
                  color: context.isDarkMode
                      ? AppColors.textLight
                      : AppColors.textGray,
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Color(0xFF888888),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    final fieldLabelStyle = AppTextStyle.h4.copyWith(
      color: context.isDarkMode ? AppColors.textLight : AppColors.textDark,
    );

    return Container(
      margin: const EdgeInsets.all(AppSpacing.marginM),
      padding: const EdgeInsets.all(AppSpacing.paddingM),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.textDark : AppColors.textLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusS),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.contact_with_us_title,
              style: TextStyle(
                fontSize: AppFontSize.labelLarge,
                fontWeight: FontWeight.bold,
                color: context.isDarkMode
                    ? AppColors.textLight
                    : AppColors.textGray,
                height: 1.5,
              ),
            ),
            const SizedBox(height: AppSpacing.marginM),

            // Issue Type Selection
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.issue_type,
                  style: AppTextStyle.h4.copyWith(
                    color: context.isDarkMode
                        ? AppColors.textLight
                        : AppColors.textGray,
                  ),
                ),
                const SizedBox(height: AppSpacing.marginS),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _issueTypes.map((type) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          label: Text(
                            type,
                            style: TextStyle(
                              fontSize: AppFontSize.bodyMedium,
                              color: _selectedIssueType == type
                                  ? AppColors.textLight
                                  : AppColors.textGray,
                            ),
                          ),
                          selected: _selectedIssueType == type,
                          selectedColor: AppColors.primary,
                          backgroundColor: context.isDarkMode
                              ? AppColors.textDark
                              : AppColors.textLight,
                          checkmarkColor: AppColors.textLight,
                          onSelected: (selected) {
                            setState(() {
                              _selectedIssueType = selected ? type : null;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.marginM),

            // Name Field
            TextFormField(
              decoration: InputDecoration(
                labelText: S.current.full_name_field,
                labelStyle: fieldLabelStyle,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSpacing.radiusS),
                  ),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.full_name_empty;
                }

                return null;
              },
              onSaved: (value) {
                _name = value ?? '';
              },
            ),
            const SizedBox(height: AppSpacing.marginM),

            // Email Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: fieldLabelStyle,
                border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSpacing.radiusS)),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.email_empty;
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return S.current.invalid_email;
                }
                return null;
              },
              onSaved: (value) {
                _email = value ?? '';
              },
            ),
            const SizedBox(height: AppSpacing.marginM),

            // Subject Field
            TextFormField(
              decoration: InputDecoration(
                labelText: S.current.subject_field,
                labelStyle: fieldLabelStyle,
                border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSpacing.radiusS)),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.subject_empty;
                }

                return null;
              },
              onSaved: (value) {
                _subject = value ?? '';
              },
            ),
            const SizedBox(height: AppSpacing.marginM),

            // Message Field
            TextFormField(
              decoration: InputDecoration(
                labelText: S.current.content_field,
                alignLabelWithHint: true,
                labelStyle: fieldLabelStyle,
                border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSpacing.radiusS)),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              maxLines: 5,
              textInputAction: TextInputAction.send,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.content_empty;
                }
                return null;
              },
              onSaved: (value) {
                _message = value ?? '';
              },
            ),
            const SizedBox(height: AppSpacing.marginM),

            // Image Attachment
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.current.attached_image_title,
                      style: fieldLabelStyle,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.attach_file,
                        color: AppColors.primary,
                      ),
                      onPressed: _mockAttachImage,
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                if (_attachedImageUrl != null) ...[
                  const SizedBox(height: AppSpacing.marginS),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusS),
                        child: Image.network(
                          _attachedImageUrl!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ),
                            onPressed: _removeAttachedImage,
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
            const SizedBox(height: AppSpacing.marginM),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusS),
                  ),
                ),
                child: Text(
                  S.current.submit_support_request,
                  style: fieldLabelStyle.copyWith(fontSize: AppFontSize.h3),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.marginL),

            // Alternative Contact Methods
            Column(
              children: [
                Text(
                  S.current.other_contact,
                  style: fieldLabelStyle,
                ),
                const SizedBox(height: AppSpacing.marginL),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildContactOption(
                      Icons.phone,
                      S.current.phone_contact_option,
                      Colors.blue,
                      context.read<ContactCubit>().contactWithPhone,
                    ),
                    _buildContactOption(
                      Icons.facebook,
                      'Facebook',
                      const Color(0xFF4267B2),
                      context.read<ContactCubit>().contactWithFb,
                    ),
                    _buildContactOption(
                      Icons.email,
                      'Email',
                      AppColors.primary,
                      context.read<ContactCubit>().contactWithMail,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.marginM),
          ],
        ),
      ),
    );
  }

  Widget _buildContactOption(
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: AppSpacing.marginXS),
          Text(
            label,
            style: const TextStyle(
              fontSize: AppFontSize.bodySmall,
              color: Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }
}
