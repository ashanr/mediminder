import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediminder/Main_home/check_health_status.dart';

import 'package:mediminder/Main_home/main_home.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/global_bloc.dart';
import 'package:mediminder/pages/home_page.dart';
import 'package:mediminder/pages/new_entry/new_entry_page.dart';
import 'package:mediminder/pages/success_screen/success_screen.dart';
import 'package:mediminder/pages/welcome.dart';
import 'package:mediminder/plans/add_diet1_plans/new_plan1.dart';
import 'package:mediminder/plans/add_diet1_plans/success_screen_diet1.dart';
import 'package:mediminder/plans/diet1plan.dart';
import 'package:mediminder/plans/global_diet1_bloc.dart';
import 'package:mediminder/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  GlobalBloc? globalBloc;
  GlobalDiet2Bloc? globalDiet2Bloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    globalDiet2Bloc = GlobalDiet2Bloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalBloc>(create: (_) => GlobalBloc()),
        Provider<GlobalDiet2Bloc>(create: (_) => GlobalDiet2Bloc())
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Medi Minder',
          //theme customization
          theme: ThemeData.dark().copyWith(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            //appbar theme
            appBarTheme: AppBarTheme(
              toolbarHeight: 5.h,
              backgroundColor: kBarColor,
              elevation: 0,
              iconTheme: IconThemeData(
                color: kScaffoldColor,
                size: 20.sp,
              ),
              titleTextStyle: GoogleFonts.aBeeZee(
                color: kScaffoldColor,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 16.sp,
              ),
            ),
            textTheme: TextTheme(
              headlineSmall: TextStyle(
                fontSize: 22.sp,
                color: kBarColor,
                fontWeight: FontWeight.w500,
              ),
              headlineLarge: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.w900,
                fontSize: 26,
                color: kTextColor,
                letterSpacing: 2,
              ),
              headlineMedium: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
                color: kTextColor,
              ),
              titleSmall:
                  GoogleFonts.aBeeZee(fontSize: 13.sp, color: kTextColor),
              bodySmall: GoogleFonts.aBeeZee(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: kOtherColor),
              labelLarge: GoogleFonts.aBeeZee(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: kScaffoldColor,
                letterSpacing: 1.0,
              ),
              labelMedium: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: kTextColor,
              ),
              labelSmall: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: kScaffoldColor,
              ),
              bodyLarge: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: kTextColor,
              ),
              bodyMedium: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: kOtherColor,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kTextLightColor,
                  width: 0.7,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kTextLightColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),

            //let's customize the time picker theme
            timePickerTheme: TimePickerThemeData(
              backgroundColor: kScaffoldColor,
              hourMinuteColor: kOtherColor,
              hourMinuteTextColor: kScaffoldColor,
              dialBackgroundColor: kOtherColor,
              dialHandColor: kBarColor,
              dialTextColor: kScaffoldColor,
              entryModeIconColor: kOtherColor,
              helpTextStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: kOtherColor),
              cancelButtonStyle: ButtonStyle(
                  foregroundColor:
                      MaterialStateColor.resolveWith((states) => kOtherColor)),
              confirmButtonStyle: ButtonStyle(
                  foregroundColor:
                      MaterialStateColor.resolveWith((states) => kOtherColor)),
            ),
          ),
          //home: WelcomePage(),
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/': (context) => const WelcomePage(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/login': (context) => const WelcomeScreen(),
            '/dashbordpage': (context) => const DashboardPage(),
            '/checkhealth': (context) => const CheckHealthStatus(),
            '/setreminders': (context) => const HomePage(),
            '/newentry': (context) => const NewEntryPage(),
            '/success': (context) => const SuccessScreen(),
            '/dietplans': (context) => const Diet2Plans(),
            '/newdietplan': (context) => const NewDiet2PlanPage(),
            '/diet2success': (context) => const Diet2SuccessScreen(),
          },
        );
      }),
    );
  }
}
