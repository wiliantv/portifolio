import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/widgets/default_scaffold.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: "Projectos",
      body: LayoutBuilder(
        builder: (context, constraints) {
          return _buildProjectsGrid(context, constraints.maxWidth);
        },
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context, double maxWidth) {
    // Define o número de colunas com base na largura da tela
    int crossAxisCount = (maxWidth / 400).toInt();

    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 2, // Ajuste a proporção da célula
      ),
      itemCount: _projects.length,
      itemBuilder: (context, index) {
        return _buildProjectItem(
          context,
          title: _projects[index]['title']!,
          description: _projects[index]['description']!,
          gitHubLink: _projects[index]['gitHubLink'],
          projectLink: _projects[index]['projectLink'],
          skills: _projects[index]['skills']!,
        );
      },
    );
  }

  Widget _buildProjectItem(
    BuildContext context, {
    required String title,
    required String description,
    String? gitHubLink,
    String? projectLink,
    required String skills,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                if (gitHubLink != null)
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.github),
                    onPressed: () => _launchURL(gitHubLink),
                  ),
                if (projectLink != null)
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.externalLinkAlt),
                    onPressed: () => _launchURL(projectLink),
                  ),
              ],
            ),
            Text(
              skills,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Divider(),
            SizedBox(height: 8.0),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Exemplo de lista de projetos
  final List<Map<String, String?>> _projects = [
    {
      'title': 'Torre de Hanoi',
      'description': 'Um jogo clássico de resolução de problemas matemáticos.',
      'gitHubLink': 'https://github.com/wiliantv/torre_hanoi_jogo',
      'projectLink': 'https://wiliantv.github.io/torre_hanoi_jogo/#/game',
      'skills': 'Flutter, Github Actions, GitHub Pages',
    },
    {
      'title': 'Meu Portifolio',
      'description': 'Meu Portifolio simples feito em Flutter',
      'gitHubLink': 'https://github.com/wiliantv/portifolio',
      'projectLink': 'https://wiliantv.github.io/portifolio/',
      'skills': 'Flutter, Github Actions, GitHub Pages',
    },
    {
      'title': 'Microservicos API Spring Cloud',
      'description':
          'Uma api em microserviços construida usando o spring cloud',
      'gitHubLink':
          'https://github.com/wiliantv/Microservicos-API-Spring-Cloud',
      'projectLink': null,
      'skills': 'Spring Cloud, Spring Boot, Docker, Java',
    },
    // Adicione mais projetos aqui
  ];
}
