import 'package:bloc_training/AppRoute.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(appRouter: Approute(),));
}

class MyApp extends StatelessWidget {
  final Approute appRouter;

  const MyApp({ this.appRouter}) ;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breaking Bad',
      onGenerateRoute: appRouter.generateRoute,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

    );
  }
}



