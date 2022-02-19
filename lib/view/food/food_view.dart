import 'package:flutter/material.dart';
import 'package:gazihealty/core/components/foodMenuCard.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            FoodMenuCard(
              icon: "lib/core/assets/icons/foodicon.png",
              title: "Ne Yesem?",
              desc: "Ne yesem diye düşünme. Sağlıklı tarifler ile buradayız.",
              img: "lib/core/assets/food1.jpg",
            ),
            FoodMenuCard(
              icon: "lib/core/assets/icons/healtyicon.png",
              title: "O mu ? x Bu mu ?",
              desc: "Sağlıksız besinlinlerin sağlıklı karşılıkları",
              img: "lib/core/assets/food2.jpg",
            ),
            FoodMenuCard(
              icon: "lib/core/assets/icons/searchicon.png",
              title: "Aradığını bulamadın mı ?",
              desc: "Bulmakta zorlandıysan bir de burda arayalım.",
              img: "lib/core/assets/food3.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
