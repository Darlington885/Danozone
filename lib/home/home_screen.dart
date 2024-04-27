import 'dart:async';
import 'dart:convert';

import 'package:danozone/classes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../classes/main_class.dart';
import '../classes/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future fetchData() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(response.body);
    List<User> users = [];

    for(var u in jsonData){
      User user = User(u['name'], u['address']['street'], u['username']);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  //snapshot is the data that is been returned for us from the Api
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot){
              if(snapshot.data == null){
                return Container(child: Center(child:CupertinoActivityIndicator(
                  color: AppColor.colorApp,
                  radius: 13,
                )),);
              }else{
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                  return MainClass.userCard(snapshot.data[index].name, snapshot.data[index].street, context);
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
