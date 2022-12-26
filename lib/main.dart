import 'package:flutter/material.dart';
import 'package:meal_appp/providers/themes_provider.dart';
import 'package:meal_appp/screens/auth_screen.dart';
import 'package:meal_appp/screens/login_screen.dart';
import 'package:meal_appp/screens/themes_screen.dart';
import './screens/category_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/filter_screen.dart';
import './screens/tabBar.dart';
import 'package:provider/provider.dart';
import 'providers/meal.dart';
// import 'package:firebase_core/firebase_core.dart';


void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MealProvider>(
        create: (ctx) => MealProvider(),
      ),
      ChangeNotifierProvider<ThemesProvider>(
        create: (ctx) => ThemesProvider(),
      ),
    ],
    child:   const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var primaryColor=Provider.of<ThemesProvider>(context).primaryColor;
    var accentColor=Provider.of<ThemesProvider>(context).accentColor;
    var tm =Provider.of<ThemesProvider>(context).tm;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode:tm,
      theme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: accentColor,
        fontFamily: 'Raleway',
        buttonColor: Colors.black87,
        shadowColor: Colors.black45,
        cardColor: Colors.white,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline2: const TextStyle(
                color: Color.fromARGB(20, 50, 50, 1),
              ),
              bodyText1: const TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold),
            ),
      ),
      darkTheme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: accentColor,
        fontFamily: 'Raleway',
        unselectedWidgetColor: Colors.white70,
        buttonColor: Colors.white60,
        shadowColor: Colors.white60,
        cardColor: const Color.fromRGBO(35, 34, 39, 1),
        canvasColor: const Color.fromRGBO(14, 22, 33, 1),
        textTheme: ThemeData.dark().textTheme.copyWith(
              headline2: const TextStyle(
                color: Colors.white54,
              ),
              bodyText1: const TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold),
            ),
      ),
      // initialRoute: "Auth",
      initialRoute: "login",
      // initialRoute: "/",
      routes: {
        "auth": (context) => const AuthScreen(),
        "login": (context) => const LoginScreen(),
        // "/": (context) => const TabBarScreen(),
        CategoryMealScreen.routeName: (context) => const CategoryMealScreen(),
        MealDetail.routeName: (context) => const MealDetail(),
        FilterScreen.routName: (context) => const FilterScreen(),
        ThemeScreen.routName: (context) => const ThemeScreen(),
        TabBarScreen.routName:(context)=>const TabBarScreen(),
        // LoginScreen.routName:(context)=>const LoginScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: const CategoryScreen(),
    );
  }
}
