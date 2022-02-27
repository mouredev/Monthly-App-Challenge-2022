import 'package:brais_wars/Home/pages/home_page.dart';
import 'package:brais_wars/config/config.dart';
import 'package:brais_wars/shared/models/character.models.dart';
import 'package:brais_wars/shared/models/characters.models.dart';
import 'package:brais_wars/shared/models/films.models.dart';
import 'package:brais_wars/shared/models/films.models.dart';
import 'package:brais_wars/shared/models/vehicles.models.dart';
import 'package:http/http.dart' as http;

import '../../shared/models/films.models.dart';

class HomeServices {
  List<String> filmsUrl = [];
  List<String> vehiclesUrl = [];
  List<Films> filmsRes = [];
  List<Vehicles> vehiclesRes = [];
  late Characters characters =
      Characters(count: 0, next: 'next', previous: 'previous', results: []);
  List<Result> results = [];
  int pageNumber = 0;

  Future<Characters> getCharacters() async {
    //https://swapi.dev/api/people'
    //https://swapi.py4e.com/api/people
    //"https://swapi.dev/api/people/?page=2"
    final res = await http.get(Uri.parse('https://swapi.dev/api/people'));
    var bodyResults = charactersFromJson(res.body);
    characters = bodyResults;
    results = bodyResults.results;
    return bodyResults;
  }

  getNextCharacter() async {
    pageNumber++;
    if (pageNumber >= 10) {
      return characters;
    }
    try {
      final resp = await http
          .get(Uri.parse('https://swapi.dev/api/people/?page=${pageNumber}'));
      final charactersRes = charactersFromJson(resp.body);
      //return decode(utf8.decode(response.bodyBytes));

      characters.results = [...characters.results, ...charactersRes.results];

      return characters;
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

  Future<Characters> getFiltrePeople(String query) async {
    var apiUrl = 'https://swapi.dev/api/people/?search=${query}';
    try {
      final resp = await http.get(Uri.parse(apiUrl));
      final charactersRes = charactersFromJson(resp.body);

      return charactersRes;
    } catch (e) {
      print('Error servicio:${e}');
      return Characters(
          count: 0, next: 'next', previous: 'previous', results: []);
    }
  }
}
