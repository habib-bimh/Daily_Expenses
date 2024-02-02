import 'package:flutter/material.dart';
import 'package:udam_course_modul_5/model/expense.dart';

import 'expenses_item.dart';


class ExpenseList extends StatelessWidget {  
  ExpenseList({super.key, required this.expense});
  final List<Expense> expense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context,index){
       return ExpenseItem(expense[index]);
    });
  }
}
