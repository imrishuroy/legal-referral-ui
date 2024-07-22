import 'dart:io';

import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';

class CreateAdReq {
  CreateAdReq({
    required this.type,
    required this.title,
    required this.description,
    required this.link,
    required this.paymentCycle,
    required this.authorId,
    required this.startDate,
    required this.endDate,
    required this.files,
  });

  final AdType type;
  final String title;
  final String description;
  final String link;
  final PaymentCycle paymentCycle;
  final String authorId;
  final DateTime startDate;
  final DateTime endDate;
  final List<File> files;
}
