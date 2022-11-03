import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../widget/customTextFormField.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  DateTime? dateOfBith;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adcionar Funcionário'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
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
}
