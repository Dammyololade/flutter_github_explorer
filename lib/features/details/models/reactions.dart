import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reactions.g.dart';

@JsonSerializable()
class Reactions extends Equatable {
  final String url;
  @JsonKey(name: 'total_count')
  final int totalCount;
  @JsonKey(name: '+1')
  final int like;
  @JsonKey(name: '-1')
  final int dislike;
  @JsonKey(name: 'laugh')
  final int laugh;
  @JsonKey(name: 'hooray')
  final int hooray;
  @JsonKey(name: 'confused')
  final int confused;
  @JsonKey(name: 'heart')
  final int heart;
  @JsonKey(name: 'rocket')
  final int rocket;
  @JsonKey(name: 'eyes')
  final int eyes;

  const Reactions({
    required this.url,
    required this.totalCount,
    required this.like,
    required this.dislike,
    required this.laugh,
    required this.hooray,
    required this.confused,
    required this.heart,
    required this.rocket,
    required this.eyes,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) =>
      _$ReactionsFromJson(json);

  @override
  List<Object?> get props => [
        url,
        totalCount,
        like,
        dislike,
        laugh,
        hooray,
        confused,
        heart,
        rocket,
        eyes
      ];

  @override
  String toString() =>
      'Reactions(url: $url, totalCount: $totalCount, like: $like, dislike: $dislike, laugh: $laugh, hooray: $hooray, confused: $confused, heart: $heart, rocket: $rocket, eyes: $eyes)';
}
