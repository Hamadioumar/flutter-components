import 'package:flutter/material.dart';
import 'package:flutter_components/app/components/app_bar.dart';
import 'package:flutter_components/app/components/catagories_list_view.dart';
import 'package:flutter_components/app/components/popular_components_list.dart';
import 'package:flutter_components/app/components/search_bar.dart';
import 'package:flutter_components/app/home/models/components_info.dart';
import 'package:flutter_components/app/home/models/design_components.dart';
import 'package:flutter_components/main.dart';

class DesignComponentHomeScreen extends StatefulWidget {
  @override
  _DesignComponentHomeScreenState createState() =>
      _DesignComponentHomeScreenState();
}

class _DesignComponentHomeScreenState extends State<DesignComponentHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignComponentAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            GetAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      GetSearchBarUI(),
                      Flexible(
                        child: getPopularComponentUI(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPopularComponentUI() {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Components',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignComponentAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: PopularComponentListView(),
          )
        ],
      ),
    );
  }
//navigation to the components info
  
  }
 



