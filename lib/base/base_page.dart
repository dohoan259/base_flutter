import 'package:base_project/base/base_state.dart';
import 'package:base_project/presenter/widgets/loading.dart';
import 'package:base_project/presenter/widgets/uninitialize_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage<T extends BaseState> extends StatefulWidget {
  @override
  _BasePageState<T> createState() => _BasePageState<T>();

  final Function() onModelReady;

  final Widget loadedView;

  final Widget errorView;

  const BasePage({this.onModelReady, this.loadedView, this.errorView});
}

class _BasePageState<T extends BaseState> extends State<BasePage> {
  @override
  void initState() {
    // var viewState = context.select<T, ViewState>((T t) => t.viewState);
    // if (viewState == ViewState.Error) {
    //   //todo: Error handler
    // }

    widget.onModelReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<T>(
      builder: (context, state, child) {
        if (state is UninitializedState) {
          return UninitializeWidget();
        } else if (state is ErrorState) {
         return widget.errorView;
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
                  selector: (_, t) => t.processing)
            ],
          );
        }
      },
    );

    // return Selector<T, ViewState>(
    //   selector: (context, model) => model.viewState,
    //   builder: (_, viewState, __) {
    //     if (viewState == ViewState.Uninitialized) {
    //       return UninitializeWidget();
    //     } else if (viewState == ViewState.Loaded) {
    //       return Stack(
    //         children: [
    //           widget.loadedView,
    //           Selector<T, bool>(
    //               builder: (_, processing, __) {
    //                 if (processing) {
    //                   return Loading(
    //                     opacity: 0.3,
    //                   );
    //                 } else {
    //                   return SizedBox();
    //                 }
    //               },
    //               selector: (_, t) => t.processing)
    //         ],
    //       );
    //     } else {
    //       return widget.errorView;
    //     }
    //   },
    // );
  }
}
