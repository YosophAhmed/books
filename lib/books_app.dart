import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/splash/presentation/views/splash_view.dart';

class BooksApp extends StatelessWidget {
  const BooksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashView(),
    );
  }
}
