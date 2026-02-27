import '../../entities/example.dart';
import '../../repositories/example_repository.dart';

class GetExamples {
  final ExampleRepository _repository;

  const GetExamples(this._repository);

  List<Example> call() => _repository.getAll();
}
