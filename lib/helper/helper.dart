import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getFormatString(int data,BuildContext context){
  final local = Localizations.maybeLocaleOf(context)!;
  String formattedValue =
  NumberFormat.decimalPattern(local.toLanguageTag(),)
      .format(data);
  return formattedValue;
}