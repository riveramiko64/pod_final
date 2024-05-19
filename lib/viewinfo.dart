import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'success.dart';
import 'verify.dart';
import 'main.dart';
import 'variable.dart';


enum UserType { student, employee, visitor }

class ViewInformation extends StatefulWidget {
  const ViewInformation({super.key});

  @override
  State<ViewInformation> createState() => _ViewInformationState();
}

class _ViewInformationState extends State<ViewInformation> {



  DateTime? _selectedDate;

  TimeOfDay? _selectedTime;
  TextEditingController incidentdescrip = TextEditingController(text: pendingincident_description);
  TextEditingController idenity = TextEditingController(text: pendingidentity);
  TextEditingController locationincident = TextEditingController(text: pendingincident_location);
  TextEditingController fullname = TextEditingController(text: pendingfullname);
  TextEditingController coursegradesec = TextEditingController(text: pendingcourse_year_section);
  TextEditingController address = TextEditingController(text: pendinghome_address);
  TextEditingController phonenumber = TextEditingController(text: pendingphone_number);
  TextEditingController dateinput = TextEditingController(text: pendingincident_date);
  TextEditingController timeinput = TextEditingController(text: pendingincident_time);
  UserType? _userType;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), // Set the last selectable date to today's date
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 243, 245, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [

                    SizedBox(height: 10,),
                    Text('(Check if your informations are correct.)',style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), // Outline border color
                  color: Colors.green, // Fill color
                  borderRadius: BorderRadius.circular(5), // Optional: border radius
                ),
                child: Row(
                  children: [
                    Column(
                      children: [

                        Text('   Personal Information',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10, top: 10,bottom: 10 ),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Full Name: ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),


                    TextField(
                      readOnly: true, // Make the TextField read-only
                      maxLines: null,
                      controller: fullname,
                      style: TextStyle(color: Colors.black87), // Set text color to black
                      decoration: InputDecoration(
                        hintText: '',
                        border: UnderlineInputBorder(),
                        disabledBorder: UnderlineInputBorder( // Define disabled border style
                          borderSide: BorderSide(color: Colors.grey), // Set border color for disabled state
                        ),
                        suffixIcon: Icon(Icons.edit_off_rounded, color: Colors.grey), // Optional: Add lock icon to indicate disabled state
                      ),
                    ),


                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Text('Course/Year & Sec. : ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),

                    TextField(
                      readOnly: true, // Make the TextField read-only
                      maxLines: null,
                      controller: coursegradesec,
                      style: TextStyle(color: Colors.black87), // Set text color to black
                      decoration: InputDecoration(
                        hintText: '',
                        border: UnderlineInputBorder(),
                        disabledBorder: UnderlineInputBorder( // Define disabled border style
                          borderSide: BorderSide(color: Colors.grey), // Set border color for disabled state
                        ),
                        suffixIcon: Icon(Icons.edit_off_rounded, color: Colors.grey), // Optional: Add lock icon to indicate disabled state
                      ),
                    ),

                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Text('Home Address  : ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),

                    TextField(
                      readOnly: true, // Make the TextField read-only
                      maxLines: null,
                      controller: address,
                      style: TextStyle(color: Colors.black87), // Set text color to black
                      decoration: InputDecoration(
                        hintText: '',
                        border: UnderlineInputBorder(),
                        disabledBorder: UnderlineInputBorder( // Define disabled border style
                          borderSide: BorderSide(color: Colors.grey), // Set border color for disabled state
                        ),
                        suffixIcon: Icon(Icons.edit_off_rounded, color: Colors.grey), // Optional: Add lock icon to indicate disabled state
                      ),
                    ),

                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Text('Phone Number : ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),


                    TextField(
                      readOnly: true,
                      maxLines: null,
                      keyboardType: TextInputType.phone, // Set keyboard type to phone
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Allow only digits
                        LengthLimitingTextInputFormatter(11), // Limit length to 11 digits
                      ],
                      controller: phonenumber,
                      decoration: InputDecoration(
                        hintText: '',
                        border: UnderlineInputBorder(),
                        disabledBorder: UnderlineInputBorder( // Define disabled border style
                          borderSide: BorderSide(color: Colors.grey), // Set border color for disabled state
                        ),
                        suffixIcon: Icon(Icons.edit_off_rounded, color: Colors.grey),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            Text('Profile :', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          readOnly: true, // Make the TextField read-only
                          maxLines: null,
                          controller: idenity,
                          style: TextStyle(color: Colors.black87), // Set text color to black
                          decoration: InputDecoration(
                            hintText: '',
                            border: UnderlineInputBorder(),
                            disabledBorder: UnderlineInputBorder( // Define disabled border style
                              borderSide: BorderSide(color: Colors.grey), // Set border color for disabled state
                            ),
                            suffixIcon: Icon(Icons.edit_off_rounded, color: Colors.grey), // Optional: Add lock icon to indicate disabled state
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), // Outline border color
                  color: Colors.green, // Fill color
                  borderRadius: BorderRadius.circular(5), // Optional: border radius
                ),
                child: Row(
                  children: [
                    Column(
                      children: [

                        Text('   INFORMATION ABOUT THE INCIDENT',style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)
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
                          'Date of Incident :',style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      readOnly: true, // Make the TextField read-only
                      maxLines: null,
                      controller: dateinput,
                      style: TextStyle(color: Colors.black87), // Set text color to black
                      decoration: InputDecoration(
                        hintText: '',
                        border: UnderlineInputBorder(),
                        disabledBorder: UnderlineInputBorder( // Define disabled border style
                          borderSide: BorderSide(color: Colors.grey), // Set border color for disabled state
                        ),
                        suffixIcon: Icon(Icons.edit_off_rounded, color: Colors.grey), // Optional: Add lock icon to indicate disabled state
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
                            'Time of Incident :',style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextField(
                        readOnly: true, // Make the TextField read-only
                        maxLines: null,
                        controller: timeinput,
                        style: TextStyle(color: Colors.black87), // Set text color to black
                        decoration: InputDecoration(
                          hintText: '',
                          border: UnderlineInputBorder(),
                          disabledBorder: UnderlineInputBorder( // Define disabled border style
                            borderSide: BorderSide(color: Colors.grey), // Set border color for disabled state
                          ),
                          suffixIcon: Icon(Icons.edit_off_rounded, color: Colors.grey), // Optional: Add lock icon to indicate disabled state
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Location of Incident : ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),

                    TextField(
                      readOnly: true, // Make the TextField read-only
                      maxLines: null,
                      controller: locationincident,
                      style: TextStyle(color: Colors.black87), // Set text color to black
                      decoration: InputDecoration(
                        hintText: '',
                        border: UnderlineInputBorder(),
                        disabledBorder: UnderlineInputBorder( // Define disabled border style
                          borderSide: BorderSide(color: Colors.grey), // Set border color for disabled state
                        ),
                        suffixIcon: Icon(Icons.edit_off_rounded, color: Colors.grey), // Optional: Add lock icon to indicate disabled state
                      ),
                    ),

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Expanded(child: Text('Description of Incident :',style: TextStyle(fontSize: 15,),)),
                      ],
                    ),
                    TextField(
                      readOnly: true, // Make the TextField read-only
                      maxLines: null,
                      controller: incidentdescrip,
                      style: TextStyle(color: Colors.black87), // Set text color to black
                      decoration: InputDecoration(
                        hintText: '',
                        border: UnderlineInputBorder(),
                        disabledBorder: UnderlineInputBorder( // Define disabled border style
                          borderSide: BorderSide(color: Colors.grey), // Set border color for disabled state
                        ),
                        suffixIcon: Icon(Icons.edit_off_rounded, color: Colors.grey), // Optional: Add lock icon to indicate disabled state
                      ),
                    ),


                  ],
                ),
              ),
            ),



            SizedBox(height: 40,),



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
                        color: Colors.green  ,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Verify()),
                                  // Replace all routes until this condition is met (in this case, always return false to replace all routes)
                            );

                          },
                          child: Text(
                            'CONFIRM',
                            style: TextStyle(color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                  ),





                ],
              ),
            ),
            SizedBox(height: 30,),
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
