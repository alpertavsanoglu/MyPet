import 'package:flutter/material.dart';
import '../utils/app_export.dart';

import '../global.dart';
import '../classes/pet.dart';

class PetInfoPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final petInfo = ""; //pet info burada çekilecek
    final ownerInfo = accFound.getCommInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Information'),
      ),
      body: Container(
        color: Colors.white, // Set background color
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             
              SizedBox(height: 20),
              Text(
                'Sahip Bilgileri',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red, // Set text color
                ),
              ),
              Text(
                ownerInfo,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red, // Set text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}