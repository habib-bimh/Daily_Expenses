import 'package:flutter/material.dart';
import 'package:udam_course_modul_5/widgets/expenses_list/expenses_list.dart';
import 'package:udam_course_modul_5/model/expense.dart';
import 'package:udam_course_modul_5/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpence = [
    Expense(
        titel: "Flutter course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        titel: "Cinema",
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisur)
  ];
   
   void _addEepensesOverly(){
     showModalBottomSheet(context: context, builder: (context){
      return NewExpense();
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expense Tracker"),
        actions: [
        IconButton(onPressed:(){
          _addEepensesOverly();
        }, icon:Icon(Icons.add))
      ]),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Expanded(child: ExpenseList(expense:_registeredExpence))
        ],
      )),
    );
  }
}
