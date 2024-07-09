
import 'package:flutter_github_explorer/core/database/local_database.dart';
import 'package:injectable/injectable.dart';

/// A module that provides the dependencies required by the application.
/// It uses the `injectable` package to generate the necessary code for dependency injection.
@module
abstract class AppModule {

  @preResolve
  Future<LocalDatabase> get database => LocalDatabase.create();
}