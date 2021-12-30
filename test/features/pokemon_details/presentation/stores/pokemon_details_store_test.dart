import 'package:flutter_test/flutter_test.dart';
import 'package:poc_flutter_mobx/core/error/models/api_exception.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/data/models/pokemon_details_model.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/domain/repositories/ipokemon_details_repository.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/presentation/stores/pokemon_details_store.dart';
import 'package:poc_flutter_mobx/injection_container.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/test_utils.dart';

void main() {
  setUpAll(() async {
    await TestUtils.initWidgetTest();
  });

  testWidgets('[pokemon details store test]', (WidgetTester tester) async {
    final repository = inject.get<IPokemonDetailsRepository>();
    final store = inject.get<PokemonDetailsStore>();

    when(() => repository.getPokemonDetails(any())).thenAnswer(
        (_) async => PokemonDetailsModel(name: 'pokemonName', height: 1, sprite: 'pokemonSprite', weight: 1));

    await store.getPokemon(1);

    expect(store.pokemon!.name, 'pokemonName');
    expect(store.errorStore.isError, false);
  });
  testWidgets('[pokemon details store test error]', (WidgetTester tester) async {
    final repository = inject.get<IPokemonDetailsRepository>();
    final store = inject.get<PokemonDetailsStore>();

    when(() => repository.getPokemonDetails(any()))
        .thenThrow(ApiException(message: 'errorMessage', statusCode: 500));

    await store.getPokemon(1);

    expect(store.pokemon, null);
    expect(store.errorStore.isError, true);
  });
}
