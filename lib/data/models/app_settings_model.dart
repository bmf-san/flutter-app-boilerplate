import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_settings_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class AppSettingsModel extends HiveObject {
  @HiveField(0)
  final bool isDarkMode;

  @HiveField(1)
  final String locale;

  const AppSettingsModel({
    this.isDarkMode = false,
    this.locale = 'ja',
  });

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingsModelToJson(this);

  AppSettingsModel copyWith({
    bool? isDarkMode,
    String? locale,
  }) {
    return AppSettingsModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      locale: locale ?? this.locale,
    );
  }
}
