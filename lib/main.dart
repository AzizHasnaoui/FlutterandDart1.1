// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quote_app/widgets/quote_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizzApp(),
    );
  }
}

class Quotes {
  String quote;
  String author;

  Quotes({required this.quote, required this.author});
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({super.key});

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  // create 2 controllers to get the text from the textfield

  final myController = TextEditingController();
  final myController1 = TextEditingController();

  List quotesList = [];

// To add new card-quote to the main screen when clicking on "ADD" in showModalBottomSheet

  typeFunc() {
    setState(() {
      quotesList
          .add(Quotes(quote: myController.text, author: myController1.text));
    });
  }
// To delete card-quote when clicking on delete icon

  deletQuote(Quotes item) {
    setState(() {
      quotesList.remove(item);
    });
  }
// To clear all cards when clicking on delete icon

  deleteAllQuote() {
    setState(() {
      quotesList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 69, 136, 1),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 28.0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              deleteAllQuote();
            },
            icon: Icon(Icons.delete_forever),
            color: Colors.red[100],
            iconSize: 30.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...quotesList
                .map((item) => Cards(
                    // To pass the( item inside the list) to "quote_list" file

                    item: item,
                    varQuote: item.quote,
                    varAuthor: item.author,
                    // To pass (the delete function) to "quote_list" file

                    deletQuote: deletQuote))
                .toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: false,
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      maxLength: 50,
                      controller: myController,
                      decoration: InputDecoration(hintText: "Type quote here"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      maxLength: 20,
                      controller: myController1,
                      decoration:
                          InputDecoration(hintText: "Type quote author"),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          typeFunc();
                          Navigator.pop(context);
                        },
                        child: Text("ADD"))
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
