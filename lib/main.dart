import 'package:flutter/material.dart';
import 'resultado.dart';
import 'questionario.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': "Qual a sua cor favorita?",
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 2},
      ]
    },
    {
      'texto': "Qual o seu animal favorito?",
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'cobra', 'pontuacao': 5},
        {'texto': 'Cachorro', 'pontuacao': 1},
        {'texto': 'Elefante', 'pontuacao': 7},
      ]
    },
    {
      'texto': "Qual seu escritor favorito?",
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 3},
        {'texto': 'Marcia', 'pontuacao': 1},
        {'texto': "Willian", 'pontuacao': 10},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguuntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
