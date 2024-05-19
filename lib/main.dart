import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'verify.dart';
import 'viewinfo.dart';
import 'welcome.dart';
import 'package:http/http.dart' as http;
import 'variable.dart';

void main() {
  runApp(MaterialApp(home: Welcome(), debugShowCheckedModeBanner: false));
}

enum UserType { student, employee, visitor }

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<void> uploaduser() async {
    try {
      pendingfullname = fullname.text;
      pendingcourse_year_section = coursegradesec.text;
      pendinghome_address = address.text;
      pendingphone_number = phonenumber.text;
      pendingidentity = _userType.toString().split('.').last;
      pendingincident_date = _selectedDate?.toIso8601String() ?? '';
      pendingincident_time = _selectedTime?.format(context) ?? '';
      pendingincident_location = locationincident.text;
      pendingincident_description = descriptionincident.text;
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Something Went Wrong'),
            content: Text('Please try again'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  bool _privacy = false;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  TextEditingController locationincident = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController coursegradesec = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController descriptionincident = TextEditingController();
  UserType? _userType;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  bool _validateFields() {
    return fullname.text.isNotEmpty &&
        coursegradesec.text.isNotEmpty &&
        address.text.isNotEmpty &&
        phonenumber.text.isNotEmpty &&
        _userType != null &&
        _selectedDate != null &&
        _selectedTime != null &&
        locationincident.text.isNotEmpty &&
        descriptionincident.text.isNotEmpty &&
        _privacy;
  }

  void _showValidationError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Validation Error'),
          content: Text('Please fill in all the fields and agree to the privacy statement.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 243, 245, 1),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(242, 243, 245, 1),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/hcclogo.png', height: 50),
              Text('Holy Cross College', textAlign: TextAlign.center),
              SizedBox(width: 15),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Student Discipline Services Division',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      'INCIDENT REPORT FORM',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '   Personal Information',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Full Name: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    TextField(
                      maxLines: null,
                      controller: fullname,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Course/Year & Sec. : ',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    TextField(
                      maxLines: null,
                      controller: coursegradesec,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Home Address  : ',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    TextField(
                      maxLines: null,
                      controller: address,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Phone Number : ',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    TextField(
                      maxLines: null,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      controller: phonenumber,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Profile :', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          children: [
                            RadioListTile<UserType>(
                              title: Text('Student'),
                              value: UserType.student,
                              groupValue: _userType,
                              onChanged: (UserType? value) {
                                setState(() {
                                  _userType = value;
                                });
                              },
                            ),
                            RadioListTile<UserType>(
                              title: Text('Employee'),
                              value: UserType.employee,
                              groupValue: _userType,
                              onChanged: (UserType? value) {
                                setState(() {
                                  _userType = value;
                                });
                              },
                            ),
                            RadioListTile<UserType>(
                              title: Text('Visitor'),
                              value: UserType.visitor,
                              groupValue: _userType,
                              onChanged: (UserType? value) {
                                setState(() {
                                  _userType = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '   INFORMATION ABOUT THE INCIDENT',
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'Date of Incident :',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Select Date',
                            border: UnderlineInputBorder(),
                          ),
                          controller: TextEditingController(
                            text: _selectedDate == null ? '' : _selectedDate.toString().substring(0, 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            'Time of Incident :',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () => _selectTime(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Select Time',
                              border: UnderlineInputBorder(),
                            ),
                            controller: TextEditingController(
                              text: _selectedTime == null ? '' : _selectedTime!.format(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Location of Incident : ',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    TextField(
                      maxLines: null,
                      controller: locationincident,
                      decoration: InputDecoration(
                        hintText: 'Be specific',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Description of Incident :',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      maxLines: null,
                      controller: descriptionincident,
                      decoration: InputDecoration(
                        hintText: 'What happened or factors leading to the incident',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _privacy,
                            onChanged: (bool? value) {
                              if (value != null) {
                                setState(() {
                                  _privacy = value;
                                });
                              }
                            },
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Text(
                                    'I hereby confirm that all the information I provided to Holy Cross College is true and accurate. I understand that my data will be used for educational purposes only and will be protected according to data privacy laws. I authorize Holy Cross College to collect, process, and store my information.',
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.grey,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'CANCEL',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  Container(
                    width: 120,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.green,
                        child: TextButton(
                          onPressed: () {
                            if (_validateFields()) {
                              setState(() {
                                uploaduser();
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ViewInformation()),
                              );
                            } else {
                              _showValidationError();
                            }
                          },
                          child: Text(
                            'CONFIRM',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            BottomAppBar(
              height: 40,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HCC-PoD'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
