import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'example_model.g.dart';

/// Hive Adapter typeId: assign a unique int per model in your app.
/// e.g. 0=ExampleModel, 1=SettingsModel, ...
@HiveType(typeId: 0)
@JsonSerializable()
class ExampleModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final DateTime createdAt;

  ExampleModel({
    String? id,
    required this.title,
    DateTime? createdAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleModelToJson(this);

  ExampleModel copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
  }) {
    return ExampleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
