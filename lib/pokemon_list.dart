import 'pokemon.dart';

class PokemonList {
  List<Pokemon> pokemon;

  PokemonList({required this.pokemon});

  static PokemonList fromJson(Map<String, dynamic> json) {
      final pokemonList = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemonList.add(Pokemon.fromJson(v));
      });

      return PokemonList(pokemon: pokemonList);
    }
  }