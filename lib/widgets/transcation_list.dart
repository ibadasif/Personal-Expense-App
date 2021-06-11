import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;

  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: FittedBox(
                          child: Text(
                            'Rs ${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deletetx(transactions[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// return Card(
//   child: Row(
//     children: [
//       Container(
//         margin:
//             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         child: Text(
//           '\Rs ${transactions[index].amount.toStringAsFixed(2)}',
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.purple),
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(
//               color: Theme.of(context).primaryColor, width: 2),
//         ),
//         padding: EdgeInsets.all(10),
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             transactions[index].title,
//             style: Theme.of(context).textTheme.title,
//           ),
//           Text(
//             DateFormat.yMMMMd()
//                 .format(transactions[index].date),
//             style: TextStyle(
//                 color: Theme.of(context).primaryColor),
//           ),
//         ],
//       )
//     ],
//   ),
// );
