import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ButtonBar(
          children: [
            TextButton(
              onPressed: () => Get.toNamed('/forward-groups'),
              child: const Text('Forward Group'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/messages'),
              child: const Text('Forwarded Messages'),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Get.isDarkMode ? Icons.sunny : Icons.nightlight),
              onPressed: () {
                Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                );
              },
            ),
          ],
        ));
  }
}
