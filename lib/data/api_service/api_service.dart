import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping/data/models/model.dart';
import 'package:shopping/utils/network/urls.dart';

class ApiService {

  Future<List<Product>>feachProducts()async{

    final response = await http.get(Uri.parse(ProductUrls.productList));

    print("URL${ProductUrls.productList}");
    print("URL${response.statusCode}");
    try{
      if(response.statusCode ==200){

        List<dynamic> data =jsonDecode(response.body);
        return data.map((item) => Product.fromJson(item)).toList();
      }
      else{
        throw Exception('Failed to load the list');
      }
    }catch(u){
      print("ERRROR$u");
    }
    if(response.statusCode ==200){

      List<dynamic> data =jsonDecode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    }
    else{
      throw Exception('Failed to load the list');
    }
  }

}