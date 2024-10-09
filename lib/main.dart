import 'package:e_library/core/helper/book_helper.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BookHelper.bookHelper.initDatabase();
  runApp(const MyApp());
}
