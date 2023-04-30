

import '../../models/models.dart';
import '../utility/api_calls.dart';

class ArtistRepository {

Future<List<Track>> new_tracks(String artist_id) async {
  List<Track> top_tracks = await get_top_tracks(artist_id);
  return top_tracks;
}

}