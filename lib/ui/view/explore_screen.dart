import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 22,
              ),
              child: Text(
                'Temukan buku,\nbuka jalan untuk masa depan cerah',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(child:  CircularProgressIndicator(),
            ),
            // BuildSearchWidget(
            //     colorStyle: colorStyle, bookRecipeProvider: bookRecipeProvider),
            // BuildCalorieCardWidget(colorStyle: colorStyle),
            // BuildRecipeBookWidget(colorStyle: colorStyle),
            // BuildRecipeAddedWidget(colorStyle: colorStyle),
          ],
        ),
      ),
    );
  }
}
