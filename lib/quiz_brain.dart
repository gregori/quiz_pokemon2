import 'dart:math';

import 'package:quiz_pokemon/pokemon_list.dart';

class QuizBrain {
  QuizBrain({required this.pokemonList});

  final PokemonList pokemonList;
  final _random = Random();
  int _currentPokemon = 0;
  int _correctPokemonIndex = 0;

  int _getRandomPokemonIndex() { // obtém um índice de pokemon aleatório
    return _random.nextInt(pokemonList.pokemon.length);
  }

  void nextPokemon() {
    // obtém um índice aleatório de pokemon
    _currentPokemon = _getRandomPokemonIndex();
    // obtém um valor entre 0 e 4 para a resposta
    _correctPokemonIndex = _random.nextInt(4);
  }

  String getCurrentPokemonImg() {
    return pokemonList.pokemon[_currentPokemon].img;
  }

  List<String> getPokemonNames() {
    var currentPokemonName = pokemonList.pokemon[_currentPokemon].name;
    List<String> pokemonNames = [];
    String incorrectPokemonName;

    for (var i = 0; i < 4; i++) {
      if (i == _correctPokemonIndex) {
        pokemonNames.add(currentPokemonName);
      } else {
        do {
          incorrectPokemonName = pokemonList.pokemon[_getRandomPokemonIndex()].name;
        } while (
          pokemonNames.contains(incorrectPokemonName) ||
          incorrectPokemonName == currentPokemonName
        );

        pokemonNames.add(incorrectPokemonName);
      }
    }

    return pokemonNames;
  }

  bool isCorrect(int answer) {
    return answer == _correctPokemonIndex;
  }
}