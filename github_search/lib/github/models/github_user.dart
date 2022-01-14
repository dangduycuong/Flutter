import 'package:json_annotation/json_annotation.dart';

part 'github_user.g.dart';

@JsonSerializable(explicitToJson: true)
class GithubUser {
  String? login;
  @JsonKey(name:'avatar_url')
  String? avatarUrl;

  GithubUser({this.login, this.avatarUrl});

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GithubUserToJson(this);
}
