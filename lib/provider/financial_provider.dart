
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_goal/model/financial_model.dart';
import 'package:flutter/material.dart';

class FinancialProvider with ChangeNotifier{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<FinancialModel> getFinancialData() {
  return _firestore.collection('financialgoal').doc('finance').snapshots().asyncMap((event){
      final financialModel = FinancialModel.fromJson(event.data()!);

      return financialModel;
    });

  }
}