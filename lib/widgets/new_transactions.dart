import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//
class NewTransactions extends StatefulWidget {
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  //late String _titleInput;
  //late String _amountInput;
  final _titleInput = TextEditingController();
  final _amountInput = TextEditingController();

  void _submitData() {
    //To validate that there is an input in the textfiled before pressing enter.
    final enteredAmount = double.parse(_amountInput.text);
    final enteredTitle = _titleInput.text;

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    //to remove the sheet when enter of addtransaction is pressed.
    Navigator.of(context).pop();
  }

  //Datepicker function
  //.then is a future function, as the name implies, it does things in the future.
  void _PresentDatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        //Todo// Do the Datepicker
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _titleInput,
              onSubmitted: (_) => _submitData(),
              keyboardType: TextInputType.name,
              //Fetching the user input.
              /*onChanged: (val) {
                        _titleInput = val;
                      }, */
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _amountInput,
              //when the enter button is pressed on the keyboard.
              onSubmitted: (_) => _submitData(),
              keyboardType: TextInputType.number,
              //Fetching the user input.
              // onChanged: (val) => _amountInput = val,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            Container(
              height: 70,
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    //TODO implement the datapicker
                    Text("No date Chosen"),
                    FlatButton(
                      onPressed: _PresentDatepicker,
                      child: const Text(
                        "Choose Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
