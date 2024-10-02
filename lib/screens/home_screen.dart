import 'package:flutter/material.dart';
import 'package:vaanilai/screens/location_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'welcome to vaanilai',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 20,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/B612_20230603_181410_818.jpg'), // Your image asset path
            fit: BoxFit
                .cover, // You can change this to BoxFit.fill if you want to fill the container
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationScreen()),
              );
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(10),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(10), // Set margin to 16 pixels on all sides
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.red,
              ), // Set button background color
            ),
            child: Text('hello! click here,'),
          ),
        ),
      ),
    );
  }
}
