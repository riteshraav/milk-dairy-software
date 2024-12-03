class Customer{
   int? c_id;
   String? name;
   String? phone_num;
   String? animal;

  Customer({
    this.c_id,
    this.name,
    this.phone_num,
    this.animal
  });
   factory Customer.fromJson(Map<String, dynamic> json) {
     return Customer(
         c_id: json['c_id'],
         name: json['name'],
         phone_num: json['phone_num'],
         animal: json['animal']
     );
   }


}