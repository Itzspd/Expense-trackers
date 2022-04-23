import 'package:app_2/widgets/Transactions_list.dart';
import './widgets/chart.dart';
import './widgets/new_transactions.dart';
import 'package:flutter/material.dart';
import './models/Transactions.dart';

void main() => runApp(ExpenseTracker());

class ExpenseTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal ExpenseTracker',
      //Theme
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Transactions> _userTransactions = [
    /* Transactions(
      id: 't1',
      title: 'Shoes',
      amount: 50.0,
      datetime: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: 'clothes',
      amount: 65.9,
      datetime: DateTime.now(),
    ),
    */
  ];

  //List to showcase the chart in 7 days interval.
  List<Transactions> get _recentTransactions {
    //.where for list is used here to get only transactions withing 7days period.
    return _userTransactions.where((trans) {
      // will get the transactions before 7days.
      return trans.datetime.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

//Function to add new Transactions.
  void _addNewTransactions(String txTitle, double txAmount) {
    final newTx = Transactions(
      title: txTitle,
      amount: txAmount,
      datetime: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _AddTransaction_sheet(BuildContext ctx) {
    //To show a modal sheet, context and builder are a must.
    //Context requrires a build i.e BuildContext ctx.
    //Note bCtx is just a give a name to the anonymous function.
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            //To catch the tap event.
            behavior: HitTestBehavior.opaque,
            child: NewTransactions(_addNewTransactions),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //fontfamily For all other text.
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        //fontfamily For the appbar.
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () => _AddTransaction_sheet(context),
              icon: const Icon(
                Icons.add,
                color: Color.fromRGBO(59, 124, 44, 1),
              ),
            )
          ],
          title: const Text(
            'Expense Tracker',
            style: TextStyle(
              color: Color.fromRGBO(59, 124, 44, 1),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(_recentTransactions),
              const SizedBox(
                height: 10,
              ),
              TransactionsList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => _AddTransaction_sheet(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
