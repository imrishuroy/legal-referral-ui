import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

abstract class PostRepository {
  Future<Either<Failure, String?>> createPost({required Post post});
}
