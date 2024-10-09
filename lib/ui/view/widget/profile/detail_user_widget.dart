import 'dart:io';
import 'package:e_library/ui/view/screen/other/edit_profile_screen.dart';
import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailUserWidget extends StatefulWidget {
  const DetailUserWidget({
    super.key,
    required this.colorStyle,
  });
  final ColorStyle colorStyle;

  @override
  State<DetailUserWidget> createState() => _DetailUserWidgetState();
}

class _DetailUserWidgetState extends State<DetailUserWidget> {
  late SharedPreferences prefs;

  String? name;
  String? gender;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    // Get saved profile data
    name = prefs.getString('name');
    gender = prefs.getString('gender');
    imagePath = prefs.getString('imagePath');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profileData, child) {
      return Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage:
                  (imagePath != null && File(imagePath!).existsSync())
                      ? FileImage(File(imagePath!)) as ImageProvider
                      : const AssetImage('assets/image/lorem_ipsum.png'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      name: name,
                      gender: gender,
                      imagePath: imagePath,
                    ),
                  ),
                ).then((_) {
                  initPrefs();
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(widget.colorStyle.base),
              ),
              child: const Text(
                'Edit profil',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 32),
            Card(
              color: widget.colorStyle.textField,
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 66,
                width: 317,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nama'),
                        Text(name ?? 'belum diisi')
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: widget.colorStyle.textField,
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 66,
                width: 317,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Jenis kelamin'),
                        Text(gender ?? 'belum diisi')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
