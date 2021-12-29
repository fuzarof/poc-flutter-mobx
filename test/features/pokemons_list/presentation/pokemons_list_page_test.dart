import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/data/models/pokemon_model.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/domain/repositories/ipokemons_list_repository.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/pages/pokemons_list_page.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/stores/pokemons_list_store.dart';
import 'package:poc_flutter_mobx/injection_container.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/test_utils.dart';

void main() {
  setUpAll(() async {
    await TestUtils.initWidgetTest();
  });

  testWidgets('[pokemons list page widget test]', (WidgetTester tester) async {
    final repository = inject.get<IPokemonsListRepository>();
    final store = inject.get<PokemonsListStore>();

    when(repository.getPokemonList)
        .thenAnswer((_) async => <PokemonModel>[PokemonModel(name: 'pokemonName', url: 'pokemonUrl')]);

    await tester.pumpWidget(
      TestUtils.buildTestableWidget(
        widget: const PokemonsListPage(),
      ),
    );

    await tester.pump();

    expect(find.text("Pokedex"), findsOneWidget);
    expect(find.byKey(const Key("PokemonListViewKey")), findsOneWidget);
    expect(store.pokemonsList[0].name, 'pokemonName');
  });

  // testWidgets('[pokemons list page widget test with error]', (WidgetTester tester) async {
  //   final store = inject.get<PokemonsListStore>();
  //   final repository = inject.get<IPokemonsListRepository>();

  //   when(repository.getPokemonList).thenThrow(ApiException('teste1', 'teste2', 500));

  //   await tester.pumpWidget(
  //     TestUtils.buildTestableWidget(
  //       widget: const PokemonsListPage(),
  //     ),
  //   );

  //   await tester.pump();

  //   expect(find.text("Pokedex"), findsOneWidget);
  //   expect(find.byKey(const Key("PokemonListViewKey")), findsOneWidget);
  //   expect(store.pokemonsList[0].name, 'pokemonName');
  // });
}
