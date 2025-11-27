import 'package:ai_chatbot/features/chat/model/chat_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class ChatDatabase {
  static final ChatDatabase instance = ChatDatabase._init();
  static Database? _database;

  ChatDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("chat.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
        '''
      CREATE TABLE chats(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        message TEXT,
        sender TEXT,
        time TEXT
      )
    '''
    );
  }

  // Write message.....
  Future<int> insertMessage(ChatModel chat) async {
    final db = await instance.database;
    return await db.insert(
      'chats',
      chat.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Read/Get message.....
  Future<List<ChatModel>> getMessages() async {
    final db = await instance.database;
    final data = await db.query('chats',orderBy: "id ASC",);
    return data.map((e) => ChatModel.fromMap(e)).toList();
  }

  // Delete all chat.......
  Future<void> deleteChat() async {
    final db = await instance.database;
    await db.delete("chats");
  }

  // Close database...........
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
