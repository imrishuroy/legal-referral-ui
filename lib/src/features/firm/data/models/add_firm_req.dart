import 'dart:io';

class AddFirmReq {
  AddFirmReq({
    required this.name,
    required this.ownerUserId,
    required this.orgType,
    required this.file,
    required this.website,
    required this.location,
    required this.about,
  });

  final String name;
  final String ownerUserId;
  final String orgType;
  final File file;
  final String website;
  final String location;
  final String about;
}
