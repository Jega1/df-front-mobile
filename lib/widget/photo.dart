import 'package:image_picker/image_picker.dart';

Future getImageFromCamera() async {
  ImagePicker picker = ImagePicker();
  final pickedFile =
      await picker.getImage(source: ImageSource.camera, imageQuality: 60);
  return pickedFile;
}

Future imageFromGallery() async {
  ImagePicker picker = ImagePicker();
  final pickedFile =
      await picker.getImage(source: ImageSource.gallery, imageQuality: 60);
  return pickedFile;
}
