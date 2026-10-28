// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_statement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionStatement {

/// Transactions in the current window, newest first.
 List<Transaction> get recent;/// Sum of [recent], in whole US dollars.
 int get total;/// Sum of the previous window, in whole US dollars.
 int get previousTotal;
/// Create a copy of TransactionStatement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionStatementCopyWith<TransactionStatement> get copyWith => _$TransactionStatementCopyWithImpl<TransactionStatement>(this as TransactionStatement, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionStatement&&const DeepCollectionEquality().equals(other.recent, recent)&&(identical(other.total, total) || other.total == total)&&(identical(other.previousTotal, previousTotal) || other.previousTotal == previousTotal));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recent),total,previousTotal);

@override
String toString() {
  return 'TransactionStatement(recent: $recent, total: $total, previousTotal: $previousTotal)';
}


}

/// @nodoc
abstract mixin class $TransactionStatementCopyWith<$Res>  {
  factory $TransactionStatementCopyWith(TransactionStatement value, $Res Function(TransactionStatement) _then) = _$TransactionStatementCopyWithImpl;
@useResult
$Res call({
 List<Transaction> recent, int total, int previousTotal
});




}
/// @nodoc
class _$TransactionStatementCopyWithImpl<$Res>
    implements $TransactionStatementCopyWith<$Res> {
  _$TransactionStatementCopyWithImpl(this._self, this._then);

  final TransactionStatement _self;
  final $Res Function(TransactionStatement) _then;

/// Create a copy of TransactionStatement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recent = null,Object? total = null,Object? previousTotal = null,}) {
  return _then(_self.copyWith(
recent: null == recent ? _self.recent : recent // ignore: cast_nullable_to_non_nullable
as List<Transaction>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,previousTotal: null == previousTotal ? _self.previousTotal : previousTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionStatement].
extension TransactionStatementPatterns on TransactionStatement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionStatement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionStatement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionStatement value)  $default,){
final _that = this;
switch (_that) {
case _TransactionStatement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionStatement value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionStatement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Transaction> recent,  int total,  int previousTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionStatement() when $default != null:
return $default(_that.recent,_that.total,_that.previousTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Transaction> recent,  int total,  int previousTotal)  $default,) {final _that = this;
switch (_that) {
case _TransactionStatement():
return $default(_that.recent,_that.total,_that.previousTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Transaction> recent,  int total,  int previousTotal)?  $default,) {final _that = this;
switch (_that) {
case _TransactionStatement() when $default != null:
return $default(_that.recent,_that.total,_that.previousTotal);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionStatement extends TransactionStatement {
  const _TransactionStatement({required final  List<Transaction> recent, required this.total, required this.previousTotal}): _recent = recent,super._();
  

/// Transactions in the current window, newest first.
 final  List<Transaction> _recent;
/// Transactions in the current window, newest first.
@override List<Transaction> get recent {
  if (_recent is EqualUnmodifiableListView) return _recent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recent);
}

/// Sum of [recent], in whole US dollars.
@override final  int total;
/// Sum of the previous window, in whole US dollars.
@override final  int previousTotal;

/// Create a copy of TransactionStatement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionStatementCopyWith<_TransactionStatement> get copyWith => __$TransactionStatementCopyWithImpl<_TransactionStatement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionStatement&&const DeepCollectionEquality().equals(other._recent, _recent)&&(identical(other.total, total) || other.total == total)&&(identical(other.previousTotal, previousTotal) || other.previousTotal == previousTotal));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recent),total,previousTotal);

@override
String toString() {
  return 'TransactionStatement(recent: $recent, total: $total, previousTotal: $previousTotal)';
}


}

/// @nodoc
abstract mixin class _$TransactionStatementCopyWith<$Res> implements $TransactionStatementCopyWith<$Res> {
  factory _$TransactionStatementCopyWith(_TransactionStatement value, $Res Function(_TransactionStatement) _then) = __$TransactionStatementCopyWithImpl;
@override @useResult
$Res call({
 List<Transaction> recent, int total, int previousTotal
});




}
/// @nodoc
class __$TransactionStatementCopyWithImpl<$Res>
    implements _$TransactionStatementCopyWith<$Res> {
  __$TransactionStatementCopyWithImpl(this._self, this._then);

  final _TransactionStatement _self;
  final $Res Function(_TransactionStatement) _then;

/// Create a copy of TransactionStatement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recent = null,Object? total = null,Object? previousTotal = null,}) {
  return _then(_TransactionStatement(
recent: null == recent ? _self._recent : recent // ignore: cast_nullable_to_non_nullable
as List<Transaction>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,previousTotal: null == previousTotal ? _self.previousTotal : previousTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
