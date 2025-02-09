import 'dart:developer' as developer;
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/books/books_model.dart';
import '../utils/raw_sql_query_utils.dart';

class LocalDatabaseService {
  static final LocalDatabaseService instance = LocalDatabaseService._internal();
  static Database? _database;
  LocalDatabaseService._internal();
  String tableName = 'books';
  String userpreferenceTableName = 'userpreference';
  final defaultId = 1;

  Future<String> get getBookStorageDefaultDirectory async {
    try {
      if (Platform.isAndroid) {
        final directory = await getExternalStorageDirectory();
        return directory!.path;
      } else {
        final directory = await getApplicationDocumentsDirectory();
        return directory.path;
      }
    } catch (e) {
      developer.log('Error getting book storage directory: $e');
      rethrow;
    }
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'local_database.db');
    final bool isMobile = Platform.isAndroid || Platform.isIOS;
    return await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute(RawSQLQueryUtils.createBooksSQLQuery);
      await db.execute(RawSQLQueryUtils.createUserPreferenceSqlQuery);

      if (isMobile || true) {
        await db.execute(RawSQLQueryUtils.createBooksPositionSqlQuery);
      }
    });
  }

  Future<List<BooksModel>> getAll() async {
    try {
      final dbInstance = await instance.database;
      final List<Map<String, dynamic>> maps = await dbInstance.query(tableName);
      return listMapToMyBook(maps);
    } catch (e) {
      developer.log('Error getting all books: $e');
      rethrow;
    }
  }

  List<BooksModel> listMapToMyBook(List<Map<String, dynamic>> maps) {
    return maps
        .map((map) {
          return BooksModel(
            id: map['id'] as String,
            isbn: map['isbn'] as String?,
            bookTitle: map['bookTitle'] as String?,
            description: map['description'] as String?,
            code: map['code'] as String?,
            bookUrl: map['bookUrl'] as String?,
            thumbnail: map['thumbnail'] as String?,
            language: map['language'] as String,
            author: (map['author'] as String?)?.split(',') ?? [], // Deserialize
            categories: (map['categories'] as String).split(','), // Deserialize
            publisher: map['publisher'] as String?,
            isActive: (map['isActive'] as int) == 1, // Convert to bool
            createdAt: DateTime.parse(map['createdAt'] as String),
            updatedAt: map['updatedAt'] != null
                ? DateTime.parse(map['updatedAt'] as String)
                : null,
            publishedAt: map['publishedAt'] != null
                ? DateTime.parse(map['publishedAt'] as String)
                : null,
            founded: (map['founded'] as int) == 1, // Convert to bool
            editor: map['editor'] as String?,
            moreImageUrl:
                (map['moreImageUrl'] as String).split(','), // Deserialize
          );
        })
        .toList()
        .reversed
        .toList(); // Reverse the list
  }

  Map<String, dynamic> bookToMap(BooksModel book) {
    return {
      'id': book.id,
      'isbn': book.isbn,
      'bookTitle': book.bookTitle,
      'description': book.description,
      'code': book.code,
      'bookUrl': book.bookUrl,
      'thumbnail': book.thumbnail,
      'language': book.language,
      'author':
          book.author?.join(','), // Serialize list to comma-separated string
      'categories':
          book.categories.join(','), // Serialize list to comma-separated string
      'publisher': book.publisher,
      'isActive': book.isActive ? 1 : 0, // Convert bool to int
      'createdAt': book.createdAt.toIso8601String(),
      'updatedAt': book.updatedAt?.toIso8601String(),
      'publishedAt': book.publishedAt?.toIso8601String(),
      'founded': book.founded ? 1 : 0, // Convert bool to int
      'editor': book.editor,
      'moreImageUrl': book.moreImageUrl
          .join(','), // Serialize list to comma-separated string
    };
  }

  Future<void> insert(BooksModel book) async {
    try {
      final dbInstance = await instance.database;
      await dbInstance.insert(
        tableName,
        bookToMap(book),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e, s) {
      developer.log('Error inserting book: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> update(BooksModel book) async {
    try {
      final dbInstance = await instance.database;
      await dbInstance.update(
        tableName,
        bookToMap(book),
        where: 'id = ?',
        whereArgs: [book.id],
      );
    } catch (e, s) {
      developer.log('Error updating book: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    try {
      final dbInstance = await instance.database;
      await dbInstance.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e, s) {
      developer.log('Error deleting book: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> deleteAll() async {
    try {
      final dbInstance = await instance.database;
      await dbInstance.delete(tableName);
    } catch (e, s) {
      developer.log('Error deleting all books: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<BooksModel> getBookById(String id) async {
    try {
      final dbInstance = await instance.database;
      final List<Map<String, dynamic>> maps = await dbInstance.query(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return listMapToMyBook(maps).first;
    } catch (e, s) {
      developer.log('Error getting book by id: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> insertBookPosition(String fileName, String position) async {
    try {
      final dbInstance = await instance.database;
      await dbInstance.insert(
        'bookposition',
        {
          'fileName': fileName,
          'position': position,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e, s) {
      developer.log('Error inserting book position: $e',
          error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> updateBookPosition(String fileName, String position) async {
    try {
      final dbInstance = await instance.database;
      await dbInstance.update(
        'bookposition',
        {
          'fileName': fileName,
          'position': position,
        },
        where: 'fileName = ?',
        whereArgs: [fileName],
      );
    } catch (e) {
      developer.log('Error updating book position: $e');
      rethrow;
    }
  }

  Future<String?> getBookPosition(String fileName) async {
    try {
      final dbInstance = await instance.database;
      final List<Map<String, dynamic>> maps = await dbInstance.query(
        'bookposition',
        where: 'fileName = ?',
        whereArgs: [fileName],
      );
      if (maps.isEmpty) {
        return null;
      }
      return maps.first['position'] as String;
    } catch (e) {
      developer.log('Error getting book position: $e');
      rethrow;
    }
  }

//? I think i can userPreference this can also do this job super easily

  Future<void> initializePreferences() async {
    try {
      final dbInstance = await instance.database;

      // Check if we have a preferences row
      final List<Map<String, dynamic>> exists = await dbInstance.query(
          userpreferenceTableName,
          where: 'id = ?',
          whereArgs: [defaultId]);

      // If no preferences exist, insert default values
      if (exists.isEmpty) {
        await dbInstance.insert(
          userpreferenceTableName,
          {
            'id': defaultId,
            'darkMode': 0,
            'language': 'en',
          },
        );
      }
    } catch (e) {
      developer.log('Error initializing preferences: $e');
      rethrow;
    }
  }

  Future<bool> isDarkTheme() async {
    try {
      final dbInstance = await instance.database;
      final List<Map<String, dynamic>> maps = await dbInstance.query(
        userpreferenceTableName,
        where: 'id = ?',
        whereArgs: [defaultId],
      );

      if (maps.isEmpty) {
        await initializePreferences();
        return false;
      }
      return maps.first['darkMode'] == 1;
    } catch (e) {
      developer.log('Error getting dark theme: $e');
      rethrow;
    }
  }

  Future<String> currentLanguage() async {
    try {
      final dbInstance = await instance.database;
      final List<Map<String, dynamic>> maps = await dbInstance.query(
        tableName,
        where: 'id = ?',
        whereArgs: [defaultId],
      );

      if (maps.isEmpty) {
        await initializePreferences();
        return "en";
      }
      return maps.first['language'];
    } catch (e) {
      developer.log('Error getting language: $e');
      rethrow;
    }
  }

  Future<void> setDarkTheme(bool isDark) async {
    try {
      final dbInstance = await instance.database;
      await dbInstance.update(
        userpreferenceTableName,
        {'darkMode': isDark ? 1 : 0},
        where: 'id = ?',
        whereArgs: [defaultId],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      developer.log('Error setting dark theme: $e');
      rethrow;
    }
  }

  Future<void> setLanguage(String language) async {
    try {
      final dbInstance = await instance.database;
      await dbInstance.update(
        userpreferenceTableName,
        {'language': language},
        where: 'id = ?',
        whereArgs: [defaultId],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e, s) {
      developer.log('Error setting language:', error: e, stackTrace: s);
      rethrow;
    }
  }
}
