import 'package:flutter/material.dart';
import 'package:portifolio/widgets/default_scaffold.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: "Formação",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle(context, 'Formações Acadêmicas'),
            _buildEducationItem(
              context,
              'Tecnologo em Análise e Desenvolvimento de Sistemas',
              'Instituto Federal Farroupilha, Campus São Vicente do Sul',
              '2019 - 2023',
            ),
            _buildEducationItem(
              context,
              'Tecnico integrado em Manutenção e Suporte em Informática',
              'Instituto Federal Farroupilha, Campus São Vicente do Sul',
              '2016 - 2018',
            ),
            SizedBox(height: 20),
            _buildSectionTitle(context, 'Cursos'),
            _buildEducationItem(
              context,
              'Inovação e possibilidades de crescimento',
              'Sebrae',
              '2024',
            ),
            _buildEducationItem(
              context,
              'Programador de Dispositivos Móveis',
              'Intituto Federal Farroupilha, Campus Jaguari',
              '2023',
            ),
            _buildEducationItem(
              context,
              'Inglês Comunicativo – Aprenda o Básico Essencial',
              'Intituto Federal do Espirito Santo',
              '2023',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildEducationItem(
      BuildContext context, String course, String institution, String duration) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          course,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          '$institution\n$duration',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
