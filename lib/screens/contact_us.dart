import 'package:audioplayer/components/share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);
  static String id = "ContactUs";

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF383B49),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              GestureDetector(
                onTap: (){
                  // launchEmail(context);

                  openEmail("mailto:oqbahdx@gmail.com");
                },
                child: Text(
                  'oqbahdx@gmail.com',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
             SizedBox(height: 250,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                IconButton(
                    onPressed: () {
                      launchFacebook('fb://profile/oqbah.dx.7',
                          'https://www.facebook.com/oqbah.dx.7');
                    },
                    icon: Icon(
                      FontAwesome.facebook_squared,
                      color: Colors.blue,
                      size: 60,
                    )),
                IconButton(
                    onPressed: () {
                      openUrl(url: 'https://github.com/oqbahdx');
                    },
                    icon: Icon(
                      FontAwesome.github_circled,
                      color: Colors.white,
                      size: 60,
                    )),
                IconButton(
                    onPressed: () {
                      openUrl(url: 'https://www.linkedin.com/in/oqbah-dx-25b9951b1/');
                    },
                    icon: Icon(
                      FontAwesome.linkedin_squared,
                      color: Colors.blue,
                      size: 60,
                    )),
                IconButton(
                    onPressed: () {
                      launchWhatsapp(context);
                    },
                    icon: Icon(
                      FontAwesome.whatsapp,
                      color: Colors.teal,
                      size: 60,
                    )),
              ],)
            ],
          )),
    );
  }
}
