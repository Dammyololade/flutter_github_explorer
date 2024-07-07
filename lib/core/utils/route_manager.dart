
import 'package:flutter/material.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/home_page.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/search_page.dart';

class RouteManager {
  static const String home = '/';
  static const String search = '/search';


  static Map<String, WidgetBuilder> get routes => {
    home: (context) => const HomePage(),
    search: (context) => const SearchPage(),
  };
}