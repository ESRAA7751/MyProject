import 'package:finalproject/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomScreen extends StatelessWidget {
  WelcomScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Search your Favorite Product',
        body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore',
        image: Image.asset(
          'assets/start.webp',
          fit: BoxFit.fill,
        ),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ))),
    PageViewModel(
        title: 'Shop and wait order',
        body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore',
        image: Image.asset(
          'assets/start.webp',
          fit: BoxFit.fill,
        ),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ))),
    PageViewModel(
        title: 'Get your order',
        body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore',
        image: Image.asset(
          'assets/start.webp',
          fit: BoxFit.fill,
        ),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Expanded(
              child: IntroductionScreen(
                pages: pages,
                dotsDecorator: DotsDecorator(activeSize: Size.fromRadius(8)),
                showDoneButton: true,
                done: Text('Done'),
                showSkipButton: true,
                skip: Text('Skip'),
                showNextButton: true,
                next: Text('Next'),
                onDone: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
