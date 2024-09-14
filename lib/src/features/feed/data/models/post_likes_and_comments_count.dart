import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_likes_and_comments_count.g.dart';

@JsonSerializable()
class PostLikesAndCommentsCount {
  PostLikesAndCommentsCount({
    required this.likes,
    required this.comments,
  });

  factory PostLikesAndCommentsCount.fromJson(Map<String, dynamic> json) =>
      _$PostLikesAndCommentsCountFromJson(json);

  final int likes;
  final int comments;

  Map<String, dynamic> toJson() => _$PostLikesAndCommentsCountToJson(this);
}
