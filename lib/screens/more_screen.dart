import 'package:flutter/material.dart';

import '../styles/colors.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          ListTile(
            title: const Center(
              child: Text('About'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: CustomColor.cultured,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Center(
              child: Text('Return Policy'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: CustomColor.cultured,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Center(
              child: Text('Privacy and Policy'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: CustomColor.cultured,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Center(
              child: Text('Terms and Conditions'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: CustomColor.cultured,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
