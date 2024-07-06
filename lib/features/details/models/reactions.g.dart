// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reactions _$ReactionsFromJson(Map<String, dynamic> json) => Reactions(
      url: json['url'] as String,
      totalCount: (json['total_count'] as num).toInt(),
      like: (json['+1'] as num).toInt(),
      dislike: (json['-1'] as num).toInt(),
      laugh: (json['laugh'] as num).toInt(),
      hooray: (json['hooray'] as num).toInt(),
      confused: (json['confused'] as num).toInt(),
      heart: (json['heart'] as num).toInt(),
      rocket: (json['rocket'] as num).toInt(),
      eyes: (json['eyes'] as num).toInt(),
    );

Map<String, dynamic> _$ReactionsToJson(Reactions instance) => <String, dynamic>{
      'url': instance.url,
      'total_count': instance.totalCount,
      '+1': instance.like,
      '-1': instance.dislike,
      'laugh': instance.laugh,
      'hooray': instance.hooray,
      'confused': instance.confused,
      'heart': instance.heart,
      'rocket': instance.rocket,
      'eyes': instance.eyes,
    };
