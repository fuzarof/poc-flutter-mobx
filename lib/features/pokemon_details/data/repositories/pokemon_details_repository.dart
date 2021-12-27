import 'package:dio/dio.dart';
import 'package:poc_flutter_mobx/core/error/services/api_exception_handler.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/data/models/pokemon_details_model.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/domain/repositories/ipokemon_details_repository.dart';

class PokemonDetailsRepository implements IPokemonDetailsRepository {
  final Dio _dio;

  PokemonDetailsRepository(this._dio);
  @override
  Future<PokemonDetailsModel> getPokemonDetails(int id) async {
    try {
      final response = await _dio.get('/pokemon/$id');
      return PokemonDetailsModel.fromJson(response.data);
    } catch (e) {
      throw ApiExceptionHandler.handleException(e);
    }
  }
}
