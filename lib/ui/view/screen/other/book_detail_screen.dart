import 'dart:io';
import 'package:e_library/core/model/book_model.dart';
import 'package:e_library/ui/view/screen/other/edit_book_screen.dart';
import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailScreen extends StatelessWidget {
  final BookModel bookModel;

  BookDetailScreen({super.key, required this.bookModel});

  final ColorStyle colorStyle = ColorStyle();

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: ((context, provider, child) => Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      top: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.more_horiz),
                          itemBuilder: ((context) => [
                                PopupMenuItem(
                                  onTap: () async {
                                    final navigator = Navigator.of(context);
                                    await Future.delayed(Duration.zero);
                                    provider.titleController.text =
                                        bookModel.title;
                                    provider.publisherController.text =
                                        bookModel.publisher.toString();
                                    provider.descriptionController.text =
                                        bookModel.description;
                                    provider.publicationYearController.text =
                                        bookModel.publicationYear.toString();
                                    provider.genreController.text =
                                        bookModel.genre;
                                    provider.image = bookModel.image;
                                    navigator.push(
                                      MaterialPageRoute(
                                        builder: (context) => EditBookScreen(
                                          bookModel: bookModel,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(width: 8),
                                      Text('Edit'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Konfirmasi"),
                                          content: const Text(
                                              "Apakah kamu yakin ingin menghapus buku ini?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Tidak"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                provider.deleteBook(bookModel);
                                                Navigator.of(context).pop();
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Ya"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.delete),
                                      SizedBox(width: 8),
                                      Text('Hapus')
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: FutureBuilder<File?>(
                            future: Provider.of<BookProvider>(context,
                                    listen: false)
                                .getImageFile(bookModel.image!.path),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    snapshot.data!,
                                    fit: BoxFit.cover,
                                    height: 180,
                                    width: 335,
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  width: 335,
                                  height: 180,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/image/lorem_ipsum.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          '${bookModel.title} (${bookModel.publicationYear})',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          'Penerbit: ${bookModel.publisher}\nGenre: ${bookModel.genre}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Deskripsi:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Center(
                          child: Text(
                            bookModel.description,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
