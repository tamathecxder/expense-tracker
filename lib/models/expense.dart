import 'package:expense_tracker/enums/expense_category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

Uuid _uuid = const Uuid();

final formatter = DateFormat('dd/MM/yyyy');

const Map<ExpenseCategory, IconData> categoryIcons = {
  ExpenseCategory.food: Icons.restaurant_outlined,
  ExpenseCategory.travel: Icons.flight_takeoff,
  ExpenseCategory.leisure: Icons.movie_outlined,
  ExpenseCategory.work: Icons.work_outline,
  ExpenseCategory.other: Icons.miscellaneous_services_sharp,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = _uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate => formatter.format(date);
}
