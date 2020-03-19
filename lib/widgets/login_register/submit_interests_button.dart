import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/constents/keywords.dart';
import 'package:safqty/providers/category_provider.dart';
import 'package:safqty/providers/login_provider.dart';
import 'package:safqty/providers/register_provider.dart';
import 'package:safqty/screens/auth/go_to_home_screen.dart';
import 'package:safqty/widgets/common/commons.dart';
import 'package:safqty/widgets/login_register/login_register_style.dart';

class SubmitInterestsButton extends StatefulWidget {
  final AuthAction authAction;
  final List<int> selectedCategories;

  SubmitInterestsButton({this.authAction, this.selectedCategories});

  @override
  _SubmitInterestsButtonState createState() => _SubmitInterestsButtonState();
}

class _SubmitInterestsButtonState extends State<SubmitInterestsButton> {
  var _loading = false;

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Container(
        height: 56,
        alignment: Alignment.center,
        child: SizedBox(
          height: double.infinity,
          width: 56,
          child: LoadingIndicator(
            color: SOrange,
            indicatorType: Indicator.ballClipRotate,
          ),
        ),
      );
    } else {
      return LoginRegisterStyle.buildButton(tr('confirm'), () {
        _addInterestedCategoriesToServer();
      }, true);
    }
  }

  Future<void> _addInterestedCategoriesToServer() async {
    setState(() {
      _loading = true;
    });
    try {
      final token = widget.authAction == AuthAction.register
          ? Provider.of<RegisterProvider>(context, listen: false).token
          : Provider.of<LoginProvider>(context, listen: false).token;
      final result = await Provider.of<CategoryProvider>(context, listen: false)
          .addInterestedCategories(widget.selectedCategories, token);
      if (result['value']) {
        final deviceToken = await getDeviceToken();
        await saveDeviceToken(deviceToken);
        Navigator.of(context).pushReplacementNamed(GoToHomeScreen.routeName);
      } else {
        Commons.showAlert(
          context: context,
          title: tr('warning'),
          content: result['msg'],
        );
        setState(() {
          _loading = false;
        });
      }
    } catch (error) {
      Commons.showAlert(
        context: context,
        title: tr('warning'),
        content: tr('check_internet'),
      );
      setState(() {
        _loading = false;
      });
    }
  }
}
