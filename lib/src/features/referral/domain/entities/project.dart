import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum ProjectStatus {
  active,
  awarded,
  accepted,
  started,
  @JsonValue('complete_initiated')
  completeInitiated,
  completed,
  rejected,
  cancelled
}

@freezed
class Project with _$Project {
  const factory Project({
    @JsonKey(name: 'referrer_user_id') required String? referrerUserId,
    @JsonKey(
      name: 'case_description',
      includeToJson: false,
    )
    String? description,
    String? title,
    @JsonKey(
      name: 'preferred_practice_area',
      includeToJson: false,
    )
    String? practiceArea,
    @JsonKey(
      name: 'preferred_practice_location',
      includeToJson: false,
    )
    String? practiceLocation,
    @Default(ProjectStatus.active)
    @JsonKey(
      name: 'status',
      includeToJson: false,
    )
    ProjectStatus status,
    @JsonKey(
      name: 'user',
      includeToJson: false,
    )
    AppUser? user,
    @JsonKey(
      name: 'created_at',
      includeToJson: false,
    )
    @DateTimeJsonConverter()
    DateTime? createdAt,
    @JsonKey(
      name: 'started_at',
      includeToJson: false,
    )
    @DateTimeJsonConverter()
    DateTime? startedAt,
    @JsonKey(
      name: 'completed_at',
      includeToJson: false,
    )
    @DateTimeJsonConverter()
    DateTime? completedAt,
    @JsonKey(name: 'project_id') int? projectId,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
