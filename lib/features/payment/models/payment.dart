// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/rendering.dart';

class Payment {
  final int id;
  final int studentId;
  final int paymentId;
  // final String? refNo;
  final String amtPaid;
  final DateTime paymentDate;
  final int billNumber;

  const Payment({
    required this.id,
    required this.studentId,
    required this.paymentId,
    required this.amtPaid,
    required this.billNumber,
    required this.paymentDate,
  });

  Payment copyWith({
    int? id,
    int? studentId,
    String? amtPaid,
    int? billNumber,
    DateTime? paymentDate,
  }) {
    return Payment(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      paymentId: paymentId,
      amtPaid: amtPaid ?? this.amtPaid,
      billNumber: billNumber?? this.billNumber,
      paymentDate: paymentDate?? this.paymentDate
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'student_id': studentId,
      'payment_id': paymentId,
      'amount': amtPaid,
      'bill_number':billNumber,
      'payment_date':paymentDate.toIso8601String()
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    debugPrint(map.toString());
    return Payment(
      id: map['payment_id'] as int,
      paymentId: map['payment_id'] as int,
      studentId: map['student_id'],
      amtPaid: map['amount'].toString(),
      billNumber: int.parse(map['bill_number']),
      paymentDate: DateTime.parse(map['payment_date'].toString())
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Payment(id: $id, studentId: $studentId, amtPaid: $amtPaid,billNumber $billNumber,paymentDate $paymentDate)';
  }

  @override
  bool operator ==(covariant Payment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.studentId == studentId &&
        other.amtPaid == amtPaid &&
        other.billNumber == billNumber &&
        other.paymentDate == paymentDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        studentId.hashCode ^
        amtPaid.hashCode ^
    billNumber.hashCode ^
    paymentDate.hashCode;
  }
}
