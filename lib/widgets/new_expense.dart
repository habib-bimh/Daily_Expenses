import 'package:flutter/material.dart';
import 'package:udam_course_modul_5/model/expense.dart';
//import 'package:udam_course_modul_5/model/expense.dart';

class NewExpense extends StatefulWidget {
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

  @override
  void dispose() {
    _titellController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Category _slectedCategory = Category.leisur;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titellController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Titel"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
         SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _slectedCategory,
                  items: Category.values.map((category) =>
                      DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()))).toList(),
                  onChanged: (value) {
                    if (value == null){
                      return ;
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
                    print(_titellController);
                    print(_amountController);
                  },
                  child: Text("Save Expense")),
            ],
          )
        ],
      ),
    );
  }
}
