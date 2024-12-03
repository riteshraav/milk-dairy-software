import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mild_dairy_web/model/appbar.dart';
import 'package:mild_dairy_web/services/customer_service.dart';

import '../model/admin.dart';
import '../model/logout.dart';
import '../model/toast.dart';

class AddCustomer extends StatefulWidget {
  final Admin admin;
  const AddCustomer(this.admin);



  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {


  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String milkType = 'Cow';


  TextEditingController calculateRate(int quantity,int fat) {

    int value = quantity * fat * 50;
    return TextEditingController(text: value.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add Customer',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone No.',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  DropdownButton<String>(
                    value: milkType,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        milkType = newValue!;
                      });
                    },
                    items: <String>['Cow', 'Buffalo']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                    addCustomer(nameController.text, phoneController.text, milkType,widget.admin.name);
                    showToast("Customer saved");

                    },
                    child: Text('Save Customer'),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 40,
            child: GestureDetector(
              onTap: () => logout(context),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
