import 'package:astrobin_app/core/datasources/base/base_dao.dart';
import 'package:astrobin_app/core/models/apodItem.dart';

import 'database_provider.dart';

class ApodDao implements Dao<ApodItem> {
  final databaseProvider = DatabaseProvider.dbProvider;

  final tablename = "apods";
  final _id = "id";
  final _columnDate = "date";
  final _columnExplanation = "explanation";
  final _columnMediaType = "media_type";
  final _columnServiceVersion = "service_version";
  final _columnTitle = "title";
  final _columnUrl = "url";

  @override
  String get createTableQuery => "CREATE TABLE $tablename($_id INT PRIMARY KEY,"
      " $_columnDate TEXT,"
      " $_columnExplanation TEXT,"
      " $_columnMediaType TEXT,"
      " $_columnServiceVersion TEXT,"
      " $_columnTitle TEXT,"
      " $_columnUrl TEXT)";

  @override
  List<ApodItem> fromList(List<Map<String, dynamic>> query) {
    List<ApodItem> apods = List<ApodItem>();
    for (Map map in query) {
      apods.add(fromMap(map));
    }
    return apods;
  }

  @override
  ApodItem fromMap(Map<String, dynamic> query) {
    ApodItem apodItem = ApodItem();
    apodItem.date = query[_columnDate];
    apodItem.explanation = query[_columnExplanation];
    apodItem.mediaType = query[_columnMediaType];
    apodItem.serviceVersion = query[_columnServiceVersion];
    apodItem.title = query[_columnTitle];
    apodItem.url = query[_columnUrl];
    return apodItem;
  }

  @override
  Map<String, dynamic> toMap(ApodItem object) {
    return <String, dynamic>{
      _id: 1,
      _columnDate: object.date,
      _columnExplanation: object.explanation,
      _columnMediaType: object.mediaType,
      _columnServiceVersion: object.serviceVersion,
      _columnTitle: object.title,
      _columnUrl: object.url
    };
  }

  Future<ApodItem> insert(ApodItem apodItem) async {
    final db = await databaseProvider.createDatabase();
    await db.insert(tablename, toMap(apodItem));
    return apodItem;
  }

  Future<ApodItem> delete(ApodItem apodItem) async {
    final db = await databaseProvider.createDatabase();
    await db.delete(tablename,
        where: _columnDate + " = ?", whereArgs: [apodItem.date]);
    return apodItem;
  }

  void deleteAll() async {
    final db = await databaseProvider.createDatabase();
    await db.delete(tablename);
  }

  Future<ApodItem> update(ApodItem apodItem) async {
    final db = await databaseProvider.createDatabase();
    await db.update(tablename, toMap(apodItem),
        where: _columnDate + " = ?", whereArgs: [apodItem.date]);
    return apodItem;
  }

  Future<ApodItem> getApod(String date) async {
    final db = await databaseProvider.createDatabase();
    ApodItem apodItem;
    List<Map> result = await db
        .query(tablename, where: _columnDate + " = ?", whereArgs: [date]);
    result.forEach((row) => apodItem = fromMap(row));
    return apodItem;
  }

  Future<List<ApodItem>> getApods() async {
    final db = await databaseProvider.createDatabase();
    List<Map> maps = await db.query(tablename);
    return fromList(maps);
  }
}
