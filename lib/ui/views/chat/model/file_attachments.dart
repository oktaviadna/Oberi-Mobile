class FileAttachment {
  String? fileURL;
  String? fileName;
  String? fileNameWithExtension;
  int? fileSize;
  DateTime? createdAt;

  FileAttachment({
    this.fileURL,
    this.fileName,
    this.fileNameWithExtension,
    this.fileSize,
    this.createdAt,
  });

  factory FileAttachment.fromJson(Map<String, dynamic> json) {
    return FileAttachment(
      fileURL: json['original_url'],
      fileName: json['name'],
      fileNameWithExtension: json['file_name'],
      fileSize: json['size'],
      createdAt: DateTime.tryParse(json['created_at']),
    );
  }
}
