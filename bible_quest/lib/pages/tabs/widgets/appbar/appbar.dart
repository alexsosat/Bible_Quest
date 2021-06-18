import 'package:bible_quest/pages/tabs/widgets/appbar/clipper.dart';
import 'package:flutter/material.dart';

class BibleQuestAppBar extends StatelessWidget with PreferredSizeWidget {
  const BibleQuestAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Stack(
        children: <Widget>[
          ClipPath(
              clipper: AppBarClipper(),
              child: Container(
                height: 140.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(0, 153, 255, 1.0),
                          Color.fromRGBO(204, 97, 255, 1.0)
                        ],
                        begin: FractionalOffset(0.2, 0.0),
                        end: FractionalOffset(1.0, 0.6),
                        stops: [0.0, 0.6],
                        tileMode: TileMode.clamp)),
                child: Stack(
                  children: <Widget>[
                    Container(
                        margin:
                            EdgeInsets.only(top: kToolbarHeight - 20, left: 10),
                        child: Icon(Icons.menu)),
                    Container(
                      margin: EdgeInsets.only(top: kToolbarHeight - 25),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1525357816819-392d2380d821?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=967&q=80"),
                          ),
                          Text(
                            "Alex Sosa",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.paid_outlined,
                    color: Colors.yellow,
                  ),
                  Text("125"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
