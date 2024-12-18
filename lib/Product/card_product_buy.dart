import 'package:flutter/material.dart';

class CardProduct {
  const CardProduct(
      this.ProductIndexl,
      this.image,// Аватар пользователя
      this.name, // Наименование карточки пользователя
      this.price, // Стоимость карточки
      this.currency, // Валюта
      this.time, // Время (число)
      this.timename, // Время (Текст)
      this.transactions, // Всего сделок карточки
      this.percentage, // % сделок
      this.countHMS, // Кол-во сделок
      this.MoneyHMS, // Валюта сделок
      this.LimitCards1, //  Лимит сделок 1
      this.LimitCards2, //  Лимит сделок 2
      this.Bank,
      this.BankColor, // Банк пользователя
      );

  final bool ProductIndexl;   
  final String image; // Аватар пользователя
  final String name; // Наименование карточки пользователя
  final double price; // Стоимость карточки 
  final String currency; // Валюта
  final int time; // Время (число)
  final String timename; // Время (Текст)
  final String transactions; // Всего сделок карточки
  final String percentage; // % сделок
  final String countHMS; // Кол-во сделок
  final String MoneyHMS; // Валюта сделок
  final String LimitCards1; //  Лимит сделок 1
  final String LimitCards2; // Лимит сделок 2
  final String Bank; // Банк пользователя
  final String BankColor; // Банк пользователя
}



class Store with ChangeNotifier {
  final Set<CardProduct> _products = <CardProduct>{
    const CardProduct(true,
      'images/AVATAR_CARD.jpg', 'HMS Official', 95.5, 'RUB', 30,
        'мин', '1100', '99%', '1,200', 'HMS', '9,500', '114,600', 'СПБ', 'images/sbp-bank.jpg'),

    const CardProduct(false,'images/Avatar2.jpg', 'Александр Б.', 92.0, 'RUB', 15, 'мин',
        '102', '95%', '100', 'HMS', '9,200', '9,200', 'T-Bank', 'images/t-bank.jpg'),

    const CardProduct(false,'images/Avatar3.jpg', 'Геннадий П.', 97.5, 'RUB', 15, 'мин',
        '10', '89%', '520', 'HMS', '9,750', '50,700', 'Alfa-bank', 'images/alfa-bank.jpg'),
     
  };

  List<CardProduct> get products => _products.toList();

  CardProduct? _cart = null;

  CardProduct? get cart => _cart;

  void addToCart(CardProduct product) {
    _cart = product;

    notifyListeners();
  }

  void removeFromCart(CardProduct product) {
    _cart = null;

    notifyListeners();
  }

  void buy() {
    _products.remove(_cart);

    _cart = null;

    notifyListeners();
  }
}
