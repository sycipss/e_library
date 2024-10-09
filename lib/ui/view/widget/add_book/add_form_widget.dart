import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view_model/add_book_provider.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:flutter/material.dart';

class AddFormWidget extends StatelessWidget {
  const AddFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.bookProvider,
    required this.addBookProvider,
    required this.colorStyle,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final BookProvider bookProvider;
  final AddBookProvider addBookProvider;
  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                //title
                TextFormField(
                  controller: bookProvider.titleController,
                  validator: addBookProvider.validateText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Judul buku',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //publisher
                TextFormField(
                  controller: bookProvider.publisherController,
                  validator: addBookProvider.validateText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Nama penerbit',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //publication year
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: bookProvider.publicationYearController,
                  validator: addBookProvider.validateNumber,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Tahun terbit',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //genre
                TextFormField(
                  controller: bookProvider.genreController,
                  validator: addBookProvider.validateText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Genre buku',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi buku',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                //description
                TextFormField(
                  controller: bookProvider.descriptionController,
                  maxLines: 15,
                  maxLength: 1000,
                  decoration: InputDecoration(
                    hintText: 'Tulis deskripsi buku disini',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorStyle.base,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              bookProvider.image = addBookProvider.image;
              if (_formKey.currentState!.validate() &&
                  addBookProvider.image != null) {
                bookProvider.insertNewBook();
                bookProvider.titleController.clear();
                bookProvider.publisherController.clear();
                bookProvider.descriptionController.clear();
                bookProvider.publicationYearController.clear();
                bookProvider.genreController.clear();
                _formKey.currentState!.reset();
                Navigator.pushReplacementNamed(context, '/');
                addBookProvider.clearImage();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error! Image harus diupload'),
                  ),
                );
              }
            },
            style: ButtonStyle(
              fixedSize: const WidgetStatePropertyAll(
                Size(335, 54),
              ),
              backgroundColor: WidgetStatePropertyAll(colorStyle.base),
            ),
            child: const Text(
              'Tambah data buku',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
