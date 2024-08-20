import 'package:expense_tracker/enums/expense_category.dart';
import 'package:uuid/uuid.dart';

Uuid _uuid = const Uuid();

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
}
