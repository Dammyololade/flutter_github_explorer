// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reactions _$ReactionsFromJson(Map<String, dynamic> json) => Reactions(
      url: json['url'] as String,
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
      like: (json['+1'] as num?)?.toInt() ?? 0,
      dislike: (json['-1'] as num?)?.toInt() ?? 0,
      laugh: (json['laugh'] as num?)?.toInt() ?? 0,
      hooray: (json['hooray'] as num?)?.toInt() ?? 0,
      confused: (json['confused'] as num?)?.toInt() ?? 0,
      heart: (json['heart'] as num?)?.toInt() ?? 0,
      rocket: (json['rocket'] as num?)?.toInt() ?? 0,
      eyes: (json['eyes'] as num?)?.toInt() ?? 0,
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
