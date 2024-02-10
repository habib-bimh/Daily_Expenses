import 'package:flutter/material.dart';
import 'package:udam_course_modul_5/model/expense.dart';

import 'expenses_item.dart';


class ExpenseList extends StatelessWidget {  
  ExpenseList({super.key,
  required this.onRemoveExpense,
   required this.expense
   });
   final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context,index){
       return Dismissible(
        
        background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal,)),
        onDismissed: (direction){onRemoveExpense(expense[index]);},
        key:ValueKey(expense[index]) ,child: ExpenseItem(expense[index]));
    });
  }
}
