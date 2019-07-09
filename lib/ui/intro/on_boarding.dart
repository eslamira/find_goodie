import 'package:find_goodie/ui/auth/main_auth.dart';
import 'package:find_goodie/ui/lib/intro_views_flutter-2.4.0/lib/Models/page_view_model.dart';
import 'package:find_goodie/ui/lib/intro_views_flutter-2.4.0/lib/intro_views_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

var _fontHeaderStyle = TextStyle(
    fontFamily: "Popins",
    fontSize: 21.0,
    fontWeight: FontWeight.w800,
    color: Colors.black87,
    letterSpacing: 1.5);

var _fontDescriptionStyle = TextStyle(
    fontFamily: "Sans",
    fontSize: 15.0,
    color: Colors.black26,
    fontWeight: FontWeight.w400);

///
/// Page View Model for on boarding
///
final pages = [
  new PageViewModel(
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Find Goodie App',
        style: _fontHeaderStyle,
      ),
      body: Container(
        height: 250.0,
        child: Text('Discover Top rated restaurants in your neighborhood',
            textAlign: TextAlign.center, style: _fontDescriptionStyle),
      ),
      mainImage: Image.network(
        'https://cdn.eatigo.com/filters:format(webp)/home-banner/7e3140dd-d321-40d0-beec-8c17912a9d7c.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),
  new PageViewModel(
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Book',
        style: _fontHeaderStyle,
      ),
      body: Container(
        height: 250.0,
        child: Text('Book Directly as you wish',
            textAlign: TextAlign.center, style: _fontDescriptionStyle),
      ),
      mainImage: Image.network(
        'https://cdn.eatigo.com/filters:format(webp)/home-banner/7e3140dd-d321-40d0-beec-8c17912a9d7c.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),
  new PageViewModel(
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Offer',
        style: _fontHeaderStyle,
      ),
      body: Container(
        height: 250.0,
        child: Text('Offer Exclusive offers up to 50%',
            textAlign: TextAlign.center, style: _fontDescriptionStyle),
      ),
      mainImage: Image.network(
        'https://cdn.eatigo.com/filters:format(webp)/home-banner/a04294d4-e3bb-4e55-9394-7e8777099e4c.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),
];

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      pages,
      pageButtonsColor: Colors.black45,
      skipText: Text(
        "SKIP",
        style: _fontDescriptionStyle.copyWith(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0),
      ),
      doneText: Text(
        "DONE",
        style: _fontDescriptionStyle.copyWith(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0),
      ),
      onTapDoneButton: () async {
        SharedPreferences _pref = await SharedPreferences.getInstance();
        _pref.setBool('seenIntro', true);
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (_, __, ___) => MainAuthScreen(),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget widget) {
            return Opacity(
              opacity: animation.value,
              child: widget,
            );
          },
          transitionDuration: Duration(milliseconds: 1500),
        ));
      },
    );
  }
}
