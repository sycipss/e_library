import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view/widget/add_book/add_form_widget.dart';
import 'package:e_library/ui/view_model/add_book_provider.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final ColorStyle colorStyle = ColorStyle();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    final addBookProvider =
        Provider.of<AddBookProvider>(context, listen: false);
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
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Tambah buku baru',
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
            Consumer<AddBookProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: Stack(
                    children: [
                      Center(
                        child: provider.image != null
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorStyle.base,
                                ),
                                height: 200,
                                width: 350,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    provider.image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                height: 200,
                                width: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorStyle.base,
                                ),
                              ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 8),
                          Row(
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
                                    provider.pickImage(
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
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            AddFormWidget(
                formKey: _formKey,
                bookProvider: bookProvider,
                addBookProvider: addBookProvider,
                colorStyle: colorStyle),
          ],
        ),
      ),
    );
  }
}
