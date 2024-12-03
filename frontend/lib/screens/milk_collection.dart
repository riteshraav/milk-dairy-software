import 'package:flutter/material.dart';
import 'package:mild_dairy_web/model/appbar.dart';
import 'package:mild_dairy_web/services/admin_service.dart';
import 'package:mild_dairy_web/services/customer_service.dart';

import '../model/admin.dart';
import '../model/customer.dart';
import '../model/logout.dart';
import '../model/toast.dart';
import '../services/collection_service.dart';

class MilkCollectionScreen extends StatefulWidget {
  final Admin admin;

  const MilkCollectionScreen(this.admin);

  @override
  State<MilkCollectionScreen> createState() => _MilkCollectionScreenState();
}

class _MilkCollectionScreenState extends State<MilkCollectionScreen> {
  final TextEditingController fatController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  final TextEditingController valueController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameController = TextEditingController(text : "");
  final TextEditingController animalController = TextEditingController(text : "");



  Customer? customer;
  double? fat,quantity ;



  void saveCollection(BuildContext context) {
    // Logic to save milk collection
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Milk Collection Saved!'),
    ));
  }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatController.addListener(calculateTotalValue);
    quantityController.addListener(calculateTotalValue);
  }
  void calculateTotalValue()
  {
      double quantity = double.tryParse(quantityController.text) ?? 0;
      double fat = double.tryParse(fatController.text)??0;
      valueController.text = (quantity*50).toString();
  }
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
                    if(customer != null) {
                      nameController.text = customer!.name!;
                      animalController.text = customer!.animal!;
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
                        keyboardType: TextInputType.number,
                        controller: quantityController,
                        decoration: InputDecoration(
                          labelText: 'Quantity(L)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: fatController,
                        decoration: InputDecoration(
                          labelText: 'Fat',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        readOnly: true,
                        controller: valueController,
                        decoration: InputDecoration(
                          labelText: 'Total Value',
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
                      // DropdownButton<String>(
                      //   value: milkType,
                      //   isExpanded: true,
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       milkType = newValue!;
                      //     });
                      //   },
                      //   items: <String>['Cow', 'Buffalo']
                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),

                      // SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            fat = double.parse(fatController.text);
                            quantity  = double.parse(quantityController.text);
                            saveInfo(widget.admin,customer!,fat!,quantity!,double.parse(valueController.text));

                            fatController.clear();
                            quantityController.clear();
                            nameController.clear();
                            animalController.clear();
                            searchController.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Milk Collection Saved!')),
                          );

                        },
                        child: Text('Save Information'),
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
