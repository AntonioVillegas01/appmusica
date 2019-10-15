import 'package:flutter/material.dart';
import 'package:appmusic/src/search/search_delegate.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Musica APP'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.amber[600],
              width: 200.0,
              height: 200.0,
              child:Column(
                children: <Widget>[
                  Image.network(
                    'https://thumbs.gfycat.com/AngelicShoddyChafer-size_restricted.gif',
                  ),
                  Text('Haz click en el boton icono de busqueda del APPBAR para iniciar',style: TextStyle(color: Colors.white),)
                ],
              )
          ),
        )
      )
    );
  }
}
