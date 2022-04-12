import 'package:http/http.dart' as http;
import '../Constants/const.dart';
import '../Modules/products_model.dart';

class ServData {


  static Future<List<Products>> getProducts() async {
    String baseUrl = root + 'get.php?action=GET_ALL_Product';
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    } else {
      return [];
    }
  }




}
