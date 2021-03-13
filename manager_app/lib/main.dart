import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          //設定顏色跟字體位置
          ),
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45, //全部設備高度佔45%
            // decoration: BoxDecoration(color: Color()),
            color: Color.fromRGBO(133, 163, 146, 0.6),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(133, 163, 146, 1),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.settings),
                        tooltip: 'Search',
                        onPressed: null,
                      ),
                    ),
                  ),
                  Text("管理者介面",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900)),
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4, //長寬比
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.people),
                                tooltip: 'people',
                                onPressed: null,
                                iconSize: 70,
                                padding: EdgeInsets.only(left: 20,top:40,right: 20,bottom: 10),
                              ),
                              Text(
                                "員工管理",
                                style: Theme.of(context).textTheme.title,
                              ),
                              // CategoryCard(
                              //   title: "員工管理",
                              //   svgSrc: "assets/icons/Hamburger.svg",
                              //   press: () {},
                              // ),
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
