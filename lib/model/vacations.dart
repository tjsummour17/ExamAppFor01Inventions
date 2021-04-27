import 'package:exam/res/const.dart';
import 'package:intl/intl.dart';

class Vacation {
  final int id;
  final String empInfo;
  final int empId;
  final DateTime fromDate;
  final DateTime toDate;
  bool? isApproved;
  final String? rejectionReason;

  Vacation({
    required this.id,
    required this.empInfo,
    required this.empId,
    required this.fromDate,
    required this.toDate,
    required this.isApproved,
    this.rejectionReason,
  });

  factory Vacation.fromJson(Map<String, dynamic> json) => Vacation(
      id: int.parse(json['id'].toString()),
      empInfo: json['empInfo'].toString(),
      empId: int.parse(json['empId'].toString()),
      fromDate: DateFormat(Const.dateFormat).parse(json['fromDate'].toString()),
      toDate: DateFormat(Const.dateFormat).parse(json['toDate'].toString()),
      isApproved: json['isTrainee'],
      rejectionReason: json['rejectionReason'].toString());
}
