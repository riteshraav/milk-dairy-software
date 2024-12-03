import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class ExcelService {
  // Export customer and collection data to an Excel file
  Future<void> exportCustomerData(List<Map<String, dynamic>> customers, List<Map<String, dynamic>> milkCollections) async {
    final excel = Excel.createExcel();
    final customerSheet = excel['Customers'];
    final collectionSheet = excel['Milk Collections'];

    // Add headers to the Customers sheet
    customerSheet.appendRow(['Customer ID', 'Name', 'Phone Number', 'Milk Type']);
    for (var customer in customers) {
      customerSheet.appendRow([
        customer['id'],
        customer['name'],
        customer['phone'],
        customer['milkType']
      ]);
    }

    // Add headers to the Milk Collections sheet
    collectionSheet.appendRow(['Customer ID', 'Date', 'Morning Fat', 'Evening Fat', 'Quantity', 'Price']);
    for (var collection in milkCollections) {
      collectionSheet.appendRow([
        collection['customerId'],
        collection['date'],
        collection['morningFat'],
        collection['eveningFat'],
        collection['quantity'],
        collection['price']
      ]);
    }

    // Save the file to the device
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/MilkDairyData.xlsx';
    final fileBytes = excel.save();
    final file = File(filePath);
    await file.writeAsBytes(fileBytes!);

    print('Excel file saved at: $filePath');
  }
}
