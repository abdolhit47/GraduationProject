import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/seventeen_bloc.dart';
import 'models/listsection_item_model.dart';
import 'models/seventeen_model.dart';
import 'models/seventeen_tab_model.dart';
import 'widgets/listsection_item_widget.dart';

class SeventeenTabPage extends StatefulWidget {
  const SeventeenTabPage({Key? key})
      : super(
          key: key,
        );

  @override
  SeventeenTabPageState createState() => SeventeenTabPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<SeventeenBloc>(
      create: (context) => SeventeenBloc(SeventeenState(
        seventeenTabModelObj: SeventeenTabModel(),
      ))
        ..add(SeventeenInitialEvent()),
      child: SeventeenTabPage(),
    );
  }
}

class SeventeenTabPageState extends State<SeventeenTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 24.h,
      ),
      child: Column(
        children: [_buildListSection(context)],
      ),
    );
  }

  /// Section Widget
  Widget _buildListSection(BuildContext context) {
    return Expanded(
      child: BlocSelector<SeventeenBloc, SeventeenState, SeventeenTabModel?>(
        selector: (state) => state.seventeenTabModelObj,
        builder: (context, seventeenTabModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.h,
              );
            },
            itemCount: seventeenTabModelObj?.listsectionItemList.length ?? 0,
            itemBuilder: (context, index) {
              ListsectionItemModel model =
                  seventeenTabModelObj?.listsectionItemList[index] ??
                      ListsectionItemModel();
              return ListsectionItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
