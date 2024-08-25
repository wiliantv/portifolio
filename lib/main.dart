import 'dart:async'; // Adicione esta importação para usar Timer
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/widgets/drawer.dart';
import 'package:portifolio/widgets/typing_text.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfólio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue, brightness: Brightness.light),
        textTheme: GoogleFonts.firaCodeTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.black87,
                displayColor: Colors.black87,
              ),
        ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue, brightness: Brightness.dark),
        textTheme: GoogleFonts.firaCodeTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        brightness: Brightness.dark,
      ),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TypingTextController _typingTextController = TypingTextController();
  TypingTextController _typingTextControllerS = TypingTextController();
  TypingTextController _typingTextControllerS2 = TypingTextController();

  @override
  void initState() {
    super.initState();
    _typingTextController
        .onStopTyping(() => _typingTextControllerS.startAnimation());
    _typingTextControllerS.onStopTyping(() => _typingTextControllerS2.startAnimation());
  }



  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfólio'),
        actions: [
          if(!isMobile)
            TextButton(onPressed: () {

            }, child: Text('Sobre')),
          TextButton(onPressed: () {

          }, child: Text('Formação')),
          TextButton(onPressed: () {

          }, child: Text('Projetos')),
          TextButton(onPressed: () {

          }, child: Text('Contato')),
          EasyDynamicThemeBtn(),
        ],
      ),
      drawer: !isMobile ? null : ResponsiveMenu(),
      body: Container(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                    child: Text('Sobre Mim'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProjectsPage()),
                      );
                    },
                    child: Text('Projetos'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Páginas de exemplo
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre Mim')),
      body: Center(
        child: Text(
          'Conteúdo da página Sobre Mim',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Projetos')),
      body: Center(
        child: Text(
          'Conteúdo da página Projetos',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formação')),
      body: Center(
        child: Text(
          'Conteúdo da página Formação',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contato')),
      body: Center(
        child: Text(
          'Conteúdo da página Contato',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
