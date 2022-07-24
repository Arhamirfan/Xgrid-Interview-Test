import 'package:flutter/material.dart';
import 'package:xgrid_interview_testdesign/Controller/storage_manager.dart';
import 'package:xgrid_interview_testdesign/constants.dart';
import 'package:xgrid_interview_testdesign/model/buttonModel.dart';

import '../Controller/theme_manager.dart';

class HomeScreen extends StatefulWidget {
  ThemeNotifier theme;
  HomeScreen({required this.theme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late var _currentTheme;
  var themeMode = 'dark';

  changeThemeDatatype() {
    StorageManager.readData('themeMode').then((value) {
      setState(() {
        themeMode = value;
      });
      if (themeMode == 'light') {
        setState(() {
          widget.theme.setDarkMode();
        });
      } else {
        setState(() {
          widget.theme.setLightMode();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      changeThemeDatatype();
                    },
                    child: Icon(themeMode == 'dark'
                        ? Icons.nightlight_outlined
                        : Icons.wb_sunny_outlined)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffFF9800),
                  radius: 40,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff221400),
                    radius: 37,
                    child: Icon(
                      Icons.person_outlined,
                      color: Color(0xffFF9800),
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text('John Doe',
                    style: themeMode == 'light'
                        ? kmlwhiteboldText
                        : kmlblackboldText),
                SizedBox(height: 10),
                Text('john.doe@example.com'),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Upgrade to PRO'),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), primary: Colors.orange),
                  ),
                ),
                SizedBox(height: 15),
                ListView.builder(
                  itemCount: buttonList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        tileColor: Colors.black12,
                        leading: buttonList[index].icon,
                        title: Text(buttonList[index].title),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    tileColor: Colors.black,
                    title: Text('Logout',
                        style: kmlwhiteText, textAlign: TextAlign.center),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
