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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    // TODO: THEMEING
                    color: const Color.fromRGBO(133, 200, 101, 1),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            //Amount Border
                            border: Border.all(
                              //Boder color
                              color: Colors.white,
                              //Border size
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            //'\$' + tx.amount.toString(),
                            //tostringAsfixed for how many decimal places.
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              DateFormat.yMMMEd()
                                  .add_Hm()
                                  .format(transactions[index].datetime),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
