import 'AppState.dart';
import 'BaseAction.dart';

abstract class BaseReducer {

	bool canHandleAction(BaseAction action);

	void handleAction(AppState state, dynamic action);

}