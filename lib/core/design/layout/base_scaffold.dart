import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../router/base_router.dart';
import '../decoration/base_color.dart';
import '../style/base_text_style.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool withAppBar;
  final bool withFab;
  final String appBarTitle;
  final bool withBackAppBar;
  final bool withTrailingAppBar;
  final Function? onTapTrailingAppBar;
  final String? backRoute;
  final bool safeArea;
  final bool padding;

  const BaseScaffold({
    required this.body,
    this.backgroundColor = BaseColor.neutral0,
    this.resizeToAvoidBottomInset = true,
    this.safeArea = true,
    this.padding = true,
    this.withBackAppBar = false,
    this.withTrailingAppBar = false,
    this.withAppBar = false,
    this.withFab = false,
    this.appBarTitle = '',
    this.onTapTrailingAppBar,
    this.backRoute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = padding
        ? Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: body,
          )
        : body;
    return Scaffold(
      floatingActionButton: withFab
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(BaseRouter.addBook);
                },
                backgroundColor: BaseColor.primary,
                child: const Icon(Icons.add),
              ),
            )
          : null,
      appBar: withAppBar
          ? AppBar(
              automaticallyImplyLeading: false,
              elevation: 1,
              backgroundColor: BaseColor.primary,
              surfaceTintColor: BaseColor.neutral0,
              shadowColor: BaseColor.neutral0,
              actions: [
                if (withTrailingAppBar)
                  IconButton(
                    onPressed: () {
                      if (onTapTrailingAppBar != null) onTapTrailingAppBar!();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: BaseColor.neutral0,
                    ),
                  )
              ],
              leading: withBackAppBar
                  ? IconButton(
                      onPressed: () {
                        backRoute != null
                            ? Navigator.popUntil(
                                context,
                                ModalRoute.withName(
                                  backRoute!,
                                ),
                              )
                            : Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        color: BaseColor.neutral0,
                      ),
                    )
                  : null,
              title: Text(
                appBarTitle,
                style: BaseTextStyle.header3Semibold(),
              ),
              centerTitle: true,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: safeArea
          ? SafeArea(
              child: content,
            )
          : content,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
