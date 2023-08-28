import 'package:flutter/material.dart';
import 'package:getjoke/features/home/presentation/joke_form.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: JokeSubmitForm(),
      ),
    );
  }
}
