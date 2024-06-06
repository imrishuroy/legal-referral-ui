part of 'post_bloc.dart';

enum DocumentType {
  initial,
  image,
  multiImage,
  video,
  document,
}

class PostState extends Equatable {
  const PostState({
    this.documentType = DocumentType.initial,
    this.documentFile = const [],
    this.filePath,
  });
  final DocumentType documentType;
  final List<File?> documentFile;
  final File? filePath;
  @override
  List<Object?> get props => [documentType, documentFile, filePath];

  PostState copyWith({
    DocumentType? documentType,
    List<File?>? documentFile,
    File? filePath,
  }) {
    return PostState(
      documentType: documentType ?? this.documentType,
      documentFile: documentFile ?? this.documentFile,
      filePath: filePath,
    );
  }
}
