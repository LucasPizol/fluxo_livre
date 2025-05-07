import 'package:app_fluxo_livre/src/models/user.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/users/widgets/admin_app_bar.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({super.key, required this.user});

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Excluir Usuário'),
        content: Text('Tem certeza que deseja excluir o usuário ${user.name}?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Excluir',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Usuário'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
                tag: 'user-avatar-${user.id}',
                child: CircleAvatar(
                  radius: 50,
                  child: Text(user.name[0].toUpperCase()),
                )),
            const SizedBox(height: 8),
            Hero(
                tag: 'user-name-${user.id}',
                child: Text(
                  user.name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 27, 27, 27),
                      ),
                )),
            const SizedBox(height: 8),
            Hero(
                tag: 'user-email-${user.id}',
                child: Text(
                  user.email,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                )),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/usuario/editar', arguments: user);
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      _showDeleteDialog(context);
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
