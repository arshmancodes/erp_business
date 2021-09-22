class CertificateModel {
  int? id;
  String? title;
  String? description;
  String? date;

  CertificateModel({
    this.description,
    this.id,
    this.date,
    this.title,
  });

  CertificateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
  }
}
