import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'database.dart';

class DatabaseTransferService {
  /// Imports a database file from the given path into the app sandbox.
  /// Overwrites the current active database file.
  static Future<void> importDatabase(String sourcePath) async {
    final sourceFile = File(sourcePath);
    if (!await sourceFile.exists()) {
      throw Exception('Source file does not exist at: $sourcePath');
    }

    // 1. Close current connection if open to release locks
    await AppDatabase.instance.close();

    // 2. Locate sandbox database file path
    final appDir = await getApplicationDocumentsDirectory();
    final dbFile = File('${appDir.path}/router_hub_db.sqlite');

    // 3. Delete existing database and journal/wal files to avoid conflict/corruption
    if (await dbFile.exists()) {
      await dbFile.delete();
    }
    
    final walFile = File('${dbFile.path}-wal');
    if (await walFile.exists()) {
      await walFile.delete();
    }
    
    final shmFile = File('${dbFile.path}-shm');
    if (await shmFile.exists()) {
      await shmFile.delete();
    }

    // 4. Copy the new backup file into place
    await sourceFile.copy(dbFile.path);
  }

  /// Exports the current database file to the external/public directory.
  /// Returns the path where it was saved.
  static Future<String> exportDatabase() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbFile = File('${appDir.path}/router_hub_db.sqlite');
    if (!await dbFile.exists()) {
      throw Exception('Database file does not exist yet.');
    }

    // Find a public or exportable directory
    Directory? exportDir;
    if (Platform.isAndroid) {
      exportDir = await getExternalStorageDirectory() ?? await getTemporaryDirectory();
    } else {
      exportDir = await getApplicationDocumentsDirectory();
    }

    final exportPath = '${exportDir.path}/router_hub_db_backup.sqlite';
    final exportFile = File(exportPath);
    await dbFile.copy(exportFile.path);

    return exportPath;
  }
}
