import 'package:flutter/material.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/pages/pokemons_list_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {'/': (_) => const PokemonsListPage()};
