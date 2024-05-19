import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CartView extends StatelessWidget {
  final Function(int) onItemSelected;

  const CartView({required this.onItemSelected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              IconlyBold.bag_2,
              size: 100,
            ),
            const Text(
              'Cart View',
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
            CupertinoButton(
              color: const Color.fromARGB(255, 112, 119, 249),
              onPressed: () {
                onItemSelected(2);
              },
              child: const Text('View all Orders'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  onItemSelected(0);
                },
                child: const Text('Back to Home'))
          ],
        ),
      ),
    );
  }
}
