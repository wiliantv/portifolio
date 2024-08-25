import 'package:flutter/material.dart';
import 'package:portifolio/widgets/default_scaffold.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: "Projetos",
      body: Center(
        child: Text(
          'Conteúdo da página Projetos',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
