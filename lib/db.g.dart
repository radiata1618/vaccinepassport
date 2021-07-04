// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Parameter extends DataClass implements Insertable<Parameter> {
  final String code;
  final int numberValue;
  final String textValue;
  final DateTime timeValue;
  final bool booleanValue;
  Parameter(
      {@required this.code,
      this.numberValue,
      this.textValue,
      this.timeValue,
      this.booleanValue});
  factory Parameter.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Parameter(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code']),
      numberValue: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number_value']),
      textValue: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}text_value']),
      timeValue: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_value']),
      booleanValue: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}boolean_value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || numberValue != null) {
      map['number_value'] = Variable<int>(numberValue);
    }
    if (!nullToAbsent || textValue != null) {
      map['text_value'] = Variable<String>(textValue);
    }
    if (!nullToAbsent || timeValue != null) {
      map['time_value'] = Variable<DateTime>(timeValue);
    }
    if (!nullToAbsent || booleanValue != null) {
      map['boolean_value'] = Variable<bool>(booleanValue);
    }
    return map;
  }

  ParametersCompanion toCompanion(bool nullToAbsent) {
    return ParametersCompanion(
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      numberValue: numberValue == null && nullToAbsent
          ? const Value.absent()
          : Value(numberValue),
      textValue: textValue == null && nullToAbsent
          ? const Value.absent()
          : Value(textValue),
      timeValue: timeValue == null && nullToAbsent
          ? const Value.absent()
          : Value(timeValue),
      booleanValue: booleanValue == null && nullToAbsent
          ? const Value.absent()
          : Value(booleanValue),
    );
  }

  factory Parameter.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Parameter(
      code: serializer.fromJson<String>(json['code']),
      numberValue: serializer.fromJson<int>(json['numberValue']),
      textValue: serializer.fromJson<String>(json['textValue']),
      timeValue: serializer.fromJson<DateTime>(json['timeValue']),
      booleanValue: serializer.fromJson<bool>(json['booleanValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'numberValue': serializer.toJson<int>(numberValue),
      'textValue': serializer.toJson<String>(textValue),
      'timeValue': serializer.toJson<DateTime>(timeValue),
      'booleanValue': serializer.toJson<bool>(booleanValue),
    };
  }

  Parameter copyWith(
          {String code,
          int numberValue,
          String textValue,
          DateTime timeValue,
          bool booleanValue}) =>
      Parameter(
        code: code ?? this.code,
        numberValue: numberValue ?? this.numberValue,
        textValue: textValue ?? this.textValue,
        timeValue: timeValue ?? this.timeValue,
        booleanValue: booleanValue ?? this.booleanValue,
      );
  @override
  String toString() {
    return (StringBuffer('Parameter(')
          ..write('code: $code, ')
          ..write('numberValue: $numberValue, ')
          ..write('textValue: $textValue, ')
          ..write('timeValue: $timeValue, ')
          ..write('booleanValue: $booleanValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      code.hashCode,
      $mrjc(
          numberValue.hashCode,
          $mrjc(textValue.hashCode,
              $mrjc(timeValue.hashCode, booleanValue.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Parameter &&
          other.code == this.code &&
          other.numberValue == this.numberValue &&
          other.textValue == this.textValue &&
          other.timeValue == this.timeValue &&
          other.booleanValue == this.booleanValue);
}

class ParametersCompanion extends UpdateCompanion<Parameter> {
  final Value<String> code;
  final Value<int> numberValue;
  final Value<String> textValue;
  final Value<DateTime> timeValue;
  final Value<bool> booleanValue;
  const ParametersCompanion({
    this.code = const Value.absent(),
    this.numberValue = const Value.absent(),
    this.textValue = const Value.absent(),
    this.timeValue = const Value.absent(),
    this.booleanValue = const Value.absent(),
  });
  ParametersCompanion.insert({
    @required String code,
    this.numberValue = const Value.absent(),
    this.textValue = const Value.absent(),
    this.timeValue = const Value.absent(),
    this.booleanValue = const Value.absent(),
  }) : code = Value(code);
  static Insertable<Parameter> custom({
    Expression<String> code,
    Expression<int> numberValue,
    Expression<String> textValue,
    Expression<DateTime> timeValue,
    Expression<bool> booleanValue,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (numberValue != null) 'number_value': numberValue,
      if (textValue != null) 'text_value': textValue,
      if (timeValue != null) 'time_value': timeValue,
      if (booleanValue != null) 'boolean_value': booleanValue,
    });
  }

  ParametersCompanion copyWith(
      {Value<String> code,
      Value<int> numberValue,
      Value<String> textValue,
      Value<DateTime> timeValue,
      Value<bool> booleanValue}) {
    return ParametersCompanion(
      code: code ?? this.code,
      numberValue: numberValue ?? this.numberValue,
      textValue: textValue ?? this.textValue,
      timeValue: timeValue ?? this.timeValue,
      booleanValue: booleanValue ?? this.booleanValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (numberValue.present) {
      map['number_value'] = Variable<int>(numberValue.value);
    }
    if (textValue.present) {
      map['text_value'] = Variable<String>(textValue.value);
    }
    if (timeValue.present) {
      map['time_value'] = Variable<DateTime>(timeValue.value);
    }
    if (booleanValue.present) {
      map['boolean_value'] = Variable<bool>(booleanValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParametersCompanion(')
          ..write('code: $code, ')
          ..write('numberValue: $numberValue, ')
          ..write('textValue: $textValue, ')
          ..write('timeValue: $timeValue, ')
          ..write('booleanValue: $booleanValue')
          ..write(')'))
        .toString();
  }
}

class $ParametersTable extends Parameters
    with TableInfo<$ParametersTable, Parameter> {
  final GeneratedDatabase _db;
  final String _alias;
  $ParametersTable(this._db, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn(
      'code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numberValueMeta =
      const VerificationMeta('numberValue');
  GeneratedIntColumn _numberValue;
  @override
  GeneratedIntColumn get numberValue =>
      _numberValue ??= _constructNumberValue();
  GeneratedIntColumn _constructNumberValue() {
    return GeneratedIntColumn(
      'number_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _textValueMeta = const VerificationMeta('textValue');
  GeneratedTextColumn _textValue;
  @override
  GeneratedTextColumn get textValue => _textValue ??= _constructTextValue();
  GeneratedTextColumn _constructTextValue() {
    return GeneratedTextColumn(
      'text_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeValueMeta = const VerificationMeta('timeValue');
  GeneratedDateTimeColumn _timeValue;
  @override
  GeneratedDateTimeColumn get timeValue => _timeValue ??= _constructTimeValue();
  GeneratedDateTimeColumn _constructTimeValue() {
    return GeneratedDateTimeColumn(
      'time_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _booleanValueMeta =
      const VerificationMeta('booleanValue');
  GeneratedBoolColumn _booleanValue;
  @override
  GeneratedBoolColumn get booleanValue =>
      _booleanValue ??= _constructBooleanValue();
  GeneratedBoolColumn _constructBooleanValue() {
    return GeneratedBoolColumn(
      'boolean_value',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [code, numberValue, textValue, timeValue, booleanValue];
  @override
  $ParametersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'parameters';
  @override
  final String actualTableName = 'parameters';
  @override
  VerificationContext validateIntegrity(Insertable<Parameter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('number_value')) {
      context.handle(
          _numberValueMeta,
          numberValue.isAcceptableOrUnknown(
              data['number_value'], _numberValueMeta));
    }
    if (data.containsKey('text_value')) {
      context.handle(_textValueMeta,
          textValue.isAcceptableOrUnknown(data['text_value'], _textValueMeta));
    }
    if (data.containsKey('time_value')) {
      context.handle(_timeValueMeta,
          timeValue.isAcceptableOrUnknown(data['time_value'], _timeValueMeta));
    }
    if (data.containsKey('boolean_value')) {
      context.handle(
          _booleanValueMeta,
          booleanValue.isAcceptableOrUnknown(
              data['boolean_value'], _booleanValueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Parameter map(Map<String, dynamic> data, {String tablePrefix}) {
    return Parameter.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ParametersTable createAlias(String alias) {
    return $ParametersTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ParametersTable _parameters;
  $ParametersTable get parameters => _parameters ??= $ParametersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [parameters];
}
