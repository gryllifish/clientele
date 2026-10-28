// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientProfileDto {

 String get location; int get totalValue; int get projectCount; double get rating; DateTime get nextSessionAt; int get nextSessionMinutes; String get latestNote;
/// Create a copy of ClientProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientProfileDtoCopyWith<ClientProfileDto> get copyWith => _$ClientProfileDtoCopyWithImpl<ClientProfileDto>(this as ClientProfileDto, _$identity);

  /// Serializes this ClientProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProfileDto&&(identical(other.location, location) || other.location == location)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.projectCount, projectCount) || other.projectCount == projectCount)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.nextSessionAt, nextSessionAt) || other.nextSessionAt == nextSessionAt)&&(identical(other.nextSessionMinutes, nextSessionMinutes) || other.nextSessionMinutes == nextSessionMinutes)&&(identical(other.latestNote, latestNote) || other.latestNote == latestNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,totalValue,projectCount,rating,nextSessionAt,nextSessionMinutes,latestNote);

@override
String toString() {
  return 'ClientProfileDto(location: $location, totalValue: $totalValue, projectCount: $projectCount, rating: $rating, nextSessionAt: $nextSessionAt, nextSessionMinutes: $nextSessionMinutes, latestNote: $latestNote)';
}


}

/// @nodoc
abstract mixin class $ClientProfileDtoCopyWith<$Res>  {
  factory $ClientProfileDtoCopyWith(ClientProfileDto value, $Res Function(ClientProfileDto) _then) = _$ClientProfileDtoCopyWithImpl;
@useResult
$Res call({
 String location, int totalValue, int projectCount, double rating, DateTime nextSessionAt, int nextSessionMinutes, String latestNote
});




}
/// @nodoc
class _$ClientProfileDtoCopyWithImpl<$Res>
    implements $ClientProfileDtoCopyWith<$Res> {
  _$ClientProfileDtoCopyWithImpl(this._self, this._then);

  final ClientProfileDto _self;
  final $Res Function(ClientProfileDto) _then;

/// Create a copy of ClientProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? location = null,Object? totalValue = null,Object? projectCount = null,Object? rating = null,Object? nextSessionAt = null,Object? nextSessionMinutes = null,Object? latestNote = null,}) {
  return _then(_self.copyWith(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as int,projectCount: null == projectCount ? _self.projectCount : projectCount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,nextSessionAt: null == nextSessionAt ? _self.nextSessionAt : nextSessionAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextSessionMinutes: null == nextSessionMinutes ? _self.nextSessionMinutes : nextSessionMinutes // ignore: cast_nullable_to_non_nullable
as int,latestNote: null == latestNote ? _self.latestNote : latestNote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientProfileDto].
extension ClientProfileDtoPatterns on ClientProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String location,  int totalValue,  int projectCount,  double rating,  DateTime nextSessionAt,  int nextSessionMinutes,  String latestNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientProfileDto() when $default != null:
return $default(_that.location,_that.totalValue,_that.projectCount,_that.rating,_that.nextSessionAt,_that.nextSessionMinutes,_that.latestNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String location,  int totalValue,  int projectCount,  double rating,  DateTime nextSessionAt,  int nextSessionMinutes,  String latestNote)  $default,) {final _that = this;
switch (_that) {
case _ClientProfileDto():
return $default(_that.location,_that.totalValue,_that.projectCount,_that.rating,_that.nextSessionAt,_that.nextSessionMinutes,_that.latestNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String location,  int totalValue,  int projectCount,  double rating,  DateTime nextSessionAt,  int nextSessionMinutes,  String latestNote)?  $default,) {final _that = this;
switch (_that) {
case _ClientProfileDto() when $default != null:
return $default(_that.location,_that.totalValue,_that.projectCount,_that.rating,_that.nextSessionAt,_that.nextSessionMinutes,_that.latestNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientProfileDto implements ClientProfileDto {
  const _ClientProfileDto({required this.location, required this.totalValue, required this.projectCount, required this.rating, required this.nextSessionAt, required this.nextSessionMinutes, required this.latestNote});
  factory _ClientProfileDto.fromJson(Map<String, dynamic> json) => _$ClientProfileDtoFromJson(json);

@override final  String location;
@override final  int totalValue;
@override final  int projectCount;
@override final  double rating;
@override final  DateTime nextSessionAt;
@override final  int nextSessionMinutes;
@override final  String latestNote;

/// Create a copy of ClientProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientProfileDtoCopyWith<_ClientProfileDto> get copyWith => __$ClientProfileDtoCopyWithImpl<_ClientProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientProfileDto&&(identical(other.location, location) || other.location == location)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.projectCount, projectCount) || other.projectCount == projectCount)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.nextSessionAt, nextSessionAt) || other.nextSessionAt == nextSessionAt)&&(identical(other.nextSessionMinutes, nextSessionMinutes) || other.nextSessionMinutes == nextSessionMinutes)&&(identical(other.latestNote, latestNote) || other.latestNote == latestNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,totalValue,projectCount,rating,nextSessionAt,nextSessionMinutes,latestNote);

@override
String toString() {
  return 'ClientProfileDto(location: $location, totalValue: $totalValue, projectCount: $projectCount, rating: $rating, nextSessionAt: $nextSessionAt, nextSessionMinutes: $nextSessionMinutes, latestNote: $latestNote)';
}


}

/// @nodoc
abstract mixin class _$ClientProfileDtoCopyWith<$Res> implements $ClientProfileDtoCopyWith<$Res> {
  factory _$ClientProfileDtoCopyWith(_ClientProfileDto value, $Res Function(_ClientProfileDto) _then) = __$ClientProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 String location, int totalValue, int projectCount, double rating, DateTime nextSessionAt, int nextSessionMinutes, String latestNote
});




}
/// @nodoc
class __$ClientProfileDtoCopyWithImpl<$Res>
    implements _$ClientProfileDtoCopyWith<$Res> {
  __$ClientProfileDtoCopyWithImpl(this._self, this._then);

  final _ClientProfileDto _self;
  final $Res Function(_ClientProfileDto) _then;

/// Create a copy of ClientProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? location = null,Object? totalValue = null,Object? projectCount = null,Object? rating = null,Object? nextSessionAt = null,Object? nextSessionMinutes = null,Object? latestNote = null,}) {
  return _then(_ClientProfileDto(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,totalValue: null == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as int,projectCount: null == projectCount ? _self.projectCount : projectCount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,nextSessionAt: null == nextSessionAt ? _self.nextSessionAt : nextSessionAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextSessionMinutes: null == nextSessionMinutes ? _self.nextSessionMinutes : nextSessionMinutes // ignore: cast_nullable_to_non_nullable
as int,latestNote: null == latestNote ? _self.latestNote : latestNote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
