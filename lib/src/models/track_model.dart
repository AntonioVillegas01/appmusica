class Tracks {

  List<Track> items = new List();

  Tracks();

  Tracks.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final track = new Track.fromJsonMap(item);
      items.add( track );
    }

  }

}



class Track {

  String uniqueId;

  int id;
  String name;
  String artist;
  String album;
  String thumbnail;
  String image;


  Track({
    this.id,
    this.name,
    this.artist,
    this.album,
    this.thumbnail,
    this.image
  });

  Track.fromJsonMap( Map<String, dynamic> json ) {

    id                 = json['trackId'];
    name               = json['trackName'] != null ? json['trackName']: '';
    artist             = json['artistName'] != null ?  json['artistName'] : '';
    album              = json['collectionName'] != null ? json['collectionName']: '';
    thumbnail          = json['artworkUrl30'];
    image              = json['artworkUrl100'];



  }


}


