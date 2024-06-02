import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
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
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('the hart.....'),
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
