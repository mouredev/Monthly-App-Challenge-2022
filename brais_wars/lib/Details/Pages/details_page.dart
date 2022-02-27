import 'package:brais_wars/Home/pages/home_page.dart';
import 'package:brais_wars/shared/models/character.models.dart';
import 'package:brais_wars/shared/models/vehicles.models.dart';
import 'package:flutter/material.dart';

import '../../shared/models/characters.models.dart';
import '../../shared/models/films.models.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentsResp = ModalRoute.of(context)!.settings.arguments as Map;
    var characterId = argumentsResp['id'];
    var character = argumentsResp['people'] as Result;
    var imageName = character.name?.replaceAll(' ', '');

    var films = argumentsResp['films'];
    var vehicles = argumentsResp['vehicles'];
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black87,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          // height: 100,
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.black87),
                  width: double.infinity,
                  height: 225,
                  child: Center(
                    child: Column(children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundColor: const Color(0xbbFB0202),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/characters/${imageName}.jpg',
                          ),
                          radius: 85.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        character.name!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ]),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.black54),
                  child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: TabBar(indicatorColor: Color(0xbbFB0202), tabs: [
                      Tab(
                        text: 'Info',
                      ),
                      Tab(
                        text: 'Películas',
                      ),
                      Tab(
                        text: 'Vehículos',
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: TabBarView(children: [
                    infoCharacter(context, character),
                    infoFilms(films, character.films),
                    infoVehicles(vehicles, character.vehicles),
                  ]),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

Widget infoCharacter(BuildContext context, Result character) {
  return ListView(
    children: [
      ListTile(
        title: const Text('Altura'),
        trailing: Text(character.height!),
      ),
      const Divider(
        height: 5,
      ),
      ListTile(
        title: const Text('Masa corporal'),
        trailing: Text(character.mass!),
      ),
      const Divider(
        height: 5,
      ),
      ListTile(
        title: const Text('Año de nacimiento'),
        trailing: Text(character.birthYear!),
      ),
      const Divider(
        height: 5,
      )
    ],
  );
}

Widget infoFilms(films, filmsCount) {
  return FutureBuilder(
    future: homeServices.getFilms(filmsCount),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
            child: Image.asset(
          "assets/loading.gif",
          height: 150.0,
          width: 150.0,
        ));
      }
      return ListView.builder(
        itemCount: filmsCount.length,
        itemBuilder: (context, index) {
          var finalFilms = snapshot.data! as List<Films>;
          return Column(
            children: [
              ListTile(
                  title: Text(finalFilms[index].title),
                  trailing:
                      Text(finalFilms[index].releaseDate.year.toString())),
              const Divider(
                height: 5,
              )
            ],
          );
        },
      );
    },
  );
}

Widget infoVehicles(vehicles, vehiclesCount) {
  if (vehiclesCount.length == 0) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
          child: Text(
        'No vehículos',
        style: TextStyle(color: Colors.red),
      )),
    );
  }
  return FutureBuilder(
    future: homeServices.getVehicles(vehiclesCount),
    builder: (context, snapshot) {
      return ListView.builder(
        itemCount: vehiclesCount.length,
        itemBuilder: (context, filmsCount) {
          if (!snapshot.hasData) {
            return Center(
                child: Image.asset(
              "assets/loading.gif",
              height: 150.0,
              width: 150.0,
            ));
          } else {
            var finalVehicles = snapshot.data! as List<Vehicles>;

            // if (finalVehicles.isEmpty) {
            //   return const Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: Center(
            //         child: Text(
            //       'No vehículos',
            //       style: TextStyle(color: Colors.red),
            //     )),
            //   );
            // }
            return Column(
              children: [
                ListTile(
                  title: Text('- ${finalVehicles[filmsCount].name}'),
                ),
                const Divider(
                  height: 5,
                )
              ],
            );
          }
        },
      );
    },
  );
}

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    final p0 = size.height * 0.75;
    path.lineTo(0.0, p0);
    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    // path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) => oldClipper != this;
}
