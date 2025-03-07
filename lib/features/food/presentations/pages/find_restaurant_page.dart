import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/bx.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/presentations/widgets/app_loading_indicator.dart';
import '../../../shared/presentations/widgets/default_app_bar.dart';
import '../bloc/find_restaurant/find_restaurant_bloc.dart';

class FindRestaurantPage extends StatelessWidget {
  const FindRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FindRestaurantBloc, FindRestaurantState>(
      listener: (context, state) {
        if (state is LocationPermissionDenied) {
          Navigator.pop(context);
        } else if (state is MapOpenFailed || state is FindRestaurantFailed) {
          final errorMessage = (state is MapOpenFailed)
              ? state.errorMessage
              : (state as FindRestaurantFailed).errorMessage;

          _showErrorToast(context, errorMessage);
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: context.isDarkMode
                ? AppColors.backgroundDark
                : AppColors.background,
            appBar: DefaultAppBar(
              title: S.current.restaurants_nearby_title,
              centerTitle: false,
            ),
            body: BlocBuilder<FindRestaurantBloc, FindRestaurantState>(
              builder: (context, state) {
                if (state is RestaurantLoading) {
                  return const AppLoadingIndicator(
                      assetName: 'location_loading');
                }

                return Padding(
                  padding: const EdgeInsets.all(AppSpacing.marginL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Result
                      Text(
                        '4 restaurants found near you',
                        style: TextStyle(
                          color: context.isDarkMode
                              ? AppColors.textLight
                              : AppColors.textDark,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.h4,
                        ),
                      ),

                      const SizedBox(height: AppSpacing.marginS),

                      DropdownButtonFormField<String>(
                        elevation: 2,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        hint: Text(S.current.sort_by_button),
                        items: const [
                          DropdownMenuItem(
                            value: '0',
                            child: Text('Nearest you'),
                          ),
                          DropdownMenuItem(
                            value: '1',
                            child: Text('Most Further you'),
                          ),
                          DropdownMenuItem(
                            value: '2',
                            child: Text('Lowest Price'),
                          ),
                          DropdownMenuItem(
                            value: '3',
                            child: Text('Most Expensive'),
                          ),
                          DropdownMenuItem(
                            value: '4',
                            child: Text('Highest Rating'),
                          ),
                          DropdownMenuItem(
                            value: '5',
                            child: Text('Lowest Rating'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),

                      const SizedBox(height: AppSpacing.marginS),

                      Expanded(
                        child: ListView.separated(
                          itemBuilder: _buildRestaurantItem,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: AppSpacing.marginS),
                          itemCount: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // TODO: CHANGE LONGITUDE AND LATITUDE
  Widget _buildRestaurantItem(BuildContext context, int index) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Name
            Text(
              'Pho Hai',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.h3,
              ),
            ),

            SizedBox(height: AppSpacing.marginXS),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '4.6',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.h4,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.marginXS),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.textGray,
                ),
                Text(
                  '123 ABC Street, District 1, HCMC',
                  style: TextStyle(
                    fontSize: AppFontSize.h4,
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () => context.read<FindRestaurantBloc>().add(const OpenMap(
                longitude: 37.7749,
                latitude: -122.4194,
              )),
          child: const Iconify(Bx.navigation),
        ),
      ),
    );
  }

  void _showErrorToast(BuildContext context, String message) {
    CherryToast.error(
      title: Text(S.current.failure_notification_title),
      description: Text(message),
      toastPosition: Position.bottom,
    ).show(context);
  }
}
