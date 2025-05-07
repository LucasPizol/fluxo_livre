import 'package:app_fluxo_livre/src/models/user.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/users/widgets/admin_app_bar.dart';
import 'package:app_fluxo_livre/src/providers/admin/user_provider.dart';
import 'package:flutter/material.dart';

class UserEdit extends StatelessWidget {
  final User user;

  const UserEdit({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);

    return Scaffold(
      appBar: customAppBar('Editar Usuário'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    UserProvider().updateUser(
                        user,
                        User(
                            name: nameController.text,
                            email: emailController.text,
                            password: user.password));

                    Navigator.of(context).pop();
                  }
                },
                child: Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
