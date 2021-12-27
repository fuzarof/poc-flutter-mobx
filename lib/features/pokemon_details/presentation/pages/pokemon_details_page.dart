import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/data/models/pokemon_details_model.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/presentation/stores/pokemon_details_store.dart';
import 'package:poc_flutter_mobx/injection_container.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  final _store = inject.get<PokemonDetailsStore>();
  late List<ReactionDisposer> _reactions;
  bool loaded = false;

  @override
  void initState() {
    initReactions();
    super.initState();
  }

  @override
  void dispose() {
    _reactions.map((e) => e.reaction.dispose()).toList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    if (!loaded) _processWithArguments(arguments);

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_store.pokemon?.name ?? ''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _store.pokemon?.sprite != null ? Image.network(_store.pokemon!.sprite) : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Name:"), Text(_store.pokemon?.name ?? '')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Height:"), Text(_store.pokemon?.height.toString() ?? '')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Weight:"), Text(_store.pokemon?.weight.toString() ?? '')],
              ),
            ],
          ),
        ),
      );
    });
  }

  _processWithArguments(Map<String, dynamic> arguments) {
    _store.getPokemon(int.parse(arguments['id'].toString()));
  }

  initReactions() {
    _reactions = [
      reaction((_) => _store.pokemon, (PokemonDetailsModel? pokemon) {
        _store.setPokemon(pokemon!);
      }),
      reaction((_) => _store.errorStore.isError, (bool isError) {
        if (isError) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(content: Text(_store.errorStore.errorMessage ?? '')));
        }
      }),
    ];
  }
}
