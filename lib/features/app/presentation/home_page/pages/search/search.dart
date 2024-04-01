import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

CardSwiperController swiperController = CardSwiperController();
List<Container> cards = [
  Container(
    alignment: Alignment.center,
    color: Colors.blue,
    child: const Text('1'),
  ),
  Container(
    alignment: Alignment.center,
    color: Colors.red,
    child: const Text('2'),
  ),
  Container(
    alignment: Alignment.center,
    color: Colors.purple,
    child: const Text('3'),
  )
];

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: CardSwiper(
            controller: swiperController,
            cardsCount: cards.length,
            cardBuilder:
                (context, index, percentThresholdX, percentThresholdY) {
              return cards[index];
            }));
  }
}
