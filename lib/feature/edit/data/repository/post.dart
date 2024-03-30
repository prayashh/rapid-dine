import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import "package:http/http.dart" as http;

class Post {
  final File? imageFile;
  final String itemName;
  final String itemDescription;
  final double price;
  final String category;

  Post({
    required this.imageFile,
    required this.itemName,
    required this.itemDescription,
    required this.price,
    required this.category,
  });
 static Future<void> postItem(Post post) async {
    var url =
        "https://rapid-dine-backend.onrender.com/api/item/add"; // replace with your API endpoint

    try {
      log(post.imageFile!.path);
      log(post.itemName);
      log(post.itemDescription);
      log(post.price.toString());
      log(post.category);
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'imageUrl': post.imageFile!.path,
          "imageId": "ascjbnjasc",
          'itemName': post.itemName,
          'description': post.itemDescription,
          'price': post.price,
          'hidden': true,
          'category': post.category,
        }),
      );

      if (response.statusCode == 201) {
        log('Item uploaded successfully.');
      } else {
        log('Failed to upload item. Status code: ${response.statusCode}');
        log('Response body: ${response.body}');

        // Parse the JSON response
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Check if the request was unsuccessful and handle the error
        if (jsonResponse['success'] == false) {
          String errorMessage = jsonResponse['error'];
          log('Error message: $errorMessage');
          // Handle the error message here (e.g., show a toast, display an alert)
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
