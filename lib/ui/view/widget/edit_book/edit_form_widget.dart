import 'package:e_library/ui/view/screen/other/edit_book_screen.dart';
import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:e_library/ui/view_model/edit_book_provider.dart';
import 'package:flutter/material.dart';

class EditFormWidget extends StatelessWidget {
  const EditFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.bookProvider,
    required this.editBookProvider,
    required this.colorStyle,
    required this.widget,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final BookProvider bookProvider;
  final EditBookProvider editBookProvider;
  final ColorStyle colorStyle;
  final EditBookScreen widget;

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
                  validator: editBookProvider.validateText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    label: const Text('Judul buku'),
                    hintText: 'Judul buku',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorStyle.base, width: 1),
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
                //pulisher
                TextFormField(
                  controller: bookProvider.publisherController,
                  validator: editBookProvider.validateText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    label: const Text('Nama penerbit'),
                    hintText: 'Nama penerbit',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorStyle.base, width: 1),
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
                  validator: editBookProvider.validateNumber,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    label: const Text('Tahun terbit'),
                    hintText: 'Tahun terbit',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorStyle.base, width: 1),
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
                TextFormField(
                  controller: bookProvider.genreController,
                  validator: editBookProvider.validateText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    label: const Text('Genre buku'),
                    hintText: 'Genre buku',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorStyle.base, width: 1),
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
                Column(
                  children: [
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
                    TextFormField(
                      controller: bookProvider.descriptionController,
                      maxLines: 15,
                      maxLength: 1000,
                      decoration: InputDecoration(
                        hintText: 'Tulis deskripsi buku disini',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colorStyle.base, width: 1),
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
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.bookModel.title = bookProvider.titleController.text;
                widget.bookModel.publisher =
                    bookProvider.publisherController.text;

                widget.bookModel.description =
                    bookProvider.descriptionController.text;
                if (editBookProvider.image != null &&
                    editBookProvider.image != widget.bookModel.image) {
                  widget.bookModel.image = editBookProvider.image;
                }
                widget.bookModel.publicationYear = int.parse(
                    bookProvider.publicationYearController.text != ''
                        ? bookProvider.publicationYearController.text
                        : '0');

                widget.bookModel.genre = bookProvider.genreController.text;
                bookProvider.updateBook(widget.bookModel);
                Navigator.of(context).pop();
                bookProvider.titleController.clear();
                bookProvider.publisherController.clear();
                bookProvider.descriptionController.clear();
                bookProvider.genreController.clear();
                bookProvider.publicationYearController.clear();
                editBookProvider.clearImage();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text('Error! Pastikan semua field diisi dengan benar'),
                  ),
                );
              }
            },
            style: ButtonStyle(
                fixedSize: const WidgetStatePropertyAll(
                  Size(335, 54),
                ),
                backgroundColor: WidgetStatePropertyAll(colorStyle.base)),
            child: const Text(
              'Simpan perubahan',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
