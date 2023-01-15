// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TimeblockTable extends Timeblock
    with TableInfo<$TimeblockTable, TimeblockData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeblockTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime> end = GeneratedColumn<DateTime>(
      'end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, start, end, note];
  @override
  String get aliasedName => _alias ?? 'timeblock';
  @override
  String get actualTableName => 'timeblock';
  @override
  VerificationContext validateIntegrity(Insertable<TimeblockData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimeblockData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimeblockData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start'])!,
      end: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
    );
  }

  @override
  $TimeblockTable createAlias(String alias) {
    return $TimeblockTable(attachedDatabase, alias);
  }
}

class TimeblockData extends DataClass implements Insertable<TimeblockData> {
  final int id;
  final DateTime start;
  final DateTime end;
  final String note;
  const TimeblockData(
      {required this.id,
      required this.start,
      required this.end,
      required this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start'] = Variable<DateTime>(start);
    map['end'] = Variable<DateTime>(end);
    map['note'] = Variable<String>(note);
    return map;
  }

  TimeblockCompanion toCompanion(bool nullToAbsent) {
    return TimeblockCompanion(
      id: Value(id),
      start: Value(start),
      end: Value(end),
      note: Value(note),
    );
  }

  factory TimeblockData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeblockData(
      id: serializer.fromJson<int>(json['id']),
      start: serializer.fromJson<DateTime>(json['start']),
      end: serializer.fromJson<DateTime>(json['end']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'start': serializer.toJson<DateTime>(start),
      'end': serializer.toJson<DateTime>(end),
      'note': serializer.toJson<String>(note),
    };
  }

  TimeblockData copyWith(
          {int? id, DateTime? start, DateTime? end, String? note}) =>
      TimeblockData(
        id: id ?? this.id,
        start: start ?? this.start,
        end: end ?? this.end,
        note: note ?? this.note,
      );
  @override
  String toString() {
    return (StringBuffer('TimeblockData(')
          ..write('id: $id, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, start, end, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeblockData &&
          other.id == this.id &&
          other.start == this.start &&
          other.end == this.end &&
          other.note == this.note);
}

class TimeblockCompanion extends UpdateCompanion<TimeblockData> {
  final Value<int> id;
  final Value<DateTime> start;
  final Value<DateTime> end;
  final Value<String> note;
  const TimeblockCompanion({
    this.id = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.note = const Value.absent(),
  });
  TimeblockCompanion.insert({
    this.id = const Value.absent(),
    required DateTime start,
    required DateTime end,
    required String note,
  })  : start = Value(start),
        end = Value(end),
        note = Value(note);
  static Insertable<TimeblockData> custom({
    Expression<int>? id,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
      if (note != null) 'note': note,
    });
  }

  TimeblockCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? start,
      Value<DateTime>? end,
      Value<String>? note}) {
    return TimeblockCompanion(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end ?? this.end,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeblockCompanion(')
          ..write('id: $id, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $TimeblockTable timeblock = $TimeblockTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [timeblock];
}
