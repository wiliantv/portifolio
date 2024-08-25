import 'package:flutter/material.dart';
import 'package:portifolio/widgets/default_scaffold.dart';
import 'package:portifolio/widgets/typing_text.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size2 = MediaQuery.of(context).size;
    var isMobile = size2.width < 800;

    return DefaultScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: isMobile ? 60 : 100,
              backgroundImage: AssetImage('images/eu.jpg'), // Substitua pelo caminho correto da sua foto
            ),
            SizedBox(height: 20),
            Text(
              'Sobre Mim',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Sou Wilian Dorneles Fragoso, um desenvolvedor full stack apaixonado por tecnologia e inovação. \n'
                  'Tenho formação em Análise e Desenvolvimento de Sistemas e mais de 3 anos de experiência no desenvolvimento de softwares para diversas plataformas. \n'
                  'Minhas áreas de especialização incluem configuração de servidores, Docker, DevOps, e Cloud Computing.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: isMobile ? 1 : (size2.width/400).toInt(),
                childAspectRatio: isMobile ? 3 : 3,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildSkillCard(context, Icons.code, 'Desenvolvimento Full Stack'),
                  _buildSkillCard(context, Icons.cloud, 'DevOps e Cloud'),
                  _buildSkillCard(context, Icons.storage, 'Gerenciamento de Servidores'),
                  _buildSkillCard(context, Icons.security, 'Segurança da Informação'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context, IconData icon, String skill) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                skill,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
