import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter_template/config/extensions/theme_mode.dart';
import 'package:flutter_starter_template/features/theme/controller/theme_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: const Column(
        children: [
          _ThemeTile(),
        ],
      ),
    );
  }
}

class _ThemeTile extends ConsumerWidget {
  const _ThemeTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.watch(themeControllerProvider);
    return ListTile(
      title: Text(AppLocalizations.of(context)!.theme),
      leading: _leading(themeController.value),
      subtitle: Text(
        themeController.value != null
            ? themeController.value!.themeModeName(context)
            : '',
      ),
      onTap: () async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          title: Text(AppLocalizations.of(context)!.theme),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values
                .map(
                  (e) => RadioListTile(
                    title: Text(e.themeModeName(context)),
                    value: e,
                    groupValue: ref.watch(themeControllerProvider).value,
                    onChanged: (value) => ref
                        .read(themeControllerProvider.notifier)
                        .saveTheme(value!),
                  ),
                )
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(AppLocalizations.of(context)!.close),
            )
          ],
        ),
      ),
    );
  }

  Widget _leading(ThemeMode? themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return const Icon(Icons.dark_mode);
      case ThemeMode.light:
        return const Icon(Icons.light_mode);
      default:
        return const Icon(Icons.smartphone);
    }
  }
}
