import 'package:flutter/material.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/presentation/pages/pokemon_details_page.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/pages/pokemons_list_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (_) => const PokemonsListPage(),
  '/pokemon': (_) => const PokemonDetailsPage(),
};
