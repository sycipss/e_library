import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier {
  ImageProvider? _image;
  ImageProvider? get image => _image;
  String? _imagePath;
  String? get imagePath => _imagePath;
  String? name;
  String? gender;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    _imagePath = image.path;
    notifyListeners();
  }

  void updateImagePath(String path) {
    _imagePath = path;
    notifyListeners();
  }

  String? validateSetupForm(String? value) {
    if (value == null || value.isEmpty) {
      return 'Silakan isi kolom ini!';
    }
    return null;
  }

  void updateData({
    required String name,
    required String gender,
    required String? imagePath,
  }) {
    this.name = name;
    this.gender = gender;
    _imagePath = imagePath;
    notifyListeners();
  }
}
