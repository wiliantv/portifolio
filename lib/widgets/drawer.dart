import 'package:flutter/material.dart';
import 'package:portifolio/widgets/default_scaffold.dart';
import 'package:portifolio/widgets/theme_mode_button.dart';

class ResponsiveMenu extends StatelessWidget {
  final List<ResponsiveButton> children;

  const ResponsiveMenu({super.key, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              // color: Colors.blue,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu',
                  style: TextStyle(
                    // color: ,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ThemeModeButton()
                ]),
          ),
          ...children.map((e) => e.toListTile(context)),

        ],
      ),
    );
  }
}
