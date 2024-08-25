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
      builder: (ctx) => ExpenseModal(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    var index = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget displayedContent = const Center(
      child: Text(
        'No expenses found yet. Start adding some!',
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      displayedContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
            child: displayedContent,
          ),
        ],
      ),
    );
  }
}
