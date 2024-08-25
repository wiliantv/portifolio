
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

class ThemeModeButton extends StatelessWidget {
  ButtonStyle? style;

  ThemeModeButton({
    super.key, this.style
  });

  IconData _getIcon(BuildContext context) {
    var themeMode = EasyDynamicTheme
        .of(context)
        .themeMode;
    return themeMode == ThemeMode.system
        ? Icons.brightness_auto
        : themeMode == ThemeMode.light
        ? Icons.brightness_high
        : Icons.brightness_4;
  }

  String _getText(BuildContext context) {
    var themeMode = EasyDynamicTheme
        .of(context)
        .themeMode;
    return themeMode == ThemeMode.system
        ? "System"
        : themeMode == ThemeMode.light
        ? "Light"
        : "Dark";
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: EasyDynamicTheme
          .of(context)
          .changeTheme,
      icon: Icon(_getIcon(context)),
      label: Text(_getText(context)),
      style:  style,
    );
  }
}