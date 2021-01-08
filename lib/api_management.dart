import 'music_suggestions.dart';
import 'package:http/http.dart' as http;

class MusicApi {
  static const String url =
      "http://musicovery.com/api/V6/playlist.php?&fct=getfrommood&popularitymax=100&popularitymin=50&starttrackid=&date70=true&trackvalence=900000&trackarousal=100000&resultsnumber=15&listenercountry=es";

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
