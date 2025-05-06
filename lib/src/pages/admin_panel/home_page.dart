import 'package:app_fluxo_livre/src/pages/admin_panel/widgets/admin_card.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Admin',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.white,
                child: Text(
                  "N",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )),
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
              ),
              AdminCard(
                title: 'Relatório',
                icon: Icons.add_chart,
              ),
              AdminCard(
                title: 'Configurações',
                icon: Icons.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
