// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $FocusTimeModelTable extends FocusTimeModel
    with TableInfo<$FocusTimeModelTable, FocusTimeModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FocusTimeModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _completedSecondMeta =
      const VerificationMeta('completedSecond');
  @override
  late final GeneratedColumn<int> completedSecond = GeneratedColumn<int>(
      'completed_second', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, completedSecond, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'focus_time_model';
  @override
  VerificationContext validateIntegrity(Insertable<FocusTimeModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('completed_second')) {
      context.handle(
          _completedSecondMeta,
          completedSecond.isAcceptableOrUnknown(
              data['completed_second']!, _completedSecondMeta));
    } else if (isInserting) {
      context.missing(_completedSecondMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FocusTimeModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FocusTimeModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      completedSecond: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}completed_second'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $FocusTimeModelTable createAlias(String alias) {
    return $FocusTimeModelTable(attachedDatabase, alias);
  }
}

class FocusTimeModelData extends DataClass
    implements Insertable<FocusTimeModelData> {
  final int id;
  final int completedSecond;
  final DateTime? createdAt;
  const FocusTimeModelData(
      {required this.id, required this.completedSecond, this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['completed_second'] = Variable<int>(completedSecond);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  FocusTimeModelCompanion toCompanion(bool nullToAbsent) {
    return FocusTimeModelCompanion(
      id: Value(id),
      completedSecond: Value(completedSecond),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory FocusTimeModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FocusTimeModelData(
      id: serializer.fromJson<int>(json['id']),
      completedSecond: serializer.fromJson<int>(json['completedSecond']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'completedSecond': serializer.toJson<int>(completedSecond),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  FocusTimeModelData copyWith(
          {int? id,
          int? completedSecond,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      FocusTimeModelData(
        id: id ?? this.id,
        completedSecond: completedSecond ?? this.completedSecond,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  FocusTimeModelData copyWithCompanion(FocusTimeModelCompanion data) {
    return FocusTimeModelData(
      id: data.id.present ? data.id.value : this.id,
      completedSecond: data.completedSecond.present
          ? data.completedSecond.value
          : this.completedSecond,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FocusTimeModelData(')
          ..write('id: $id, ')
          ..write('completedSecond: $completedSecond, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, completedSecond, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FocusTimeModelData &&
          other.id == this.id &&
          other.completedSecond == this.completedSecond &&
          other.createdAt == this.createdAt);
}

class FocusTimeModelCompanion extends UpdateCompanion<FocusTimeModelData> {
  final Value<int> id;
  final Value<int> completedSecond;
  final Value<DateTime?> createdAt;
  const FocusTimeModelCompanion({
    this.id = const Value.absent(),
    this.completedSecond = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FocusTimeModelCompanion.insert({
    this.id = const Value.absent(),
    required int completedSecond,
    this.createdAt = const Value.absent(),
  }) : completedSecond = Value(completedSecond);
  static Insertable<FocusTimeModelData> custom({
    Expression<int>? id,
    Expression<int>? completedSecond,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (completedSecond != null) 'completed_second': completedSecond,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FocusTimeModelCompanion copyWith(
      {Value<int>? id,
      Value<int>? completedSecond,
      Value<DateTime?>? createdAt}) {
    return FocusTimeModelCompanion(
      id: id ?? this.id,
      completedSecond: completedSecond ?? this.completedSecond,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (completedSecond.present) {
      map['completed_second'] = Variable<int>(completedSecond.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FocusTimeModelCompanion(')
          ..write('id: $id, ')
          ..write('completedSecond: $completedSecond, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ScheduleTaskModelTable extends ScheduleTaskModel
    with TableInfo<$ScheduleTaskModelTable, ScheduleTaskModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleTaskModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fromTimeMeta =
      const VerificationMeta('fromTime');
  @override
  late final GeneratedColumn<DateTime> fromTime = GeneratedColumn<DateTime>(
      'from_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _toTimeMeta = const VerificationMeta('toTime');
  @override
  late final GeneratedColumn<DateTime> toTime = GeneratedColumn<DateTime>(
      'to_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  static const VerificationMeta _isFailedMeta =
      const VerificationMeta('isFailed');
  @override
  late final GeneratedColumn<bool> isFailed = GeneratedColumn<bool>(
      'is_failed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_failed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, subject, notes, fromTime, toTime, isCompleted, isFailed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_task_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<ScheduleTaskModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('from_time')) {
      context.handle(_fromTimeMeta,
          fromTime.isAcceptableOrUnknown(data['from_time']!, _fromTimeMeta));
    } else if (isInserting) {
      context.missing(_fromTimeMeta);
    }
    if (data.containsKey('to_time')) {
      context.handle(_toTimeMeta,
          toTime.isAcceptableOrUnknown(data['to_time']!, _toTimeMeta));
    } else if (isInserting) {
      context.missing(_toTimeMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('is_failed')) {
      context.handle(_isFailedMeta,
          isFailed.isAcceptableOrUnknown(data['is_failed']!, _isFailedMeta));
    } else if (isInserting) {
      context.missing(_isFailedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleTaskModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleTaskModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      fromTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}from_time'])!,
      toTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}to_time'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      isFailed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_failed'])!,
    );
  }

  @override
  $ScheduleTaskModelTable createAlias(String alias) {
    return $ScheduleTaskModelTable(attachedDatabase, alias);
  }
}

class ScheduleTaskModelData extends DataClass
    implements Insertable<ScheduleTaskModelData> {
  final int id;
  final String subject;
  final String notes;
  final DateTime fromTime;
  final DateTime toTime;
  final bool isCompleted;
  final bool isFailed;
  const ScheduleTaskModelData(
      {required this.id,
      required this.subject,
      required this.notes,
      required this.fromTime,
      required this.toTime,
      required this.isCompleted,
      required this.isFailed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject'] = Variable<String>(subject);
    map['notes'] = Variable<String>(notes);
    map['from_time'] = Variable<DateTime>(fromTime);
    map['to_time'] = Variable<DateTime>(toTime);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['is_failed'] = Variable<bool>(isFailed);
    return map;
  }

  ScheduleTaskModelCompanion toCompanion(bool nullToAbsent) {
    return ScheduleTaskModelCompanion(
      id: Value(id),
      subject: Value(subject),
      notes: Value(notes),
      fromTime: Value(fromTime),
      toTime: Value(toTime),
      isCompleted: Value(isCompleted),
      isFailed: Value(isFailed),
    );
  }

  factory ScheduleTaskModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleTaskModelData(
      id: serializer.fromJson<int>(json['id']),
      subject: serializer.fromJson<String>(json['subject']),
      notes: serializer.fromJson<String>(json['notes']),
      fromTime: serializer.fromJson<DateTime>(json['fromTime']),
      toTime: serializer.fromJson<DateTime>(json['toTime']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      isFailed: serializer.fromJson<bool>(json['isFailed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subject': serializer.toJson<String>(subject),
      'notes': serializer.toJson<String>(notes),
      'fromTime': serializer.toJson<DateTime>(fromTime),
      'toTime': serializer.toJson<DateTime>(toTime),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'isFailed': serializer.toJson<bool>(isFailed),
    };
  }

  ScheduleTaskModelData copyWith(
          {int? id,
          String? subject,
          String? notes,
          DateTime? fromTime,
          DateTime? toTime,
          bool? isCompleted,
          bool? isFailed}) =>
      ScheduleTaskModelData(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        notes: notes ?? this.notes,
        fromTime: fromTime ?? this.fromTime,
        toTime: toTime ?? this.toTime,
        isCompleted: isCompleted ?? this.isCompleted,
        isFailed: isFailed ?? this.isFailed,
      );
  ScheduleTaskModelData copyWithCompanion(ScheduleTaskModelCompanion data) {
    return ScheduleTaskModelData(
      id: data.id.present ? data.id.value : this.id,
      subject: data.subject.present ? data.subject.value : this.subject,
      notes: data.notes.present ? data.notes.value : this.notes,
      fromTime: data.fromTime.present ? data.fromTime.value : this.fromTime,
      toTime: data.toTime.present ? data.toTime.value : this.toTime,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      isFailed: data.isFailed.present ? data.isFailed.value : this.isFailed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTaskModelData(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('notes: $notes, ')
          ..write('fromTime: $fromTime, ')
          ..write('toTime: $toTime, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isFailed: $isFailed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, subject, notes, fromTime, toTime, isCompleted, isFailed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleTaskModelData &&
          other.id == this.id &&
          other.subject == this.subject &&
          other.notes == this.notes &&
          other.fromTime == this.fromTime &&
          other.toTime == this.toTime &&
          other.isCompleted == this.isCompleted &&
          other.isFailed == this.isFailed);
}

class ScheduleTaskModelCompanion
    extends UpdateCompanion<ScheduleTaskModelData> {
  final Value<int> id;
  final Value<String> subject;
  final Value<String> notes;
  final Value<DateTime> fromTime;
  final Value<DateTime> toTime;
  final Value<bool> isCompleted;
  final Value<bool> isFailed;
  const ScheduleTaskModelCompanion({
    this.id = const Value.absent(),
    this.subject = const Value.absent(),
    this.notes = const Value.absent(),
    this.fromTime = const Value.absent(),
    this.toTime = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isFailed = const Value.absent(),
  });
  ScheduleTaskModelCompanion.insert({
    this.id = const Value.absent(),
    required String subject,
    required String notes,
    required DateTime fromTime,
    required DateTime toTime,
    required bool isCompleted,
    required bool isFailed,
  })  : subject = Value(subject),
        notes = Value(notes),
        fromTime = Value(fromTime),
        toTime = Value(toTime),
        isCompleted = Value(isCompleted),
        isFailed = Value(isFailed);
  static Insertable<ScheduleTaskModelData> custom({
    Expression<int>? id,
    Expression<String>? subject,
    Expression<String>? notes,
    Expression<DateTime>? fromTime,
    Expression<DateTime>? toTime,
    Expression<bool>? isCompleted,
    Expression<bool>? isFailed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject != null) 'subject': subject,
      if (notes != null) 'notes': notes,
      if (fromTime != null) 'from_time': fromTime,
      if (toTime != null) 'to_time': toTime,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (isFailed != null) 'is_failed': isFailed,
    });
  }

  ScheduleTaskModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? subject,
      Value<String>? notes,
      Value<DateTime>? fromTime,
      Value<DateTime>? toTime,
      Value<bool>? isCompleted,
      Value<bool>? isFailed}) {
    return ScheduleTaskModelCompanion(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      notes: notes ?? this.notes,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      isCompleted: isCompleted ?? this.isCompleted,
      isFailed: isFailed ?? this.isFailed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (fromTime.present) {
      map['from_time'] = Variable<DateTime>(fromTime.value);
    }
    if (toTime.present) {
      map['to_time'] = Variable<DateTime>(toTime.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (isFailed.present) {
      map['is_failed'] = Variable<bool>(isFailed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTaskModelCompanion(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('notes: $notes, ')
          ..write('fromTime: $fromTime, ')
          ..write('toTime: $toTime, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isFailed: $isFailed')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FocusTimeModelTable focusTimeModel = $FocusTimeModelTable(this);
  late final $ScheduleTaskModelTable scheduleTaskModel =
      $ScheduleTaskModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [focusTimeModel, scheduleTaskModel];
}

typedef $$FocusTimeModelTableCreateCompanionBuilder = FocusTimeModelCompanion
    Function({
  Value<int> id,
  required int completedSecond,
  Value<DateTime?> createdAt,
});
typedef $$FocusTimeModelTableUpdateCompanionBuilder = FocusTimeModelCompanion
    Function({
  Value<int> id,
  Value<int> completedSecond,
  Value<DateTime?> createdAt,
});

class $$FocusTimeModelTableFilterComposer
    extends Composer<_$AppDatabase, $FocusTimeModelTable> {
  $$FocusTimeModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get completedSecond => $composableBuilder(
      column: $table.completedSecond,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$FocusTimeModelTableOrderingComposer
    extends Composer<_$AppDatabase, $FocusTimeModelTable> {
  $$FocusTimeModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get completedSecond => $composableBuilder(
      column: $table.completedSecond,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$FocusTimeModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $FocusTimeModelTable> {
  $$FocusTimeModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get completedSecond => $composableBuilder(
      column: $table.completedSecond, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FocusTimeModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FocusTimeModelTable,
    FocusTimeModelData,
    $$FocusTimeModelTableFilterComposer,
    $$FocusTimeModelTableOrderingComposer,
    $$FocusTimeModelTableAnnotationComposer,
    $$FocusTimeModelTableCreateCompanionBuilder,
    $$FocusTimeModelTableUpdateCompanionBuilder,
    (
      FocusTimeModelData,
      BaseReferences<_$AppDatabase, $FocusTimeModelTable, FocusTimeModelData>
    ),
    FocusTimeModelData,
    PrefetchHooks Function()> {
  $$FocusTimeModelTableTableManager(
      _$AppDatabase db, $FocusTimeModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FocusTimeModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FocusTimeModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FocusTimeModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> completedSecond = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              FocusTimeModelCompanion(
            id: id,
            completedSecond: completedSecond,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int completedSecond,
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              FocusTimeModelCompanion.insert(
            id: id,
            completedSecond: completedSecond,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FocusTimeModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FocusTimeModelTable,
    FocusTimeModelData,
    $$FocusTimeModelTableFilterComposer,
    $$FocusTimeModelTableOrderingComposer,
    $$FocusTimeModelTableAnnotationComposer,
    $$FocusTimeModelTableCreateCompanionBuilder,
    $$FocusTimeModelTableUpdateCompanionBuilder,
    (
      FocusTimeModelData,
      BaseReferences<_$AppDatabase, $FocusTimeModelTable, FocusTimeModelData>
    ),
    FocusTimeModelData,
    PrefetchHooks Function()>;
typedef $$ScheduleTaskModelTableCreateCompanionBuilder
    = ScheduleTaskModelCompanion Function({
  Value<int> id,
  required String subject,
  required String notes,
  required DateTime fromTime,
  required DateTime toTime,
  required bool isCompleted,
  required bool isFailed,
});
typedef $$ScheduleTaskModelTableUpdateCompanionBuilder
    = ScheduleTaskModelCompanion Function({
  Value<int> id,
  Value<String> subject,
  Value<String> notes,
  Value<DateTime> fromTime,
  Value<DateTime> toTime,
  Value<bool> isCompleted,
  Value<bool> isFailed,
});

class $$ScheduleTaskModelTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleTaskModelTable> {
  $$ScheduleTaskModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get fromTime => $composableBuilder(
      column: $table.fromTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get toTime => $composableBuilder(
      column: $table.toTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFailed => $composableBuilder(
      column: $table.isFailed, builder: (column) => ColumnFilters(column));
}

class $$ScheduleTaskModelTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleTaskModelTable> {
  $$ScheduleTaskModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get fromTime => $composableBuilder(
      column: $table.fromTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get toTime => $composableBuilder(
      column: $table.toTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFailed => $composableBuilder(
      column: $table.isFailed, builder: (column) => ColumnOrderings(column));
}

class $$ScheduleTaskModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleTaskModelTable> {
  $$ScheduleTaskModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get fromTime =>
      $composableBuilder(column: $table.fromTime, builder: (column) => column);

  GeneratedColumn<DateTime> get toTime =>
      $composableBuilder(column: $table.toTime, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<bool> get isFailed =>
      $composableBuilder(column: $table.isFailed, builder: (column) => column);
}

class $$ScheduleTaskModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ScheduleTaskModelTable,
    ScheduleTaskModelData,
    $$ScheduleTaskModelTableFilterComposer,
    $$ScheduleTaskModelTableOrderingComposer,
    $$ScheduleTaskModelTableAnnotationComposer,
    $$ScheduleTaskModelTableCreateCompanionBuilder,
    $$ScheduleTaskModelTableUpdateCompanionBuilder,
    (
      ScheduleTaskModelData,
      BaseReferences<_$AppDatabase, $ScheduleTaskModelTable,
          ScheduleTaskModelData>
    ),
    ScheduleTaskModelData,
    PrefetchHooks Function()> {
  $$ScheduleTaskModelTableTableManager(
      _$AppDatabase db, $ScheduleTaskModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleTaskModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleTaskModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleTaskModelTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<DateTime> fromTime = const Value.absent(),
            Value<DateTime> toTime = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<bool> isFailed = const Value.absent(),
          }) =>
              ScheduleTaskModelCompanion(
            id: id,
            subject: subject,
            notes: notes,
            fromTime: fromTime,
            toTime: toTime,
            isCompleted: isCompleted,
            isFailed: isFailed,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String subject,
            required String notes,
            required DateTime fromTime,
            required DateTime toTime,
            required bool isCompleted,
            required bool isFailed,
          }) =>
              ScheduleTaskModelCompanion.insert(
            id: id,
            subject: subject,
            notes: notes,
            fromTime: fromTime,
            toTime: toTime,
            isCompleted: isCompleted,
            isFailed: isFailed,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ScheduleTaskModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ScheduleTaskModelTable,
    ScheduleTaskModelData,
    $$ScheduleTaskModelTableFilterComposer,
    $$ScheduleTaskModelTableOrderingComposer,
    $$ScheduleTaskModelTableAnnotationComposer,
    $$ScheduleTaskModelTableCreateCompanionBuilder,
    $$ScheduleTaskModelTableUpdateCompanionBuilder,
    (
      ScheduleTaskModelData,
      BaseReferences<_$AppDatabase, $ScheduleTaskModelTable,
          ScheduleTaskModelData>
    ),
    ScheduleTaskModelData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FocusTimeModelTableTableManager get focusTimeModel =>
      $$FocusTimeModelTableTableManager(_db, _db.focusTimeModel);
  $$ScheduleTaskModelTableTableManager get scheduleTaskModel =>
      $$ScheduleTaskModelTableTableManager(_db, _db.scheduleTaskModel);
}
