import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/local/hive_example_datasource.dart';
import '../../data/repositories/example_repository_impl.dart';
import '../../domain/entities/example.dart';
import '../../domain/usecases/example/get_examples.dart';

part 'example_provider.g.dart';

/// TODO: Wire up use cases and extend with create/delete as needed.
@riverpod
class ExampleNotifier extends _$ExampleNotifier {
  late final GetExamples _getExamples;

  @override
  List<Example> build() {
    final repo = ExampleRepositoryImpl(HiveExampleDatasource());
    _getExamples = GetExamples(repo);
    return _getExamples();
  }

  void reload() {
    state = _getExamples();
  }
}
