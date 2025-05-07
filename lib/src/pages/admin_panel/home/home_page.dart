import 'package:app_fluxo_livre/src/pages/admin_panel/users/widgets/admin_app_bar.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/home/widgets/admin_card.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Admin'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            children: [
              AdminCard(
                title: 'Usuários',
                icon: Icons.person,
                onTap: () => Navigator.pushNamed(context, '/usuarios'),
              ),
              AdminCard(
                title: 'Relatório',
                icon: Icons.add_chart,
                onTap: () {},
              ),
              AdminCard(
                title: 'Configurações',
                icon: Icons.settings,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
