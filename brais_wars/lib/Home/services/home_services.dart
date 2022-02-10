import 'package:brais_wars/config/config.dart';
import 'package:brais_wars/shared/models/characters.models.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  Future<List<Result>> getCharacters() async {
    try {
      final resp = await http.get(Uri.parse('${Config.apiUrl}/people'));

      final charactersRes = charactersFromJson(resp.body);

      return charactersRes.results;
    } catch (e) {
      return [];
    }
  }
}
