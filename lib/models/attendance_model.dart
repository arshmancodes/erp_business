class AttendanceModel {
  int? id;
  int? userid;
  bool? attendance;
  String? date;

  AttendanceModel({this.attendance, this.date, this.id, this.userid});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    attendance = json['attendance'];
    date = json['date'];
  }
}
