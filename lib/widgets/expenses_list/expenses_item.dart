

import 'package:flutter/material.dart';
import 'package:udam_course_modul_5/model/expense.dart';

class ExpenseItem extends StatelessWidget { 
  ExpenseItem(this.expense,{super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
   return  Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16
      
      ),
      child: Column(
        
        children: [
          Text(expense.titel),
          SizedBox(height: 4,),
          Row(
            children: [
              Text("\$${expense.amount.toStringAsFixed(2)}"),
              Spacer(),
              Row(children: [
                Icon(categoryIcon[expense.category]),
                SizedBox(width: 8,),
                Text(expense.formattedDate)
              ],)
            ],
          )
        ],
      ),
    ),
     );
    
  }
}


