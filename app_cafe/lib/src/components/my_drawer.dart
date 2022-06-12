import 'package:app_cafe/src/conection/server_controller.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({this.serverController, key}) : super(key: key);

  final ServerController serverController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://st.depositphotos.com/2632165/3063/i/450/depositphotos_30638835-stock-photo-coffee.jpg"),
                  fit: BoxFit.cover),
            ),
            accountName: Text(
              serverController.loggedUser.nickname,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: FileImage(serverController.loggedUser.photo),
            ),
            onDetailsPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed("/register",
                  arguments: serverController.loggedUser);
            },
          ),
          ListTile(
            title: Text(
              "Mis Recetas",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.book,
              color: Colors.orange,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed("/my_recipes");
            },
          ),
          ListTile(
            title: Text(
              "Mis Favoritos",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed("/favorites");
            },
          ),
          ListTile(
            title: const Text(
              "Cerrar Sesion",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.power_settings_new,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text("© by. ivanleonc",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
