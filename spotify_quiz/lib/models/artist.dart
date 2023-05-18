import 'models.dart';

class Artist {
  late String id;
  late String name;
  late List<Image>? images;
  late List<String>? genres;
  //late List<Track>? tracks; //only the top tracks

   
  

  Artist(this.id, this.name, this.images, this.genres );

  dynamic toJson() => {'id': id, 'name': name, 'images': images, 'genres': genres};

  @override
  String toString() {
    return toJson().toString();
  }
  
}
