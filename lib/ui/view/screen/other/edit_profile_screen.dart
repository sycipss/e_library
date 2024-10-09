import 'dart:io';

import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view/widget/profile/edit_profil_form_widget.dart';
import 'package:e_library/ui/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  final String? name;
  final String? gender;
  final String? imagePath;

  const EditProfileScreen({
    super.key,
    this.name,
    this.gender,
    this.imagePath,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final editKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final genderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name ?? '';
    genderController.text = widget.gender ?? '';
    SharedPreferences.getInstance().then((prefs) {
      String? imagePath = prefs.getString('imagePath');
      if (imagePath != null) {
        if (!mounted) return;
        Provider.of<ProfileProvider>(context, listen: false)
            .updateImagePath(imagePath);
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorStyle = ColorStyle();
    final height = MediaQuery.of(context).size.height;
    final provider = Provider.of<ProfileProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Edit Profil',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorStyle.grey,
                ),
                child: Consumer<ProfileProvider>(
                    builder: (context, provider, child) {
                  return Stack(
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: (provider.imagePath != null &&
                                File(provider.imagePath!).existsSync())
                            ? FileImage(File(provider.imagePath!))
                                as ImageProvider
                            : const AssetImage('assets/image/lorem_ipsum.png'),
                      ),
                      Positioned(
                        top: -10,
                        right: -8,
                        child: IconButton(
                          onPressed: () {
                            provider.pickImage(ImageSource.gallery);
                          },
                          icon: Image.asset(
                            'assets/image/edit.jpg',
                            fit: BoxFit.contain,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            EditProfilFormWidget(
                height: height,
                editKey: editKey,
                nameController: nameController,
                provider: provider,
                colorStyle: colorStyle,
                genderController: genderController),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(
                onPressed: () async {
                  if (editKey.currentState!.validate()) {
                    final profileData =
                        Provider.of<ProfileProvider>(context, listen: false);
                    profileData.updateData(
                      name: nameController.text,
                      gender: genderController.text,
                      imagePath: provider.imagePath,
                    );
                    // Simpan perubahan ke SharedPreferences
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('name', nameController.text);

                    await prefs.setString('gender', genderController.text);

                    await prefs.setString(
                        'imagePath', profileData.imagePath ?? '');
                    if (mounted) {
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                    nameController.clear();
                    genderController.clear();
                  }
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(colorStyle.base),
                    fixedSize: const WidgetStatePropertyAll(Size(198, 54))),
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
