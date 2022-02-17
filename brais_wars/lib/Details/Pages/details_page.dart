import 'package:brais_wars/shared/models/character.models.dart';
import 'package:flutter/material.dart';

import '../../shared/models/characters.models.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentsResp = ModalRoute.of(context)!.settings.arguments as Map;
    var characterId = argumentsResp['id'];
    var character = argumentsResp['people'] as Result;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.black87),
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Color(0xbbFB0202),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://starwars-visualguide.com/assets/img/characters/${characterId + 1}.jpg',
                      ),
                      radius: 85.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    character.name!,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                ]),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  title: Text('Altura'),
                  trailing: Text(character.height!),
                ),
                Divider(
                  height: 5,
                ),
                ListTile(
                  title: Text('Masa corporal'),
                  trailing: Text(character.mass!),
                ),
                Divider(
                  height: 5,
                ),
                ListTile(
                  title: Text('Año de nacimiento'),
                  trailing: Text(character.birthYear!),
                ),
                Divider(
                  height: 5,
                )
              ],
            ))
          ],
        ),
      ),
    ));
    // return SafeArea(
    //     child: Scaffold(
    //   body: Stack(
    //     children: [
    //       Column(children: [
    //         ClipPath(
    //           clipper: BackgroundWaveClipper(),
    //           child: Container(
    //             width: MediaQuery.of(context).size.width,
    //             height: 280,
    //             decoration: const BoxDecoration(
    //                 gradient: LinearGradient(
    //                     colors: [Color(0xbb8E0E00), Color(0xbb1F1C18)])),
    //           ),
    //         ),
    //         Positioned(
    //           top: 16,
    //           left: 16,
    //           right: 16,
    //           child: Container(
    //               child: Container(
    //             decoration:
    //                 BoxDecoration(borderRadius: BorderRadius.circular(10)),
    //             margin: const EdgeInsets.all(5.0),
    //             child: SizedBox(
    //               width: 100,
    //               height: 100,
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Image.network(
    //                   'https://starwars-visualguide.com/assets/img/characters/${characterId + 1}.jpg',
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //             ),
    //           )),
    //         )
    //       ])
    //     ],
    //   ),
    // ));
    // return SafeArea(
    //   child: Scaffold(
    //       appBar: AppBar(
    //         elevation: 0,
    //         backgroundColor: const Color(0xbb1F1D29),
    //       ),
    //       body: SizedBox(
    //         height: MediaQuery.of(context).size.height,
    //         child: Column(
    //           children: [
    //             Row(
    //               children: [
    //                 Container(
    //                   height: MediaQuery.of(context).size.height * .5,
    //                   width: MediaQuery.of(context).size.width,
    //                   color: const Color(0xbb1F1D29),
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10)),
    //                     margin: const EdgeInsets.all(5.0),
    //                     child: SizedBox(
    //                       // width: 100,
    //                       // height: 100,
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: Image.network(
    //                           'https://starwars-visualguide.com/assets/img/characters/${characterId + 1}.jpg',
    //                           fit: BoxFit.cover,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             Text(character.name!),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             Expanded(
    //                 child: ListView(
    //               children: [
    //                 ListTile(
    //                   title: Text('Altura: ${character.height!}'),
    //                 ),
    //                 const Divider(
    //                   color: Colors.red,
    //                 ),
    //                 ListTile(
    //                   title: Text('Masa corporal: ${character.mass!}'),
    //                 ),
    //                 const Divider(
    //                   color: Colors.red,
    //                 ),
    //                 ListTile(
    //                   title: Text('Año de nacimiento: ${character.birthYear}'),
    //                 ),
    //                 const Divider(
    //                   color: Colors.red,
    //                 ),
    //               ],
    //             ))
    //           ],
    //         ),
    //       )),
    // );
  }
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

// AppBar(
//             elevation: 0,
//             backgroundColor: const Color(0xbb1F1D29),
//           ),
