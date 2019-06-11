import 'package:first_flutter/redux/BaseReducer.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class AppState {
  static const Locale enLocal = Locale('zh', '');

  Locale currentLocal = enLocal;

//  static DefaultCacheManager cacheManager;

  static AppState createInitialState() {
    return new AppState();
  }
}

class AppReducer {
  static const String TAG = "AppReducer";

  static Store<AppState> store =
      Store(AppReducer.reducer, initialState: AppState.createInitialState());

  static List<BaseReducer> reducers = [];

  /// 拦截器
  static void appMiddleware(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
  ) {
    next(action);
  }

  static AppState reducer(AppState state, dynamic action) {
    for (BaseReducer reducer in reducers) {
      if (reducer.canHandleAction(action)) {
        reducer.handleAction(state, action);
      }
    }
    return state;
  }
}
