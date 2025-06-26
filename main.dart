import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [];
  int total = 0;

  ShoppingMall() {
    products = [
      Product('셔츠', 45000),
      Product('원피스', 30000),
      Product('반팔티', 35000),
      Product('반바지', 38000),
      Product('양말', 5000),
    ];
  }

  void showProducts() {
    for (var p in products) {
      print('${p.name} / ${p.price}원');
    }
  }

  void addToCart(String name, int quantity) {
    var selected = products.firstWhere(
      (p) => p.name == name,
      orElse: () => Product('', 0),
    );

    if (selected.name == '') {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    if (quantity <= 0) {
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      return;
    }

    total += selected.price * quantity;
    print('장바구니에 상품이 담겼어요 !');
  }

  void showTotal() {
    print('장바구니에 ${total}원 어치를 담으셨네요 !');
  }
}

void main() {
  ShoppingMall mall = ShoppingMall();
  bool isRunning = true;

  while (isRunning) {
    print('\n[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니 총 가격 보기 / [4] 프로그램 종료');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        print('상품 이름을 입력하세요:');
        String? name = stdin.readLineSync();

        print('상품 개수를 입력하세요:');
        String? quantityInput = stdin.readLineSync();

        try {
          int quantity = int.parse(quantityInput!);
          mall.addToCart(name!, quantity);
        } catch (e) {
          print('입력값이 올바르지 않아요 !');
        }
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
        isRunning = false;
        break;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
