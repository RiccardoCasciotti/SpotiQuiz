import 'models.dart';
class Track {
  late String id;
  late String name;
  late List<Image> images;
  late List<Artist> artists;
  late String preview_url;

  Track(String id, String name, List<Image> images, List<Artist> artists, String preview_url){
     this.id = id;
     this.images = images;
     this.name = name;
     this.artists = artists;
     this.preview_url = preview_url;
     
  }

  dynamic toJson() => {'id': id, 'name': name, 'images': images, 'artists': artists, 'preview_url': preview_url};

  @override
  String toString() {
    return toJson().toString();
  }
}
