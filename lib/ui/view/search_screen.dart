import 'package:e_library/ui/view/style/color_style.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ColorStyle colorStyle = ColorStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: 28,
              ),
              child: TextField(
                onChanged: (value) {
                  // Provider.of<SearchRecipeProvider>(context, listen: false)
                  //     .filterRecipes(widget.recipe, value);
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
                      Navigator.pop(context);
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
            // Consumer<SearchRecipeProvider>(
            //   builder: (context, provider, child) {
            //     return Container(
            //       padding: const EdgeInsets.all(10),
            //       child: provider.filteredRecipes.isNotEmpty
            //           ? ListView.builder(
            //               shrinkWrap: true,
            //               physics: const NeverScrollableScrollPhysics(),
            //               itemCount: provider.filteredRecipes.length,
            //               itemBuilder: (BuildContext context, int index) {
            //                 return ShowBookRecipeListWidget(
            //                     provider.filteredRecipes[index]);
            //               })
            //           : const Center(
            //               child: Text(''),
            //             ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
