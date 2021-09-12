import 'package:bible_quest/globals/user_character.dart';
import 'package:flutter/material.dart';

import 'clipper.dart';

class BibleQuestAppBar extends StatelessWidget with PreferredSizeWidget {
  const BibleQuestAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
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
            (!Navigator.of(context).canPop())
                ? Container(
                    margin: EdgeInsets.only(top: kToolbarHeight - 30),
                    child: Material(
                      elevation: 0,
                      clipBehavior: Clip.hardEdge,
                      type: MaterialType.circle,
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: kToolbarHeight - 30),
                    child: Material(
                      elevation: 0,
                      clipBehavior: Clip.hardEdge,
                      type: MaterialType.circle,
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
            Positioned(
              top: kToolbarHeight - 27,
              right: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.white),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.notifications),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kToolbarHeight - 25),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  UserCharacter(
                    size: 50,
                    shape: BoxShape.circle,
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
      ),
    );
  }
}
