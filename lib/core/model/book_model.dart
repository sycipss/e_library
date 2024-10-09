import 'dart:io';

class BookModel {
  int? id;
  late String title;
  late bool isSaved;
  File? image;
  late String publisher;
  late String description;
  late String genre;
  late int publicationYear;

  BookModel({
    this.id,
    required this.title,
    required this.isSaved,
    this.image,
    required this.publisher,
    required this.description,
    required this.genre,
    required this.publicationYear,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isSaved': isSaved ? 1 : 0,
      'publisher': publisher,
      'description': description,
      'genre': genre,
      'image': image == null ? '' : image!.path,
      'publicationYear': publicationYear,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'],
      title: map['title'],
      isSaved: map['isSaved'] == 1 ? true : false,
      publisher: map['publisher'],
      description: map['description'],
      genre: map['genre'],
      image: map['image'] != null ? File(map['image']) : null,
      publicationYear: map['publicationYear'],
    );
  }
}
