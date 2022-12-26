import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';
import '../screens/themes_screen.dart';
import '../providers/themes_provider.dart';

class MainDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 23),
            height: 85,
            width: double.infinity,
            alignment: Alignment.topCenter,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up !",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          buildListTile("Meal", Icons.restaurant, () {
            Navigator.of(context).pushNamed("/");
          }, context),
          buildListTile("Filters", Icons.settings, () {
            Navigator.of(context).pushNamed(FilterScreen.routName);
          }, context),
          buildListTile("Themes", Icons.color_lens, () {
            Navigator.of(context).pushNamed(ThemeScreen.routName);
          }, context),
          buildListTile("Log Out", Icons.logout_outlined, () {
            Navigator.of(context).pushNamed('login');
          }, context),
          const Divider(height: 30,color: Colors.black45,),

        ],

      ),
    );
  }

  ListTile buildListTile(
      String title, IconData icon, Function() tab, BuildContext ctx) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(ctx).buttonColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(ctx).textTheme.bodyText1!.color,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: tab,
    );
  }
}
