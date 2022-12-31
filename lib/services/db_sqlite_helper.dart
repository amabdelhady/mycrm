import 'package:newnew/models/visiting_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbSQLiteHelper{
  static final DbSQLiteHelper _instance = DbSQLiteHelper.internal();
  factory DbSQLiteHelper() => _instance;
  DbSQLiteHelper.internal();
  static Database _db = Database as Database;

  Future<Database> createDatabase() async{
    if(_db != null){
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'visitingList.db');
    _db = await openDatabase(path,version: 1,onCreate: (Database db, int v){
      //create all tables/
      db.execute(
          "create table visits("
          "id integer primary key autoincrement,"
          " medicineName varchar(50),"
          " samples integer(20),"
          " visitingDate varchar(20),"
          " visitingTime varchar(20),"
          " visitingDateTime varchar(20),"
          " notes varchar(400))");
    });
    return _db;
  }

  Future<int> createVisiting(VisitingData visitingDataModel) async{
    Database db = await createDatabase();
    return db.insert('courses', visitingDataModel.toJson());
  }

  Future<List> allVisits() async{
    Database db = await createDatabase();
    return db.query('courses');
  }

  Future<int> deleteVisit(int id) async{
    Database db = await createDatabase();
    return db.delete('courses',where: 'id = ?',whereArgs:[id] );
  }

}