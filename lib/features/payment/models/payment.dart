// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/rendering.dart';

class Payment {
  final int id;
  final int studentId;
  final int paymentId;
  // final String? refNo;
  final String amtPaid;
  final String balance;
  final bool paid;
  final bool orderConfirm;
  final int studentMyClassId;
  final String year;
  final int monthNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Payment({
    required this.id,
    required this.studentId,
    required this.paymentId,
    // this.refNo,
    required this.amtPaid,
    required this.balance,
    required this.paid,
    required this.orderConfirm,
    required this.studentMyClassId,
    required this.year,
    required this.monthNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  Payment copyWith({
    int? id,
    int? studentId,
    String? refNo,
    String? amtPaid,
    String? balance,
    bool? paid,
    bool? orderConfirm,
    int? studentMyClassId,
    String? year,
    int? monthNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Payment(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      paymentId: paymentId,
      // refNo: refNo ?? this.refNo,
      amtPaid: amtPaid ?? this.amtPaid,
      balance: balance ?? this.balance,
      paid: paid ?? this.paid,
      orderConfirm: orderConfirm ?? this.orderConfirm,
      studentMyClassId: studentMyClassId ?? this.studentMyClassId,
      year: year ?? this.year,
      monthNumber: monthNumber ?? this.monthNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'student_id': studentId,
      'payment_id': paymentId,
      // 'ref_no': refNo,
      'amt_paid': amtPaid,
      'balance': balance,
      'paid': paid ? 1 : 0,
      'order_confirm': orderConfirm ? 1 : 0,
      'student_my_class_id': studentMyClassId,
      'year': year,
      'month_number': monthNumber,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    debugPrint(map.toString());
    return Payment(
      id: map['id'] as int,
      paymentId: map['payment_id'] as int,
      studentId: map['student_id'] as int,
      // refNo: map['ref_no'] != null ? map['ref_no'] as String : null,
      amtPaid: map['amt_paid'] as String,
      balance: map['balance'] as String,
      paid: map['paid'] == 1,
      orderConfirm: map['order_confirm'] == 1,
      studentMyClassId: map['student_my_class_id'] as int,
      year: map['year'] as String,
      monthNumber: map['month_number'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Payment(id: $id, studentId: $studentId, amtPaid: $amtPaid, balance: $balance, paid: $paid, orderConfirm: $orderConfirm, studentMyClassId: $studentMyClassId, year: $year, monthNumber: $monthNumber, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Payment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.studentId == studentId &&
        // other.refNo == refNo &&
        other.amtPaid == amtPaid &&
        other.balance == balance &&
        other.paid == paid &&
        other.orderConfirm == orderConfirm &&
        other.studentMyClassId == studentMyClassId &&
        other.year == year &&
        other.monthNumber == monthNumber &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        studentId.hashCode ^
        // refNo.hashCode ^
        amtPaid.hashCode ^
        balance.hashCode ^
        paid.hashCode ^
        orderConfirm.hashCode ^
        studentMyClassId.hashCode ^
        year.hashCode ^
        monthNumber.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
