import 'package:brais_wars/Details/Pages/details_page.dart';
import 'package:brais_wars/Home/services/home_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../shared/models/characters.models.dart' as starWarsCharacters;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final homeServices = HomeServices();
// late starWarsCharacters.Characters? charcters;
late starWarsCharacters.Characters character;
late starWarsCharacters.Characters nextCharacter;
var imageUrl;
int page = 1;
late List<starWarsCharacters.Result> characters = [];
late List<starWarsCharacters.Result> nextCharacters = [];

@override
class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = new ScrollController();
  var nextUrl;
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        setState(() {
          if (page <= 9) {
            page++;
            print('ter23  ${page}');
          }

          mockNewData(page);
          print('ter  ${page}');
        });
      }
    });
    super.initState();
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final testCharacters = [
    {
      "name": "Luke Skywalker",
      "height": "172",
      "mass": "77",
      "hair_color": "blond",
      "skin_color": "fair",
      "eye_color": "blue",
      "birth_year": "19BBY",
      "gender": "male",
      "homeworld": "https://swapi.dev/api/planets/1/",
      "films": [
        "https://swapi.dev/api/films/1/",
        "https://swapi.dev/api/films/2/",
        "https://swapi.dev/api/films/3/",
        "https://swapi.dev/api/films/6/"
      ],
      "species": [],
      "vehicles": [
        "https://swapi.dev/api/vehicles/14/",
        "https://swapi.dev/api/vehicles/30/"
      ],
      "starships": [
        "https://swapi.dev/api/starships/12/",
        "https://swapi.dev/api/starships/22/"
      ],
      "created": "2014-12-09T13:50:51.644000Z",
      "edited": "2014-12-20T21:17:56.891000Z",
      "url": "https://swapi.dev/api/people/1/"
    },
    {
      "name": "C-3PO",
      "height": "167",
      "mass": "75",
      "hair_color": "n/a",
      "skin_color": "gold",
      "eye_color": "yellow",
      "birth_year": "112BBY",
      "gender": "n/a",
      "homeworld": "https://swapi.dev/api/planets/1/",
      "films": [
        "https://swapi.dev/api/films/1/",
        "https://swapi.dev/api/films/2/",
        "https://swapi.dev/api/films/3/",
        "https://swapi.dev/api/films/4/",
        "https://swapi.dev/api/films/5/",
        "https://swapi.dev/api/films/6/"
      ],
      "species": ["https://swapi.dev/api/species/2/"],
      "vehicles": [],
      "starships": [],
      "created": "2014-12-10T15:10:51.357000Z",
      "edited": "2014-12-20T21:17:50.309000Z",
      "url": "https://swapi.dev/api/people/2/"
    },
    {
      "name": "R2-D2",
      "height": "96",
      "mass": "32",
      "hair_color": "n/a",
      "skin_color": "white, blue",
      "eye_color": "red",
      "birth_year": "33BBY",
      "gender": "n/a",
      "homeworld": "https://swapi.dev/api/planets/8/",
      "films": [
        "https://swapi.dev/api/films/1/",
        "https://swapi.dev/api/films/2/",
        "https://swapi.dev/api/films/3/",
        "https://swapi.dev/api/films/4/",
        "https://swapi.dev/api/films/5/",
        "https://swapi.dev/api/films/6/"
      ],
      "species": ["https://swapi.dev/api/species/2/"],
      "vehicles": [],
      "starships": [],
      "created": "2014-12-10T15:11:50.376000Z",
      "edited": "2014-12-20T21:17:50.311000Z",
      "url": "https://swapi.dev/api/people/3/"
    },
    {
      "name": "Darth Vader",
      "height": "202",
      "mass": "136",
      "hair_color": "none",
      "skin_color": "white",
      "eye_color": "yellow",
      "birth_year": "41.9BBY",
      "gender": "male",
      "homeworld": "https://swapi.dev/api/planets/1/",
      "films": [
        "https://swapi.dev/api/films/1/",
        "https://swapi.dev/api/films/2/",
        "https://swapi.dev/api/films/3/",
        "https://swapi.dev/api/films/6/"
      ],
      "species": [],
      "vehicles": [],
      "starships": ["https://swapi.dev/api/starships/13/"],
      "created": "2014-12-10T15:18:20.704000Z",
      "edited": "2014-12-20T21:17:50.313000Z",
      "url": "https://swapi.dev/api/people/4/"
    },
    {
      "name": "Leia Organa",
      "height": "150",
      "mass": "49",
      "hair_color": "brown",
      "skin_color": "light",
      "eye_color": "brown",
      "birth_year": "19BBY",
      "gender": "female",
      "homeworld": "https://swapi.dev/api/planets/2/",
      "films": [
        "https://swapi.dev/api/films/1/",
        "https://swapi.dev/api/films/2/",
        "https://swapi.dev/api/films/3/",
        "https://swapi.dev/api/films/6/"
      ],
      "species": [],
      "vehicles": ["https://swapi.dev/api/vehicles/30/"],
      "starships": [],
      "created": "2014-12-10T15:20:09.791000Z",
      "edited": "2014-12-20T21:17:50.315000Z",
      "url": "https://swapi.dev/api/people/5/"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xbb1F1D29),
          appBar: AppBar(
            title: const Text('Brais-Wars'),
            // actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
            elevation: 0,
            backgroundColor: const Color(0xbb1F1D29),
          ),
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<starWarsCharacters.Characters>(
                future: homeServices.getCharacters(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData || snapshot.data == Null) {
                    return Center(
                        child: Image.asset(
                      "assets/loading.gif",
                      height: 150.0,
                      width: 150.0,
                    ));
                  }

                  character = snapshot.data;
                  characters = character.results;
                  nextUrl = character.next;
                  if (characters.isEmpty) {
                    return const Center(
                        child: Text(
                      'No items',
                      style: TextStyle(color: Colors.white),
                    ));
                  }
                  if (nextCharacters.length > characters.length) {
                    return listOfCharacters(
                        context, nextCharacters, _scrollController);
                  } else {
                    return listOfCharacters(
                        context, characters, _scrollController);
                  }
                },
              )),
        ),
      ),
    );
  }
}

Widget listOfCharacters(
    BuildContext context,
    List<starWarsCharacters.Result>? result,
    ScrollController _scrollController) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(36)),
          child: const TextField(),
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: Container(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              itemCount: result?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 100.0,
                        width: 70.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            image: NetworkImage(
                              'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                            ),
                            placeholder: const AssetImage(
                              'assets/logo.png',
                            ),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/logo.png');
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          result![index].name!,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'details',
                                  arguments: {
                                    'id': index,
                                    'people': result[index]
                                  });
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xbbFB0202),
                            ))
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

mockNewData(int page) async {
  // print('primara ${nextUrl}');
  var next = await homeServices
      .getNextCharacter('https://swapi.dev/api/people/?page=$page');
  // nextCharacter = next;
  character.next = next.next;
  // print('segunda ${nextUrl}');
  characters.addAll(next.results);
  nextCharacters = characters;
}
