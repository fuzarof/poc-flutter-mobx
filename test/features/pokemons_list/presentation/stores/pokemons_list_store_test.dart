import 'package:flutter_test/flutter_test.dart';
import 'package:poc_flutter_mobx/core/error/models/api_exception.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/data/models/pokemon_model.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/domain/repositories/ipokemons_list_repository.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/stores/pokemons_list_store.dart';
import 'package:poc_flutter_mobx/injection_container.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobx/mobx.dart' as mobx;

import '../../../../utils/test_utils.dart';

void main() {
  setUpAll(() async {
    await TestUtils.initWidgetTest();
  });

  testWidgets('[pokemons store test]', (WidgetTester tester) async {
    final repository = inject.get<IPokemonsListRepository>();
    final store = inject.get<PokemonsListStore>();

    when(repository.getPokemonList)
        .thenAnswer((_) async => <PokemonModel>[PokemonModel(name: 'pokemonName', url: 'pokemonUrl')]);

    await store.getPokemonsList();

    expect(store.requestGetPokemonsList.status, mobx.FutureStatus.fulfilled);
    expect(store.requestGetPokemonsList.value![0].name, 'pokemonName');
    expect(store.requestGetPokemonsList.error, null);
  });
  testWidgets('[pokemons store test error]', (WidgetTester tester) async {
    final repository = inject.get<IPokemonsListRepository>();
    final store = inject.get<PokemonsListStore>();

    when(repository.getPokemonList).thenThrow(ApiException(message: 'errorMessage', statusCode: 500));

    await store.getPokemonsList();

    expect(store.requestGetPokemonsList.status, mobx.FutureStatus.rejected);
    expect(store.requestGetPokemonsList.value, null);
    expect(store.requestGetPokemonsList.error.message, 'errorMessage');
    expect(store.requestGetPokemonsList.error.statusCode, 500);

    await tester.pump(const Duration(seconds: 1));
  });
}
