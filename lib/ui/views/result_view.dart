import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../core/models/tvshow_result.dart';
import '../../core/utils/constants.dart';
import '../shared/styles.dart';
import '../shared/unicons_icons.dart';
import '../widgets/home_button.dart';
import '../widgets/info_box.dart';
import 'loading_view.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key key, this.tvshowResult}) : super(key: key);
  final TvshowResult tvshowResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: DEFAULT_INSESTS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                translate('app.result.title'),
                style: StyleText.MESSAGES,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        right: 0.0,
                        left: 0.0,
                        top: 0.0,
                        bottom: 24.0,
                        child: Container(
                          padding: DEFAULT_INSESTS,
                          decoration: BoxDecoration(
                            borderRadius: BORDER_RADIUS,
                            border: Border.all(),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                tvshowResult.tvshowDetails.name,
                                style: StyleText.TITLE,
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InfoBox(
                                      typeInfo: 3,
                                      value: tvshowResult.randomSeason,
                                    ),
                                    InfoBox(
                                      typeInfo: 4,
                                      value: tvshowResult.randomEpisode,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                tvshowResult.episodeName,
                                style: StyleText.MESSAGES,
                              ),
                              const SizedBox(height: 8),
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 3,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(tvshowResult.episodeDescription),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton.icon(
                          icon: const Icon(
                            Unicons.dice_multiple,
                            color: StyleColor.WHITE,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: StyleColor.PRIMARY,
                          label: Text(
                            translate('app.result.button_random'),
                            style: StyleText.WHITE,
                          ),
                          onPressed: () => Navigator.pushNamed<LoadingView>(
                            context,
                            RoutePaths.LOADING,
                            arguments: tvshowResult.tvshowDetails,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const HomeButton(),
          ],
        ),
      )),
    );
  }
}
