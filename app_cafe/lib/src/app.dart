import 'package:app_cafe/src/conection/server_controller.dart';
import 'package:app_cafe/src/screens/add_recipe_page.dart';
import 'package:app_cafe/src/screens/details_page.dart';
import 'package:app_cafe/src/screens/home_page.dart';
import 'package:app_cafe/src/screens/login_page.dart';
import 'package:app_cafe/src/screens/my_favorities_page.dart';
import 'package:app_cafe/src/screens/mys_recipes_page.dart';
import 'package:app_cafe/src/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/data_init.dart';
import 'package:flutter_modulo1_fake_backend/user.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';
import 'package:flutter/services.dart';

import 'conection/server_controller.dart';

ServerController _serverController = ServerController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog de Cafe',
      initialRoute: '/',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.brown,
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(
          color: Colors.white,
        ),
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
                titleLarge: TextStyle(color: Colors.black, fontSize: 25)),
            iconTheme: IconThemeData(color: Colors.white)),
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          switch (settings.name) {
            case '/':
              return LoginPage(_serverController, context);
            case '/home':
              User loggedUser = settings.arguments;
              _serverController.loggedUser = loggedUser;
              return HomePage(_serverController);
            case '/register':
              User loggedUser = settings.arguments;
              return RegisterPage(
                _serverController,
                context,
                userToEdit: loggedUser,
              );
            case '/favorites':
              return MyFavoritesPage(
                _serverController,
              );
            case '/my_recipes':
              return MyRecipesPage(
                _serverController,
              );
            case "/add_recipe":
              return AddRecipePage(
                _serverController,
              );
            case "/edit_recipe":
              Recipe recipe = settings.arguments;
              return AddRecipePage(
                _serverController,
                recipe: recipe,
              );
            case '/details':
              Recipe recipe = settings.arguments;
              return DetailsPage(
                recipe: recipe,
                serverController: _serverController,
              );
            default:
              return LoginPage(
                _serverController,
                context,
              );
          }
        });
      },
    );
  }
}
