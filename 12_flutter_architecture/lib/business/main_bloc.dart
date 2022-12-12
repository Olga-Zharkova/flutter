import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_architecture/domain/user.dart';
import 'package:flutter_architecture/domain/user_service.dart';

part 'main_bloc.freezed.dart';

class MainBloc {
  final UserService userService;
  final StreamController<MainBlocEvent> _eventController = StreamController();
  final StreamController<MainBlocState> _stateController = StreamController();

  Stream<MainBlocState> get state => _stateController.stream;

  MainBloc({required this.userService}) {
    _eventController.stream.listen((event) {
      event.map<void>(
        init: (_) async {
          _stateController.add(
            const MainBlocState.loading(),
          );
          _stateController.add(
            MainBlocState.loaded(
              user: await userService.getDefaultUser(),
            ),
          );
        },
        setUser: (event) async => _stateController.add(
          MainBlocState.loaded(
              user: await userService.getUserById(event.userId)),
        ),
      );
    });
  }

  void add(MainBlocEvent event) {
    if (_eventController.isClosed) return;
    _eventController.add(event);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}

@freezed
class MainBlocState with _$MainBlocState {
  const factory MainBlocState.loading() = _MainLoadingState;

  const factory MainBlocState.loaded({required User user}) = MainLoadedState;
}

@freezed
class MainBlocEvent with _$MainBlocEvent {
  const factory MainBlocEvent.init() = _MainInitEvent;

  const factory MainBlocEvent.setUser({required int userId}) = MainSetEvent;
}
