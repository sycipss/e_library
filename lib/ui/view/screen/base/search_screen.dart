import 'package:e_library/core/model/book_model.dart';
import 'package:e_library/ui/view/style/color_style.dart';
import 'package:e_library/ui/view/widget/book_list/book_list_widget.dart';
import 'package:e_library/ui/view_model/book_provider.dart';
import 'package:e_library/ui/view_model/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  final List<BookModel> books;

  const SearchScreen({super.key, required this.books});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ColorStyle colorStyle = ColorStyle();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<SearchProvider>(context, listen: false)
        .updateFilteredBooks(widget.books);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BookProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: 28,
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  Provider.of<SearchProvider>(context, listen: false)
                      .filterRecipes(widget.books, value);
                },
                autofocus: true,
                cursorColor: colorStyle.base,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: colorStyle.base,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      searchController.clear(); // Kosongkan TextField
                      Provider.of<SearchProvider>(context, listen: false)
                          .updateFilteredBooks(
                              widget.books); // Tampilkan kembali semua buku
                    },
                  ),
                  hintText: 'Cari buku',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: colorStyle.base),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: searchProvider.filteredBooks.isNotEmpty
                        ? ListView.builder(
                            itemCount: searchProvider.filteredBooks.length,
                            itemBuilder: (BuildContext context, int index) {
                              final bookModel =
                                  searchProvider.filteredBooks[index];
                              return BookListWidget(bookModel: bookModel);
                            },
                          )
                        : const Align(
                            alignment: Alignment.center,
                            child: Text('Buku tidak ditemukan...'),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
