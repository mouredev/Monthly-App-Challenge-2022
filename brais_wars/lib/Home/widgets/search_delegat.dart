import 'package:brais_wars/Home/services/home_services.dart';
import 'package:flutter/material.dart';
import '../../shared/models/characters.models.dart' as starWarsCharacters;

class SearchPeople extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar personaje';

  var _homeServices = new HomeServices();
  late starWarsCharacters.Characters character;
  late List<starWarsCharacters.Result> characters = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: const Center(
        child: const Icon(
          Icons.people,
          size: 100,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: const Center(
          child: const Icon(
            Icons.people,
            size: 100,
          ),
        ),
      );
    }
    return FutureBuilder(
      future: _homeServices.getFiltrePeople(query),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: const Center(
              child: Icon(
                Icons.people,
                size: 100,
              ),
            ),
          );
        }

        character = snapshot.data;
        characters = character.results;

        return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text(characters[index].name!),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'details', arguments: {
                        'id': index,
                        'people': characters[index]
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xbbFB0202),
                    )),
              );
            });
      },
    );
  }
}
