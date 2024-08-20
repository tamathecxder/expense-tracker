import 'package:uuid/uuid.dart';

Uuid _uuid = const Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = _uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
}
