import 'package:equatable/equatable.dart';

class ReactionsEntity extends Equatable {
  final String url;
  final int totalCount;
  final int like;
  final int dislike;
  final int laugh;
  final int hooray;
  final int confused;
  final int heart;
  final int rocket;
  final int eyes;

  const ReactionsEntity({
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
