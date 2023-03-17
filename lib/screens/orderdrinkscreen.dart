import 'package:flutter/material.dart';


class DrinkOrderScreen extends StatefulWidget {
  const DrinkOrderScreen({super.key, required this.imagesName});

  final String imagesName;

  @override
  State<DrinkOrderScreen> createState() => _DrinkOrderScreenState();
}

class _DrinkOrderScreenState extends State<DrinkOrderScreen> {

  int orderNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ระบุจำนวนเครื่องดื่ม')),
        
      ),

    body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200, height: 200,
            padding: EdgeInsets.all(5),
            child: Image.asset(widget.imagesName),
          ),
          Center(
            child: Container(
              width: 400,
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      orderNum ++;
                    });
                  }, 
                  icon:Icon(Icons.add,color: Colors.red,size: 30,),
                  ),
                  Text('$orderNum',
                   style: TextStyle(fontSize: 30,color: Colors.blue),
                  ),
                  IconButton(onPressed: (() {
                    
                    setState(() {
                      if(orderNum == 0){
                        orderNum = orderNum;
                      }else {
                        orderNum--;
                      }
                    });

                  }), icon: Icon(Icons.remove,color: Colors.green ,size: 30,))
                ],
              ),
              ),
          ),
               Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'ยืนยัน',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            ),
        ],
      ),
    ),
  
    );
  }
}