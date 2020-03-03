import 'package:bmsflutter/Activities.dart';
import 'package:bmsflutter/Sports.dart';
import 'package:flutter/material.dart';
import 'Movie.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController controller;
  static var actionslist = [
    "All",
    "Movies",
    "Sports",
    "Activities"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: actionslist.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2E3336),
        titleSpacing: 0.0,
        title: TabBar(
            indicatorColor: Colors.transparent,
            isScrollable: true,
            controller: controller,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.white,
            tabs: actionslist
                .map((tab) =>
            new Text(
              tab,
              style: new TextStyle(fontSize: 18.0),
            ))
                .toList()),
      ),
      body: new TabBarView(controller: controller, children: [
        new All(controller),
        new Movie(),
        new Sports(),
        new Activities(),
      ]),
    );
  }
}

class All extends StatefulWidget {
  TabController controller;

  All(this.controller);

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  var movies = ["Avengers Endgame", "Joker", "Us", "Spiderman Far From Home","Captain Marvel","Hereditary"];
  var sports = ["WorldCup", "LaLiga", "IPL", "ISL", "BundesLiga"];
  var events = ["Sunburn", "Hardwell", "TomorrowLand", "Arijit Singh's Concert"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: new ListView(shrinkWrap: false, children: <Widget>[
              new Container(
                  height: 200.0,
                  child: Carousel(
                    showIndicator: true,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.transparent,
                    dotSize: 5.0,
                    boxFit: BoxFit.fill,
                    images: [
                       new AssetImage("Assets/img/Star Wars.jpeg"),
                       new AssetImage("Assets/img/Jumanji.jpeg"),
                       new AssetImage("Assets/img/Frozen 2.jpeg"),
                       new AssetImage("Assets/img/Charlie's.jpeg"),
                       new AssetImage("Assets/img/21 Bridges.jpeg")
                    ],
                  )),
              new Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Movies",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                        new GestureDetector(
                            onTap: () {
                              widget.controller.animateTo(1);
                            },
                            child: Text(
                              "more",
                              style: new TextStyle(color: Colors.blue),
                            ))
                      ])),
              new GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  children: movies
                      .map((movie) =>
                  new Container(
                          height: 1500.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Container(
                                  height: 130.0,
                                  width: 150.0,
                                  child: Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12.0)),
                                    child: new ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: new Image(
                                        image: new AssetImage("Assets/img/"+movie+".jpeg"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )),
                              new Text(
                                movie,
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              ),
                              new Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  new Text(
                                    "77%",
                                    style: new TextStyle(color: Colors.black),
                                  )
                                ],
                              )
                            ],
                          )))
                      .toList()),
              new Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Sports",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                        new GestureDetector(
                            onTap: () {
                              widget.controller.animateTo(4);
                            },
                            child: Text(
                              "more",
                              style: new TextStyle(color: Colors.blue),
                            ))
                      ])),
              new Container(
                  height: 300.0,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: sports
                        .map(
                          (sports) =>
                      new Container(
                          height: 300.0,
                          width: 250.0,
                          child: new Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Container(
                                    height: 250.0,
                                    width: 250.0,
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12.0)),
                                      child: new ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(12.0),
                                        child: new Image(
                                        image: new AssetImage("Assets/img/"+sports+".jpeg"),
                                        fit: BoxFit.fill,
                                      ),
                                      ),
                                    )),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:<Widget>[
                                new Text(
                                  sports,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                 new Icon(
                                    Icons.thumb_up,
                                        color: Colors.green,
                                      ),
                                      new Text("77%",
                                          style: new TextStyle(
                                              color: Colors.black))
                                    
                               ] )
                               ])),
                    )
                        .toList(),
                  )),
              new Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Events",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                        new GestureDetector(
                            onTap: () {
                              widget.controller.animateTo(2);
                            },
                            child: Text(
                              "more",
                              style: new TextStyle(color: Colors.blue),
                            ))
                      ])),
              new Container(
                  height: 300.0,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: events
                        .map(
                          (events) =>
                      new Container(
                          height: 300.0,
                          width: 250.0,
                          child: new Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Container(
                                    height: 250.0,
                                    width: 250.0,
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12.0)),
                                      child: new ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(12.0),
                                        child: new Image(
                                          image: new AssetImage("Assets/img/"+events+".jpeg"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:<Widget>[new Text(
                                  events,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                
                                new Icon(
                                        Icons.thumb_up,
                                        color: Colors.blue,
                                  ),
                                new Text("77%",
                                    style: new TextStyle(
                                    color: Colors.black))
                                ])
                              ])),
                    )
                        .toList(),
                  ))
            ])));
  }
}
