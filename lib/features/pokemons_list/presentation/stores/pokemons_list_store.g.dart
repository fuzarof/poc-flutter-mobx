// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonsListStore on _PokemonsListStoreBase, Store {
  final _$requestGetPokemonsListAtom =
      Atom(name: '_PokemonsListStoreBase.requestGetPokemonsList');

  @override
  ObservableFuture<List<PokemonModel>?> get requestGetPokemonsList {
    _$requestGetPokemonsListAtom.reportRead();
    return super.requestGetPokemonsList;
  }

  @override
  set requestGetPokemonsList(ObservableFuture<List<PokemonModel>?> value) {
    _$requestGetPokemonsListAtom
        .reportWrite(value, super.requestGetPokemonsList, () {
      super.requestGetPokemonsList = value;
    });
  }

  final _$pokemonsListAtom = Atom(name: '_PokemonsListStoreBase.pokemonsList');

  @override
  ObservableList<PokemonModel> get pokemonsList {
    _$pokemonsListAtom.reportRead();
    return super.pokemonsList;
  }

  @override
  set pokemonsList(ObservableList<PokemonModel> value) {
    _$pokemonsListAtom.reportWrite(value, super.pokemonsList, () {
      super.pokemonsList = value;
    });
  }

  final _$_PokemonsListStoreBaseActionController =
      ActionController(name: '_PokemonsListStoreBase');

  @override
  dynamic setPokemonsList(List<PokemonModel> pokemonsList) {
    final _$actionInfo = _$_PokemonsListStoreBaseActionController.startAction(
        name: '_PokemonsListStoreBase.setPokemonsList');
    try {
      return super.setPokemonsList(pokemonsList);
    } finally {
      _$_PokemonsListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemonsList() {
    final _$actionInfo = _$_PokemonsListStoreBaseActionController.startAction(
        name: '_PokemonsListStoreBase.getPokemonsList');
    try {
      return super.getPokemonsList();
    } finally {
      _$_PokemonsListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestGetPokemonsList: ${requestGetPokemonsList},
pokemonsList: ${pokemonsList}
    ''';
  }
}
