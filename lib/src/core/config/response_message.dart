import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_message.g.dart';

@JsonSerializable()
class ResponseMsg {
  ResponseMsg({
    required this.message,
  });

  factory ResponseMsg.fromJson(Map<String, dynamic> json) =>
      _$ResponseMsgFromJson(json);

  final String message;

  Map<String, dynamic> toJson() => _$ResponseMsgToJson(this);
}
