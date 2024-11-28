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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FocusTimeModelTable focusTimeModel = $FocusTimeModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [focusTimeModel];
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FocusTimeModelTableTableManager get focusTimeModel =>
      $$FocusTimeModelTableTableManager(_db, _db.focusTimeModel);
}
