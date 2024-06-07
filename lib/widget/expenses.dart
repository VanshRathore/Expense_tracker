import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpense = [
    Expense(
      date: DateTime.now(),
      amount: 20.99,
      title: 'flutter module',
      category: Category.food,
    ),
    Expense(
      date: DateTime.now(),
      amount: 200.50,
      title: 'Ohio',
      category: Category.travel,
    ),
    Expense(
      date: DateTime.now(),
      amount: 10.2,
      title: 'haikyu',
      category: Category.leisure,
    ),
    Expense(
      date: DateTime.now(),
      amount: 4,
      title: 'workkkkkkkk',
      category: Category.work,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('the Chart'),
          Expanded(
            child: ExpensesList(
              expenses: _registerdExpense,
            ),
          )
        ],
      ),
    );
  }
}
