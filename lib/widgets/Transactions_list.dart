import '../models/Transactions.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset('Assets/images/image/waiting.png'),
                )
              ],
            )
          : ListView.builder(
              //ListView.builder takes itembuilder and itemCount as a must have.
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].datetime),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
