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
var imageUrl;
late List<starWarsCharacters.Result> characters = [];

@override
// void initState() {
//   scrollController.addListener(() {
//     if (scrollController.position.pixels == 200) {
//       print('hola');
//     }
//   });

//   // super.initState();
// }

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = new ScrollController();
  var nextUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xbb1F1D29),
        appBar: AppBar(
          title: Text('Brais-Wars'),
          // actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
          elevation: 0,
          backgroundColor: Color(0xbb1F1D29),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<starWarsCharacters.Characters>(
              future: homeServices.getCharacters(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  Center(
                      child: Image.asset(
                    "assets/loading.gif",
                    height: 150.0,
                    width: 150.0,
                  ));
                }

                character = snapshot.data;
                characters = character.results;

                if (characters.length == 0) {
                  return const Center(
                      child: Text(
                    'No items',
                    style: TextStyle(color: Colors.white),
                  ));
                }

                return listOfCharacters(context, characters);
              },
            )),
      ),
    );
  }
}

Widget listOfCharacters(
  BuildContext context,
  List<starWarsCharacters.Result>? result,
) {
  final ScrollController _scrollController = ScrollController();

  var wawa;
  // _scrollController.addListener(() {
  //   if (_scrollController.position.maxScrollExtent ==
  //       _scrollController.position.pixels) {
  //     // print(' papa');
  //     // wawa = homeServices.getNextCharacter(charcters!.next);
  //     // print(wawa);
  //     homeServices
  //         .getCharacters(charcters!.next)
  //         ?.then((value) => [...?result, ...value.results]);
  //   }
  // });

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(36)),
          child: TextField(),
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
                          child: Image.network(
                            'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                            fit: BoxFit.cover,
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
                          style: TextStyle(
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
                              // MaterialPageRoute(
                              //     builder: (context) => const DetailsPage());
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
