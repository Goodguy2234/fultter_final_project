import 'package:finalproject/screens/orderfoodscreen.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {

  var foodNames = [
    "แฮมเบอเกอร์",
    "ปีกไก่ทอด",
    "ยำวุ้นเส้น",
    "ต้มยำ",
    "ข้าวผัด",
    "กระเพรา",
    "สลัด",
    "สปาเก๊ตตี้"
  ];

  var foodImages = [
    "images/foods/hamburger.png",
    "images/foods/chickenwings.png",
    "images/foods/yumwoonsen.png",
    "images/foods/tomyum.png",
    "images/foods/firerice.png",
    "images/foods/krapauw.png",
    "images/foods/salad.png",
    "images/foods/spaghetti.png"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: foodNames.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2)),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child:InkWell(
            onTap: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: ((context) => 
              OrderFoodScreen(imagesName: foodImages[index],foodName: foodNames[index],)))
              );
            },
            child: Column(
              children: [
                SizedBox(height: 25,),
                Image.asset(foodImages[index],height: 70, width: 70,),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(foodNames[index],
                  style: TextStyle(color: Colors.black, fontSize: 18,
                  fontWeight: FontWeight.w500),),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}