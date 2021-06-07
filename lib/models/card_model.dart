import 'package:flutter/material.dart';
import 'package:payment_integration/constants/color_constant.dart';

class CardModel {
  String? user;
  String? cardNumber;
  String? cardExpired;
  String? cardType;
  int? cardBackground;
  Color textColor;

  CardModel(
    this.user,
    this.cardNumber,
    this.cardExpired,
    this.cardType,
    this.cardBackground,
    this.textColor,
  );
}

List<CardModel> cards = cardData
    .map(
      (item) => CardModel(
        item['user'] as String?,
        item['cardNumber'] as String?,
        item['cardExpired'] as String?,
        item['cardType'] as String?,
        item['cardBackground'] as int?,
        item['textColor'] as Color,
      ),
    )
    .toList();

var cardData = [
  {
    "user": "Amit Singh",
    "cardNumber": "**** **** **** 1425",
    "cardExpired": "03-01-2023",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFFCBD2D9,
    "textColor": kBackgroundColor,
    "Email": "Amit125@gmail.com",
    "contact": "7056487952",
    "amount": "",
  },
  {
    "user": "Amanda Alex",
    "cardNumber": "**** **** **** 8287",
    "cardExpired": "03-01-2025",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xff7B8794,
    "textColor": Colors.black,
    "Email": "virtuetti57@gmail.com",
    "contact": "6546846516",
    "amount": "",
    // "cardElementTop": "assets/svg/ellipse_top_blue.svg",
    // "cardElementBottom": "assets/svg/ellipse_bottom_blue.svg"
  }
];

String getUserName(int index) {
  return cardData[index]['user'].toString();
}

String getEmail(int index) {
  return cardData[index]['Email'].toString();
}
