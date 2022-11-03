import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:projectsqlite/data/local/entity/employeeEntity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'myDatabase.g.dart';

LazyDatabase openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(path.join(dbFolder.path, 'employee.sqlite'));

      return NativeDatabase(file);
    },
  );
}

@DriftDatabase(tables: [Employee])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

// retorna toda a lista de funcionarios
  Future<List<EmployeeData>> getEmployees() async {
    return await select(employee).get();
  }

// retorna apenas o funcionario do id específico
  Future<EmployeeData> getEmployee(int id) async {
    return await (select(employee)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateEmployee(EmployeeCompanion entity) async {
    return await update(employee).replace(entity);
  }

  Future<int> insertEmployee(EmployeeCompanion entity) async {
    return await into(employee).insert(entity);
  }

  Future<int> deleteEmployee(int id) async {
    return await (delete(employee)..where((tbl) => tbl.id.equals(id))).go();
  }
}
