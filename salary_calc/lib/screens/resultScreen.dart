import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:salary_calc/screens/HomePage.dart';

import '../Transitions.dart';
class AnswerScreen extends StatelessWidget {

  int columnCount = 3;
  var list = [
    "Vəzifə maaşı", "Rütbə pulu", "Kirayə Pulu", "Ərzaq pulu", "Məharət dərəcəsi", "Xidmət ili", "Yaşayış yeri", "Aylıq maaş", "Aylıq gəlir", "İllik gəlir",
    "13-14", "Maddi yardım", "Məzuniyyət pulu", "Tutulan vergi", "Tibbi siğorta"
  ];
  var list1 = [
    "123", "140", "150", "64", "3", "2", "Bakı", "700","1000", "1000", "1000", "1000", "1000", "1000", "1000",
  ];

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.8),
      appBar:AppBar(
        leading: IconButton(onPressed: () {            Navigator.of(context).pushReplacement(SizeTransition3(HomePage()));
        }, icon: Icon(Icons.home),) ,
        centerTitle: true,
        title:  Text(
          "Nəticə", style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) , bottomRight: Radius.circular(20))
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: AnimationLimiter(
        child: GridView.builder(
          itemCount: list.length,
          physics:
          BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(_w / 60),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 3,
    ),
          itemBuilder: (BuildContext context, int index) {
    return AnimationConfiguration.staggeredGrid(
    position: index,
    duration: Duration(milliseconds: 500),
    columnCount: list.length,
    child: ScaleAnimation(
    duration: Duration(milliseconds: 900),
    curve: Curves.fastLinearToSlowEaseIn,
    child: FadeInAnimation(
    child: Card(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)
      ),
    child: Container(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Spacer(),
      Text("${list[index]}", maxLines: 1, overflow: TextOverflow.ellipsis,
        style: TextStyle(

      ),),
      Spacer(),
      Text("${list1[index]}", maxLines: 1, overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
      Spacer()
    ],
      ),
    margin: EdgeInsets.only(
    bottom: _w / 30, left: _w / 60, right: _w / 60),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(20)),
    boxShadow: [

    ],
    ),
    ),
    ),
    ),
    ),
    );






    },



          ),
        ),
      );
  }
}
