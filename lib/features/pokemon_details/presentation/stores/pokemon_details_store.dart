import 'package:mobx/mobx.dart';
import 'package:poc_flutter_mobx/core/error/services/error_store.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/data/models/pokemon_details_model.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/domain/repositories/ipokemon_details_repository.dart';
part 'pokemon_details_store.g.dart';

class PokemonDetailsStore = _PokemonDetailsStoreBase with _$PokemonDetailsStore;

abstract class _PokemonDetailsStoreBase with Store {
  late final IPokemonDetailsRepository _repository;

  _PokemonDetailsStoreBase(this._repository);

  @observable
  ErrorStore errorStore = ErrorStore();

  @observable
  PokemonDetailsModel? pokemon;

  @action
  setPokemon(PokemonDetailsModel pokemon) {
    this.pokemon = pokemon;
  }

  @action
  getPokemon(int id) async {
    errorStore.resetErrors();
    try {
      pokemon = await _repository.getPokemonDetails(id);
    } catch (err) {
      errorStore.handleException(err);
    }
  }
}
