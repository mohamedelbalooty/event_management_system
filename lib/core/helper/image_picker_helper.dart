import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  final ImagePicker _picker;

  const ImagePickerHelper({required ImagePicker picker}) : _picker = picker;

  Future<XFile?> pickImage(
      {ImageSource source = ImageSource.gallery,
        int? quality,
        double? maxHeight,
        double? maxWidth}) async =>
      await _picker.pickImage(
          source: source,
          imageQuality: quality,
          maxHeight: maxHeight,
          maxWidth: maxWidth);

  Future<List<XFile?>> pickMultipleImages(
      {int? quality, double? maxHeight, double? maxWidth}) async =>
      await _picker.pickMultiImage(
          imageQuality: quality, maxHeight: maxHeight, maxWidth: maxWidth);

  Future<XFile?> pickVideo({ImageSource source = ImageSource.gallery}) async =>
      await _picker.pickVideo(source: source);
}