// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invitation_app/cubit/app_states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialeState());
  static AppCubit get(context) => BlocProvider.of(context);

// the dataBase
  List<Map> events = [];
  late Database database;
  // lest for full data
  // sender , receiver , date , location ,[  Events ]
  void createDataBase() {
    openDatabase(
      'event.db',
      version: 1,
      onCreate: (database, version) {
        print('databae created new !!');
        // title ,time ,date , status
        database
            .execute(
                'CREATE TABLE Events (id INTEGER PRIMARY KEY, sender TEXT, receiver TEXT, date TEXT, location TEXT)')
            .then((value) {
          print('Table created ');
        }).catchError((error) {
          print('Error when create table :> ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataBase(database).then((value) {
          events = value;
          emit(AppGetDatabaseStates());
          print('the data!!!!!!!!!!!!!! $events');
        });
        print('open database new ??');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseStates());
    });
  }

// sender , receiver , date , location ,[  Events ]
  insertDataBase({
    required String sender,
    required String receiver,
    required String date,
    required String location,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Events(sender, receiver ,date, location) VALUES("$sender","$receiver","$date","$location")')
          .then((value) {
        print('Insert saccessfully $value');
        emit(AppInsertDatabaseStates());
        // get the database

        getDataBase(database).then((value) {
          events = value;
          emit(AppGetDatabaseStates());
        });
      }).catchError((error) {
        print('Error when create insert new Record :> ${error.toString()}');
      });
    });
  }

  Future<List<Map>> getDataBase(database) async {
    emit(AppGetLoadingDatabaseStates());
    return await database.rawQuery('SELECT * FROM Events');
  }
}
