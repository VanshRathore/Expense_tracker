import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widget/chart/chart.dart';

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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerdExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerdExpense.indexOf(expense);
    setState(() {
      _registerdExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                _registerdExpense.insert(expenseIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('NO expenses found. start adding some.'),
    );
    if (_registerdExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerdExpense,
        onRemoveExpense: _removeExpense,
      );
    }
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
          Chart(expenses: _registerdExpense),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
