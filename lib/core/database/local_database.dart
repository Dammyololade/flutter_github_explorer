import 'package:flutter_github_explorer/core/utils/app_constants.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// A class that provides a local database to store search results and issues.
/// It uses the `sembast` package to interact with the database.
/// The database is stored in the application documents directory.
/// The `LocalDatabase` class is a singleton class, so it can be accessed from anywhere in the application.
class LocalDatabase {
  static late Database _db;

  /// Creates a new instance of the `LocalDatabase` class.
  /// This method should be called only once in the application to initialize the database.
  static Future<LocalDatabase> create() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, AppConstants.dbPath);

    DatabaseFactory dbFactory = databaseFactoryIo;
    _db = await dbFactory.openDatabase(dbPath);

    return LocalDatabase();
  }

  StoreRef get searchStore => StoreRef<String, Map<String, dynamic>>.main();

  StoreRef get issuesStore => StoreRef<String, Map<String, dynamic>>.main();

  /// Puts the data into the database.
  /// The [key] is used to identify the data in the database.
  /// The [data] is a map that contains the data to be stored.
  /// The [store] parameter specifies the store in which the data should be stored.
  Future<void> put(
      {required String key,
      required Map<String, dynamic> data,
      required DBStore store}) async {
    final storeRef = store == DBStore.search ? searchStore : issuesStore;
    await storeRef.record(key).put(_db, data);
  }

  /// Gets the data from the database using the specified [key].
  /// The [store] parameter specifies the store from which the data should be retrieved.
  /// Returns a map containing the data if it exists, otherwise returns `null`.
  Future<Map<String, dynamic>?> get(
      {required String key, required DBStore store}) async {
    final storeRef = store == DBStore.search ? searchStore : issuesStore;
    return await storeRef.record(key).get(_db) as Map<String, dynamic>?;
  }
}

/// An enum that represents the different stores in the local database.
enum DBStore {
  search,
  issues,
}
