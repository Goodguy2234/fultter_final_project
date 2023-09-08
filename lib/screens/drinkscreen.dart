import 'package:flutter/material.dart';
import 'package:finalproject/screens/orderdrinkscreen.dart';
class DrinkScreen extends StatefulWidget {
  const DrinkScreen({super.key});

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {

  var drinkNames = [
    "โคคา โคล่า",
    "เป๊ปซี่",
    "น้ำเปล่า",
    "กาแฟร้อน",
    "กาแฟเย็น",
    "สตอเบอรี่ปั่น",
    "ชาเย็น",
    "ชาเขียว"
  ];

  var drinkImages = [
    "images/drinks/cocacola.png",
    "images/drinks/pepsi.png",
    "images/drinks/purewater.png",
    "images/drinks/hotcoffee.png",
    "images/drinks/icecoffee.png",
    "images/drinks/strawberry.png",
    "images/drinks/icetea.png",
    "images/drinks/greentea.png"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: drinkNames.length,
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
              DrinkOrderScreen(imagesName: drinkImages[index],drinkName: drinkNames[index],)))
              );
            },
            child: Column(
              children: [
                SizedBox(height: 25,),
                Image.asset(drinkImages[index],height: 70 ,width: 70,),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(drinkNames[index],
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