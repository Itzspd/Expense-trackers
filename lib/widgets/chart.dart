import 'package:intl/intl.dart';
import '../models/Transactions.dart';
import 'package:flutter/material.dart';
import './chart_Bar.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  Chart(this.recentTransactions);
//To generate a list of weekdays from monday to sunday.
  Iterable<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      //Generating the weekday shortText.
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalsum = 0.0;
      //For loop to loop through the weekdays.
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].datetime.day == weekday.day &&
            recentTransactions[i].datetime.month == weekday.month &&
            recentTransactions[i].datetime.year == weekday.year) {
          totalsum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekday).substring(0, 1));
      print(totalsum);
      //Dateformat.E() for the shorthand of weeekdays.
      return {
        "Day": DateFormat.E().format(weekday).substring(0, 1),
        "amount": totalsum,
      };
    }).reversed.toList();
  }

  double get totalspending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['Day'].toString(),
                    (data['amount'] as double),
                    totalspending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalspending),
              );
            }).toList()),
      ),
    );
  }
}
