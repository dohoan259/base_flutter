import 'package:base_project/base/base_controller.dart';
import 'package:base_project/base/base_state.dart';
import 'package:base_project/data/result.dart';
import 'package:base_project/presentation/view/screens/error/unknown_error_page.dart';
import 'package:base_project/presentation/view/widgets/loading.dart';
import 'package:base_project/presentation/view/widgets/uninitialized_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage<C extends BaseController, T extends BaseState>
    extends StatefulWidget {
  @override
  _BasePageState<C, T> createState() => _BasePageState<C, T>();

  final Function(Result) onPageInitialized;

  final Widget loadedView;

  final Widget errorView;

  const BasePage({
    this.onPageInitialized,
    @required this.loadedView,
    this.errorView,
  });
}

class _BasePageState<C extends BaseController, T extends BaseState>
    extends State<BasePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<C>().loadData().then((result) {
        widget.onPageInitialized?.call(result);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Selector<T, ViewState>(
          selector: (context, model) => model.viewState,
          builder: (_, viewState, __) {
            if (viewState == ViewState.Uninitialized) {
              return UninitializedWidget();
            } else if (viewState == ViewState.Error) {
              return widget.errorView ?? UnknownErrorPage<C>();
            } else {
              return Stack(
                children: [
                  Scaffold(
                    body: widget.loadedView,
                  ),
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
        ));
  }
}
