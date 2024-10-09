import 'dart:io';
import 'dart:math';

import 'package:e_library/ui/view/screen/other/book_detail_screen.dart';
import 'package:e_library/ui/view/screen/other/book_list_screen.dart';
import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddedBookWidget extends StatelessWidget {
  const AddedBookWidget({
    super.key,
    required this.colorStyle,
  });

  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Baru datang',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookListScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorStyle.base,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: colorStyle.base,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<BookProvider>(builder: (context, provider, child) {
            return SizedBox(
              height: 240,
              child: provider.allBooks.isNotEmpty
                  ? ListView.separated(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: min(4, provider.allBooks.length),
                      itemBuilder: (BuildContext context, int index) {
                        final bookModel = provider.allBooks[index];
                        return SizedBox(
                          width: 130,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      BookDetailScreen(bookModel: bookModel)),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 335,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    FutureBuilder<File?>(
                                      future: Provider.of<BookProvider>(context,
                                              listen: false)
                                          .getImageFile(bookModel.image!.path),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                                ConnectionState.done &&
                                            snapshot.hasData) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/image/lorem_ipsum.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        bookModel.title,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 16);
                      },
                    )
                  : const Center(
                      child: Text('Buku tidak ditemukan...'),
                    ),
            );
          }),
        ),
      ],
    );
  }
}
