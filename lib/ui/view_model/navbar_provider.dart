import 'package:e_library/core/model/book_model.dart';
import 'package:e_library/ui/view/screen/base/explore_screen.dart';
import 'package:e_library/ui/view/screen/base/favorite_screen.dart';
import 'package:e_library/ui/view/screen/base/profile_screen.dart';
import 'package:e_library/ui/view/screen/base/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavbarProvider with ChangeNotifier {
  int _currentTab = 0;
  final List<Widget> screens;
  Widget _currentScreen = const ExploreScreen(); // Default to ExploreScreen

  NavbarProvider(List<BookModel> books)
      : screens = [
          const ExploreScreen(),
          SearchScreen(books: books), // Pass the books to SearchScreen
          const FavoriteScreen(),
          const ProfileScreen(),
        ] {
    _loadCurrentTab(); // Load the last accessed tab when the provider is initialized
  }

  Widget get currentScreen => _currentScreen;
  int get currentTab => _currentTab;

  Future<void> _loadCurrentTab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentTab =
        prefs.getInt('currentTab') ?? 0; // Load last tab or default to 0
    _currentScreen = screens[_currentTab];
    notifyListeners(); // Notify listeners to update the UI after loading the tab
  }

  Future<void> _saveCurrentTab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentTab', _currentTab); // Save the current tab index
  }

  void exploreTab() {
    _currentScreen = screens[0];
    _currentTab = 0;
    _saveCurrentTab(); // Save the current tab state
    notifyListeners();
  }

  void searchTab() {
    _currentScreen = screens[1];
    _currentTab = 1;
    _saveCurrentTab(); // Save the current tab state
    notifyListeners();
  }

  void favoriteTab() {
    _currentScreen = screens[2];
    _currentTab = 2;
    _saveCurrentTab(); // Save the current tab state
    notifyListeners();
  }

  void profileTab() {
    _currentScreen = screens[3];
    _currentTab = 3;
    _saveCurrentTab(); // Save the current tab state
    notifyListeners();
  }
}
