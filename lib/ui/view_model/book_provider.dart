import 'dart:io';
import 'package:e_library/core/helper/book_helper.dart';
import 'package:e_library/core/model/book_model.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  BookProvider() {
    getBooks();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController publisherController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController publicationYearController = TextEditingController();
  File? image;

  List<BookModel> allBooks = [];
  List<BookModel> favoriteBooks = [];
  Future<void> getBooks() async {
    allBooks = await BookHelper.bookHelper.getAllBooks();
    favoriteBooks = allBooks.where((e) => e.isSaved).toList();
    notifyListeners();
  }

  void insertNewBook() {
    BookModel bookModel = BookModel(
      isSaved: false,
      title: titleController.text,
      publisher: publisherController.text,
      description: descriptionController.text,
      genre: genreController.text,
      publicationYear: int.parse(publicationYearController.text != ''
          ? publicationYearController.text
          : '0'),
      image: image,
    );
    BookHelper.bookHelper.insertNewBook(bookModel);
    getBooks();
  }

  void updateBook(BookModel bookModel) async {
    await BookHelper.bookHelper.updateBook(bookModel);
    getBooks();
  }

  void deleteBook(BookModel bookModel) {
    BookHelper.bookHelper.deleteBook(bookModel);
    getBooks();
  }

  void updateIsSaved(BookModel bookModel) {
    BookHelper.bookHelper.updateIsSaved(bookModel);
    getBooks();
  }

  Future<File?> getImageFile(String? imagePath) async {
    if (imagePath == null || imagePath.isEmpty) {
      return null;
    }

    final imageFile = File(imagePath);
    if (await imageFile.exists()) {
      return imageFile;
    } else {
      return null;
    }
  }
}
