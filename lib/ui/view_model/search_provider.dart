import 'package:e_library/core/model/book_model.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  List<BookModel> _filteredBooks = [];
  List<BookModel> get filteredBooks => _filteredBooks;

  void filterRecipes(List<BookModel> books, String query) {
    if (query.isEmpty) {
      _filteredBooks = books;
    } else {
      _filteredBooks = books.where((book) {
        return book.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void updateFilteredBooks(List<BookModel> books) {
    _filteredBooks = books;
    notifyListeners();
  }
}
