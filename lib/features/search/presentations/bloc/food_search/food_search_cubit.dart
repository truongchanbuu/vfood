import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hl_image_picker/hl_image_picker.dart';

import '../../../../../config/log/app_logger.dart';
import '../../../../../cores/helpers/image_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../injection_container.dart';

part 'food_search_state.dart';

class FoodSearchCubit extends Cubit<FoodSearchState> {
  FoodSearchCubit() : super(FoodSearchInitial());

  final AppLogger _appLogger = getIt.get<AppLogger>();

  Future<void> searchByImage() async {
    try {
      emit(FoodSearching());
      final List<HLPickerItem> images = await ImageHelper.pickImages();

      print(images);
      // TODO: CONTINUE IMPLEMENTING

      emit(SearchSucceed());
    } catch (e) {
      _appLogger.e(e);
      emit(SearchFoodFailed(S.current.not_found_title));
    }
  }
}
