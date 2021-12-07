import 'package:flutter/material.dart';

moveToPage(BuildContext context, {String namePage}) {
  return Navigator.of(context).pushNamed(namePage);
}

moveToPageWithData(BuildContext context, {Widget namePage}) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => namePage));
}
