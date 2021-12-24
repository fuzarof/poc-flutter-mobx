import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_flutter_mobx/core/error/models/api_exception.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/stores/pokemons_list_store.dart';
import 'package:poc_flutter_mobx/injection_container.dart';

class PokemonsListPage extends StatefulWidget {
  const PokemonsListPage({Key? key}) : super(key: key);

  @override
  _PokemonsListPageState createState() => _PokemonsListPageState();
}

class _PokemonsListPageState extends State<PokemonsListPage> {
  final _store = inject.get<PokemonsListStore>();
  late List<ReactionDisposer> _reactions;

  @override
  void initState() {
    initReactions();
    _store.getPokemonsList();
    super.initState();
  }

  @override
  void dispose() {
    _reactions.map((e) => e.reaction.dispose()).toList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokedex")),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: _store.pokemonsList.length,
            itemBuilder: (context, index) {
              final pokemon = _store.pokemonsList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Center(
                    child: Text(pokemon.name),
                  ),
                ),
              );
            });
      }),
    );
  }

  initReactions() {
    _reactions = [
      reaction((_) => _store.requestGetPokemonsList.status, (FutureStatus status) {
        if (status == FutureStatus.fulfilled) {
          final response = _store.requestGetPokemonsList.value;
          _store.setPokemonsList(response!);
        } else if (status == FutureStatus.rejected) {
          final error = _store.requestGetPokemonsList.error;
          if (error is ApiException) {
            showDialog(
                context: context, builder: (context) => AlertDialog(content: Text(error.message ?? '')));
          }
        }
      }),
    ];
  }
}
