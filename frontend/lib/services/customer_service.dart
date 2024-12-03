import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/admin.dart';
import '../model/customer.dart';

Future<void> addCustomer(String name, String phone_num, String animal,String? admin) async {
  final url = Uri.parse('http://localhost:8080/customer/add');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'name': name,
      'phone_num': phone_num,
      'animal':animal,
      'admin':{
        'name':admin
      }
    }),
  );

  if (response.statusCode == 200) {
    print('User registered: ${response.body}');

  } else {
    print('Error: ${response.statusCode}');

  }
}
Future<Customer> findCustomerFromData(int c_id) async {
  final url = Uri.parse('http://localhost:8080/customer/${c_id}');

  final response = await http.get(url);
  final data = json.decode(response.body);

   return Customer.fromJson(data);

}
