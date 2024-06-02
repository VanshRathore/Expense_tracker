import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenses, {super.key});

  final Expense expenses;

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
            Text(expenses.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${expenses.amount.toStringAsFixed(2)}')
              ],
            )
          ],
        ),
      ),
    );
  }
}
