import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'main.dart';



class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
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
              Image.asset('assets/hcclogo.png',height: 50,),
              Text('Holy Cross College',textAlign: TextAlign.center,),
              SizedBox(width: 15,),
            ],
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(

                children: [

                  Text('YOUR INCIDENT REPORT SUCCESSFULLY SENT',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  SizedBox(height: 8,),
                  Text('( Wait for further announcement on your Email and Phone Number. )',textAlign: TextAlign.center,style: TextStyle(fontSize: 11),),


                  SizedBox(height: 25,),

                  Container(
                    width: 120,
                    height: 35,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.redAccent  ,
                        child: TextButton(
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          child: Text(
                            'EXIT',
                            style: TextStyle(color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Set border radius to 10
                        ),
                      ),
                    ),
                    child: Text('Submit another report'),
                  ),
                  SizedBox(height: 20),



                ],
              ),
            ),
          ),
          // Add spacer to push the footer to the bottom of the screen

        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 45,
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
