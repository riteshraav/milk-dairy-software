import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/admin.dart';
import '../model/customer.dart';


Future<void> saveInfo(Admin admin,Customer customer,double fat, double quantity, num total_value,)
async {

  final url = Uri.parse("http/localhost:8080/collection/save");
  final response = await http.post(
    url,
    headers : {'Content-Type':'application/json'},
    body: jsonEncode({
      'admin' : {
        'name':admin.name
      },
      'customer':{
        'c_id':customer.c_id
      },
      'fat':fat,
      'total_value':total_value,
      'quantity_liters':quantity,
      'animal':customer.animal,
      'shift':"MORNING"/////////////////////////////////to be changed
      }),


  );
  print("info saved");
}
Future <List<double>> findTotalValueByCustomerAndAnimal(int? c_id,String? animal)async
{
    final url = Uri.parse("http://localhost:8080/collection/total_value?c_id=$c_id&animal=$animal");

    final response = await http.get(url);
    List<dynamic> jsonData = jsonDecode(response.body);

    List<List<double>> doubleList =  jsonData.map((innerList) {
      return (innerList as List<dynamic>).map<double>((value) => value as double).toList();
}).toList();
  var total_quantity = 0.0 ;
  for(var quantity in doubleList)
    {
      total_quantity =total_quantity +  quantity[0];
    }
    var total_value=0.0 ;
    for(var value in doubleList)
    {
      total_value =total_value +  value[1];
    }
    print("total quantity : $total_quantity");
    print("total value : $total_value");

    List<double> result = [];
    result.add(total_quantity);
    result.add(total_value);
    return result;

}