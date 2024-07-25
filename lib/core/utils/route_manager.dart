import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_explorer/features/search/domain/entities/item_entity.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/details_page.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/home_page.dart';
import 'package:flutter_github_explorer/features/search/presentation/views/search_page.dart';

/// A utility class to manage the routes in the app.
/// The routes are defined as static constants in this class.
/// The routes are used to navigate between different screens in the app.
class RouteManager {
  static const String home = '/';
  static const String search = '/search';
  static const String details = '/details';

  /// A map of the routes in the app.
  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomePage(),
        search: (context) => const SearchPage(),
        details: (context) => DetailsPage(
              item: ModalRoute.of(context)!.settings.arguments as ItemEntity,
            ),
      };
}
