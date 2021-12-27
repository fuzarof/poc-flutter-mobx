// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailsStore on _PokemonDetailsStoreBase, Store {
  final _$errorStoreAtom = Atom(name: '_PokemonDetailsStoreBase.errorStore');

  @override
  ErrorStore get errorStore {
    _$errorStoreAtom.reportRead();
    return super.errorStore;
  }

  @override
  set errorStore(ErrorStore value) {
    _$errorStoreAtom.reportWrite(value, super.errorStore, () {
      super.errorStore = value;
    });
  }

  final _$pokemonAtom = Atom(name: '_PokemonDetailsStoreBase.pokemon');

  @override
  PokemonDetailsModel? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonDetailsModel? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  final _$getPokemonAsyncAction =
      AsyncAction('_PokemonDetailsStoreBase.getPokemon');

  @override
  Future getPokemon(int id) {
    return _$getPokemonAsyncAction.run(() => super.getPokemon(id));
  }

  final _$_PokemonDetailsStoreBaseActionController =
      ActionController(name: '_PokemonDetailsStoreBase');

  @override
  dynamic setPokemon(PokemonDetailsModel pokemon) {
    final _$actionInfo = _$_PokemonDetailsStoreBaseActionController.startAction(
        name: '_PokemonDetailsStoreBase.setPokemon');
    try {
      return super.setPokemon(pokemon);
    } finally {
      _$_PokemonDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorStore: ${errorStore},
pokemon: ${pokemon}
    ''';
  }
}
