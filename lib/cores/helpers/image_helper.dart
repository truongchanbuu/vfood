import 'dart:io';

import 'package:hl_image_picker/hl_image_picker.dart';

class ImageHelper {
  static bool isNetworkImage(String url) {
    final uri = Uri.tryParse(url);
    return uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https');
  }

  static bool isFile(String path) {
    return File(path).existsSync();
  }

  static const double _maximumImageSizeInKb = 1000;
  static const int _maximumSelectedAssets = 1;
  static Future<List<HLPickerItem>> pickImages({
    int maxSelectedAssets = _maximumSelectedAssets,
  }) async {
    final HLImagePicker picker = HLImagePicker();

    return await picker.openPicker(
      cropping: true,
      cropOptions: const HLCropOptions(
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 0.9,
        croppingStyle: CroppingStyle.circular,
      ),
      pickerOptions: HLPickerOptions(
        mediaType: MediaType.image,
        maxSelectedAssets: maxSelectedAssets,
        maxFileSize: _maximumImageSizeInKb,
        enablePreview: true,
        usedCameraButton: true,
      ),
    );
  }
}
