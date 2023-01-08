import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValue = {
      'nombre': 'Diego',
      'correo': 'Diego@google.com',
      'password': '123456',
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs - Forms'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const CustomFieldInput(
                icon: Icons.assignment_ind_outlined,
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomFieldInput(
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomFieldInput(
                labelText: 'Contraseña',
                icon: Icons.password_outlined,
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    print(formValue);
                  },
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Guardar'))))
            ],
          ),
        ),
      )),
    );
  }
}
