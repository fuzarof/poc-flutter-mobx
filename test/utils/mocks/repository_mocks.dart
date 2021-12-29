import 'package:mocktail/mocktail.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/domain/repositories/ipokemon_details_repository.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/domain/repositories/ipokemons_list_repository.dart';

class PokemonsListMock extends Mock implements IPokemonsListRepository {}

class PokemonDetailsMock extends Mock implements IPokemonDetailsRepository {}
