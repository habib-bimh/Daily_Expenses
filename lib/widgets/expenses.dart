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
     showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context){
      return NewExpense(onAddExpense: _addExpense,);
     });
   }

  void _addExpense(Expense expense){
    setState(() {
      _registeredExpence.add(expense);
    });
   }
   void _removeExpense(Expense expense){
    final expensIndex = _registeredExpence.indexOf(expense);
     setState(() {
       _registeredExpence.remove(expense);
     });
     ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text("Expense delet"),
      action: SnackBarAction(label: 'Undo', onPressed:(){
       setState(() {
         _registeredExpence.insert(expensIndex, expense);
       });
      }),
      ));
   }

  @override
  Widget build(BuildContext context) {
     Widget maincontent = Center(child: Text("No expenses found. Start adding some!"),);
    if(_registeredExpence.isNotEmpty){
      maincontent= ExpenseList(expense:_registeredExpence,onRemoveExpense: _removeExpense,);
    }
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
         Expanded(
          child:maincontent )
         
        ],
      )),
    );
  }
}
