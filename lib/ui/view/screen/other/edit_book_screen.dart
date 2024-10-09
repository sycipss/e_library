import 'dart:io';

import 'package:e_library/core/model/book_model.dart';
import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view/widget/edit_book/edit_form_widget.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:e_library/ui/view_model/edit_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditBookScreen extends StatefulWidget {
  final BookModel bookModel;
  const EditBookScreen({super.key, required this.bookModel});

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  final ColorStyle colorStyle = ColorStyle();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    final editBookProvider =
        Provider.of<EditBookProvider>(context, listen: false);

    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 16,
              right: 16,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    bookProvider.titleController.clear();
                    bookProvider.publisherController.clear();
                    bookProvider.descriptionController.clear();
                    bookProvider.genreController.clear();
                    bookProvider.publicationYearController.clear();
                    Navigator.of(context).pop();
                    bookProvider.image = null;
                    editBookProvider.clearImage();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Edit buku',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Stack(
                      children: [
                        Consumer<EditBookProvider>(
                          builder: (context, provider, child) {
                            return FutureBuilder<File?>(
                              future: (provider.image ??
                                          widget.bookModel.image) !=
                                      null
                                  ? Future.value(
                                      provider.image ?? widget.bookModel.image)
                                  : Future.value(null),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  final imageFile = snapshot.data!;
                                  if (imageFile.existsSync()) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        imageFile,
                                        fit: BoxFit.cover,
                                        height: 180,
                                        width: 335,
                                      ),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Center(
                                        child: Image.asset(
                                          'assets/image/lorem_ipsum.png',
                                          fit: BoxFit.cover,
                                          height: 180,
                                          width: 335,
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                            );
                          },
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        editBookProvider.pickImage(
                                            ImageSource.gallery, context);
                                      },
                                      icon: Image.asset(
                                        'assets/image/edit.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  EditFormWidget(
                      formKey: _formKey,
                      bookProvider: bookProvider,
                      editBookProvider: editBookProvider,
                      colorStyle: colorStyle,
                      widget: widget),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
