import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portifolio/main.dart';
import 'package:portifolio/screens/about_screen.dart';
import 'package:portifolio/screens/contact_screen.dart';
import 'package:portifolio/screens/education_screen.dart';
import 'package:portifolio/screens/projects_screen.dart';
import 'package:portifolio/widgets/drawer.dart';
import 'package:portifolio/widgets/theme_mode_button.dart';

class DefaultScaffold extends StatefulWidget {
  final Widget? body;

  const DefaultScaffold({super.key, this.body});

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.width < 800;
    List<ResponsiveButton> children = [
      ResponsiveButton(
        route: '/',
        icon: Icon(Icons.home),
        label: Text('Home'),
      ),
      ResponsiveButton(
        route: '/about',
        icon: Icon(Icons.person),
        label: Text('Sobre'),
      ),
      ResponsiveButton(
        route: '/education',
        icon: Icon(Icons.school),
        label: Text('Formação'),
      ),
      ResponsiveButton(
        route: '/projects',
        icon: Icon(Icons.work),
        label: Text('Projetos'),
      ),
      ResponsiveButton(
        route: '/contact',
        icon: Icon(Icons.contact_mail),
        label: Text('Contato'),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Portfólio'),
          actions: [
            if (!isMobile)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...children
                      .map(
                        (e) => e.toTextButton(context),
                      )
                      .toList(),
                  ThemeModeButton()
                ],
              ),
            // EasyDynamicThemeBtn(),
          ],
        ),
        drawer: !isMobile
            ? null
            : ResponsiveMenu(
                children: children,
              ),
        body: widget.body);
  }
}

class ResponsiveButton {
  Icon icon;
  Text label;
  String route;

  ResponsiveButton(
      {required this.icon, required this.label, required this.route});

  TextButton toTextButton(BuildContext context) {
    var isSelected = GoRouterState.of(context).path == route;
    return TextButton.icon(
      onPressed: isSelected ? null : () {
        context.go(route);
      },
      icon: icon,
      label: label,
      style: isSelected
          ? ButtonStyle(
              textStyle: WidgetStatePropertyAll(TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hoverColor)),
              foregroundColor:
                  WidgetStatePropertyAll(Theme.of(context).hintColor))
          : null,
    );
  }

  toListTile(BuildContext context) {
    ;
    var selected = GoRouterState.of(context).path == route;
    return ListTile(
      leading: icon,
      title: label,
      selected: selected,
      onTap: selected ? null : () {
        context.go(route);
      },
    );
  }
}
