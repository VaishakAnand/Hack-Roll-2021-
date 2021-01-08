import 'music_suggestions.dart';
import 'package:http/http.dart' as http;

class MusicApi {
  static int valence = 200000;
  static int arousal = 400000;
  static String valenceString = valence.toString();
  static String arousalString = arousal.toString();
  static String url =
      "http://musicovery.com/api/V6/playlist.php?&fct=getfrommood&popularitymax=100&popularitymin=10&starttrackid=&trackvalence=$valenceString&trackarousal=$arousalString&resultsnumber=3&listenercountry=us";

  static Future<MusicSuggestions> getSuggestions() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final MusicSuggestions suggestions =
            musicSuggestionsFromJson(response.body);
        return suggestions;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
