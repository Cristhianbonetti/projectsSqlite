import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../data/local/db/myDatabase.dart';
import '../widget/customTextFormField.dart';
import 'package:drift/drift.dart' as drift;

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  late MyDatabase _db;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  DateTime? dateOfBith;

  @override
  void initState() {
    super.initState();
    _db = MyDatabase();
  }

  @override
  void dispose() {
    _db.close();
    nameController.dispose();
    cpfController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adcionar Funcionário'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                addEmployee();
              },
              icon: const Icon(Icons.save),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomTextFormField(
            controller: nameController,
            label: 'Nome Completo',
            keyboardType: TextInputType.name,
          ),
          CustomTextFormField(
            controller: cpfController,
            label: 'CPF',
            keyboardType: TextInputType.number,
          ),
          // CustomTextFormField(
          //   controller: dateOfBirthController,
          //   label: 'Data de Nascimento',
          //   keyboardType: TextInputType.datetime,
          //   ontap: () => pickDateOfBirth(context),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: dateOfBirthController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Data de Nascimento'),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Data de Nascimento não pode ser vazio';
                }
              },
              onTap: () => pickDateOfBirth(context),
            ),
          ),
          CustomTextFormField(
            controller: emailController,
            label: 'E-mail',
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

  // Função para a data de nascimento

  Future<void> pickDateOfBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateOfBith ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.blue,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child ?? const Text(''),
      ),
    );
    if (newDate == null) {
      return;
    }
    setState(() {
      dateOfBith = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      dateOfBirthController.text = dob;
    });
  }

  void addEmployee() {
    final entity = EmployeeCompanion(
      name: drift.Value(nameController.text),
      cpf: drift.Value(cpfController.text),
      dateOfBirth: drift.Value(dateOfBith!),
      email: drift.Value(emailController.text),
    );

    _db.insertEmployee(entity).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.grey[300],
              content: Text('Novo funcionario adicionado: $value'),
              actions: [
                TextButton(
                  onPressed: () =>
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                  child: const Text('Fechar'),
                ),
              ],
            ),
          ),
        );
  }
}
