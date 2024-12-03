import 'package:flutter/material.dart';
void showEditConfirmationDialog() {
  var context;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Edit'),
        content: Text('Are you sure you want to edit this customer?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog without action
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Call the edit function
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Edit'),
          ),
        ],
      );
    },
  );
}
void showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Deletion'),
        content: Text('Are you sure you want to delete this customer?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog without action
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Delete the customer
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Delete'),
          ),
        ],
      );
    },
  );
}


// Function to edit the customer (placeholder, replace with your logic)
void editCustomer(String customerId, BuildContext context) {
  // Add the edit logic here (e.g., open a form to edit customer details)
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Customer $customerId Edited!'),
  ));
}

// Function to delete the customer (placeholder, replace with your logic)
void deleteCustomer(String customerId,BuildContext context) {
  // Add the delete logic here (e.g., remove from database)

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Customer $customerId Deleted!'),
  ));
}


void showCustomerDetailsDialog(int? customerId,String? customerName,String? phoneNumber,String? animal,BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Customer Details'),
        content: Container(
          width: 400,
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(),
              columnWidths: {
                0: FractionColumnWidth(0.3),
                1: FractionColumnWidth(0.7),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Customer ID:', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(customerId.toString()),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name:', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(customerName!),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Phone:', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(phoneNumber!),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Milk Type:', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(animal!),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          // Close button
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Close'),
          ),

          // Edit button
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: showEditConfirmationDialog, // Confirm edit action
          ),

          // Delete button
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed:()=>{} , // Confirm delete action
          ),
        ],
      );
    },
  );
}
