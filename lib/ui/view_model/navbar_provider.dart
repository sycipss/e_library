import 'package:e_library/ui/view/explore_screen.dart';
import 'package:e_library/ui/view/favorite_screen.dart';
import 'package:e_library/ui/view/profile_screen.dart';
import 'package:e_library/ui/view/search_screen.dart';
import 'package:flutter/material.dart';

class NavbarProvider with ChangeNotifier {
  int _currentTab = 0;
  final List<Widget> screens = [
    const ExploreScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  Widget _currentScreen = const ExploreScreen();

  Widget get currentScreen => _currentScreen;
  int get currentTab => _currentTab;

  void exploreTab() {
    _currentScreen = screens[0];
    _currentTab = 0;
    notifyListeners();
  }

  void searchTab() {
    _currentScreen = screens[1];
    _currentTab = 1;
    notifyListeners();
  }

  void favoriteTab() {
    _currentScreen = screens[2];
    _currentTab = 3;
    notifyListeners();
  }

  void profileTab() {
    _currentScreen = screens[3];
    _currentTab = 4;
    notifyListeners();
  }
}
