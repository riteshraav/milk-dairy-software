import 'package:flutter/material.dart';
import 'package:mild_dairy_web/model/appbar.dart';
import 'package:mild_dairy_web/model/customer_details.dart';
import 'package:mild_dairy_web/screens/add_customer.dart';
import 'package:mild_dairy_web/screens/generate_report.dart';
import 'package:mild_dairy_web/screens/milk_collection.dart';

import '../model/admin.dart';
import '../model/customer.dart';
import '../model/logout.dart';
import '../services/customer_service.dart';

class AdminDashboard extends StatefulWidget {
  final Admin admin;
  const AdminDashboard(this.admin);



  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String milkType = 'Cow';

  void findCustomer(int i) async {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Customer Found!'),
    ));
    Navigator.of(context).pop();
     Customer customer =  await findCustomerFromData(i);
     showCustomerDetailsDialog(customer.c_id, customer.name,customer.phone_num ,customer.animal, context);

  }

  void showCustomerDialog(String action) {
    TextEditingController customerIdController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 300, // Dialog size
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${action} Customer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  if (action == 'Find') ...[
                    TextField(
                      controller: customerIdController,
                      decoration: InputDecoration(labelText: 'Enter Customer ID'),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {

                       findCustomer(int.parse(customerIdController.text));
                      },
                      child: Text('Search Customer'),
                    ),
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  Appbar(),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Positioned widget to place the delete icon at the top-right corner

          // Centered content
          Center(
            child: Container(
              width: 600,
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
                    'Admin Dashboard',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Option Cards
                  Wrap(
                    spacing: 15.0,
                    runSpacing: 15.0,
                    children: [
                      _buildOptionCard(
                        title: 'Add Customer',
                        icon: Icons.person_add,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCustomer(widget.admin)));
                        },
                      ),
                      _buildOptionCard(
                        title: 'Find Customer',
                        icon: Icons.edit,
                        onTap: () {
                          nameController.clear();
                          phoneController.clear();
                          // Default value
                          showCustomerDialog('Find');
                        },
                      ),
                      _buildOptionCard(
                        title: 'Milk Collection',
                        icon: Icons.link_rounded,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MilkCollectionScreen(widget.admin)),
                          );
                        },
                      ),
                      _buildOptionCard(
                        title: 'Generate Reports',
                        icon: Icons.file_download,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>GenerateReport(widget.admin)));
                          print('Navigating to Generate Reports');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Logout Option
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

  // Helper method to build clickable cards
  Widget _buildOptionCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40.0,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
