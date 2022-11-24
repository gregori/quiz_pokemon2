import 'package:flutter/material.dart';
import 'package:quiz_pokemon/pokemon_list.dart';
import 'package:quiz_pokemon/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({required this.pokemonList, Key? key}) : super(key: key);

  final PokemonList pokemonList;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final textStyle = const TextStyle(fontSize: 20);
  late QuizBrain quizBrain;
  List<String> pokemonAnswers = [];
  int rightCount = 0;
  int wrongCount = 0;

  @override
  void initState() {
    super.initState();
    quizBrain = QuizBrain(pokemonList: widget.pokemonList);
    updatePokemonData();
  }

  void updatePokemonData() {
    setState(() {
      quizBrain.nextPokemon();
      pokemonAnswers = quizBrain.getPokemonNames();
    });
  }

  void checkAnswer(int answer) {
    var message = '';
    if (quizBrain.isCorrect(answer)) {
      message = 'Resposta certa!';

      setState(() {
        rightCount++;
      });
    } else {
      message = 'Resposta errada!';

      setState(() {
        wrongCount++;
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );

    updatePokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Certos: $rightCount', style: textStyle,),
                    const SizedBox(width: 20),
                    Text('Errados: $wrongCount', style: textStyle,),
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Image.network(quizBrain.getCurrentPokemonImg())),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(onPressed: () {
                    checkAnswer(0);
                  }, child: Text(pokemonAnswers[0], style: textStyle,)),
                ),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(onPressed: () {
                  checkAnswer(1);
                }, child: Text(pokemonAnswers[1], style: textStyle,)),
              ),),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(onPressed: () {
                    checkAnswer(2);
                  }, child: Text(pokemonAnswers[2], style: textStyle,)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(onPressed: () {
                    checkAnswer(3);
                  }, child: Text(pokemonAnswers[3], style: textStyle,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
