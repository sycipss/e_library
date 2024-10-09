import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view_model/profile_provider.dart';
import 'package:flutter/material.dart';

class EditProfilFormWidget extends StatelessWidget {
  const EditProfilFormWidget({
    super.key,
    required this.height,
    required this.editKey,
    required this.nameController,
    required this.provider,
    required this.colorStyle,
    required this.genderController,
  });

  final double height;
  final GlobalKey<FormState> editKey;
  final TextEditingController nameController;
  final ProfileProvider provider;
  final ColorStyle colorStyle;
  final TextEditingController genderController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: height * 0.030,
      ),
      child: Form(
        key: editKey,
        child: Column(
          children: [
            //name
            TextFormField(
              controller: nameController,
              validator: provider.validateSetupForm,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                filled: true,
                fillColor: colorStyle.textField,
                hintText: 'Nama',
                label: const Text('Nama'),
                floatingLabelStyle: const TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: colorStyle.textField),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: height * 0.016),
            //gender
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.male),
                          title: const Text('Laki-laki'),
                          onTap: () {
                            genderController.text = 'Laki-laki';
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.female),
                          title: const Text('Perempuan'),
                          onTap: () {
                            genderController.text = 'Perempuan';
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: genderController,
                  validator: provider.validateSetupForm,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colorStyle.textField,
                    hintText: 'Jenis kelamin',
                    label: const Text('Jenis kelamin'),
                    floatingLabelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: colorStyle.textField),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.016),
          ],
        ),
      ),
    );
  }
}
