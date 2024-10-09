import 'dart:io';
import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view/widget/profile/detail_user_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorStyle = ColorStyle();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                right: 16,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Profil',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    icon: const Icon(Icons.more_horiz),
                    itemBuilder: ((context) => [
                          PopupMenuItem(
                            onTap: () {},
                            child: const Row(
                              children: [
                                Icon(Icons.info),
                                SizedBox(width: 8),
                                Text('Tentang'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: (() => exit(0)),
                            child: Column(
                              children: [
                                Divider(
                                  color: colorStyle.black,
                                  thickness: 0.5,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.exit_to_app_outlined,
                                      color: colorStyle.base,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text('Keluar'),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            DetailUserWidget(colorStyle: colorStyle)
          ],
        ),
      ),
    );
  }
}
