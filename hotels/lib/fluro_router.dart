import 'package:fluro/fluro.dart';

import 'package:flutter/material.dart';

import 'views/home_view.dart';
import 'views/detal_view.dart';

class FlRouter {
  //static Router router = Router();
  static FluroRouter router = FluroRouter();

  static Handler _homeHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomeView();
  });

  static Handler _detalHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    print(params);
    return DetalView(
      name: params['name'][0],
      uuid: params['uuid'][0],
    );
  });

  static void setupRoute() {
    router.define(HomeView.routname, handler: _homeHandler);
    router.define('${DetalView.routname}/:name/:uuid',
        handler: _detalHandler, transitionType: TransitionType.cupertino);
  }
}
