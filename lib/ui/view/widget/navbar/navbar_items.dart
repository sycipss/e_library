import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view_model/navbar_provider.dart';
import 'package:flutter/material.dart';

class NavbarItems extends StatelessWidget {
  const NavbarItems({
    super.key,
    required this.provider,
    required this.colorStyle,
  });

  final NavbarProvider provider;
  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                provider.exploreTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.explore),
                color: provider.currentTab == 0
                    ? colorStyle.base
                    : Colors.black.withOpacity(0.2),
              ),
            ),
            MaterialButton(
              onPressed: () {
                provider.searchTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.search),
                color: provider.currentTab == 1
                    ? colorStyle.base
                    : Colors.black.withOpacity(0.2),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                provider.favoriteTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.favorite),
                color: provider.currentTab == 2
                    ? colorStyle.base
                    : Colors.black.withOpacity(0.2),
              ),
            ),
            MaterialButton(
              onPressed: () {
                provider.profileTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.person),
                color: provider.currentTab == 3
                    ? colorStyle.base
                    : Colors.black.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
