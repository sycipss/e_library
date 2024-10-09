import 'dart:io';
import 'package:e_library/core/model/book_model.dart';
import 'package:e_library/ui/view/screen/other/book_detail_screen.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListWidget extends StatelessWidget {
  const BookListWidget({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => BookDetailScreen(bookModel: bookModel)),
          ),
        );
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FutureBuilder<File?>(
                  future: Provider.of<BookProvider>(context, listen: false)
                      .getImageFile(bookModel.image!.path),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          snapshot.data!,
                          fit: BoxFit.cover,
                          height: 180,
                          width: MediaQuery.of(context).size.width * 0.85,
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
                            height: 180,
                            width: MediaQuery.of(context).size.width * 0.85,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      bookModel.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
            Positioned(
              right: 16,
              top: 16,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Consumer<BookProvider>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: () {
                        provider.updateIsSaved(bookModel);
                      },
                      child: bookModel.isSaved
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
