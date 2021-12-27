import 'package:poc_flutter_mobx/features/pokemon_details/data/models/pokemon_details_model.dart';

abstract class IPokemonDetailsRepository {
  Future<PokemonDetailsModel> getPokemonDetails(int id);
}
