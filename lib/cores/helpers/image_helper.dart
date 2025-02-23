import 'dart:io';

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
}
