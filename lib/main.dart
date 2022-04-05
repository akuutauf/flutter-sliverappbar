import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /*
  appbar, gradient color, leading, actions, appbar decoration
  */

  @override
  Widget build(BuildContext context) {
    return Main();
  }

  // MaterialApp MainOne() {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(
  //       appBar: AppBar(
  //         brightness: Brightness.light,
  //         leading: Icon((Icons.person)),
  //         title: Text("BELAJAR APPBAR"),
  //         flexibleSpace: Container(
  //           decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //                 begin: Alignment.topLeft,
  //                 end: Alignment.bottomRight,
  //                 colors: [Colors.green, Colors.blue]),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

MaterialApp Main() {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("SliverAppBar Widget",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    background: Image(
                      image: AssetImage('assets/images/spiderman.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        new Tab(
                            icon: new Icon(Icons.audiotrack), text: "Songs"),
                        new Tab(
                            icon: new Icon(Icons.collections), text: "Gallery"),
                        new Tab(
                            icon: new Icon(Icons.collections), text: "Gallery"),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Center(
              child: Text("Spiderman No Way Home Is Waiting You"),
            ),
          ),
        ),
      ));
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
