import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

void launchFacebook(String url, String fallbackUrl) async {
  try {
    bool launched =
        await launch(url, forceSafariVC: false, forceWebView: false);
    if (!launched) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  }
}

launchWhatsapp(BuildContext context) async {
  var whatsapp = "+249929990093";
  var whatsappURlAndroid =
      "whatsapp://send?phone=" + whatsapp + "&text=hello oqbah from dx player app";
  var whatsappURLIos =
      "https://wa.me/$whatsapp?text=${Uri.parse("hello oqbah form dx player app")}";
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunch(whatsappURLIos)) {
      await launch(whatsappURLIos, forceSafariVC: false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("whatsapp is not installed")));
    }
  } else {
    // android , web
    if (await canLaunch(whatsappURlAndroid)) {
      await launch(whatsappURlAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("whatsapp is not installed")));
    }
  }
}

Future<void> openEmail(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void openUrl({String url}) {
  launch(url, forceWebView: false, enableJavaScript: true);
}
