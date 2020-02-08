import 'package:bachat/screens/bachat_page.dart';
import 'package:bachat/screens/login_page.dart';
import 'package:bachat/screens/summary_page.dart';
import 'package:bachat/themes/colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          cardColor: kBlackColor,
          appBarTheme: AppBarTheme(
            color: kBlackColor
          ),
          scaffoldBackgroundColor: kBlackColor
        ),
        home: SummaryScreen(),
      ),
    );
