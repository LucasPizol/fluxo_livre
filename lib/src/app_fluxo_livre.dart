import 'package:app_fluxo_livre/src/pages/admin_panel/home_page.dart';
import 'package:app_fluxo_livre/src/pages/cad_usuario_page.dart';
import 'package:app_fluxo_livre/src/pages/home_page.dart';
import 'package:app_fluxo_livre/src/pages/login_page.dart';
import 'package:app_fluxo_livre/src/providers/auth_provider.dart';
import 'package:app_fluxo_livre/src/providers/user_register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isAdmin = true;

class AppFluxolivre extends StatelessWidget {
  const AppFluxolivre({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserRegisterProvider()),
        ChangeNotifierProvider(
            create: (context) => AuthProvider()..loadToken()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppFluxoLivre',
        routes: {
          '/': (_) => isAdmin ? AdminPage() : LoginPage(),
          '/home': (_) => HomePage(),
          '/novousuario': (_) => CadUsuarioPage(),
          '/admin': (_) => AdminPage(),
        },
      ),
    );
  }
}
