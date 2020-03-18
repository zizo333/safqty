import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/providers/category_provider.dart';
import 'package:safqty/providers/city_provider.dart';
import 'package:safqty/providers/login_provider.dart';
import 'package:safqty/providers/register_provider.dart';
import 'package:safqty/screens/add_auction/add_auction_screen.dart';
import 'package:safqty/screens/add_auction/added_auction_success_screen.dart';
import 'package:safqty/screens/add_auction/continue_add_auction_screen.dart';
import 'package:safqty/screens/auction_details_screen.dart';
import 'package:safqty/screens/auth/activation_screen.dart';
import 'package:safqty/screens/filter_screen.dart';
import 'package:safqty/screens/notifications_screen.dart';
import 'package:safqty/screens/side_menu/bank_accounts_screen.dart';
import 'package:safqty/screens/side_menu/commission_screen.dart';
import 'package:safqty/screens/auth/forgot_password_screen.dart';
import 'package:safqty/screens/auth/go_to_home_screen.dart';
import 'package:safqty/screens/home_screen.dart';
import 'package:safqty/screens/auth/interests_screen.dart';
import 'package:safqty/screens/auth/intro_screen.dart';
import 'package:safqty/screens/auth/login_screen.dart';
import 'package:safqty/screens/tabs/messages_screen.dart';
import 'package:safqty/screens/tabs/my_favorite_screen.dart';
import 'package:safqty/screens/side_menu/orders_screen.dart';
import 'package:safqty/screens/tabs/profile_screen.dart';
import 'package:safqty/screens/auth/register_screen.dart';
import 'package:safqty/screens/side_menu/sign_out_screen.dart';
import 'package:safqty/screens/splash_screen.dart';
import 'package:safqty/screens/side_menu/support_screen.dart';
import 'package:safqty/screens/side_menu/terms_screen.dart';

import 'screens/tab_bar_items.dart';

void main() {
  runApp(
    EasyLocalization(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: CityProvider(),
          ),
          ChangeNotifierProvider.value(
            value: RegisterProvider(),
          ),
          ChangeNotifierProvider.value(
            value: CategoryProvider(),
          ),
          ChangeNotifierProvider.value(
            value: LoginProvider(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
              fontFamily: 'ArbFONTS-Tajawal',
              primaryColor: SOrange,
              canvasColor: Color(0XFFF8F8FA)),
          debugShowCheckedModeBanner: false,
          title: 'Safqty',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            EasyLocalizationDelegate(locale: data.locale, path: 'assets/lang')
          ],
          supportedLocales: [
            Locale('ar', 'EG'),
            Locale('en', 'US'),
          ],
          home: LoginScreen(),
          routes: {
            LoginScreen.routeName: (ctx) => LoginScreen(),
            RegisterScreen.routeName: (ctx) => RegisterScreen(),
            ActivationScreen.routeName: (ctx) => ActivationScreen(),
            InterestsScreen.routeName: (ctx) => InterestsScreen(),
            ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            CommissionScreen.routeName: (ctx) => CommissionScreen(),
            BankAccountsScreen.routeName: (ctx) => BankAccountsScreen(),
            SupportScreen.routeName: (ctx) => SupportScreen(),
            TermsScreen.routeName: (ctx) => TermsScreen(),
            SignOutScreen.routeName: (ctx) => SignOutScreen(),
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
            MessagesScreen.routeName: (ctx) => MessagesScreen(),
            MyFavoriteScreen.routeName: (ctx) => MyFavoriteScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            FilterScreen.routeName: (ctx) => FilterScreen(),
            NotificationsScreen.routeName: (ctx) => NotificationsScreen(),
            AuctionDetailsScreen.routeName: (ctx) => AuctionDetailsScreen(),
            ContinueAddAuction.routeName: (ctx) => ContinueAddAuction(),
            GoToHomeScreen.routeName: (ctx) => GoToHomeScreen(),
            AddAuctionScreen.routeName: (ctx) => AddAuctionScreen(),
            AddedAuctionSuccessScreen.routeName: (ctx) =>
                AddedAuctionSuccessScreen(),
            TabBarItems.routeName: (ctx) => TabBarItems(),
          },
        ),
      ),
    );
  }
}
