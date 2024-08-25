import 'package:flutter/material.dart';
import 'package:portifolio/widgets/default_scaffold.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Center(
        child: Text(
          'Conteúdo da página Sobre Mim',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
