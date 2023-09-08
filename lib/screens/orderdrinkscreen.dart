
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DrinkOrderScreen extends StatefulWidget {
  const DrinkOrderScreen({super.key, required this.imagesName , required this.drinkName});

  final String imagesName;
  final String drinkName;
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
                  onPressed: () {
                     setState(() {
                      //Map
                      Map<String, dynamic> values = Map();
                      values['cust_id'] = '63011211129';
                      values['product_name'] = widget.drinkName;
                      values['product_source'] = widget.imagesName;
                      values['order_num'] = orderNum; 

                      insertOrder(values);
                      Navigator.pop(context);
                    });

                  },
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

  void insertOrder(Map<String, dynamic> values) async {
    //var url = Uri.https('http://192.168.1.146:3000/insertorder&#39;);

    try {
      var url = Uri.http('192.168.1.40:3000', '/insertorder');

      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: convert.jsonEncode(values));
      if (response.statusCode == 200) {
        print('Insert Success!!');
        //Navigator.pop(context, true);
      } else {
        print('Insert not Success!!');
      }
    } catch (e) {
      print(e);
    }
  }
}