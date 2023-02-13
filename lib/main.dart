import 'package:books/core/utils/service_locator.dart';
import 'package:flutter/material.dart';

import 'books_app.dart';

void main() {
  setupServiceLocator();
  runApp(
    const BooksApp(),
  );
}
