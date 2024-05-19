import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'success.dart';
import 'variable.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  String sendedotp = "";
  bool otpSent = false;
  TextEditingController email = TextEditingController();
  TextEditingController otp = TextEditingController();

  Future<void> generateOTP() async {
    if (email.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Email field cannot be empty.'),
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
      return;
    }

    try {
      final uri = ip + "otp.php";

      Map<String, dynamic> otp = {
        'email': email.text,
      };

      final response = await http.post(
        Uri.parse(uri),
        body: otp,
      );

      sendedotp = response.body;
      otpSent = true;
      print(sendedotp);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('OTP Successfully Sent'),
            content: Text('Please check your email and enter the code to proceed'),
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

  Future<void> verifyOTP() async {
    if (email.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Email field cannot be empty.'),
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
      return;
    }

    if (!otpSent) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please send OTP before verifying.'),
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
      return;
    }

    if (otp.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('OTP field cannot be empty.'),
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
      return;
    }

    if (otp.text.toString() == sendedotp) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('OTP verified successfully'),
            content: Text('Enter OK to Proceed'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  uploaduser();
                  clear();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Success()));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      print("TAMA DIN");
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Wrong OTP'),
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
      print("Mali bobo");
    }
  }

  Future<void> uploaduser() async {
    final uri = ip + "upload.php";

    Map<String, dynamic> userform = {
      'fullname': pendingfullname,
      'course_year_section': pendingcourse_year_section,
      'home_address': pendinghome_address,
      'phone_number': pendingphone_number,
      'identity': pendingidentity, // Getting the identity
      'incident_date': pendingincident_date,
      'incident_time': pendingincident_time,
      'incident_location': pendingincident_location,
      'incident_description': pendingincident_description,
    };

    final response = await http.post(
      Uri.parse(uri),
      body: userform,
    );

    print(response.body);
  }

  void clear() {
    pendingfullname = "";
    pendingcourse_year_section = "";
    pendinghome_address = "";
    pendingphone_number = "";
    pendingidentity = "";
    pendingincident_date = "";
    pendingincident_time = "";
    pendingincident_location = "";
    pendingincident_description = "";
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Align the column vertically in the center
        children: [
          Center(
            child: Column(
              children: [
                Text("VERIFICATION", style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Container(
                  width: 200, // Adjust the width of the TextField as needed
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Enter your email here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.green,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            generateOTP();
                          });
                        },
                        child: Text(
                          'SEND OTP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200, // Adjust the width of the TextField as needed
                  child: TextField(
                    controller: otp,
                    decoration: InputDecoration(
                      hintText: 'Enter code here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.green,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            verifyOTP();
                          });
                        },
                        child: Text(
                          'VERIFY',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 40,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HCC-PoD'),
          ],
        ),
      ),
    );
  }
}
