import 'package:drift/drift.dart';

class Employee extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
  TextColumn get cpf => text().named('cpf')();
  DateTimeColumn get dateOfBirth => dateTime().named('dateOfBirth')();
  TextColumn get email => text().named('email')();
}
