import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemesProvider with ChangeNotifier {
  var primaryColor = Colors.teal;
  var accentColor = Colors.indigo;

  var tm = ThemeMode.system;

  String themeText = 's';

  onChange(colors, n) async {
    n == 1
        ? primaryColor = _setMaterialColor(colors.hashCode)
        : accentColor = _setMaterialColor(colors.hashCode);
    notifyListeners();

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(" themeColor", primaryColor.value);
    pref.setInt(" themeColor", accentColor.value);

  }
  getThemeColor()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    primaryColor=_setMaterialColor(pref.getInt(" themeColor", )??0xFF009688);
    accentColor= _setMaterialColor(pref.getInt(" themeColor" )??0xFF3F51B5);
    notifyListeners();

  }

  MaterialColor _setMaterialColor(colorVal) {
    return MaterialColor(
      colorVal,
      <int, Color>{
        50: const Color(0xFFFCE4EC),
        100: const Color(0xFFF8BBD0),
        200: const Color(0xFFF48FB1),
        300: const Color(0xFFF06292),
        400: const Color(0xFFEC407A),
        500: Color(colorVal),
        600: const Color(0xFFD81B60),
        700: const Color(0xFFC2185B),
        800: const Color(0xFFAD1457),
        900: const Color(0xFF880E4F),
      },
    );
  }

  void themeModeChange(newTheme) async {
    tm = newTheme;
    _getThemeText(tm);
    notifyListeners();


  }

  getThemeMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    themeText = pref.getString(" themeText") ?? 's';
    if (themeText == 'd') {
      tm == ThemeMode.dark;
    } else if (themeText == 'l') {
      tm = ThemeMode.light;
    } else if (themeText == 's') {
      tm = ThemeMode.system;
    }

  }

  _getThemeText(ThemeMode tm) {
    if (tm == ThemeMode.dark) {
      themeText = 'd';
    } else if (tm == ThemeMode.light) {
      themeText = 'l';
    } else if (tm == ThemeMode.system) {
      themeText = 's';
    }
    notifyListeners();
  }
}
