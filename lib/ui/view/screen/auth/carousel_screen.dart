import 'package:e_library/ui/view/screen/auth/setup_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        // Welcome Screen
        PageViewModel(
          title: "Welcome Libraians",
          body: "Menemukan Kegembiraan dalam Setiap Halaman",
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                Image.asset('assets/image/welcome.png', height: 200),
              ],
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle:
                const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: const TextStyle(fontSize: 16.0),
            bodyPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
            imagePadding: const EdgeInsets.all(24),
          ),
        ),
        // Have Fun Screen
        PageViewModel(
          title: "Have Fun",
          body: "Buka Buku, Buka Senyum",
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                Image.asset('assets/image/fun.png', height: 200),
              ],
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle:
                const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: const TextStyle(fontSize: 16.0),
            bodyPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
            imagePadding: const EdgeInsets.all(24),
          ),
        ),
        // Masuk Screen
        PageViewModel(
          title: "Mulai",
          body: "Mulai Bacaan Seru, Temukan Cerita Baru",
          image: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                Image.asset('assets/image/start.png', height: 200),
              ],
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle:
                const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: const TextStyle(fontSize: 16.0),
            bodyPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
            imagePadding: const EdgeInsets.all(24),
          ),
        ),
      ],
      onDone: () {
        // Redirect to setup page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SetupProfileScreen(),
          ),
        );
      },
      onSkip: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SetupProfileScreen(),
          ),
        );
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.black26,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
