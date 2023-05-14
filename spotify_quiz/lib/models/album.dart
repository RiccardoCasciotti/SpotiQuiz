import 'models.dart';

class Album {
  late String id;
  late String name;
  late List<Image>? images;
  late List<Artist> artists;
  late DateTime date;
  late String precision;
  

  Album(String id, String name, List<Image>? images, List<Artist> artists, DateTime date, String precision){
     this.id = id;
     this.images = images;
     this.name = name;
     this.artists = artists;
     this.date = date;
     this.precision = precision;
  }

  dynamic toJson() => {'id': id, 'name': name, 'images': images, 'artists': artists, 'date': date, "precision": precision};

  @override
  String toString() {
    return toJson().toString();
  }
}