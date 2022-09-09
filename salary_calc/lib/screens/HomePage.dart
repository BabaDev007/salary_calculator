import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_custom_clippers/flutter_custom_clippers.dart";
import 'package:get/get.dart';
import 'package:salary_calc/Transitions.dart';
import 'package:salary_calc/screens/resultScreen.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var initialValue;
  @override
  void initState() {
    nal = null;
    // TODO: implement initState
    super.initState();
  }
  var nal = null;
  var items = [
    "Kiçik Çavuş", "Çavuş","Baş Çavuş", "Gizir", "Baş Gizir", "Kiçik Leytenant", "Leytenant",
    "Baş Leytenant", "Kapitan",  "Mayor", "Polkovnik-leytenant", "Polkovnik"

  ];
  var payokValue;
  var payok = [
    "Alıram",
    "Almıram"
  ];
  var kirayeValue;
  var kiraye = [
    "Almıram",
    "Subay",
    "Ailəli",
    "Ailəli, 1 uşaq",
    "Ailəli, 2 uşaq",
    "Ailəli, 3 uşaq",
    "Ailəli, 4 uşaq"
  ];
  var xidmetIliValue;
  var xidmetIli = [
    "Yoxdur",
    "1 il",
    "2 il",
    "2 - 5",
    "5 - 10",
    "10-15",
    "15 - 20",
    "20 - 25",
    "25 ildən yuxarı"
  ];
  var yashayishYeriValue;
  var yashayishYeri = [
    "Bakı", "Gəncə", "Digər"
  ];
  var meharetValue;
  var meharetDerecesi = [
    "Yoxdur", "3", "2","1","Usta"
  ];

  var zor = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Scaffold(
          floatingActionButton:
          FloatingActionButton.extended(

            onPressed:
                ()async {
                  if(initialValue == null || meharetValue == null || payokValue == null|| xidmetIliValue == null || kirayeValue  == null || yashayishYeriValue == null){
                    setState(() {
                      nal = null;
                    });
                  } else setState(() {
                    nal = 0;
                  });


          if( nal == null)     Get.showSnackbar(GetSnackBar(
             maxWidth: Get.width/1.4,
             backgroundColor: Colors.red.shade300,
             borderRadius: 20,
             padding: EdgeInsets.all(20),
             icon: Image.asset("assets/icon_salary.png"),
             snackStyle: SnackStyle.FLOATING,
             snackPosition: SnackPosition.TOP,
             duration: Duration(seconds: 2),
             messageText: Text("Bütün xanalar doldururlmalıdır", style: TextStyle(color: Colors.white),),



           ));
          if (nal != null) {
            await Future.delayed(Duration(seconds: 2));

            Navigator.of(context).pushReplacement(
                SizeTransition3(AnswerScreen()));
          }}, label: Text("Hesabla") ,),

          backgroundColor: Colors.white,
          appBar:
          AppBar(
    leading:  Image.asset("assets/icon_salary.png", height: 60,),
        centerTitle: true,
        title:  Text(
    "Maaş Hesabla", style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
    ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) , bottomRight: Radius.circular(20))
    ),
            elevation: 0,
            shadowColor: Colors.transparent,
    ),










          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.6,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue.shade500.withOpacity(.7),
                          border: Border.all(color: Colors.black.withOpacity(.2))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton(
                                  underline: SizedBox(),

                                  iconEnabledColor: Colors.transparent, //Icon color
                                  style: TextStyle(  //te
                                      color: Colors.white, //Font color
                                      fontSize: 20 //font size on dropdown button
                                  ),

                                  dropdownColor: Colors.blue.withOpacity(.9), //dropdown background color
                                 //remove underline
                                 //make true to make width 100%
                                hint: Text("Rütbə", style: TextStyle(color: Colors.white),),
                                 value: initialValue,
                                  items: items.map((String items){
                                    return DropdownMenuItem(
                                    child: Text(items), value: items,);}).toList(),


                                  onChanged: (value){
                                   setState(() {
                                     initialValue = value;
                                   });
                                  }),
                              Icon(Icons.arrow_circle_down_sharp, color: Colors.white,),

                            ],
                          ),
                        ),
                      ), initialValue == null ? SizedBox() : Icon(Icons.check, color: Colors.green, size: 30,)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.6,

                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue.shade500.withOpacity(.7),
                            border: Border.all(color: Colors.black.withOpacity(.2))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              DropdownButton(
                                  underline: SizedBox(),

                                  iconEnabledColor: Colors.transparent, //Icon color
                                  style: TextStyle(  //te
                                      color: Colors.white, //Font color
                                      fontSize: 20 //font size on dropdown button
                                  ),

                                  dropdownColor: Colors.blue.withOpacity(.9), //dropdown background color
                                  //remove underline
                                  //make true to make width 100%
                                  hint: Text("Məharət dərəcəsi", style: TextStyle(color: Colors.white),),
                                  value: meharetValue,
                                  items: meharetDerecesi.map((String item){
                                    return DropdownMenuItem(
                                      child: Text(item), value: item,);}).toList(),


                                  onChanged: (value){
                                    setState(() {
                                      meharetValue = value;
                                    });
                                  }),
                              Icon(Icons.arrow_circle_down_sharp, color: Colors.white,),

                            ],
                          ),
                        ),
                      ), meharetValue == null ? SizedBox() : Icon(Icons.check, color: Colors.green, size: 30,)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.6,

                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue.shade500.withOpacity(.7),
                            border: Border.all(color: Colors.black.withOpacity(.2))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              DropdownButton(
                                  underline: SizedBox(),

                                  iconEnabledColor: Colors.transparent, //Icon color
                                  style: TextStyle(  //te
                                      color: Colors.white, //Font color
                                      fontSize: 20 //font size on dropdown button
                                  ),

                                  dropdownColor: Colors.blue.withOpacity(.9), //dropdown background color
                                  //remove underline
                                  //make true to make width 100%
                                  hint: Text("Ərzaq pulu", style: TextStyle(color: Colors.white),),
                                  value: payokValue,
                                  items: payok.map((String items){
                                    return DropdownMenuItem(
                                      child: Text(items), value: items,);}).toList(),


                                  onChanged: (value){
                                    setState(() {
                                      payokValue = value;
                                    });
                                  }),
                              Icon(Icons.arrow_circle_down_sharp, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      payokValue == null ? SizedBox() : Icon(Icons.check, color: Colors.green, size: 30,)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.6,

                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue.shade500.withOpacity(.7),
                            border: Border.all(color: Colors.black.withOpacity(.2))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              DropdownButton(
                                  underline: SizedBox(),

                                  iconEnabledColor: Colors.transparent, //Icon color
                                  style: TextStyle(  //te
                                      color: Colors.white, //Font color
                                      fontSize: 20 //font size on dropdown button
                                  ),

                                  dropdownColor: Colors.blue.withOpacity(.9), //dropdown background color
                                  //remove underline
                                  //make true to make width 100%
                                  hint: Text("Xidmət ili", style: TextStyle(color: Colors.white),),
                                  value: xidmetIliValue,
                                  items: xidmetIli.map((String items){
                                    return DropdownMenuItem(
                                      child: Text(items), value: items,);}).toList(),


                                  onChanged: (value){
                                    setState(() {
                                      xidmetIliValue = value;
                                    });
                                  }),
                              Icon(Icons.arrow_circle_down_sharp, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      xidmetIliValue == null ? SizedBox() : Icon(Icons.check, color: Colors.green, size: 30,)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.6,

                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue.shade500.withOpacity(.7),
                            border: Border.all(color: Colors.black.withOpacity(.2))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              DropdownButton(
                                  underline: SizedBox(),

                                  iconEnabledColor: Colors.transparent, //Icon color
                                  style: TextStyle(  //te
                                      color: Colors.white, //Font color
                                      fontSize: 20 //font size on dropdown button
                                  ),

                                  dropdownColor: Colors.blue.withOpacity(.9), //dropdown background color
                                  //remove underline
                                  //make true to make width 100%
                                  hint: Text("Kirayə pulu", style: TextStyle(color: Colors.white),),
                                  value:kirayeValue,
                                  items: kiraye.map((String items){
                                    return DropdownMenuItem(
                                      child: Text(items), value: items,);}).toList(),


                                  onChanged: (value){
                                    setState(() {
                                      kirayeValue = value;
                                    });
                                  }),
                              Icon(Icons.arrow_circle_down_sharp, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      kirayeValue == null ? SizedBox() : Icon(Icons.check, color: Colors.green, size: 30,)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.6,

                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue.shade500.withOpacity(.7),
                            border: Border.all(color: Colors.black.withOpacity(.2))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton(
                                          underline: SizedBox(),
                                  iconEnabledColor: Colors.transparent, //Icon color
                                  style: TextStyle(  //te
                                      color: Colors.white, //Font color
                                      fontSize: 20 //font size on dropdown button
                                  ),

                                  dropdownColor: Colors.blue.withOpacity(.9), //dropdown background color
                                  //remove underline
                                  //make true to make width 100%
                                  hint: Text("Yaşayış yeri", style: TextStyle(color: Colors.white),),
                                  value: yashayishYeriValue,
                                  items: yashayishYeri.map((String items){
                                    return DropdownMenuItem(
                                      child: Text(items), value: items,);}).toList(),


                                  onChanged: (value){
                                    setState(() {
                                      yashayishYeriValue = value;
                                    });
                                  }),
                              Icon(Icons.arrow_circle_down_sharp, color: Colors.white,),
                            ],
                          ),
                        ),
                      ),
                      yashayishYeriValue == null ? SizedBox() : Icon(Icons.check, color: Colors.green, size: 30,)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.6,

                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue.shade500.withOpacity(.7),
                            border: Border.all(color: Colors.black.withOpacity(.2))
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white, fontSize: 20
                          ),
                          cursorColor: Colors.white,
                          cursorHeight: 20,
                          keyboardType: TextInputType.number,
                            decoration: InputDecoration(

                              focusedBorder: InputBorder.none,
                              labelStyle: TextStyle(
                                  color: Colors.white, fontSize: 20),
                              labelText: "  Vəzifə maaşı",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,

                              ),

                              border: InputBorder.none
                          ),
                      ),

                      ), meharetValue == null ? SizedBox() : Icon(Icons.check, color: Colors.green, size: 30,)
                    ],
                  )],
              ),
            ),
          )
        ),

       nal == null ? SizedBox() : Container(
          width: Get.width,
          height: Get.height,
          color: Colors.grey.withOpacity(.4),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
