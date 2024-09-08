import 'dart:io';

import 'package:canlendar_schedulert/model/category.dart';

import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:canlendar_schedulert/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

part 'drift.g.dart';

@DriftDatabase(
  tables: [ScheduleTable]
) // -> 바로 밑의 코드 생성을 도움
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  /* 스키마 버전은 데이터베이스 상태를 버전으로 관리하는데 테이블을 다시 변경하고 배포할때 스키마 버전의 숫자를 올리고 배포
 현재 데이터베이스가 원하는 상태로 되어있는지 확인하기 위함 */
}

//LazyDatabase를 반환하는 _openConnection 함수 생성
LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dbFolder =  await getApplicationDocumentsDirectory();
    // getApplicationDocumentsDirectory 앱 설치 시, 각각의 앱별로 배정되는 폴더의 위치를 가져옴

    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    // join 여러개의 경롷를 운영체제에 맞게 합쳐줌
    // C: \\Users\Flutter
    // /Users/Flutter
    // /Users/Flutter + /name/codefactory
    // /Users/Flutter/name/codefactory/calender_scheduler/db.sqlite

    if(Platform.isAndroid){
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      //옛날 안드로이드 버전에서 생기는 에러 해결 코드 추가 필수
    }

    final cachebase =  await getTemporaryDirectory(); // 임시폴더 가져옴

    sqlite3.tempDirectory = cachebase.path;
    //sqlite 가 자동으로 임시폴더를 사용하고, 캣이나, 메타데이터를 저장

    return NativeDatabase.createInBackground(file);
  },);
}