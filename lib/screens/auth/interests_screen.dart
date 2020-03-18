import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:safqty/constents/colors.dart';
import 'package:safqty/constents/helper.dart';
import 'package:safqty/providers/category_provider.dart';
import 'package:safqty/widgets/common/commons.dart';
import 'package:safqty/widgets/interests/interests_categories.dart';
import 'package:safqty/widgets/login_register/submit_interests_button.dart';

class InterestsScreen extends StatelessWidget {
  final AuthAction authAction;

  InterestsScreen([this.authAction = AuthAction.register]);

  static const routeName = '/interests-screen';

  final List<int> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 18,
            right: 18,
            top: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),
                      Commons.safqtyHeader(),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          tr('من فضلك حدد اهتماماتك'),
                          style: TextStyle(color: SBlack, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FutureBuilder(
                        future: Provider.of<CategoryProvider>(context,
                                listen: false)
                            .fetchAllCategories(),
                        builder: (ctx, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Container(
                                height: 80,
                                width: 80,
                                child: LoadingIndicator(
                                  color: SOrange,
                                  indicatorType: Indicator.ballClipRotate,
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                tr('check_internet'),
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            );
                          } else {
                            return Consumer<CategoryProvider>(
                              builder: (ctx, category, _) => GridView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: category.items.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 18,
                                  crossAxisSpacing: 18,
                                  childAspectRatio: 3 / 2,
                                ),
                                itemBuilder: (ctx, index) =>
                                    InterestsCategories(
                                  category: category.items[index],
                                  selectedCategories: selectedCategories,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SubmitInterestsButton(
                    authAction: authAction,
                    selectedCategories: selectedCategories,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(
                  Localizations.localeOf(context).languageCode == 'en'
                      ? Icons.arrow_forward_ios
                      : Icons.arrow_back_ios,
                  color: Color(0XFF434A51),
                  size: 32,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
