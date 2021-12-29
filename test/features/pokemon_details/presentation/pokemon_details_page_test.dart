import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/data/models/pokemon_details_model.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/domain/repositories/ipokemon_details_repository.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/presentation/pages/pokemon_details_page.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/presentation/stores/pokemon_details_store.dart';
import 'package:poc_flutter_mobx/injection_container.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/test_utils.dart';

void main() {
  setUpAll(() async {
    await TestUtils.initWidgetTest();
  });

  testWidgets('[pokemon detail page widget test]', (WidgetTester tester) async {
    final repository = inject.get<IPokemonDetailsRepository>();
    final store = inject.get<PokemonDetailsStore>();

    when(() => repository.getPokemonDetails(any())).thenAnswer(
        (_) async => PokemonDetailsModel(name: 'pokemonName', height: 1, sprite: 'pokemonSprite', weight: 1));

    await mockNetworkImages(() async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          widget: const PokemonDetailsPage(id: 1),
        ),
      );

      await tester.pump();

      expect(find.text("pokemonName"), findsWidgets);
      expect(find.byKey(const Key("PokemonDetailsColumnKey")), findsOneWidget);
      expect(store.pokemon!.name, 'pokemonName');
    });
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
