import 'package:e_library/ui/view/screen/other/add_book_screen.dart';
import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view_model/navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navbar_items.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
  });

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  final ColorStyle colorStyle = ColorStyle();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavbarProvider>(context);
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: provider.currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorStyle.base,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddBookScreen()));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 86,
          child: NavbarItems(provider: provider, colorStyle: colorStyle),
        ),
      ),
    );
  }
}
