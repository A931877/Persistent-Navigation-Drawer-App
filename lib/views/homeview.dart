import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeView extends StatelessWidget {
  final Function(int) onItemSelected;

  const HomeView({required this.onItemSelected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              IconlyBold.home,
              size: 100,
            ),
            const Text(
              'Home View',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "It can be a stateless or stateful class. You can place any content or widgets you need within this page class.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  onItemSelected(3);
                },
                child: const Text('Go to Cart'))
          ],
        ),
      ),
    );
  }
}
