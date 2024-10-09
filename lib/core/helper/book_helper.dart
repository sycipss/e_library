import 'dart:io';
import 'package:e_library/core/model/book_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class BookHelper {
  late Database database;
  static BookHelper bookHelper = BookHelper();
  final String tableName = 'book';
  final String titleColumn = 'title';
  final String idColumn = 'id';
  final String isSavedColumn = 'isSaved';
  final String descriptionColumn = 'description';
  final String genreColumn = 'genre';
  final String imageColumn = 'image';
  final String publicationYearColumn = 'publicationYear';
  final String publisherColumn = 'publisher';

  initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/books.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $titleColumn TEXT, $publisherColumn TEXT, $publicationYearColumn INTEGER, $genreColumn TEXT, $isSavedColumn INTEGER, $descriptionColumn TEXT, $imageColumn TEXT)');
      },
    );
  }

  Future<List<BookModel>> getAllBooks() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) => BookModel.fromMap(e)).toList();
  }

  insertNewBook(BookModel bookModel) {
    database.insert(tableName, bookModel.toMap());
  }

  deleteBook(BookModel bookModel) {
    database.delete(tableName, where: '$idColumn=?', whereArgs: [bookModel.id]);
  }

  updateBook(BookModel bookModel) async {
    await database.update(
        tableName,
        {
          isSavedColumn: bookModel.isSaved ? 1 : 0,
          titleColumn: bookModel.title,
          publisherColumn: bookModel.publisher,
          publicationYearColumn: bookModel.publicationYear,
          genreColumn: bookModel.genre,
          imageColumn: bookModel.image!.path,
          descriptionColumn: bookModel.description,
        },
        where: '$idColumn=?',
        whereArgs: [bookModel.id]);
  }

  updateIsSaved(BookModel bookModel) {
    database.update(tableName, {isSavedColumn: !bookModel.isSaved ? 1 : 0},
        where: '$idColumn=?', whereArgs: [bookModel.id]);
  }
}
