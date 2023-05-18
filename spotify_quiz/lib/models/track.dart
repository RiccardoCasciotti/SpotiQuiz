import 'models.dart';
class Track {
  late String id;
  late String name;
  late List<Image> images;
  late List<Artist> artists;
  // ignore: non_constant_identifier_names
  late String preview_url;

  // ignore: non_constant_identifier_names
  Track(this.id, this.name, this.images, this.artists, this.preview_url);

  dynamic toJson() => {'id': id, 'name': name, 'images': images, 'artists': artists, 'preview_url': preview_url};

  @override
  String toString() {
    return toJson().toString();
  }
}
