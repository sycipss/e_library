import 'package:e_library/ui/view/widget/book_list/book_list_widget.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          body: ListView(
            children: [
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(
                  left: 28,
                  top: 16,
                ),
                child: Text(
                  'Buku tersimpan',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              provider.favoriteBooks.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.favoriteBooks.length,
                      itemBuilder: (context, index) {
                        final bookModel = provider.favoriteBooks[index];
                        return BookListWidget(bookModel: bookModel);
                      },
                    )
                  : const Center(
                      child: Text('Tidak ada buku tersimpan...'),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
