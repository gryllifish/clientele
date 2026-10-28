// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionDto {

 int get id; String get title; String get clientName; int get amount; DateTime get occurredAt; List<TransactionParticipantDto> get participants;
/// Create a copy of TransactionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDtoCopyWith<TransactionDto> get copyWith => _$TransactionDtoCopyWithImpl<TransactionDto>(this as TransactionDto, _$identity);

  /// Serializes this TransactionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&const DeepCollectionEquality().equals(other.participants, participants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,clientName,amount,occurredAt,const DeepCollectionEquality().hash(participants));

@override
String toString() {
  return 'TransactionDto(id: $id, title: $title, clientName: $clientName, amount: $amount, occurredAt: $occurredAt, participants: $participants)';
}


}

/// @nodoc
abstract mixin class $TransactionDtoCopyWith<$Res>  {
  factory $TransactionDtoCopyWith(TransactionDto value, $Res Function(TransactionDto) _then) = _$TransactionDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String clientName, int amount, DateTime occurredAt, List<TransactionParticipantDto> participants
});




}
/// @nodoc
class _$TransactionDtoCopyWithImpl<$Res>
    implements $TransactionDtoCopyWith<$Res> {
  _$TransactionDtoCopyWithImpl(this._self, this._then);

  final TransactionDto _self;
  final $Res Function(TransactionDto) _then;

/// Create a copy of TransactionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? clientName = null,Object? amount = null,Object? occurredAt = null,Object? participants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<TransactionParticipantDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionDto].
extension TransactionDtoPatterns on TransactionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionDto value)  $default,){
final _that = this;
switch (_that) {
case _TransactionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionDto value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String clientName,  int amount,  DateTime occurredAt,  List<TransactionParticipantDto> participants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionDto() when $default != null:
return $default(_that.id,_that.title,_that.clientName,_that.amount,_that.occurredAt,_that.participants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String clientName,  int amount,  DateTime occurredAt,  List<TransactionParticipantDto> participants)  $default,) {final _that = this;
switch (_that) {
case _TransactionDto():
return $default(_that.id,_that.title,_that.clientName,_that.amount,_that.occurredAt,_that.participants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String clientName,  int amount,  DateTime occurredAt,  List<TransactionParticipantDto> participants)?  $default,) {final _that = this;
switch (_that) {
case _TransactionDto() when $default != null:
return $default(_that.id,_that.title,_that.clientName,_that.amount,_that.occurredAt,_that.participants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionDto implements TransactionDto {
  const _TransactionDto({required this.id, required this.title, required this.clientName, required this.amount, required this.occurredAt, required final  List<TransactionParticipantDto> participants}): _participants = participants;
  factory _TransactionDto.fromJson(Map<String, dynamic> json) => _$TransactionDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String clientName;
@override final  int amount;
@override final  DateTime occurredAt;
 final  List<TransactionParticipantDto> _participants;
@override List<TransactionParticipantDto> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}


/// Create a copy of TransactionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDtoCopyWith<_TransactionDto> get copyWith => __$TransactionDtoCopyWithImpl<_TransactionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&const DeepCollectionEquality().equals(other._participants, _participants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,clientName,amount,occurredAt,const DeepCollectionEquality().hash(_participants));

@override
String toString() {
  return 'TransactionDto(id: $id, title: $title, clientName: $clientName, amount: $amount, occurredAt: $occurredAt, participants: $participants)';
}


}

/// @nodoc
abstract mixin class _$TransactionDtoCopyWith<$Res> implements $TransactionDtoCopyWith<$Res> {
  factory _$TransactionDtoCopyWith(_TransactionDto value, $Res Function(_TransactionDto) _then) = __$TransactionDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String clientName, int amount, DateTime occurredAt, List<TransactionParticipantDto> participants
});




}
/// @nodoc
class __$TransactionDtoCopyWithImpl<$Res>
    implements _$TransactionDtoCopyWith<$Res> {
  __$TransactionDtoCopyWithImpl(this._self, this._then);

  final _TransactionDto _self;
  final $Res Function(_TransactionDto) _then;

/// Create a copy of TransactionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? clientName = null,Object? amount = null,Object? occurredAt = null,Object? participants = null,}) {
  return _then(_TransactionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<TransactionParticipantDto>,
  ));
}


}


/// @nodoc
mixin _$TransactionParticipantDto {

 int get clientId; String get photoAsset;
/// Create a copy of TransactionParticipantDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionParticipantDtoCopyWith<TransactionParticipantDto> get copyWith => _$TransactionParticipantDtoCopyWithImpl<TransactionParticipantDto>(this as TransactionParticipantDto, _$identity);

  /// Serializes this TransactionParticipantDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionParticipantDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,photoAsset);

@override
String toString() {
  return 'TransactionParticipantDto(clientId: $clientId, photoAsset: $photoAsset)';
}


}

/// @nodoc
abstract mixin class $TransactionParticipantDtoCopyWith<$Res>  {
  factory $TransactionParticipantDtoCopyWith(TransactionParticipantDto value, $Res Function(TransactionParticipantDto) _then) = _$TransactionParticipantDtoCopyWithImpl;
@useResult
$Res call({
 int clientId, String photoAsset
});




}
/// @nodoc
class _$TransactionParticipantDtoCopyWithImpl<$Res>
    implements $TransactionParticipantDtoCopyWith<$Res> {
  _$TransactionParticipantDtoCopyWithImpl(this._self, this._then);

  final TransactionParticipantDto _self;
  final $Res Function(TransactionParticipantDto) _then;

/// Create a copy of TransactionParticipantDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? photoAsset = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as int,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionParticipantDto].
extension TransactionParticipantDtoPatterns on TransactionParticipantDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionParticipantDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionParticipantDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionParticipantDto value)  $default,){
final _that = this;
switch (_that) {
case _TransactionParticipantDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionParticipantDto value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionParticipantDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int clientId,  String photoAsset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionParticipantDto() when $default != null:
return $default(_that.clientId,_that.photoAsset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int clientId,  String photoAsset)  $default,) {final _that = this;
switch (_that) {
case _TransactionParticipantDto():
return $default(_that.clientId,_that.photoAsset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int clientId,  String photoAsset)?  $default,) {final _that = this;
switch (_that) {
case _TransactionParticipantDto() when $default != null:
return $default(_that.clientId,_that.photoAsset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionParticipantDto implements TransactionParticipantDto {
  const _TransactionParticipantDto({required this.clientId, required this.photoAsset});
  factory _TransactionParticipantDto.fromJson(Map<String, dynamic> json) => _$TransactionParticipantDtoFromJson(json);

@override final  int clientId;
@override final  String photoAsset;

/// Create a copy of TransactionParticipantDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionParticipantDtoCopyWith<_TransactionParticipantDto> get copyWith => __$TransactionParticipantDtoCopyWithImpl<_TransactionParticipantDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionParticipantDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionParticipantDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,photoAsset);

@override
String toString() {
  return 'TransactionParticipantDto(clientId: $clientId, photoAsset: $photoAsset)';
}


}

/// @nodoc
abstract mixin class _$TransactionParticipantDtoCopyWith<$Res> implements $TransactionParticipantDtoCopyWith<$Res> {
  factory _$TransactionParticipantDtoCopyWith(_TransactionParticipantDto value, $Res Function(_TransactionParticipantDto) _then) = __$TransactionParticipantDtoCopyWithImpl;
@override @useResult
$Res call({
 int clientId, String photoAsset
});




}
/// @nodoc
class __$TransactionParticipantDtoCopyWithImpl<$Res>
    implements _$TransactionParticipantDtoCopyWith<$Res> {
  __$TransactionParticipantDtoCopyWithImpl(this._self, this._then);

  final _TransactionParticipantDto _self;
  final $Res Function(_TransactionParticipantDto) _then;

/// Create a copy of TransactionParticipantDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? photoAsset = null,}) {
  return _then(_TransactionParticipantDto(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as int,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
