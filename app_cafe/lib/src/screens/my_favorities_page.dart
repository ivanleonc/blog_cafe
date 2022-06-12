import 'package:app_cafe/src/conection/server_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';

import '../components/my_drawer.dart';

class MyFavoritesPage extends StatefulWidget {
  final ServerController serverController;

  MyFavoritesPage(this.serverController, {Key key}) : super(key: key);

  @override
  State<MyFavoritesPage> createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis favoritos"),
        backgroundColor: Colors.brown,
      ),
      body: FutureBuilder<List<Recipe>>(
        future: widget.serverController.getFavoritesList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Recipe> list = snapshot.data;

            if (list.length == 0) {
              return SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.info,
                          size: 120,
                          color: Colors.grey[300],
                        ),
                        Text(
                          "Su listado de favoritos esta vacio, para poder agregar a favoritos, simplemente seleccione el icono de favorito (corazon) en la receta que desea agregar.",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ));
            }

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                Recipe recipe = list[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Card(
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: FileImage(recipe.photo),
                          fit: BoxFit.cover,
                        )),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          color: Colors.black.withOpacity(0.35),
                          child: ListTile(
                            title: Text(
                              recipe.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              recipe.user.nickname,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {},
                              iconSize: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
