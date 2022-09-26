import 'package:vpm/screens/BuyVpmScreen.dart';
import 'package:vpm/screens/BusinessScreen.dart';
import 'package:vpm/screens/CollabMainScreen.dart';
import 'package:vpm/screens/CreateBusinessCollabJobScreen.dart';
import 'package:vpm/screens/CreateBusinessHomeScreen.dart';
import 'package:vpm/screens/CreateBusinessScreen.dart';
import 'package:vpm/screens/HomeScreen.dart';
import 'package:vpm/screens/InvestInBusiness.dart';
import 'package:vpm/screens/LoginScreen.dart';
import 'package:vpm/screens/RegisterScreen.dart';
import 'package:vpm/screens/SupportEmailScreen.dart';
import 'package:vpm/screens/UserDetailsScreen.dart';
import 'package:vpm/screens/UserInvestmentScreen.dart';
import 'package:vpm/screens/UsersBusinessScreen.dart';
import 'package:vpm/screens/UsersCollabScreen.dart';
import 'package:vpm/widgets/SplashScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Color.fromRGBO(240, 240, 240, 1),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(24, 119, 242, 1.0),
          backgroundColor: Colors.white,
          fontFamily: 'Avenir'),
      home: SplashScreenWidget(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        BuyVpmScreen.routeName: (ctx) => BuyVpmScreen(),
        CreateBusinessScreen.routeName: (ctx) => CreateBusinessScreen(),
        BusinessScreen.routeName: (ctx) => BusinessScreen(),
        InvestInBusiness.routeName: (ctx) => InvestInBusiness(),
        UserDetailsScreen.routeName: (ctx) => UserDetailsScreen(),
        UserInvestmentScreen.routeName: (ctx) => UserInvestmentScreen(),
        UsersCollabScreen.routeName: (ctx) => UsersCollabScreen(),
        UsersBusinessScreen.routeName: (ctx) => UsersBusinessScreen(),
        SupportEmailScreen.routeName: (ctx) => SupportEmailScreen(),
        CreateBusinessHomeScreen.routeName: (ctx) => CreateBusinessHomeScreen(),
        CollabMainScreen.routeName: (ctx) => CollabMainScreen(),
        CreateBusinessCollabJobScreen.routeName: (ctx) =>
            CreateBusinessCollabJobScreen(),
      },
    );
  }
}
