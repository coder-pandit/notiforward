import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../forward_group/forward_group_add_page.dart';
import '../forward_group/forward_group_page.dart';
import '../home/home_page.dart';
import '../messages/messages.dart';
import '../splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const Scaffold(body: Center(child: Text('Page not found'))),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashPage(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/forward-groups',
          page: () => ForwardGroupPage(),
        ),
        GetPage(
          name: '/forward-groups/add',
          page: () => const AddForwardGroupPage(),
        ),
        GetPage(
          name: '/messages',
          page: () => MessagesPage(),
        ),
      ],
      home: MaterialApp(
        title: 'NotiForward',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue[900],
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
