import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(this.pontuacao, this.quandoReiniciarQuestioario, {super.key});

  final int pontuacao;
  final void Function() quandoReiniciarQuestioario;

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabén!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestioario,
          child: const Text(
            'Reiniciar',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
