import 'package:e_library/ui/view/screen/auth/carousel_screen.dart';
import 'package:e_library/ui/view/widget/navbar/navbar_widget.dart';
import 'package:e_library/ui/view_model/add_book_provider.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:e_library/ui/view_model/edit_book_provider.dart';
import 'package:e_library/ui/view_model/navbar_provider.dart';
import 'package:e_library/ui/view_model/profile_provider.dart';
import 'package:e_library/ui/view_model/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddBookProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookProvider(),
        ),
        ChangeNotifierProxyProvider<BookProvider, NavbarProvider>(
          create: (context) => NavbarProvider([]),
          update: (context, bookProvider, previous) => NavbarProvider(
            bookProvider.allBooks,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => EditBookProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
          // Cek data profil
          future: hasSetupProfile(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Tampilkan loading sementara menunggu
            } else {
              if (snapshot.data == true) {
                return const NavbarWidget();
              } else {
                return const CarouselScreen();
              }
            }
          },
        ),
      ),
    );
  }

  Future<bool> hasSetupProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    return name != null;
  }
}
