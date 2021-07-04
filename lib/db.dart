import 'package:moor_flutter/moor_flutter.dart';

part 'db.g.dart';//generated when execute "flutter packages pub run build_runner watch" in terminal

class Parameters extends Table {
  TextColumn get code => text()();
  IntColumn get numberValue => integer().nullable()();
  TextColumn get textValue => text().nullable()();
  DateTimeColumn get timeValue => dateTime().nullable()();
  BoolColumn get booleanValue => boolean().nullable()();




  @override
  Set<Column> get primaryKey => {code};
}
@UseMoor(
    tables: [Parameters]
)//add Table name
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite',
      logStatements: true));

  MyDatabase db;

  @override
  MigrationStrategy get migration => destructiveFallback;

  @override
  int get schemaVersion => 1;


  Future <List<Parameter>> getAllparameters() => select(parameters).get();

  Stream <List<Parameter>> watchAllparameters() => select(parameters).watch();

  Future insertparameter(Parameter parameter) =>
      into(parameters).insert(parameter);

  Future updateparameter(Parameter parameter) =>
      update(parameters).replace(parameter);

  Future deleteparameter(Parameter parameter) =>
      delete(parameters).delete(parameter);


  Future<List<Parameter>> selectParameterByCode(String code) {
    return customSelect(
      'SELECT *' + 'From parameters ' + 'WHERE code = ?;',
      variables: [Variable.withString(code)],
      readsFrom: {parameters},
    )
        .map((row) =>
        Parameter(
            code: row.readString('code'),
            numberValue: row.read('number_value'),
            textValue: row.read('text_value'),
            timeValue: row.read('time_value'),
            booleanValue: row.read('boolean_value')))
        .get();
  }


  Future<List<Parameter>> selectAllParametersOrderByNumber() {
    return customSelect(
      'SELECT *'
          + 'From parameters '
          + 'Order by number_value ASC;',
      readsFrom: {parameters},
    )
        .map((row) =>
        Parameter(
            code: row.read('code'),
            numberValue: row.read('number_value'),
            textValue: row.read('text_value'),
            timeValue: row.read('time_value'),
            booleanValue: row.read('boolean_value')))
        .get();
  }
}