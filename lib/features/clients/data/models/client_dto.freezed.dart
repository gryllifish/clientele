// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientDto {

 int get id; String get name; String get role; String get photoAsset; DateTime get onboardedAt; int get hotScore;
/// Create a copy of ClientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientDtoCopyWith<ClientDto> get copyWith => _$ClientDtoCopyWithImpl<ClientDto>(this as ClientDto, _$identity);

  /// Serializes this ClientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset)&&(identical(other.onboardedAt, onboardedAt) || other.onboardedAt == onboardedAt)&&(identical(other.hotScore, hotScore) || other.hotScore == hotScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role,photoAsset,onboardedAt,hotScore);

@override
String toString() {
  return 'ClientDto(id: $id, name: $name, role: $role, photoAsset: $photoAsset, onboardedAt: $onboardedAt, hotScore: $hotScore)';
}


}

/// @nodoc
abstract mixin class $ClientDtoCopyWith<$Res>  {
  factory $ClientDtoCopyWith(ClientDto value, $Res Function(ClientDto) _then) = _$ClientDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String role, String photoAsset, DateTime onboardedAt, int hotScore
});




}
/// @nodoc
class _$ClientDtoCopyWithImpl<$Res>
    implements $ClientDtoCopyWith<$Res> {
  _$ClientDtoCopyWithImpl(this._self, this._then);

  final ClientDto _self;
  final $Res Function(ClientDto) _then;

/// Create a copy of ClientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? role = null,Object? photoAsset = null,Object? onboardedAt = null,Object? hotScore = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,onboardedAt: null == onboardedAt ? _self.onboardedAt : onboardedAt // ignore: cast_nullable_to_non_nullable
as DateTime,hotScore: null == hotScore ? _self.hotScore : hotScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientDto].
extension ClientDtoPatterns on ClientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String role,  String photoAsset,  DateTime onboardedAt,  int hotScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientDto() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.photoAsset,_that.onboardedAt,_that.hotScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String role,  String photoAsset,  DateTime onboardedAt,  int hotScore)  $default,) {final _that = this;
switch (_that) {
case _ClientDto():
return $default(_that.id,_that.name,_that.role,_that.photoAsset,_that.onboardedAt,_that.hotScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String role,  String photoAsset,  DateTime onboardedAt,  int hotScore)?  $default,) {final _that = this;
switch (_that) {
case _ClientDto() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.photoAsset,_that.onboardedAt,_that.hotScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientDto implements ClientDto {
  const _ClientDto({required this.id, required this.name, required this.role, required this.photoAsset, required this.onboardedAt, required this.hotScore});
  factory _ClientDto.fromJson(Map<String, dynamic> json) => _$ClientDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String role;
@override final  String photoAsset;
@override final  DateTime onboardedAt;
@override final  int hotScore;

/// Create a copy of ClientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientDtoCopyWith<_ClientDto> get copyWith => __$ClientDtoCopyWithImpl<_ClientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset)&&(identical(other.onboardedAt, onboardedAt) || other.onboardedAt == onboardedAt)&&(identical(other.hotScore, hotScore) || other.hotScore == hotScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role,photoAsset,onboardedAt,hotScore);

@override
String toString() {
  return 'ClientDto(id: $id, name: $name, role: $role, photoAsset: $photoAsset, onboardedAt: $onboardedAt, hotScore: $hotScore)';
}


}

/// @nodoc
abstract mixin class _$ClientDtoCopyWith<$Res> implements $ClientDtoCopyWith<$Res> {
  factory _$ClientDtoCopyWith(_ClientDto value, $Res Function(_ClientDto) _then) = __$ClientDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String role, String photoAsset, DateTime onboardedAt, int hotScore
});




}
/// @nodoc
class __$ClientDtoCopyWithImpl<$Res>
    implements _$ClientDtoCopyWith<$Res> {
  __$ClientDtoCopyWithImpl(this._self, this._then);

  final _ClientDto _self;
  final $Res Function(_ClientDto) _then;

/// Create a copy of ClientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? role = null,Object? photoAsset = null,Object? onboardedAt = null,Object? hotScore = null,}) {
  return _then(_ClientDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,onboardedAt: null == onboardedAt ? _self.onboardedAt : onboardedAt // ignore: cast_nullable_to_non_nullable
as DateTime,hotScore: null == hotScore ? _self.hotScore : hotScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
