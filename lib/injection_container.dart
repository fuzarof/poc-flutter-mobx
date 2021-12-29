import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:poc_flutter_mobx/core/error/services/navigation_handler.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/data/repositories/pokemon_details_repository.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/domain/repositories/ipokemon_details_repository.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/presentation/stores/pokemon_details_store.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/data/repositories/pokemons_list_repository.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/domain/repositories/ipokemons_list_repository.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/stores/pokemons_list_store.dart';

GetIt inject = GetIt.I;

void setup() {
  inject.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/")));
  inject.registerLazySingleton<NavigationHandler>(() => NavigationHandler());

  inject.registerFactory<IPokemonsListRepository>(() => PokemonsListRepository(inject.get()));
  inject.registerFactory<IPokemonDetailsRepository>(() => PokemonDetailsRepository(inject.get()));

  inject.registerLazySingleton<PokemonsListStore>(() => PokemonsListStore(inject.get()));
  inject.registerLazySingleton<PokemonDetailsStore>(() => PokemonDetailsStore(inject.get()));
}
