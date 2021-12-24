import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/data/repositories/pokeapi_repository.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/domain/repositories/ipokeapi_repository.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/stores/pokemons_list_store.dart';

GetIt inject = GetIt.I;

void setUpDI() {
  sharedModule();
  dataModule();
  presentationModule();
}

void sharedModule() {
  inject.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/")));
}

void dataModule() {
  inject.registerFactory<IPokeApiRepository>(() => PokeApiRepository(inject.get()));
}

void presentationModule() {
  inject.registerLazySingleton<PokemonsListStore>(() => PokemonsListStore(inject.get()));
}
