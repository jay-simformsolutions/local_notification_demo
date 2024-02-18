import 'package:json_annotation/json_annotation.dart';
part 'employee_model.g.dart';

@JsonSerializable()
class EmployeeModel {
  EmployeeModel({
    required this.id,
    required this.name,
    required this.username,
    required this.website,
    required this.email,
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final String website;

  /// Connect the generated [_$EmployeeModelToJson] function to the `fromJson`
  /// factory.
  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

  /// Connect the generated [_$EmployeeModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}
