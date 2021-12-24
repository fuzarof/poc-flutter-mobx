import 'package:dio/dio.dart';
import 'package:poc_flutter_mobx/core/error/services/api_exception_handler.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/data/models/pokemon_model.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/domain/repositories/ipokeapi_repository.dart';

class PokeApiRepository implements IPokeApiRepository {
  final Dio _dio;

  PokeApiRepository(this._dio);

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    try {
      final response = await _dio.get('/pokemon');
      return (response.data['results'] as List).map((i) => PokemonModel.fromJson(i)).toList();
    } catch (e) {
      throw ApiExceptionHandler.handleException(e);
    }
  }
}
