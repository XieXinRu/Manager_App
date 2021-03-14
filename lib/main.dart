import 'package:flutter/material.dart';
import 'package:manager_app/widget/category_card.dart';

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
      //下方功能列設定---------------------------------
      bottomNavigationBar: Container( 
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //Item按鈕間的距離排版
          children: <Widget>[
            BottomNavItem(
              iconSrc: Icons.date_range_outlined,
              textSrc: "Reservation",
            ),
            BottomNavItem(
              iconSrc: Icons.directions_bus_outlined,
              textSrc: "Dispatching",
              // isActive: true,
            ),
            BottomNavItem(
              iconSrc: Icons.bar_chart,
              textSrc: "Chart",
            ),
          ],
        ),
      ),
      //---------------------------------
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
                  //功能框設定---------------------------
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
                          press: (){},
                        ),
                        CategoryCard(
                          title:"車輛管理",
                          iconSrc: Icons.directions_bus_rounded,
                          press: (){},
                        ),
                        CategoryCard(
                          title:"庫存管理",
                          iconSrc: Icons.medical_services,
                          press: (){},
                        ),
                        CategoryCard(
                          title:"公告管理",
                          iconSrc: Icons.create,
                          press: (){},
                        ),
                        ], //把做好的方框按鈕命名為此方法
                    ),
                  ),
                  //--------------------------------------
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String textSrc;
  final IconData iconSrc;
  final Function press;
  // final bool isActive;
  const BottomNavItem({
    Key key, 
    this.textSrc, 
    this.iconSrc, 
    this.press, 
    // this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      // child: FlatButton(
      //   onPressed: () => {},
        // padding: EdgeInsets.only(left: 50,top:10,right: 30,bottom: 10),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceAround, //icon與字的排版樣式
          children: <Widget>[
            Icon(
              iconSrc,
              color:Color.fromRGBO(170, 205, 190, 1),
            ),
            
            Text(
              textSrc,
              style: TextStyle(color:Color.fromRGBO(170, 205, 190, 1)),  
            ),
          ],
        ),
      // ),
    );
  }
}
