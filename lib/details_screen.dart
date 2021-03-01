import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'adaptive_flat_button.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String name;
  String number;
  DateTime _selectedDate;
  String amount;
  String amountType;
  bool viewVisible = false;
  bool showSpinner = false;

  getCsv() async {
    // String data = name +
    //     number.toString() +
    //     _selectedDate.toString() +
    //     amount.toString() +
    //     amountType.toString();
    // List<List<dynamic>> rowsAsListOfValues =
    //     const CsvToListConverter().convert(data);
    // String csv = const ListToCsvConverter().convert(rowsAsListOfValues);
    List<List<dynamic>> rows = List<List<dynamic>>();

    List<dynamic> row = List();
    row.add(name);
    row.add(number);
    row.add(_selectedDate);
    row.add(amount);
    row.add(amountType);
    rows.add(row);

    rows.add(row);

    String csv = const ListToCsvConverter().convert(rows);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            reverse: false,
            primary: true,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Number'),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  number = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker)
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                onChanged: (value) {
                  amount = value;
                },
              ),
              Opacity(
                child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  label: Text('Add'),
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      viewVisible = true;
                    });
                  },
                ),
                opacity: viewVisible ? 0.0 : 1.0,
              ),
              SizedBox(
                height: 8.0,
              ),
              Opacity(
                opacity: viewVisible ? 1.0 : 0.0,
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Amount Type'),
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      amountType = value;
                    },
                  ),
                ),
              ),
              Opacity(
                child: FloatingActionButton.extended(
                  heroTag: "btn2",
                  onPressed: () {},
                  label: Text('Export'),
                ),
                opacity: viewVisible ? 1.0 : 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
