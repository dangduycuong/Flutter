import 'package:json_annotation/json_annotation.dart';

part 'search_result_error.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResultError {
  String? message;

  SearchResultError({this.message});

  factory SearchResultError.fromJson(Map<String, dynamic> json) =>
      _$SearchResultErrorFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SearchResultErrorToJson(this);
}
