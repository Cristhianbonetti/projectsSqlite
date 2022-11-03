// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myDatabase.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class EmployeeData extends DataClass implements Insertable<EmployeeData> {
  final int id;
  final String name;
  final int cpf;
  final DateTime dateOfBirth;
  final String email;
  const EmployeeData(
      {required this.id,
      required this.name,
      required this.cpf,
      required this.dateOfBirth,
      required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['cpf'] = Variable<int>(cpf);
    map['dateOfBirth'] = Variable<DateTime>(dateOfBirth);
    map['email'] = Variable<String>(email);
    return map;
  }

  EmployeeCompanion toCompanion(bool nullToAbsent) {
    return EmployeeCompanion(
      id: Value(id),
      name: Value(name),
      cpf: Value(cpf),
      dateOfBirth: Value(dateOfBirth),
      email: Value(email),
    );
  }

  factory EmployeeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      cpf: serializer.fromJson<int>(json['cpf']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'cpf': serializer.toJson<int>(cpf),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'email': serializer.toJson<String>(email),
    };
  }

  EmployeeData copyWith(
          {int? id,
          String? name,
          int? cpf,
          DateTime? dateOfBirth,
          String? email}) =>
      EmployeeData(
        id: id ?? this.id,
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('EmployeeData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cpf: $cpf, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, cpf, dateOfBirth, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeData &&
          other.id == this.id &&
          other.name == this.name &&
          other.cpf == this.cpf &&
          other.dateOfBirth == this.dateOfBirth &&
          other.email == this.email);
}

class EmployeeCompanion extends UpdateCompanion<EmployeeData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> cpf;
  final Value<DateTime> dateOfBirth;
  final Value<String> email;
  const EmployeeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.cpf = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.email = const Value.absent(),
  });
  EmployeeCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int cpf,
    required DateTime dateOfBirth,
    required String email,
  })  : name = Value(name),
        cpf = Value(cpf),
        dateOfBirth = Value(dateOfBirth),
        email = Value(email);
  static Insertable<EmployeeData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? cpf,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (cpf != null) 'cpf': cpf,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
      if (email != null) 'email': email,
    });
  }

  EmployeeCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? cpf,
      Value<DateTime>? dateOfBirth,
      Value<String>? email}) {
    return EmployeeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (cpf.present) {
      map['cpf'] = Variable<int>(cpf.value);
    }
    if (dateOfBirth.present) {
      map['dateOfBirth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cpf: $cpf, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $EmployeeTable extends Employee
    with TableInfo<$EmployeeTable, EmployeeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _cpfMeta = const VerificationMeta('cpf');
  @override
  late final GeneratedColumn<int> cpf = GeneratedColumn<int>(
      'cpf', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'dateOfBirth', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, cpf, dateOfBirth, email];
  @override
  String get aliasedName => _alias ?? 'employee';
  @override
  String get actualTableName => 'employee';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cpf')) {
      context.handle(
          _cpfMeta, cpf.isAcceptableOrUnknown(data['cpf']!, _cpfMeta));
    } else if (isInserting) {
      context.missing(_cpfMeta);
    }
    if (data.containsKey('dateOfBirth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['dateOfBirth']!, _dateOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      cpf: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}cpf'])!,
      dateOfBirth: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dateOfBirth'])!,
      email: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $EmployeeTable createAlias(String alias) {
    return $EmployeeTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $EmployeeTable employee = $EmployeeTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [employee];
}
