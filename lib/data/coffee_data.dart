import '../models/coffee.dart';

const categories = ['Cappuccino', 'Macchiato', 'Latte', 'Americano', 'Espresso'];

const _desc =
    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of '
    'espresso coffee and 85 ml of fresh milk the fo.. It is smooth, rich and '
    'topped with a thick layer of silky foam, perfect for a relaxing coffee break.';

const coffeeList = <Coffee>[
  Coffee(id: 1, name: 'Cappuccino', subtitle: 'with Chocolate', category: 'Cappuccino',
      image: 'assets/images/cappuccino1.jpg', description: _desc, price: 4.53, rating: 4.8, reviews: 2330),
  Coffee(id: 2, name: 'Cappuccino', subtitle: 'with Oat Milk', category: 'Cappuccino',
      image: 'assets/images/cappuccino2.jpg', description: _desc, price: 3.90, rating: 4.9, reviews: 1820),
  Coffee(id: 3, name: 'Cappuccino', subtitle: 'with Cinnamon', category: 'Cappuccino',
      image: 'assets/images/cappuccino3.jpg', description: _desc, price: 4.10, rating: 4.5, reviews: 940),
  Coffee(id: 4, name: 'Macchiato', subtitle: 'with Caramel', category: 'Macchiato',
      image: 'assets/images/macchiato1.jpg', description: _desc, price: 4.20, rating: 4.6, reviews: 1210),
  Coffee(id: 5, name: 'Latte', subtitle: 'with Vanilla', category: 'Latte',
      image: 'assets/images/latte1.jpg', description: _desc, price: 4.80, rating: 4.7, reviews: 1560),
  Coffee(id: 6, name: 'Latte', subtitle: 'with Almond Milk', category: 'Latte',
      image: 'assets/images/latte2.jpg', description: _desc, price: 4.95, rating: 4.4, reviews: 680),
  Coffee(id: 7, name: 'Americano', subtitle: 'with Ice', category: 'Americano',
      image: 'assets/images/americano1.jpg', description: _desc, price: 3.20, rating: 4.3, reviews: 770),
  Coffee(id: 8, name: 'Espresso', subtitle: 'with Chocolate', category: 'Espresso',
      image: 'assets/images/espresso1.jpg', description: _desc, price: 3.50, rating: 4.5, reviews: 2330),
];