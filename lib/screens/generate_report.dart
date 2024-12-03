import 'package:flutter/material.dart';

import '../model/admin.dart';
import '../model/appbar.dart';
import '../model/customer.dart';
import '../model/logout.dart';
import '../services/collection_service.dart';
import '../services/customer_service.dart';

class GenerateReport extends StatefulWidget {
  final Admin admin;
  const GenerateReport(this.admin);

  @override
  State<GenerateReport> createState() => _GenerateReportState();
}

class _GenerateReportState extends State<GenerateReport> {


  final TextEditingController quantityController = TextEditingController();

  final TextEditingController valueController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController animalController = TextEditingController();
  double? fat,quantity ;
  List<double>? info;
  Customer? customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [

          Center(
            child: Column(
              children: [
                Container(
                  width: 400,
                  child: TextField(
                    controller : searchController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    customer = await findCustomerFromData(int.parse(searchController.text));
                    info = await findTotalValueByCustomerAndAnimal(customer?.c_id, customer?.animal);

                    if(customer != null) {
                      nameController.text = customer!.name!;
                      animalController.text = customer!.animal!;
                      quantityController.text = info!.elementAt(0).toString();
                      valueController.text = info!.elementAt(1).toString();
                    }
                    print('Search button clicked!');
                  },
                  child: Text('Search'),
                ),
                SizedBox(height: 20),
                Container(
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
                        'Milk Collection',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        enabled: false,
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Customer name',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0), // Rounded corners
                            borderSide: BorderSide.none, // No border
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600, // Slightly bold text
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextField(
                        //enabled: false,
                        readOnly: true,
                        controller: animalController,
                        decoration: InputDecoration(
                          labelText: 'Animal name',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0), // Rounded corners
                            borderSide: BorderSide.none, // No border
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600, // Slightly bold text
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        //enabled: false,
                        readOnly: true,
                        controller: quantityController,
                        decoration: InputDecoration(
                          labelText: 'Quanitty(L)',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0), // Rounded corners
                            borderSide: BorderSide.none, // No border
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600, // Slightly bold text
                        ),
                      ),
                      SizedBox(height: 20,),

                      TextField(
                        //enabled: false,
                        readOnly: true,
                        controller: valueController,
                        decoration: InputDecoration(
                          labelText: 'Total value of collected milk',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0), // Rounded corners
                            borderSide: BorderSide.none, // No border
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600, // Slightly bold text
                        ),
                      ),

                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          setState(() async {
                            valueController.clear();
                            quantityController.clear();
                            nameController.clear();
                            animalController.clear();
                            searchController.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Report Generated')),
                          );

                        },
                        child: Text('Generate Report'),
                      ),

                    ],
                  ),
                ),
              ],
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
