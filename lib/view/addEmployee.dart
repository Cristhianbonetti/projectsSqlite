import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          CustomTextFormField(
            controller: dateOfBirthController,
            label: 'Data de Nascimento',
            keyboardType: TextInputType.datetime,
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
}
