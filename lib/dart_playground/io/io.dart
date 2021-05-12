import 'dart:convert';
import 'dart:io';

enum Category {
  all,
  accessories,
  clothing,
  home,
}

class Product {
  Category category;
  int id;
  String name;
  double price;
  bool isFeature;

  Product(this.category, this.id, this.name, this.price, this.isFeature);

  @override
  String toString() {
    return 'Product{category: $category, id: $id, name: $name, price: $price, isFeature: $isFeature}';
  }
}

class ProductRepository {
  static loadProducts(Category? category) async {
    File jsonFile =
        new File('${Directory.current.path}/lib/dart_playground/io/products.json');
    var productionJson = await jsonFile.readAsString(encoding: utf8);
    var products = json.decode(productionJson) as List;
    products = products.map((f) {
      Category _category = Category.values.firstWhere((element) {
        return element.toString() == 'Category.${f['category']}';
      });
      return Product(_category, f['id'], f['name'], f['price'], f['isFeature']);
    }).toList();
    return products;
  }
}

void main() {
  ProductRepository.loadProducts(null).then((products){
    for(var product in products){
      print(product.toString());
    }
  });
}
