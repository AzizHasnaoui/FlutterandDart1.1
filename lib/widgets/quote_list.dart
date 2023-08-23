// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quote_app/main.dart';

class Cards extends StatelessWidget {
  final String varQuote;
  final String varAuthor;
  final Function deletQuote;
  final Quotes item;

  const Cards({
    super.key,
    required this.varQuote,
    required this.varAuthor,
    required this.deletQuote,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Card(
        margin: EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0)),
        color: Color.fromRGBO(56, 69, 136, 1),
        shadowColor: Colors.amber[200],
        elevation: 25.0,
        child: Container(
          padding: EdgeInsets.all(11.0),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  varQuote,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      deletQuote(item);
                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                    color: Colors.red[100],
                  ),
                  Text(
                    varAuthor,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
