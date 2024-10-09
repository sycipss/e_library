import 'package:e_library/ui/view/widget/book_list/book_list_widget.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'List Buku',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Consumer<BookProvider>(
                builder: (context, provider, child) {
                  return provider.allBooks.isNotEmpty
                      ? ListView.builder(
                          itemCount: provider.allBooks.length,
                          itemBuilder: (context, index) {
                            final bookModel = provider.allBooks[index];
                            return BookListWidget(bookModel: bookModel);
                          })
                      : const Center(
                          child: Text('Buku tidak ditemukan...'),
                        );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
