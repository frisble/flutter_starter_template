import 'package:flutter/material.dart';
import 'package:flutter_starter_template/config/extensions/l10n.dart';
import 'package:flutter_starter_template/config/router/app_route.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.title),
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(AppRoute.settings.name),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
