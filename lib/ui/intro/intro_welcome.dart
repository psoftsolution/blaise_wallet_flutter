import 'package:blaise_wallet_flutter/appstate_container.dart';
import 'package:blaise_wallet_flutter/ui/util/text_styles.dart';
import 'package:blaise_wallet_flutter/ui/widgets/auto_resize_text.dart';
import 'package:blaise_wallet_flutter/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class IntroWelcomePage extends StatefulWidget {
  @override
  _IntroWelcomePageState createState() => _IntroWelcomePageState();
}

class _IntroWelcomePageState extends State<IntroWelcomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // The main scaffold that holds everything
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      backgroundColor: StateContainer.of(context).curTheme.backgroundPrimary,
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
              children: <Widget>[
                //A widget that holds welcome animation + paragraph
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // A stack for background gradient and the animation
                      Stack(
                        children: <Widget>[
                          // Container for the gradient background
                          Container(
                            height: (MediaQuery.of(context).padding.top +
                                    (MediaQuery.of(context).size.width *
                                        262 /
                                        400)) -
                                (MediaQuery.of(context).size.width * 80 / 400),
                            decoration: BoxDecoration(
                              gradient: StateContainer.of(context)
                                  .curTheme
                                  .gradientPrimary,
                            ),
                          ),
                          //Container for the animation
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                top: MediaQuery.of(context).padding.top),
                            //Width/Height ratio for the animation is needed because BoxFit is not working as expected
                            width: double.infinity,
                            height:
                                MediaQuery.of(context).size.width * 262 / 400,
                            child: Center(
                              child: FlareActor(
                                "assets/animation_welcome.flr",
                                animation: "main",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Container for the paragraph
                      Expanded(
                        child: Container(
                          alignment: Alignment(0, -0.2),
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: AutoSizeText(
                            "Welcome to Blaise Wallet. To begin, you can create a new private key or import one.",
                            maxLines: 4,
                            stepGranularity: 0.1,
                            style: AppStyles.paragraph(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //A column with "New Private Key" and "Import Private Key" buttons
                Column(
                  children: <Widget>[
                    // "New Private Key" button 
                    Row(
                      children: <Widget>[
                        AppButton.buildAppButton(context, AppButtonType.Primary, "New Private Key", buttonTop: true, onPressed: (){
                          Navigator.of(context)
                                    .pushNamed('/intro_new_private_key');
                        }),
                      ],
                    ),
                    // "Import Private Key" button 
                    Row(
                      children: <Widget>[
                        AppButton.buildAppButton(context, AppButtonType.PrimaryOutline, "Import Private Key"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
