import 'package:github_search/github/models/github_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result_item.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResultItem {
  @JsonKey(name:'full_name')
  String? fullName;

  @JsonKey(name:'html_url')
  String? htmlUrl;

  GithubUser? owner;

  SearchResultItem({
    this.fullName,
    this.htmlUrl,
    this.owner,
  });

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SearchResultItemToJson(this);
}
