import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import '../UI/mytheme.dart';
import 'SettingViewModel.dart';

class SettingsPage extends StatefulWidget{
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SettingsList(
            darkTheme: SettingsThemeData(
                settingsListBackground:
                MyTheme.dark().scaffoldBackgroundColor,
                settingsSectionBackground:
                MyTheme.dark().scaffoldBackgroundColor
            ),
            lightTheme: SettingsThemeData(
                settingsListBackground:
                MyTheme.light().scaffoldBackgroundColor,
                settingsSectionBackground:
                MyTheme.light().scaffoldBackgroundColor
            ),
            sections: [
        SettingsSection(
        title: const Text('Theme'),
        tiles: [
    SettingsTile.switchTile(
    initialValue: context.watch<SettingViewModel>
        ().isDark, //Provider.of<SettingViewModel>(context).isDark,
    onToggle: (bool value)
    {context.read<SettingViewModel>
    ().isDark=value;},//Provider.of<SettingViewModel> (context,listen:false).isDark=value, title: null,;},
  title: const Text('Dark mode'),
  leading: const Icon(Icons.invert_colors),)
  ])
  ],
  ),
  );
}
}