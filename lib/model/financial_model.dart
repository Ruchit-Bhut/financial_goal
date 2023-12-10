// To parse this JSON data, do
//
//     final financialModel = financialModelFromJson(jsonString);

import 'dart:convert';

FinancialModel financialModelFromJson(String str) =>
    FinancialModel.fromJson(json.decode(str));

String financialModelToJson(FinancialModel data) => json.encode(data.toJson());

class FinancialModel {
  int totalAmount;
  int targetAmount;
  int contribution;
  int salary;
  int allExpenses;
  int houseRent;
  String targetDate;

  FinancialModel({
    required this.totalAmount,
    required this.targetAmount,
    required this.contribution,
    required this.targetDate,
    required this.allExpenses,
    required this.houseRent,
    required this.salary,
  });

  factory FinancialModel.fromJson(Map<String, dynamic> json) => FinancialModel(
        totalAmount: json["totalAmount"],
        targetAmount: json["targetAmount"],
        contribution: json["contribution"],
        targetDate: json["targetDate"],
        salary: json['salary'],
        allExpenses: json['allExpenses'],
        houseRent: json['houseRent'],
      );

  Map<String, dynamic> toJson() => {
        "totalAmount": totalAmount,
        "targetAmount": targetAmount,
        "contribution": contribution,
        "targetDate": targetDate,
        "houseRent": houseRent,
        "allExpenses": allExpenses,
        "salary": salary,
      };
}
