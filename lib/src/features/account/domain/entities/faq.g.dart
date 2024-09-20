// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FAQImpl _$$FAQImplFromJson(Map<String, dynamic> json) => _$FAQImpl(
      question: json['question'] as String,
      answer: json['answer'] as String,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
      id: (json['faq_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FAQImplToJson(_$FAQImpl instance) => <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
