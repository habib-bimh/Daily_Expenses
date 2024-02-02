import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();
enum Category { foot, travel, leisur, work }

const categoryIcon={
  Category.foot: Icons.lunch_dining,
  Category.leisur: Icons.movie,
  Category.travel:Icons.flight_takeoff,
  Category.work:Icons.work,
};

class Expense {
  Expense({
    required this.titel,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String id;
  final String titel;
  final double amount;
  final DateTime date;
  final Category category;

String get formattedDate{
  return formatter.format(date);
}

}
