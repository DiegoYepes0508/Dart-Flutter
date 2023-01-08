import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOptions>[
    MenuOptions(
        route: 'alert',
        icon: Icons.add_alert,
        name: 'alerta - alert',
        screen: const AlertScreen()),
    MenuOptions(
        route: 'card',
        icon: Icons.credit_card,
        name: 'tarjeta - card',
        screen: const CardScreen()),
    MenuOptions(
        route: 'avatar',
        icon: Icons.supervised_user_circle_rounded,
        name: 'circle - avatar',
        screen: const AvatarScreen()),
    MenuOptions(
        route: 'animated',
        icon: Icons.play_circle_outline_outlined,
        name: 'animated',
        screen: const AnimatedScreen()),
    MenuOptions(
        route: 'inputs',
        icon: Icons.input_outlined,
        name: 'inputs',
        screen: const InputScreen()),
    MenuOptions(
        route: 'users',
        icon: Icons.verified_user_sharp,
        name: 'users',
        screen: const UsersScreen()),
    MenuOptions(
        route: 'post',
        icon: Icons.post_add,
        name: 'post',
        screen: const PostScreen()),
    MenuOptions(
        route: 'checkbox && switches',
        icon: Icons.check_box,
        name: 'checkbox && switches',
        screen: const CheckSwitchesScreen()),
    MenuOptions(
        route: 'infinite scroll',
        icon: Icons.download,
        name: 'infinite scroll',
        screen: const InfiniteScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (var options in menuOptions) {
      appRoutes
          .addAll({options.route: (BuildContext context) => options.screen});
    }

    return appRoutes;
  }
}
