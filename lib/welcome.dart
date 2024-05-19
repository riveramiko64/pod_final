import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 243, 245, 1),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(

              children: [
                SizedBox(height: 220,),
                Image.asset('assets/hcclogo1.png',height: 150,),
                Text('Fides • Caritas • Libertas'),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(child:
                  Column(
                    children: [
                      Text('Welcome to HCC-PoD',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Text('Report a Incident on your School',style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                      Text('Anywhere with you phone.',style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                    ],
                  )


                  ),
                ),




                SizedBox(height: 25,),

                Container(
                  width: 200,
                  height: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.green  ,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Homepage()), (route) => false);
                        },
                        child: Text(
                          'GET STARTED',
                          style: TextStyle(color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                ),




              ],
            ),
          ),
          // Add spacer to push the footer to the bottom of the screen

        ],
      ),

    );
  }
}
