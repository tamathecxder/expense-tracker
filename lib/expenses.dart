import 'package:expense_tracker/components/expense_modal.dart';
import 'package:expense_tracker/components/expenses_list.dart';
import 'package:expense_tracker/enums/expense_category.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Ayam Gepuk Pak Gembus',
      amount: 40000,
      date: DateTime.now(),
      category: ExpenseCategory.food,
    ),
    Expense(
      title: 'Buy Indie Merch',
      amount: 20000,
      date: DateTime.now(),
      category: ExpenseCategory.other,
    ),
    Expense(
      title: 'Cappucino',
      amount: 10000,
      date: DateTime.now(),
      category: ExpenseCategory.food,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const ExpenseModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
