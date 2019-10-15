
import 'package:appmusic/src/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:appmusic/src/pages/home_page.dart';
import 'package:appmusic/src/pages/track_detalle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes APP',
      initialRoute: '/',
      routes: {
        '/'   : (BuildContext context) => HomePage(),
        'detalle'   : (BuildContext context) => TrackDetalle(),
      },
    );
  }
}
