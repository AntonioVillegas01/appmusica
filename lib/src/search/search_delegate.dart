import 'package:flutter/material.dart';
import 'package:appmusic/src/models/track_model.dart';
import 'package:appmusic/src/providers/tracks_provider.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';
  final tracksProvider = new TracksProvider();


  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del app Bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: (AnimatedIcons.menu_arrow),
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder que crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if(query.isEmpty) return Container();

    return FutureBuilder(
      future: tracksProvider.buscarTrack( query ),
      builder: (BuildContext context, AsyncSnapshot<List<Track>> snapshot) {
        if(snapshot.hasData){
          final tracks = snapshot.data;

          return ListView(
              children: tracks.map( (track) {
                return ListTile(
                  leading: FadeInImage(
                    image: track.thumbnail != null ? NetworkImage(track.thumbnail) : AssetImage('assets/img/no-image.jpg'),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  title: Text(track.name),
                  isThreeLine: true,
                  subtitle: Text(track.artist + '\n' + track.album),
                  onTap: (){
                    close(context, null);
                    track.uniqueId='';
                    Navigator.pushNamed(context, 'detalle', arguments: track);
                  },
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              }).toList()
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }

      },
    );

  }
}
