import 'models.dart';

class Album {
  late String id;
  late String name;
  late List<Image>? images;
  late List<Artist> artists;
  late DateTime date;
  late String precision;
  

  Album(this.id, this.name, this.images, this.artists, this.date, this.precision);

  dynamic toJson() => {'id': id, 'name': name, 'images': images, 'artists': artists, 'date': date, "precision": precision};

  @override
  String toString() {
    return toJson().toString();
  }
}