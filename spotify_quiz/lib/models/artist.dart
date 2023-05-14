import 'models.dart';

class Artist {
  late String id;
  late String name;
  late List<Image>? images;
  late List<String>? genres;
  //late List<Track>? tracks; //only the top tracks

   
  

  Artist(String id, String name, List<Image> ?images, List<String>? genres ){//,  //List<Track> ?tracks){
     this.id = id;
     this.images = images;
     this.genres = genres;
     this.name = name;
     //this.tracks = tracks;
  }

  dynamic toJson() => {'id': id, 'name': name, 'images': images, 'genres': genres};

  @override
  String toString() {
    return toJson().toString();
  }
  
}
