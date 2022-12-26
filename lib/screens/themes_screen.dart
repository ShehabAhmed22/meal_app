import 'package:flutter/material.dart';
import 'package:meal_appp/widget/main_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../providers/themes_provider.dart';

class ThemeScreen extends StatelessWidget {

  static const routName = "/themes";

  const ThemeScreen({Key? key}) : super(key: key);

  Widget buildRadioListTile(
      ThemeMode themeVal, String txt, IconData? icon, BuildContext ctx) {
    return RadioListTile(
        secondary: Icon(
          icon,
          color: Theme.of(ctx).buttonColor,
        ),
        title: Text(txt),
        value: themeVal,
        groupValue: Provider.of<ThemesProvider>(ctx, listen: true).tm,
        onChanged: (newThemeVal) =>
            Provider.of<ThemesProvider>(ctx, listen: false)
                .themeModeChange(newThemeVal));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Themes'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust Your Theme Selection',
                style: Theme.of(context).textTheme.bodyText1),
          ),
          Expanded(
              child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Choose Your Theme Mode ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              buildRadioListTile(
                  ThemeMode.system, "System Default Theme", null , context),
              buildRadioListTile(ThemeMode.light, "Light Theme",
                  Icons.wb_sunny_outlined, context),
              buildRadioListTile(ThemeMode.dark, "DarkTheme",
                  Icons.nights_stay_outlined, context),
              const SizedBox(height: 30,),
              buildLisTile(context, "primary"),
              buildLisTile(context, "accent"),
            ],
          )),
        ],
      ),
      drawer:   MainDrawer(),
    );
  }
}

ListTile buildLisTile(BuildContext context, txt) {
  var primaryColor =
      Provider.of<ThemesProvider>(context, listen: true).primaryColor;
  var accentColor =
      Provider.of<ThemesProvider>(context, listen: true).accentColor;

  return ListTile(
    title: Text(
      "Choose Your $txt color",
      style: Theme.of(context).textTheme.bodyText1,
    ),
    trailing: CircleAvatar(
      backgroundColor: txt == "primary" ? primaryColor : accentColor,
    ),
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              elevation: 4,
              titlePadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: txt == "primary"
                      ? Provider.of<ThemesProvider>(context, listen: true)
                          .primaryColor
                      : Provider.of<ThemesProvider>(context, listen: true)
                          .accentColor,
                  onColorChanged: (newColor) =>
                      Provider.of<ThemesProvider>(context, listen: false)
                          .onChange(newColor, txt == 'primary' ? 1 : 2),
                  colorPickerWidth: 300,
                  pickerAreaHeightPercent: 0.7,
                  enableAlpha: false,
                  displayThumbColor: true,
                  showLabel: false,
                ),
              ),
            );
          });
    },
  );
}
