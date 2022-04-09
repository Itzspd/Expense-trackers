import 'package:flutter/material.dart';

//
class NewTransactions extends StatefulWidget {
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  //late String titleInput;
  //late String amountInput;
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  void submitData() {
    //To validate that there is an input in the textfiled before pressing enter.
    final enteredAmount = double.parse(amountInput.text);
    final enteredTitle = titleInput.text;

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
              controller: titleInput,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.name,
              //Fetching the user input.
              /*onChanged: (val) {
                        titleInput = val;
                      }, */
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: amountInput,
              //when the enter button is pressed on the keyboard.
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
              //Fetching the user input.
              // onChanged: (val) => amountInput = val,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
