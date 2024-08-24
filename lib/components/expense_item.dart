import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Text(
              expense.title,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("\$${expense.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(expense.date.toString()),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
