import 'constants/strings.dart';

class FakeDataBase {
  String id;
  FakeDataBase.withId(this.id);
  static FakeDataBase instance = FakeDataBase.withId('');

  factory FakeDataBase(String id) {
    if (instance.id == '') {
      instance = FakeDataBase.withId(id);
    }
    return instance;
  }

  final List<Map<String, dynamic>>  _allCategories = [
    {
      Str.ID: "VegetablesID",
      Str.NAME: "Vegetables",
      Str.IMAGE: "lib/assets/images/pumpkin.svg",
      Str.PRODUCTS: [
        {
          Str.ID: "TomatoID",
          Str.IMAGE: "lib/assets/images/tomato.svg",
          Str.NAME: "Tomato",
          Str.PRICE: 20,
          Str.DISCOUNT: 23,
          Str.PRODUCT_COUNT: 20
        },
        {
          Str.ID: "PumpkinID",
          Str.IMAGE: "lib/assets/images/pumpkin.svg",
          Str.NAME: "Pumpkin",
          Str.PRICE: 30,
          Str.DISCOUNT: 60,
          Str.PRODUCT_COUNT: 30
        }
      ]
    },
    {
      Str.ID: "FruitsID",
      Str.NAME: "Fruits",
      Str.IMAGE: "lib/assets/images/fruits.svg",
      Str.PRODUCTS: [
        {
          Str.ID: "GrapeID",
          Str.IMAGE: "lib/assets/images/fruits.svg",
          Str.NAME: "Grape",
          Str.PRICE: 23,
          Str.DISCOUNT: 35,
          Str.PRODUCT_COUNT: 20
        },
      ]
    },
    {
      Str.ID: "DrinksID",
      Str.NAME: "Drinks",
      Str.IMAGE: "lib/assets/images/drink.svg",
      Str.PRODUCTS: [
        {
          Str.ID: "CokeID",
          Str.IMAGE: "lib/assets/images/drink.svg",
          Str.NAME: "Coke",
          Str.PRICE: 23,
          Str.DISCOUNT: 60,
          Str.PRODUCT_COUNT: 100
        },
      ]
    },
    {
      Str.ID: "AlcoholID",
      Str.NAME: "Alcohol",
      Str.IMAGE: "lib/assets/images/cocktail.svg",
      Str.PRODUCTS: [
        {
          Str.ID: "CocktailID",
          Str.IMAGE: "lib/assets/images/cocktail.svg",
          Str.NAME: "Cocktail",
          Str.PRICE: 23,
          Str.DISCOUNT: 60,
          Str.PRODUCT_COUNT: 10
        },
      ]
    },
    {
      Str.ID: "FishID",
      Str.NAME: "Fish",
      Str.IMAGE: "lib/assets/images/fish.svg",
      Str.PRODUCTS: [
        {
          Str.ID: "SalmonID",
          Str.IMAGE: "lib/assets/images/fish.svg",
          Str.NAME: "Salmon",
          Str.PRICE: 23,
          Str.DISCOUNT: 15,
          Str.PRODUCT_COUNT: 10
        },
      ]
    },
    {
      Str.ID: "CakesID",
      Str.NAME: "Cakes",
      Str.IMAGE: "lib/assets/images/cake.svg",
      Str.PRODUCTS: [
        {
          Str.ID: "BrownyID",
          Str.IMAGE: "lib/assets/images/cake.svg",
          Str.NAME: "Browny",
          Str.PRICE: 23,
          Str.PRODUCT_COUNT: 5
        },
      ]
    },
    {
      Str.ID: "BakeryID",
      Str.NAME: "Bakery",
      Str.IMAGE: "lib/assets/images/dripper.svg",
      Str.PRODUCTS: [
        {
          Str.ID: "CroissantID",
          Str.IMAGE: "lib/assets/images/dripper.svg",
          Str.NAME: "Croissant",
          Str.PRICE: 23,
          Str.DISCOUNT: 60,
          Str.PRODUCT_COUNT: 14
        },
      ]
    },
    {
      Str.ID: "CoffeeID",
      Str.NAME: "Coffee",
      Str.IMAGE: "lib/assets/images/coffee.svg",
      Str.PRODUCTS: [
        {
          Str.ID: "CappuccinoID",
          Str.IMAGE: "lib/assets/images/coffee.svg",
          Str.NAME: "Cappuccino",
          Str.PRICE: 23,
          Str.DISCOUNT: 60,
          Str.PRODUCT_COUNT: 3
        },
      ]
    },
  ];

  get allCategoriesAndProducts => _allCategories;

  List<Map<String, dynamic>> getAllProducts() {
    final List<Map<String, dynamic>> allProducts = [];

    for (var category in _allCategories) {
      final productsList = category[Str.PRODUCTS] as List<Map<String, dynamic>>;
      for (var product in productsList) {
        allProducts.add(product);
      }
    }
    return allProducts;
  }

  List<Map<String, dynamic>> getAllProductsWithDiscount() {
    List<Map<String, dynamic>> allProductsWithDiscount = [];

    for (var product in getAllProducts()) {
      if (product[Str.DISCOUNT] != null) {
        allProductsWithDiscount.add(product);
      }
    }
    return allProductsWithDiscount;
  }

  List<Map<String, dynamic>> getAllCategories() {
    List<Map<String, dynamic>> list = [];
    for (var element in _allCategories) {
      final map = {
        Str.ID: element[Str.ID],
        Str.NAME: element[Str.NAME],
        Str.IMAGE: element[Str.IMAGE],
      };
      list.add(map);
    }
    return list;
  }

  List<Map<String, dynamic>> getProductsOfCategory(String id) {
    List<Map<String, dynamic>> products = [];
    for (Map<String, dynamic> element in _allCategories) {
      if (element[Str.ID] == id) {
        products = element[Str.PRODUCTS];
        break;
      }
    }
    return products;
  }
}
