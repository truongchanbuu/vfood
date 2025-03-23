import 'package:equatable/equatable.dart';
import 'package:hl_image_picker/hl_image_picker.dart';

class ImageItem extends Equatable {
  final String id;
  final String path;
  final String name;
  final String mimeType;
  final int size;
  final int width;
  final int height;
  final String type;
  final String? thumbnail;

  const ImageItem({
    required this.path,
    required this.id,
    required this.name,
    required this.mimeType,
    required this.size,
    required this.width,
    required this.height,
    required this.type,
    this.thumbnail,
  });

  factory ImageItem.fromHLPickerItem(HLPickerItem item) {
    return ImageItem(
      path: item.path,
      id: item.id,
      name: item.name,
      mimeType: item.mimeType,
      size: item.size,
      width: item.width,
      height: item.height,
      type: item.type,
      thumbnail: item.thumbnail,
    );
  }

  @override
  List<Object?> get props => [
        id,
        path,
        name,
        mimeType,
        size,
        width,
        height,
        type,
        thumbnail,
      ];
}
