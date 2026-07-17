
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/transaction_model.dart';



class DatabaseService {


  static Database? _database;



  Future<Database> get database async {


    if (_database != null) {

      return _database!;

    }


    _database = await initDatabase();


    return _database!;


  }





  Future<Database> initDatabase() async {


    String path = join(

      await getDatabasesPath(),

      'pocketguard.db',

    );



    return await openDatabase(

      path,

      version: 1,


      onCreate: (Database db, int version) async {


        await db.execute('''

        CREATE TABLE transactions(

          id TEXT PRIMARY KEY,

          amount REAL,

          title TEXT,

          type TEXT,

          date TEXT

        )

        ''');


      },


    );


  }






  Future<void> insertTransaction(

      TransactionModel transaction

      ) async {


    final db = await database;



    await db.insert(

      'transactions',

      transaction.toMap(),

      conflictAlgorithm: ConflictAlgorithm.replace,

    );


  }







  Future<List<TransactionModel>> getTransactions() async {


    final db = await database;



    final result = await db.query(

      'transactions',

      orderBy: 'date DESC',

    );



    return result.map((item){


      return TransactionModel.fromMap(item);


    }).toList();


  }



}