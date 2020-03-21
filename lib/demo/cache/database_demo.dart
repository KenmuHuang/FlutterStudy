import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

final String routeNameOfDatabaseDemoPage = '/DatabaseDemoPage';

class DatabaseDemo extends StatelessWidget {
  DatabaseDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatabaseDemoPage(
      title: 'Database Demo Page',
    );
  }
}

class DatabaseDemoPage extends StatefulWidget {
  DatabaseDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DatabaseDemoPageState createState() {
    return _DatabaseDemoPageState();
  }
}

class _DatabaseDemoPageState extends State<DatabaseDemoPage> {
  Database database;
  String databaseFilePath;
  
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  _initDatabaseFilePath() async {
    // Get a location using getDatabasesPath
    var databasePath = await getDatabasesPath();
    databaseFilePath = databasePath + '/demo.db';
  }
  
  void _createTableCompanyV1(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS Company');
    batch.execute('''create table Company (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    )''');

    print('create table Company successfully -- Version 1');
  }

  void _createTableCompanyV2(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS Company');
    batch.execute('''create table Company (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      description TEXT
    )''');

    print('create table Company successfully -- Version 2');
  }
  
  void _updateTableCompanyV1toV2(Batch batch) {
    batch.execute('ALTER TABLE Company ADD description TEXT');

    print('update table Company successfully -- Version 2');
  }

  void _createTableEmployeeV2(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS Employee');
    batch.execute('''create table Employee (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      companyId INTEGER,
      FOREIGN KEY (companyId) REFERENCES Company(id) ON DELETE CASCADE
    )''');

    print('create table Employee successfully -- Version 2');
  }

  void _openDatabaseV1() async {
    // Delete the database
    await deleteDatabase(databaseFilePath);

    // Open the database
    database = await openDatabase(
      databaseFilePath,
      version: 1,
      onCreate: (Database db, int version) async {
        var batch = db.batch();
        _createTableCompanyV1(batch);
        await batch.commit();
      },
      onDowngrade: onDatabaseDowngradeDelete,
    );

    // Close the database
    await database.close();
  }

  void _openDatabaseV2() async {
    // Open the database
    database = await openDatabase(
      databaseFilePath,
      version: 2,
      onConfigure: _onConfigure,
      onCreate: (Database db, int version) async {
        var batch = db.batch();
        // We create all the tables
        _createTableCompanyV2(batch);
        _createTableEmployeeV2(batch);
        await batch.commit();
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        var batch = db.batch();
        if (oldVersion == 1) {
          // We update existing table and create the new tables
          _updateTableCompanyV1toV2(batch);
          _createTableEmployeeV2(batch);
        }
        await batch.commit();
      },
      onDowngrade: onDatabaseDowngradeDelete,
    );

    // Close the database
    await database.close();
  }

  @override
  void initState() {
    super.initState();

    _initDatabaseFilePath();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'sqflite',
          style: TextStyle(
            color: Colors.indigoAccent,
            fontSize: 15.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Test database',
        onPressed: () {
//          _openDatabaseV1();

          _openDatabaseV2();
        },
      ),
    );
  }
}