import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appmusic/src/models/track_model.dart';


class TracksProvider {
  String _url = 'itunes.apple.com';


  bool _cargando = false;



  void disposeStreams(){
  }


  Future<List<Track>> _procesarRespuesta( Uri url) async {

    final resp = await http.get(url);
    final decodedData = jsonDecode(resp.body);

    final tracks = new Tracks.fromJsonList(decodedData['results']);

    return tracks.items;
  }

  Future<List<Track>> buscarTrack( String query) async {
    _cargando = true;
    /*final url = Uri.https(_url, '/search', {
      'query': query
    });*/
    _cargando = false;
    return await _procesarRespuesta(Uri.parse('https://itunes.apple.com/search?term=$query'));
  }
}
