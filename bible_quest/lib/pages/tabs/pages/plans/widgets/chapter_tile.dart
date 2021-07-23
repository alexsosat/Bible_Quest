import 'package:flutter/material.dart';

class ChapterTile extends StatelessWidget {
  final String title;
  final bool readed;
  final Function()? onPressed;

  const ChapterTile({
    Key? key,
    required this.title,
    required this.readed,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          primary: Colors.white,
          backgroundColor: Color(0xFF151529),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: (readed)
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
