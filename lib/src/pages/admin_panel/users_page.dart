import 'package:app_fluxo_livre/src/models/user.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/users/widgets/admin_app_bar.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/users/widgets/loading_user_card.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/users/widgets/user_card.dart';
import 'package:app_fluxo_livre/src/providers/admin/user_provider.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Usuários'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Seus usuários',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<User>>(
                future: UserProvider().getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return LoadingUserCard();
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Nenhum usuário encontrado'));
                  }

                  return ListView.separated(
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final user = snapshot.data![index];

                        return UserCard(user: user);
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
