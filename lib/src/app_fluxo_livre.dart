import 'package:app_fluxo_livre/src/models/user.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/home/home_page.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/user_edit/user_edit.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/user_info/user_info.dart';
import 'package:app_fluxo_livre/src/pages/admin_panel/users/users_page.dart';
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
        onGenerateRoute: (settings) {
          Widget page;

          switch (settings.name) {
            case '/':
              page = isAdmin ? AdminPage() : LoginPage();
              break;
            case '/home':
              page = HomePage();
              break;
            case '/novousuario':
              page = CadUsuarioPage();
              break;
            case '/admin':
              page = AdminPage();
              break;
            case '/usuarios':
              page = UsersPage();
              break;
            case '/usuario':
              page = UserInfo(user: settings.arguments as User);
              break;
            case '/usuario/editar':
              page = UserEdit(user: settings.arguments as User);
              break;
            default:
              page = isAdmin ? AdminPage() : LoginPage();
          }

          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.decelerate;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 150),
          );
        },
      ),
    );
  }
}
