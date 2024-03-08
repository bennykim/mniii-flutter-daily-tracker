import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/models/cost/expense.dart';
import 'package:mniii_flutter_daily_tracker/widgets/cost/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, idx) => Dismissible(
        key: ValueKey(expenses[idx]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[idx]);
        },
        child: ExpenseItem(
          expenses[idx],
        ),
      ),
    );
  }
}
