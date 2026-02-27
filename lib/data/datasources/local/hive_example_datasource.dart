import 'package:hive_flutter/hive_flutter.dart';

import '../../models/example_model.dart';
import '../../../core/constants/storage_keys.dart';

class HiveExampleDatasource {
  Box<ExampleModel> get _box => Hive.box<ExampleModel>(StorageKeys.examplesBox);

  List<ExampleModel> getAll() => _box.values.toList();

  ExampleModel? getById(String id) {
    try {
      return _box.values.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> save(ExampleModel model) async {
    await _box.put(model.id, model);
  }

  Future<void> delete(String id) async {
    final key = _box.keys.firstWhere(
      (k) => _box.get(k)?.id == id,
      orElse: () => null,
    );
    if (key != null) await _box.delete(key);
  }
}
