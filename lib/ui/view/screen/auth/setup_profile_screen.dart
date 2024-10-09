import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view/widget/navbar/navbar_widget.dart';
import 'package:e_library/ui/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  final authKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorStyle = ColorStyle();
    final height = MediaQuery.of(context).size.height;
    final provider = Provider.of<ProfileProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: height * 0.1),
            const Text(
              'E-Library',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 56, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Isi data dulu ya!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: height * 0.1,
              ),
              child: Form(
                key: authKey,
                child: Column(
                  children: [
                    //Name
                    TextFormField(
                      controller: nameController,
                      validator: provider.validateSetupForm,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: colorStyle.textField,
                        hintText: 'Nama',
                        label: const Text('Nama'),
                        floatingLabelStyle:
                            const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: colorStyle.textField),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    //Gender
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
                            floatingLabelStyle:
                                const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: colorStyle.textField),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(
                onPressed: () async {
                  if (authKey.currentState!.validate()) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('name', nameController.text);
                    await prefs.setString('gender', genderController.text);
                    if (mounted) {
                      Navigator.pushReplacement(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavbarWidget(),
                        ),
                      );
                    }

                    nameController.clear();
                    genderController.clear();
                  }
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(colorStyle.base),
                    fixedSize: const WidgetStatePropertyAll(Size(198, 54))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mulai',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
