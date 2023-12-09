// To parse this JSON data, do
//
//     final financialModel = financialModelFromJson(jsonString);

import 'dart:convert';

FinancialModel financialModelFromJson(String str) => FinancialModel.fromJson(json.decode(str));

String financialModelToJson(FinancialModel data) => json.encode(data.toJson());

class FinancialModel {
  int totalAmount;
  int targetAmount;
  int contribution;
  String targetDate;

  FinancialModel({
    required this.totalAmount,
    required this.targetAmount,
    required this.contribution,
    required this.targetDate,
  });

  factory FinancialModel.fromJson(Map<String, dynamic> json) => FinancialModel(
    totalAmount: json["totalAmount"],
    targetAmount: json["targetAmount"],
    contribution: json["contribution"],
    targetDate: json["targetDate"],
  );

  Map<String, dynamic> toJson() => {
    "totalAmount": totalAmount,
    "targetAmount": targetAmount,
    "contribution": contribution,
    "targetDate": targetDate,
  };
}
