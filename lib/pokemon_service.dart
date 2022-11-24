import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:quiz_pokemon/pokemon_list.dart';
import 'package:http/http.dart' as http;

PokemonList pokemonListFromJson(String str) =>
    PokemonList.fromJson(json.decode(str));

Future<PokemonList> fetchPokemonList() async {
  const url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  final response = await http.get(Uri.parse(url));

  return compute(pokemonListFromJson, response.body);
} 
