import 'package:flutter/material.dart';
import 'package:poc_flutter_mobx/features/pokemon_details/presentation/pages/pokemon_details_page.dart';
import 'package:poc_flutter_mobx/features/pokemons_list/presentation/pages/pokemons_list_page.dart';

class NavigationHandler {
  final GlobalKey<NavigatorState> appGlobalKey = GlobalKey();

  Route<dynamic> appRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PokemonsListPage.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return const PokemonsListPage();
            });

      case PokemonDetailsPage.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return PokemonDetailsPage(id: settings.arguments as int);
            });
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return Container();
            });
    }
  }

  Future<T?> push<T extends Object?>(
    String route, {
    Object? arguments,
  }) async {
    return Navigator.pushNamed(
      appGlobalKey.currentContext!,
      route,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>([
    T? result,
  ]) {
    return Navigator.pop(appGlobalKey.currentContext!, result);
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    String route,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      appGlobalKey.currentContext!,
      route,
      predicate,
      arguments: arguments,
    );
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object>(
    String route, {
    Object? arguments,
    Object? result,
  }) {
    return Navigator.pushReplacementNamed(
      appGlobalKey.currentContext!,
      route,
      arguments: arguments,
      result: result,
    );
  }
}
