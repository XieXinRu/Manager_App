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
            color: Color.fromRGBO(170, 205, 190, 0.7),
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
                        color: Color.fromRGBO(170, 205, 190, 1),
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
                      crossAxisSpacing: 20,
                      // mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title:"員工管理",
                          iconSrc: Icons.group,
                        ),
                        CategoryCard(
                          title:"車輛管理",
                          iconSrc: Icons.directions_bus_rounded ,
                        ),
                        CategoryCard(
                          title:"庫存管理",
                          iconSrc: Icons.medical_services,
                        ),
                        CategoryCard(
                          title:"公告管理",
                          iconSrc: Icons.create,
                        ),
                        ], //把做好的方框按鈕命名為此方法
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
//方框按鈕參照
class CategoryCard extends StatelessWidget {
  final IconData iconSrc;
  final String title;
  const CategoryCard({
    Key key,
    this.iconSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(iconSrc),
            // icon: Icon(Icons.people),
            // tooltip: 'people',
            // onPressed: null,
            iconSize: 70,
            padding: EdgeInsets.only(left: 20,top:40,right: 20,bottom: 10),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          // CategoryCard(
          //   title: "員工管理",
          //   svgSrc: "assets/icons/Hamburger.svg",
          //   press: () {},
          // ),
        ],
      )
    );
  }
}
