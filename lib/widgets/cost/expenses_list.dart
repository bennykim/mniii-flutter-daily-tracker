import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/models/cost/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesList({
    super.key,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, idx) => Text(expenses[idx].title),
    );
  }
}
