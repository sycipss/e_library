import 'package:e_library/ui/view/widget/navbar/navbar_widget.dart';
import 'package:e_library/ui/view_model/navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(
        create: (context) => NavbarProvider(),
      ),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const NavbarWidget(),
      ),
    );
  }
}
