// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainLoadingState value) loading,
    required TResult Function(MainLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainLoadingState value)? loading,
    TResult Function(MainLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainLoadingState value)? loading,
    TResult Function(MainLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBlocStateCopyWith<$Res> {
  factory $MainBlocStateCopyWith(
          MainBlocState value, $Res Function(MainBlocState) then) =
      _$MainBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MainBlocStateCopyWithImpl<$Res>
    implements $MainBlocStateCopyWith<$Res> {
  _$MainBlocStateCopyWithImpl(this._value, this._then);

  final MainBlocState _value;
  // ignore: unused_field
  final $Res Function(MainBlocState) _then;
}

/// @nodoc
abstract class _$$_MainLoadingStateCopyWith<$Res> {
  factory _$$_MainLoadingStateCopyWith(
          _$_MainLoadingState value, $Res Function(_$_MainLoadingState) then) =
      __$$_MainLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MainLoadingStateCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res>
    implements _$$_MainLoadingStateCopyWith<$Res> {
  __$$_MainLoadingStateCopyWithImpl(
      _$_MainLoadingState _value, $Res Function(_$_MainLoadingState) _then)
      : super(_value, (v) => _then(v as _$_MainLoadingState));

  @override
  _$_MainLoadingState get _value => super._value as _$_MainLoadingState;
}

/// @nodoc

class _$_MainLoadingState implements _MainLoadingState {
  const _$_MainLoadingState();

  @override
  String toString() {
    return 'MainBlocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MainLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainLoadingState value) loading,
    required TResult Function(MainLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainLoadingState value)? loading,
    TResult Function(MainLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainLoadingState value)? loading,
    TResult Function(MainLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _MainLoadingState implements MainBlocState {
  const factory _MainLoadingState() = _$_MainLoadingState;
}

/// @nodoc
abstract class _$$MainLoadedStateCopyWith<$Res> {
  factory _$$MainLoadedStateCopyWith(
          _$MainLoadedState value, $Res Function(_$MainLoadedState) then) =
      __$$MainLoadedStateCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$MainLoadedStateCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res>
    implements _$$MainLoadedStateCopyWith<$Res> {
  __$$MainLoadedStateCopyWithImpl(
      _$MainLoadedState _value, $Res Function(_$MainLoadedState) _then)
      : super(_value, (v) => _then(v as _$MainLoadedState));

  @override
  _$MainLoadedState get _value => super._value as _$MainLoadedState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$MainLoadedState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$MainLoadedState implements MainLoadedState {
  const _$MainLoadedState({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'MainBlocState.loaded(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainLoadedState &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$MainLoadedStateCopyWith<_$MainLoadedState> get copyWith =>
      __$$MainLoadedStateCopyWithImpl<_$MainLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loaded,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainLoadingState value) loading,
    required TResult Function(MainLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainLoadingState value)? loading,
    TResult Function(MainLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainLoadingState value)? loading,
    TResult Function(MainLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MainLoadedState implements MainBlocState {
  const factory MainLoadedState({required final User user}) = _$MainLoadedState;

  User get user;
  @JsonKey(ignore: true)
  _$$MainLoadedStateCopyWith<_$MainLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MainBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int userId) setUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int userId)? setUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int userId)? setUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainInitEvent value) init,
    required TResult Function(MainSetEvent value) setUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainInitEvent value)? init,
    TResult Function(MainSetEvent value)? setUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainInitEvent value)? init,
    TResult Function(MainSetEvent value)? setUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBlocEventCopyWith<$Res> {
  factory $MainBlocEventCopyWith(
          MainBlocEvent value, $Res Function(MainBlocEvent) then) =
      _$MainBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MainBlocEventCopyWithImpl<$Res>
    implements $MainBlocEventCopyWith<$Res> {
  _$MainBlocEventCopyWithImpl(this._value, this._then);

  final MainBlocEvent _value;
  // ignore: unused_field
  final $Res Function(MainBlocEvent) _then;
}

/// @nodoc
abstract class _$$_MainInitEventCopyWith<$Res> {
  factory _$$_MainInitEventCopyWith(
          _$_MainInitEvent value, $Res Function(_$_MainInitEvent) then) =
      __$$_MainInitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MainInitEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res>
    implements _$$_MainInitEventCopyWith<$Res> {
  __$$_MainInitEventCopyWithImpl(
      _$_MainInitEvent _value, $Res Function(_$_MainInitEvent) _then)
      : super(_value, (v) => _then(v as _$_MainInitEvent));

  @override
  _$_MainInitEvent get _value => super._value as _$_MainInitEvent;
}

/// @nodoc

class _$_MainInitEvent implements _MainInitEvent {
  const _$_MainInitEvent();

  @override
  String toString() {
    return 'MainBlocEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MainInitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int userId) setUser,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int userId)? setUser,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int userId)? setUser,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainInitEvent value) init,
    required TResult Function(MainSetEvent value) setUser,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainInitEvent value)? init,
    TResult Function(MainSetEvent value)? setUser,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainInitEvent value)? init,
    TResult Function(MainSetEvent value)? setUser,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _MainInitEvent implements MainBlocEvent {
  const factory _MainInitEvent() = _$_MainInitEvent;
}

/// @nodoc
abstract class _$$MainSetEventCopyWith<$Res> {
  factory _$$MainSetEventCopyWith(
          _$MainSetEvent value, $Res Function(_$MainSetEvent) then) =
      __$$MainSetEventCopyWithImpl<$Res>;
  $Res call({int userId});
}

/// @nodoc
class __$$MainSetEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res>
    implements _$$MainSetEventCopyWith<$Res> {
  __$$MainSetEventCopyWithImpl(
      _$MainSetEvent _value, $Res Function(_$MainSetEvent) _then)
      : super(_value, (v) => _then(v as _$MainSetEvent));

  @override
  _$MainSetEvent get _value => super._value as _$MainSetEvent;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$MainSetEvent(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MainSetEvent implements MainSetEvent {
  const _$MainSetEvent({required this.userId});

  @override
  final int userId;

  @override
  String toString() {
    return 'MainBlocEvent.setUser(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainSetEvent &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$MainSetEventCopyWith<_$MainSetEvent> get copyWith =>
      __$$MainSetEventCopyWithImpl<_$MainSetEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int userId) setUser,
  }) {
    return setUser(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int userId)? setUser,
  }) {
    return setUser?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int userId)? setUser,
    required TResult orElse(),
  }) {
    if (setUser != null) {
      return setUser(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainInitEvent value) init,
    required TResult Function(MainSetEvent value) setUser,
  }) {
    return setUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainInitEvent value)? init,
    TResult Function(MainSetEvent value)? setUser,
  }) {
    return setUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainInitEvent value)? init,
    TResult Function(MainSetEvent value)? setUser,
    required TResult orElse(),
  }) {
    if (setUser != null) {
      return setUser(this);
    }
    return orElse();
  }
}

abstract class MainSetEvent implements MainBlocEvent {
  const factory MainSetEvent({required final int userId}) = _$MainSetEvent;

  int get userId;
  @JsonKey(ignore: true)
  _$$MainSetEventCopyWith<_$MainSetEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
