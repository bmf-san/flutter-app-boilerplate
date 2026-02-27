import '../../domain/entities/example.dart';
import '../../domain/repositories/example_repository.dart';
import '../datasources/local/hive_example_datasource.dart';
import '../models/example_model.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final HiveExampleDatasource _datasource;

  ExampleRepositoryImpl(this._datasource);

  @override
  List<Example> getAll() {
    return _datasource.getAll().map(_toEntity).toList();
  }

  @override
  Future<void> save(Example example) async {
    await _datasource.save(_toModel(example));
  }

  @override
  Future<void> delete(String id) async {
    await _datasource.delete(id);
  }

  // ── Mappers ──────────────────────────────

  Example _toEntity(ExampleModel model) => Example(
        id: model.id,
        title: model.title,
        createdAt: model.createdAt,
      );

  ExampleModel _toModel(Example entity) => ExampleModel(
        id: entity.id,
        title: entity.title,
        createdAt: entity.createdAt,
      );
}
