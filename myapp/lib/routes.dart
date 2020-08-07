import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/team_detail.dart';

class Routes {
  static final Router _router = new Router();

  static var teamDetailsHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new TeamDetails(params["id"]);
  });

  static void initRoutes() {
    _router.define(":id", handler: teamDetailsHandler);
  }

  static void navigateTo(context, String route) {
    _router.navigateTo(context, route);
  }
}
