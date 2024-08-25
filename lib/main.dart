import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.firaCodeTextTheme(
          Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.black87, displayColor: Colors.black87),
        ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.firaCodeTextTheme(
          Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white, displayColor: Colors.white),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfólio'),
        actions: [
          EasyDynamicThemeBtn()
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Olá, Eu sou Wilian Dorneles Fragoso',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Text(
              'Analista e desenvolvedor de sistemas',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            Text(
              '> Prazer, sou formado em analise e desenvolvimento de sistemas pelo Intituto federal farroupilha, campus sao vicente do sul e a 3 anos\n atuo no ramo de desenvolvimento de softwares e sistemas para computadores e dispositivos moveis,\n com esperiencia em configuração de servidores e instalação de serviços para hospedagens,\n docker e mais algumas skills de devops e cloud. \n',
              style: Theme.of(context).textTheme.bodySmall
              ,textAlign: TextAlign.center ,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navegar para a seção de projetos
                  },
                  child: Text('Sobre mim'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navegar para a seção de contato
                  },
                  child: Text('Projetos'),
                ),
                ]
            )
          ],
        ),
      ),
    );
  }
}


