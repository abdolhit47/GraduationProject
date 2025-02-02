import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/zero_bloc.dart';
import 'models/zero_model.dart';

class ZeroScreen extends StatelessWidget {
  const ZeroScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ZeroBloc>(
      create: (context) => ZeroBloc(ZeroState(
        zeroModelObj: ZeroModel(),
      ))
        ..add(ZeroInitialEvent()),
      child: ZeroScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZeroBloc, ZeroState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colorScheme.onPrimary,
          body: SafeArea(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgWhatsappImage20241116,
                    height: 80.h,
                    width: 82.h,
                    radius: BorderRadius.circular(
                      14.h,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
