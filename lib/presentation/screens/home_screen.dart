import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../providers/example_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final examples = ref.watch(exampleNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
      ),
      body: examples.isEmpty
          ? Center(child: Text(l10n.noItems))
          : ListView.builder(
              itemCount: examples.length,
              itemBuilder: (context, index) {
                final item = examples[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.createdAt.toIso8601String()),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
