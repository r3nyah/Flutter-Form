import 'package:flutter/material.dart';

import 'Src/HomePage.dart';
import 'Src/ProfilePage.dart';

void main(){
  runApp(const MyApp());
}
const String myhomepageRoute = '/';
const String myprofileRoute = 'profile';

class Router{
  static Route<dynamic>generateRoute(RouteSettings settings){
    switch (settings.name){
      case myhomepageRoute:
        return MaterialPageRoute(
          builder: (_){
            return const MyHomePage();
          }
        );

      case myprofileRoute:
        return MaterialPageRoute(
          builder: (_){
            return MyProfilePage();
          }
        );

      default:
        return MaterialPageRoute(
          builder: (_){
            return const Scaffold(
              body: Center(
                child: Text(
                  '404 Not Found',
                ),
              ),
            );
          }
        );
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Form',
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute,
        initialRoute: myhomepageRoute
    );
  }
}
