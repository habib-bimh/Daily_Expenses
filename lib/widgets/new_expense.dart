import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:udam_course_modul_5/model/expense.dart';
//import 'package:udam_course_modul_5/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<StatefulWidget> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titellController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }
   void _showDialog(){
    if (Platform.isIOS){
     showCupertinoDialog(context: context,
      builder:(v)=> CupertinoAlertDialog(
        title: Text("Invalide Inpute"),
              content: Text(
                  "please make sure a valid titel, amount, date  and category was enterd"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Okey"))
              ],
      )
     );
    }
    else {
      showDialog(
          useSafeArea: true,
          context: context,
          builder: (context) {
            return AlertDialog(
              title:const  Text("Invalide Inpute"),
              content: const Text(
                  "please make sure a valid titel, amount, date  and category was enterd"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Okey"))
              ],
            );
          });
    }
   }

  void _submitExpenseData() {
    final enturendAmount = double.tryParse(_amountController.text);
    final amountisInvalide = enturendAmount == null || enturendAmount <= 0;
    if (_titellController.text.trim().isEmpty ||
        amountisInvalide ||
        _selectedDate == null) {
      _showDialog();
      return;
    }
    widget.onAddExpense(
      Expense(
          titel: _titellController.text,
          amount: enturendAmount,
          date: _selectedDate!,
          category: _slectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titellController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Category _slectedCategory = Category.leisur;

  @override
  Widget build(BuildContext context) {
    final KeyboardSpeach = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, KeyboardSpeach + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titellController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text("Titel"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            label: Text("Amount"),
                            prefixText: "\$ ",
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: _titellController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text("Titel"),
                    ),
                  ),
                if(width >= 600)
                Row(children: [
                  DropdownButton(
                        value: _slectedCategory,
                        items: Category.values
                            .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase())))
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _slectedCategory = value;
                          });
                        }),
                        const SizedBox(width: 24,),
                          Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null
                            ? "No date Selected"
                            : formatter.format(_selectedDate!)),
                        IconButton(
                            onPressed: () {
                              _presentDatePicker();
                            },
                            icon: Icon(Icons.calendar_month))
                      ],
                    ))
                ],)
                else
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("Amount"),
                          prefixText: "\$ ",
                        ),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null
                            ? "No date Selected"
                            : formatter.format(_selectedDate!)),
                        IconButton(
                            onPressed: () {
                              _presentDatePicker();
                            },
                            icon: Icon(Icons.calendar_month))
                      ],
                    ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                if(width >= 600)
                Row(children: [
                  const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cencle"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _submitExpenseData();
                        },
                        child: Text("Save Expense")),
                ],)
                else
                Row(
                  children: [
                    DropdownButton(
                        value: _slectedCategory,
                        items: Category.values
                            .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase())))
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _slectedCategory = value;
                          });
                        }),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cencle"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _submitExpenseData();
                        },
                        child: Text("Save Expense")),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
