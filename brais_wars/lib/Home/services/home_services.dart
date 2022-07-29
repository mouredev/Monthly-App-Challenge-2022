import 'package:brais_wars/config/config.dart';
import 'package:brais_wars/shared/models/character.models.dart';
import 'package:brais_wars/shared/models/characters.models.dart';
import 'package:brais_wars/shared/models/films.models.dart';
import 'package:brais_wars/shared/models/films.models.dart';
import 'package:brais_wars/shared/models/vehicles.models.dart';
import 'package:http/http.dart' as http;

import '../../shared/models/films.models.dart';

class HomeServices {
  // var characters;
  // List<Character> hola = [];
  List<String> filmsUrl = [];
  List<String> vehiclesUrl = [];
  List<Films> filmsRes = [];
  List<Vehicles> vehiclesRes = [];
  late Characters characters;

  Future<Characters> getCharacters() async {
    //https://swapi.dev/api/people'
    //https://swapi.py4e.com/api/people
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

  Future<List<Films>> getFilms(filmsUrl) async {
    try {
      for (var i = 0; i < filmsUrl.length; i++) {
        final resp = await http.get(Uri.parse(filmsUrl[i]));
        var multiRes = filmsFromJson(resp.body);
        filmsRes.add(multiRes);
      }
      return filmsRes;
    } catch (e) {
      return [];
    }
  }

  Future<List<Vehicles>> getVehicles(vehiclesUrl) async {
    try {
      for (var i = 0; i < vehiclesUrl.length; i++) {
        final resp = await http.get(Uri.parse(vehiclesUrl[i]));
        var multiRes = vehiclesFromJson(resp.body);
        vehiclesRes.add(multiRes);
      }
      return vehiclesRes;
    } catch (e) {
      return [];
    }
  }
}
