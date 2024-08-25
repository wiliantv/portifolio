import 'package:flutter/material.dart';
import 'package:portifolio/widgets/default_scaffold.dart';
import 'package:portifolio/widgets/typing_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TypingTextController _typingTextController = TypingTextController();
  TypingTextController _typingTextControllerS = TypingTextController();
  TypingTextController _typingTextControllerS2 = TypingTextController(typingSpeed: Duration(milliseconds: 40));

  @override
  void initState() {
    super.initState();
    _typingTextController
        .onStopTyping(() => _typingTextControllerS.startAnimation());
    _typingTextControllerS
        .onStopTyping(() => _typingTextControllerS2.startAnimation());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TypingText(
                    'Olá, Eu sou Wilian Dorneles Fragoso.',
                    controller: _typingTextController,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TypingText(
                    'Analista e desenvolvedor de sistemas.',
                    controller: _typingTextControllerS,
                    autoStart: false,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TypingText(
                    "> Prazer, sou formado em Análise e Desenvolvimento de Sistemas pelo Instituto Federal Farroupilha, Campus São Vicente do Sul. \n Há 3 anos atuo no ramo de desenvolvimento de softwares e sistemas para computadores e dispositivos móveis,\n com experiência em configuração de servidores, instalação de serviços para hospedagens, Docker e algumas habilidades em DevOps e Cloud.",
                    controller: _typingTextControllerS2,
                    autoStart: false,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Contato()),
                          // );
                        },
                        child: Text('Contato'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Text(
                '© 2024 Todos os direitos reservados.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
