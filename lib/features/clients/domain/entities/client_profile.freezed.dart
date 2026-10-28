// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientProfile {

 int get clientId; String get location;/// Lifetime billed amount, in whole US dollars.
 int get totalValue; int get projectCount;/// Average satisfaction, from 0 to 5.
 double get rating; ClientSession get nextSession; String get latestNote;
/// Create a copy of ClientProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientProfileCopyWith<ClientProfile> get copyWith => _$ClientProfileCopyWithImpl<ClientProfile>(this as ClientProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProfile&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.location, location) || other.location == location)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.projectCount, projectCount) || other.projectCount == projectCount)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.nextSession, nextSession) || other.nextSession == nextSession)&&(identical(other.latestNote, latestNote) || other.latestNote == latestNote));
}


@override
int get hashCode => Object.hash(runtimeType,clientId,location,totalValue,projectCount,rating,nextSession,latestNote);

@override
String toString() {
  return 'ClientProfile(clientId: $clientId, location: $location, totalValue: $totalValue, projectCount: $projectCount, rating: $rating, nextSession: $nextSession, latestNote: $latestNote)';
}


}

/// @nodoc
abstract mixin class $ClientProfileCopyWith<$Res>  {
  factory $ClientProfileCopyWith(ClientProfile value, $Res Function(ClientProfile) _then) = _$ClientProfileCopyWithImpl;
@useResult
$Res call({
 int clientId, String location, int totalValue, int projectCount, double rating, ClientSession nextSession, String latestNote
});


$ClientSessionCopyWith<$Res> get nextSession;

}
/// @nodoc
class _$ClientProfileCopyWithImpl<$Res>
    implements $ClientProfileCopyWith<$Res> {
  _$ClientProfileCopyWithImpl(this._self, this._then);

  final ClientProfile _self;
  final $Res Function(ClientProfile) _then;

/// Create a copy of ClientProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? location = null,Object? totalValue = null,Object? projectCount = null,Object? rating = null,Object? nextSession = null,Object? latestNote = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as int,projectCount: null == projectCount ? _self.projectCount : projectCount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,nextSession: null == nextSession ? _self.nextSession : nextSession // ignore: cast_nullable_to_non_nullable
as ClientSession,latestNote: null == latestNote ? _self.latestNote : latestNote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ClientProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientSessionCopyWith<$Res> get nextSession {
  
  return $ClientSessionCopyWith<$Res>(_self.nextSession, (value) {
    return _then(_self.copyWith(nextSession: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClientProfile].
extension ClientProfilePatterns on ClientProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientProfile value)  $default,){
final _that = this;
switch (_that) {
case _ClientProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ClientProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int clientId,  String location,  int totalValue,  int projectCount,  double rating,  ClientSession nextSession,  String latestNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientProfile() when $default != null:
return $default(_that.clientId,_that.location,_that.totalValue,_that.projectCount,_that.rating,_that.nextSession,_that.latestNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int clientId,  String location,  int totalValue,  int projectCount,  double rating,  ClientSession nextSession,  String latestNote)  $default,) {final _that = this;
switch (_that) {
case _ClientProfile():
return $default(_that.clientId,_that.location,_that.totalValue,_that.projectCount,_that.rating,_that.nextSession,_that.latestNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int clientId,  String location,  int totalValue,  int projectCount,  double rating,  ClientSession nextSession,  String latestNote)?  $default,) {final _that = this;
switch (_that) {
case _ClientProfile() when $default != null:
return $default(_that.clientId,_that.location,_that.totalValue,_that.projectCount,_that.rating,_that.nextSession,_that.latestNote);case _:
  return null;

}
}

}

/// @nodoc


class _ClientProfile implements ClientProfile {
  const _ClientProfile({required this.clientId, required this.location, required this.totalValue, required this.projectCount, required this.rating, required this.nextSession, required this.latestNote});
  

@override final  int clientId;
@override final  String location;
/// Lifetime billed amount, in whole US dollars.
@override final  int totalValue;
@override final  int projectCount;
/// Average satisfaction, from 0 to 5.
@override final  double rating;
@override final  ClientSession nextSession;
@override final  String latestNote;

/// Create a copy of ClientProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientProfileCopyWith<_ClientProfile> get copyWith => __$ClientProfileCopyWithImpl<_ClientProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientProfile&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.location, location) || other.location == location)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.projectCount, projectCount) || other.projectCount == projectCount)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.nextSession, nextSession) || other.nextSession == nextSession)&&(identical(other.latestNote, latestNote) || other.latestNote == latestNote));
}


@override
int get hashCode => Object.hash(runtimeType,clientId,location,totalValue,projectCount,rating,nextSession,latestNote);

@override
String toString() {
  return 'ClientProfile(clientId: $clientId, location: $location, totalValue: $totalValue, projectCount: $projectCount, rating: $rating, nextSession: $nextSession, latestNote: $latestNote)';
}


}

/// @nodoc
abstract mixin class _$ClientProfileCopyWith<$Res> implements $ClientProfileCopyWith<$Res> {
  factory _$ClientProfileCopyWith(_ClientProfile value, $Res Function(_ClientProfile) _then) = __$ClientProfileCopyWithImpl;
@override @useResult
$Res call({
 int clientId, String location, int totalValue, int projectCount, double rating, ClientSession nextSession, String latestNote
});


@override $ClientSessionCopyWith<$Res> get nextSession;

}
/// @nodoc
class __$ClientProfileCopyWithImpl<$Res>
    implements _$ClientProfileCopyWith<$Res> {
  __$ClientProfileCopyWithImpl(this._self, this._then);

  final _ClientProfile _self;
  final $Res Function(_ClientProfile) _then;

/// Create a copy of ClientProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? location = null,Object? totalValue = null,Object? projectCount = null,Object? rating = null,Object? nextSession = null,Object? latestNote = null,}) {
  return _then(_ClientProfile(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as int,projectCount: null == projectCount ? _self.projectCount : projectCount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,nextSession: null == nextSession ? _self.nextSession : nextSession // ignore: cast_nullable_to_non_nullable
as ClientSession,latestNote: null == latestNote ? _self.latestNote : latestNote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ClientProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientSessionCopyWith<$Res> get nextSession {
  
  return $ClientSessionCopyWith<$Res>(_self.nextSession, (value) {
    return _then(_self.copyWith(nextSession: value));
  });
}
}

/// @nodoc
mixin _$ClientSession {

 DateTime get startsAt; Duration get duration;
/// Create a copy of ClientSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientSessionCopyWith<ClientSession> get copyWith => _$ClientSessionCopyWithImpl<ClientSession>(this as ClientSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSession&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,startsAt,duration);

@override
String toString() {
  return 'ClientSession(startsAt: $startsAt, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $ClientSessionCopyWith<$Res>  {
  factory $ClientSessionCopyWith(ClientSession value, $Res Function(ClientSession) _then) = _$ClientSessionCopyWithImpl;
@useResult
$Res call({
 DateTime startsAt, Duration duration
});




}
/// @nodoc
class _$ClientSessionCopyWithImpl<$Res>
    implements $ClientSessionCopyWith<$Res> {
  _$ClientSessionCopyWithImpl(this._self, this._then);

  final ClientSession _self;
  final $Res Function(ClientSession) _then;

/// Create a copy of ClientSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startsAt = null,Object? duration = null,}) {
  return _then(_self.copyWith(
startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientSession].
extension ClientSessionPatterns on ClientSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientSession value)  $default,){
final _that = this;
switch (_that) {
case _ClientSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientSession value)?  $default,){
final _that = this;
switch (_that) {
case _ClientSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startsAt,  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientSession() when $default != null:
return $default(_that.startsAt,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startsAt,  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _ClientSession():
return $default(_that.startsAt,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startsAt,  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _ClientSession() when $default != null:
return $default(_that.startsAt,_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _ClientSession implements ClientSession {
  const _ClientSession({required this.startsAt, required this.duration});
  

@override final  DateTime startsAt;
@override final  Duration duration;

/// Create a copy of ClientSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientSessionCopyWith<_ClientSession> get copyWith => __$ClientSessionCopyWithImpl<_ClientSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientSession&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,startsAt,duration);

@override
String toString() {
  return 'ClientSession(startsAt: $startsAt, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$ClientSessionCopyWith<$Res> implements $ClientSessionCopyWith<$Res> {
  factory _$ClientSessionCopyWith(_ClientSession value, $Res Function(_ClientSession) _then) = __$ClientSessionCopyWithImpl;
@override @useResult
$Res call({
 DateTime startsAt, Duration duration
});




}
/// @nodoc
class __$ClientSessionCopyWithImpl<$Res>
    implements _$ClientSessionCopyWith<$Res> {
  __$ClientSessionCopyWithImpl(this._self, this._then);

  final _ClientSession _self;
  final $Res Function(_ClientSession) _then;

/// Create a copy of ClientSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startsAt = null,Object? duration = null,}) {
  return _then(_ClientSession(
startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
