
import 'package:flutter_github_explorer/core/di/app_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// A global instance of the `GetIt` service locator.
final GetIt locator = GetIt.I;

/// Initializes the service locator using the `injectable` package.
/// This method should be called once at the beginning of the application.
/// It generates the necessary code to register the dependencies defined in the `app_locator.config.dart` file.
/// The `preferRelativeImports` parameter is set to `false` to avoid issues with relative imports.
/// This method is marked as `async` to allow for asynchronous initialization of the service locator.
@InjectableInit(
  preferRelativeImports: false,
)
Future<void> initAppLocator() async => locator.init();