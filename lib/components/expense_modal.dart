import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseModal extends StatefulWidget {
  const ExpenseModal({super.key});

  @override
  State<ExpenseModal> createState() => _ExpenseModalState();
}

class _ExpenseModalState extends State<ExpenseModal> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _amountController.dispose();
  }

  void _openDatePicker() async {
    var firstDate = DateTime(DateTime.now().year - 1);
    var lastDate = DateTime.now();

    var selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    labelText: 'Amount',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate != null
                          ? formatter.format(_selectedDate!)
                          : 'No Date Chosen',
                    ),
                    IconButton(
                      onPressed: _openDatePicker,
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Save Expense',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
