import 'package:dio/dio.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/domain/repositories/ipokemon_details_repository.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/presentation/stores/pokemon_details_store.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/domain/repositories/ipokemons_list_repository.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/stores/pokemons_list_store.dart';
import 'package:poc_flutter_mobx/injection_container.dart';

import 'mocks/repository_mocks.dart';

void setupTest() {
  inject.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/")));

  inject.registerLazySingleton<IPokemonsListRepository>(() => PokemonsListMock());
  inject.registerLazySingleton<IPokemonDetailsRepository>(() => PokemonDetailsMock());

  inject.registerLazySingleton<PokemonsListStore>(() => PokemonsListStore(inject.get()));
  inject.registerLazySingleton<PokemonDetailsStore>(() => PokemonDetailsStore(inject.get()));
}
