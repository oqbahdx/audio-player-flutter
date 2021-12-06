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
  var whatsappURl_android =
      "whatsapp://send?phone=" + whatsapp + "&text=hello oqbah from audio app";
  var whatappURL_ios =
      "https://wa.me/$whatsapp?text=${Uri.parse("hello oqbah form audio app")}";
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunch(whatappURL_ios)) {
      await launch(whatappURL_ios, forceSafariVC: false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp is not installed")));
    }
  } else {
    // android , web
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp is not installed")));
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
