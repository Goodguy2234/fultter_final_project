import 'package:finalproject/database/getorder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Data>? _listOrder = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                // leading: Image.network('${_listOrder?[index].product_img}'),
                leading: Image.asset('${_listOrder?[index].product_img}'),
                title: Text('${_listOrder? [index].product_name}'),
                subtitle: Text('${_listOrder? [index].order_num}ชิ้น'),
                onTap: () {
                  print(index);
                },
              );
            },
            separatorBuilder: (context, index) => Divider(color: Colors.grey),
            itemCount: _listOrder == null ? 0 : _listOrder!.length));
  }

  void getAPI() async {
//var url = Uri.parse('http:// IP:portnumber/orderwhere');

    try {
      String oid = '63011211129';

      var url = Uri.http(
          '192.168.1.40:3000', '/orderwhere', {'cust_id': '63011211129'});

      ;

      print(url);

      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      print(response.body);
      if (response.statusCode == 200) {
        print('data : ${response.body}');

        GetOrder gorder = GetOrder.fromJson(convert.jsonDecode(response.body));

        print('data : ${gorder.data}');

// return products_model.products;

        setState(() {
          _listOrder = gorder.data;
        });

// print(_lsProducts?[0].title);

      } else {
        print('Request failed with status: ${response.statusCode}.');

        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print(e);
    }
  } //getAPI
}
