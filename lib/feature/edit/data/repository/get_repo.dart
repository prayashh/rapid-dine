import 'dart:convert';
import 'dart:developer';
import 'package:digital_menu/config/api_config.dart';
import 'package:digital_menu/feature/edit/data/model/iitem_model.dart';
import 'package:http/http.dart' as http;

class ItemRepo {
  static Future<List<ItemModel>> fetchItems() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse("$baseUrl/item/all"),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData.containsKey('data') && jsonData['data'] is List) {
          List<ItemModel> items = (jsonData['data'] as List)
              .map((json) => ItemModel.fromJson(json))
              .toList();

          // for (var item in items) {
          //   log('Item ID: ${item.id}');
          //   log('Item Name: ${item.itemName}');
          //   log('Description: ${item.description}');
          //   log('Price: ${item.price}');
          //   log('Hidden: ${item.hidden}');
          //   log('Category: ${item.category}');
          //   log('Image URL: ${item.imageUrl}');
          //   log('Image ID: ${item.imageId}');
          //   log('Created At: ${item.createdAt}');
          //   log('Updated At: ${item.updatedAt}');
          //   log('---------------------');
          // }

          return items;
        }
      }

      // If the response is not as expected, log an error and return an empty list
      log('Unexpected response format');
      return [];
    } catch (e) {
      // Log and return an empty list in case of an error
      log('Error fetching items: $e');
      return [];
    } finally {
      client.close();
    }
  }


}
