// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_header_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeHeaderState {

 DateTime get today; PartOfDay get partOfDay; String get userName; int get totalClients; int get clientsThisMonth;
/// Create a copy of HomeHeaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeHeaderStateCopyWith<HomeHeaderState> get copyWith => _$HomeHeaderStateCopyWithImpl<HomeHeaderState>(this as HomeHeaderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeHeaderState&&(identical(other.today, today) || other.today == today)&&(identical(other.partOfDay, partOfDay) || other.partOfDay == partOfDay)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.totalClients, totalClients) || other.totalClients == totalClients)&&(identical(other.clientsThisMonth, clientsThisMonth) || other.clientsThisMonth == clientsThisMonth));
}


@override
int get hashCode => Object.hash(runtimeType,today,partOfDay,userName,totalClients,clientsThisMonth);

@override
String toString() {
  return 'HomeHeaderState(today: $today, partOfDay: $partOfDay, userName: $userName, totalClients: $totalClients, clientsThisMonth: $clientsThisMonth)';
}


}

/// @nodoc
abstract mixin class $HomeHeaderStateCopyWith<$Res>  {
  factory $HomeHeaderStateCopyWith(HomeHeaderState value, $Res Function(HomeHeaderState) _then) = _$HomeHeaderStateCopyWithImpl;
@useResult
$Res call({
 DateTime today, PartOfDay partOfDay, String userName, int totalClients, int clientsThisMonth
});




}
/// @nodoc
class _$HomeHeaderStateCopyWithImpl<$Res>
    implements $HomeHeaderStateCopyWith<$Res> {
  _$HomeHeaderStateCopyWithImpl(this._self, this._then);

  final HomeHeaderState _self;
  final $Res Function(HomeHeaderState) _then;

/// Create a copy of HomeHeaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? today = null,Object? partOfDay = null,Object? userName = null,Object? totalClients = null,Object? clientsThisMonth = null,}) {
  return _then(_self.copyWith(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as DateTime,partOfDay: null == partOfDay ? _self.partOfDay : partOfDay // ignore: cast_nullable_to_non_nullable
as PartOfDay,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,totalClients: null == totalClients ? _self.totalClients : totalClients // ignore: cast_nullable_to_non_nullable
as int,clientsThisMonth: null == clientsThisMonth ? _self.clientsThisMonth : clientsThisMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeHeaderState].
extension HomeHeaderStatePatterns on HomeHeaderState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeHeaderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeHeaderState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeHeaderState value)  $default,){
final _that = this;
switch (_that) {
case _HomeHeaderState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeHeaderState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeHeaderState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime today,  PartOfDay partOfDay,  String userName,  int totalClients,  int clientsThisMonth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeHeaderState() when $default != null:
return $default(_that.today,_that.partOfDay,_that.userName,_that.totalClients,_that.clientsThisMonth);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime today,  PartOfDay partOfDay,  String userName,  int totalClients,  int clientsThisMonth)  $default,) {final _that = this;
switch (_that) {
case _HomeHeaderState():
return $default(_that.today,_that.partOfDay,_that.userName,_that.totalClients,_that.clientsThisMonth);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime today,  PartOfDay partOfDay,  String userName,  int totalClients,  int clientsThisMonth)?  $default,) {final _that = this;
switch (_that) {
case _HomeHeaderState() when $default != null:
return $default(_that.today,_that.partOfDay,_that.userName,_that.totalClients,_that.clientsThisMonth);case _:
  return null;

}
}

}

/// @nodoc


class _HomeHeaderState implements HomeHeaderState {
  const _HomeHeaderState({required this.today, required this.partOfDay, required this.userName, required this.totalClients, required this.clientsThisMonth});
  

@override final  DateTime today;
@override final  PartOfDay partOfDay;
@override final  String userName;
@override final  int totalClients;
@override final  int clientsThisMonth;

/// Create a copy of HomeHeaderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeHeaderStateCopyWith<_HomeHeaderState> get copyWith => __$HomeHeaderStateCopyWithImpl<_HomeHeaderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeHeaderState&&(identical(other.today, today) || other.today == today)&&(identical(other.partOfDay, partOfDay) || other.partOfDay == partOfDay)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.totalClients, totalClients) || other.totalClients == totalClients)&&(identical(other.clientsThisMonth, clientsThisMonth) || other.clientsThisMonth == clientsThisMonth));
}


@override
int get hashCode => Object.hash(runtimeType,today,partOfDay,userName,totalClients,clientsThisMonth);

@override
String toString() {
  return 'HomeHeaderState(today: $today, partOfDay: $partOfDay, userName: $userName, totalClients: $totalClients, clientsThisMonth: $clientsThisMonth)';
}


}

/// @nodoc
abstract mixin class _$HomeHeaderStateCopyWith<$Res> implements $HomeHeaderStateCopyWith<$Res> {
  factory _$HomeHeaderStateCopyWith(_HomeHeaderState value, $Res Function(_HomeHeaderState) _then) = __$HomeHeaderStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime today, PartOfDay partOfDay, String userName, int totalClients, int clientsThisMonth
});




}
/// @nodoc
class __$HomeHeaderStateCopyWithImpl<$Res>
    implements _$HomeHeaderStateCopyWith<$Res> {
  __$HomeHeaderStateCopyWithImpl(this._self, this._then);

  final _HomeHeaderState _self;
  final $Res Function(_HomeHeaderState) _then;

/// Create a copy of HomeHeaderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? today = null,Object? partOfDay = null,Object? userName = null,Object? totalClients = null,Object? clientsThisMonth = null,}) {
  return _then(_HomeHeaderState(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as DateTime,partOfDay: null == partOfDay ? _self.partOfDay : partOfDay // ignore: cast_nullable_to_non_nullable
as PartOfDay,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,totalClients: null == totalClients ? _self.totalClients : totalClients // ignore: cast_nullable_to_non_nullable
as int,clientsThisMonth: null == clientsThisMonth ? _self.clientsThisMonth : clientsThisMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
