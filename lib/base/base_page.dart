import 'package:base_project/base/base_controller.dart';
import 'package:base_project/base/base_state.dart';
import 'package:base_project/base/error_page.dart';
import 'package:base_project/base/result.dart';
import 'package:base_project/presenter/widgets/loading.dart';
import 'package:base_project/presenter/widgets/uninitialize_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage<T extends BaseState, U extends BaseController> extends StatefulWidget {
  @override
  _BasePageState<T, U> createState() => _BasePageState<T, U>();

  final Function(Result) onPageInitialized;

  final Widget loadedView;

  final Widget errorView;

  const BasePage({
    this.onPageInitialized,
    @required this.loadedView,
    this.errorView,
  });
}

class _BasePageState<T extends BaseState, U extends BaseController> extends State<BasePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<U>().initState().then((result) {
        widget.onPageInitialized?.call(result);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<T, ViewState>(
      selector: (context, model) => model.viewState,
      builder: (_, viewState, __) {
        if (viewState == ViewState.Uninitialized) {
          return UninitializeWidget();
        } else if (viewState == ViewState.Error) {
          return widget.errorView ?? ErrorPage();
        } else {
          return Stack(
            children: [
              widget.loadedView,
              Selector<T, bool>(
                  builder: (_, processing, __) {
                    if (processing) {
                      return Loading(
                        opacity: 0.3,
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                  selector: (_, state) => state.processing)
            ],
          );
        }
      },
    );
  }
}
