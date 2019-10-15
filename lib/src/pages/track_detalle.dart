import 'package:flutter/material.dart';
import 'package:appmusic/src/models/track_model.dart';


class TrackDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Track track = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(track),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 1.0,
              ),
              _posterTitulo(context, track),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _crearAppbar(Track track) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          track.name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(track.image),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 100),
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  Widget _posterTitulo(BuildContext context, Track track) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            child:
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: NetworkImage(track.image),
                  height: 200.0,
                )),
            tag: track.album,
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(track.name,
                      style: Theme.of(context).textTheme.title,
                      overflow: TextOverflow.ellipsis),
                  Text(track.artist,
                      style: Theme.of(context).textTheme.subhead,
                      overflow: TextOverflow.ellipsis),
                  Text(track.album,
                      style: Theme.of(context).textTheme.subhead,
                      overflow: TextOverflow.ellipsis),
                ],
              ))
        ],
      ),
    );
  }
}
