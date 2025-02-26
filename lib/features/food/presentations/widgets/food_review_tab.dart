// import 'package:flutter/material.dart';
//
// import '../../../../cores/constants/colors.dart';
// import '../../../../cores/constants/font_sizes.dart';
// import '../../../../cores/constants/spacing.dart';
// import '../../../../cores/extensions/context_extension.dart';
// import '../../../../generated/l10n.dart';
//
// class FoodReviewTab extends StatelessWidget {
//   const FoodReviewTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(AppSpacing.paddingSM),
//           decoration: BoxDecoration(
//             color:
//                 context.isDarkMode ? AppColors.primaryDark : AppColors.primary,
//             borderRadius: BorderRadius.circular(AppSpacing.radiusS),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.reviews,
//                     color: Colors.white,
//                   ),
//                   const SizedBox(width: AppSpacing.marginS),
//                   Text(
//                     S.current.reviews_title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: AppFontSize.h4,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     S.current.view_all_button,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: AppFontSize.bodyLarge,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Icon(
//                     Icons.chevron_right,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//
//         const SizedBox(height: AppSpacing.marginL),
//
//         // Reviews Card
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(AppSpacing.radiusM),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: .05),
//                 spreadRadius: 1,
//                 blurRadius: 5,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               // Reviews section
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.25,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: AppSpacing.marginL,
//                   vertical: AppSpacing.marginM,
//                 ),
//                 decoration: BoxDecoration(
//                   color: context.isDarkMode ? AppColors.textDark : Colors.white,
//                   borderRadius: BorderRadius.circular(AppSpacing.radiusM),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withValues(alpha: .1),
//                       blurRadius: 4,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                   border: Border.all(
//                     color: AppColors.textGray,
//                     width: 0.05,
//                   ),
//                 ),
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => _buildReviewItem(
//                     "User 001",
//                     "15 minutes ago",
//                     "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus tempore quibusdam operam reprehenderit totam sunt dolores voluptates voluptatem dolore justo minus verirtatis, quas face Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus tempore qui...",
//                   ),
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(width: AppSpacing.marginS),
//                   itemCount: 3,
//                 ),
//               ),
//
//               const SizedBox(height: AppSpacing.marginL),
//
//               // Review button
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text(
//                   S.current.review_button,
//                   style: const TextStyle(
//                     color: AppColors.primary,
//                     fontWeight: FontWeight.bold,
//                     fontSize: AppFontSize.h4,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildReviewItem(String userName, String timeAgo, String reviewText) {
//     return SizedBox(
//       width: 300,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // User info row
//           Row(
//             children: [
//               // Avatar
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: const BoxDecoration(
//                   color: AppColors.primary,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Center(
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//
//               const SizedBox(width: AppSpacing.marginS),
//
//               // User name and time
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     userName,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: AppFontSize.h4,
//                     ),
//                   ),
//                   Text(
//                     timeAgo,
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: AppFontSize.bodyMedium,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//
//           const SizedBox(height: AppSpacing.marginSM),
//
//           // Review text
//           Text(
//             reviewText,
//             style: const TextStyle(
//               fontSize: AppFontSize.bodyLarge,
//               color: ,
//             ),
//             maxLines: 5,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }
