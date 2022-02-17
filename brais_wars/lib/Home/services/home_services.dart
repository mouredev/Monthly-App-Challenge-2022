import 'package:brais_wars/config/config.dart';
import 'package:brais_wars/shared/models/character.models.dart';
import 'package:brais_wars/shared/models/characters.models.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  // var characters;
  // List<Character> hola = [];

  late Characters characters;

  Future<Characters> getCharacters() async {
    final res = await http.get(Uri.parse('https://swapi.dev/api/people'));
    var results = charactersFromJson(res.body);
    characters = results;

    return results;
  }

  Future<Characters> getNextCharacter(String nextUrl) async {
    late Characters empty;
    try {
      final resp = await http.get(Uri.parse(nextUrl));
      final charactersRes = charactersFromJson(resp.body);

      return charactersRes;
    } catch (e) {
      return Characters(
          count: 0, next: 'next', previous: 'previous', results: []);
    }
  }
}
