import 'package:flutter/material.dart';

import 'package:hotels/views/detal_view.dart';
import 'package:hotels/views/home_view.dart';

import 'fluro_router.dart';

void main() {
  FlRouter.setupRoute();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: FlRouter.router.generator,
      // routes: {
      //   '/': (BuildContext context) => HomeView(),
      //   '/Detal': (BuildContext context, String param) => DetalView(uuid: params),
      // },
    );
  }
}
