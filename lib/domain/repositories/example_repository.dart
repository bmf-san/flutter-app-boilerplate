import '../entities/example.dart';

abstract class ExampleRepository {
  List<Example> getAll();
  Future<void> save(Example example);
  Future<void> delete(String id);
}
