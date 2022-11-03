import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectsqlite/data/local/db/myDatabase.dart';
import 'package:projectsqlite/data/local/entity/employeeEntity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MyDatabase _db;

  @override
  void initState() {
    super.initState();
    _db = MyDatabase();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<EmployeeData>>(
        future: _db.getEmployees(),
        builder: (context, snapshot) {
          final List<EmployeeData>? employees = snapshot.data;

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (employees != null) {
            return ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return Card(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Id: ${employee.id.toString()}'),
                        Text('Nome: ${employee.name.toString()}'),
                        Text('CPF: ${employee.cpf.toString()}'),
                        Text(
                            'Data de Nasci: ${employee.dateOfBirth.toString()}'),
                        Text('E-mail: ${employee.email.toString()}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Text('Nenhum dado encontrado');
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/addEmployee');
        },
        icon: const Icon(Icons.add),
        label: const Text('Adicionar Funcionário'),
      ),
    );
  }
}
