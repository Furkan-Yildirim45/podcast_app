import 'package:flutter/material.dart';
import 'package:musicapp/feature/onboarding/view/onboarding_view.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardingView(),
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff1f1d2b),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff1f1d2b),
          )),
    );
  }
}
