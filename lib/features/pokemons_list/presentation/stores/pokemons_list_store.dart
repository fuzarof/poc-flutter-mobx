import 'package:mobx/mobx.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/data/models/pokemon_model.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/domain/repositories/ipokeapi_repository.dart';
part 'pokemons_list_store.g.dart';

class PokemonsListStore = _PokemonsListStoreBase with _$PokemonsListStore;

abstract class _PokemonsListStoreBase with Store {
  late final IPokeApiRepository _pokeApiRepository;

  _PokemonsListStoreBase(this._pokeApiRepository);

  @observable
  ObservableFuture<List<PokemonModel>?> requestGetPokemonsList = ObservableFuture.value(null);

  @observable
  ObservableList<PokemonModel> pokemonsList = <PokemonModel>[].asObservable();

  @action
  setPokemonsList(List<PokemonModel> pokemonsList) {
    this.pokemonsList.clear();
    this.pokemonsList.addAll(pokemonsList);
  }

  @action
  getPokemonsList() {
    requestGetPokemonsList = _pokeApiRepository.getPokemonList().asObservable();
  }
}
