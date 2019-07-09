import 'package:astrobin_app/core/datasources/base/base_dao.dart';
import 'package:astrobin_app/core/models/astrobin_item.dart';

import 'database_provider.dart';

class AstrobinDao implements Dao<AstrobinItem> {
  final databaseProvider = DatabaseProvider.dbProvider;

  final tablename = "pods";

  final _columnAnimated = 'animated';
  final _columnDec = 'dec';
  final _columnDescription = 'description';
  final _columnH = 'h';
  final _columnId = 'id';
  final _columnImagingCameras = 'imaging_cameras';
  final _columnImagingTelescopes = 'imaging_telescopes';
  final _columnIsFinal = 'is_final';
  final _columnIsSolved = 'is_solved';
  final _columnLicense = 'license';
  final _columnLink = 'link';
  final _columnLinkToFits = 'link_to_fits';
  final _columnOrientation = 'orientation';
  final _columnPixscale = 'pixscale';
  final _columnPublished = 'published';
  final _columnRa = 'ra';
  final _columnRadius = 'radius';
  final _columnResourceUri = 'resource_uri';
  final _columnSubjects = 'subjects';
  final _columnTitle = 'title';
  final _columnUpdated = 'updated';
  final _columnUploaded = 'uploaded';
  final _columnUrlDuckduckgo = 'url_duckduckgo';
  final _columnUrlDuckduckgoSmall = 'url_duckduckgo_small';
  final _columnUrlGallery = 'url_gallery';
  final _columnUrlHd = 'url_hd';
  final _columnUrlReal = 'url_real';
  final _columnUrlRegular = 'url_regular';
  final _columnUrlThumb = 'url_thumb';
  final _columnUser = 'user';
  final _columnW = 'w';

  @override
  String get createTableQuery => "CREATE TABLE $tablename($_columnAnimated INT,"
      " $_columnDec TEXT,"
      " $_columnDescription TEXT,"
      " $_columnH INT,"
      " $_columnId INT PRIMARY KEY,"
      " $_columnImagingCameras TEXT,"
      " $_columnImagingTelescopes TEXT,"
      " $_columnIsFinal INT,"
      " $_columnIsSolved INT,"
      " $_columnLicense INT,"
      " $_columnLink TEXT,"
      " $_columnLinkToFits TEXT,"
      " $_columnOrientation TEXT,"
      " $_columnPixscale TEXT,"
      " $_columnPublished TEXT,"
      " $_columnRa TEXT,"
      " $_columnRadius TEXT,"
      " $_columnResourceUri TEXT,"
      " $_columnSubjects TEXT,"
      " $_columnTitle TEXT,"
      " $_columnUpdated TEXT,"
      " $_columnUploaded TEXT,"
      " $_columnUrlDuckduckgo TEXT,"
      " $_columnUrlDuckduckgoSmall TEXT,"
      " $_columnUrlGallery TEXT,"
      " $_columnUrlHd TEXT,"
      " $_columnUrlReal TEXT,"
      " $_columnUrlRegular TEXT,"
      " $_columnUrlThumb TEXT,"
      " $_columnUser TEXT,"
      " $_columnW INT)";

  @override
  List<AstrobinItem> fromList(List<Map<String, dynamic>> query) {
    List<AstrobinItem> pods = List<AstrobinItem>();
    for (Map map in query) {
      pods.add(fromMap(map));
    }
    return pods;
  }

  @override
  AstrobinItem fromMap(Map<String, dynamic> query) {
    AstrobinItem astrobinItem = AstrobinItem.fromJson(query);
    return astrobinItem;
  }

  @override
  Map<String, dynamic> toMap(AstrobinItem object) {
    return object.toJson();
  }

  Future<AstrobinItem> insert(AstrobinItem astrobinItem) async {
    final db = await databaseProvider.createDatabase();
    await db.insert(tablename, toMap(astrobinItem));
    return astrobinItem;
  }

  Future<AstrobinItem> delete(AstrobinItem astrobinItem) async {
    final db = await databaseProvider.createDatabase();
    await db
        .delete(tablename, where: "id" + " = ?", whereArgs: [astrobinItem.id]);
    return astrobinItem;
  }

  void deleteAll() async {
    final db = await databaseProvider.createDatabase();
    await db.delete(tablename);
  }

  Future<AstrobinItem> update(AstrobinItem astrobinItem) async {
    final db = await databaseProvider.createDatabase();
    await db.update(tablename, toMap(astrobinItem),
        where: "id" + " = ?", whereArgs: [astrobinItem.id]);
    return astrobinItem;
  }

  Future<AstrobinItem> getAstrobinItem(int id) async {
    final db = await databaseProvider.createDatabase();
    AstrobinItem astrobinItem;
    List<Map> result =
        await db.query(tablename, where: "id" + " = ?", whereArgs: [id]);
    result.forEach((row) => astrobinItem = fromMap(row));
    return astrobinItem;
  }

  Future<List<AstrobinItem>> getAstrobinItems() async {
    final db = await databaseProvider.createDatabase();
    List<Map> maps = await db.query(tablename);
    return fromList(maps);
  }
}
