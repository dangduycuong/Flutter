import 'package:github_search/github/models/search_result_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  final List<SearchResultItem>? items;
  final String? message;

  SearchResult({this.items, this.message});

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
