import 'package:flutter/material.dart';

class ResponsiveMenu extends StatelessWidget {
  const ResponsiveMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text('Sobre Mim'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AboutPage()),
              // );
            },
          ),
          ListTile(
            title: Text('Projetos'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProjectsPage()),
              // );
            },
          ),
          ListTile(
            title: Text('Formação'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => EducationPage()),
              // );
            },
          ),
          ListTile(
            title: Text('Contato'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ContactPage()),
              // );
            },
          ),
        ],
      ),
    );
  }
}
