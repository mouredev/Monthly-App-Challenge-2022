import 'package:brais_wars/Details/Pages/details_page.dart';
import 'package:brais_wars/Home/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomePage(),
  'details': (_) => DetailsPage()
};
