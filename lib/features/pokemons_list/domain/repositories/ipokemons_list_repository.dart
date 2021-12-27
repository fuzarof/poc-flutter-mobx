import 'package:poc_flutter_mobx/features/pokemons_list/data/models/pokemon_model.dart';

abstract class IPokemonsListRepository {
  Future<List<PokemonModel>> getPokemonList();
}
