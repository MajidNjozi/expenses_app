import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction.dart';

void main(List<String> args) {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  var currency = 'Tsh ';
  var transactions = [
    Transaction(
      id: 'T1',
      title: 'New Shoes',
      amount: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'New Phone',
      amount: 500,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent[700],
          title: const Text(
            'Expenses App',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              child: const Card(
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Chart",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                margin: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        label: Text('Title'),
                      ),
                    ),
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        label: Text('Amount'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                      child: Text(
                        'Add Transaction',
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: (transactions.map((tx) {
                return SizedBox(
                  height: 80,
                  width: 50,
                  child: Card(
                      margin: const EdgeInsets.all(10),
//color: Colors.blue,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(style: BorderStyle.solid)),
                            margin: const EdgeInsets.all(12),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              '$currency ${tx.amount}',
                              style: TextStyle(
                                color: Colors.orangeAccent[700],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            //padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.title,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                    DateFormat.yMMMEd().format(
                                      tx.date,
                                    ),
                                    style: const TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      )),
                );
              }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
