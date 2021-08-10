import 'package:flutter/foundation.dart';
import 'package:test_app/utils/enums.dart';

class SnackBarEntity {
  final String message;
  final bool showSnackBar;
  final SnackBarStatus status;

  const SnackBarEntity._({this.message, this.showSnackBar, this.status});

  factory SnackBarEntity.initial() => SnackBarEntity._(
      message: '', showSnackBar: false, status: SnackBarStatus.error);

  factory SnackBarEntity.error({@required String message}) => SnackBarEntity._(
      showSnackBar: true, message: message, status: SnackBarStatus.error);

  factory SnackBarEntity.success({@required String message}) =>
      SnackBarEntity._(
          showSnackBar: true, message: message, status: SnackBarStatus.success);

  factory SnackBarEntity.reset() => SnackBarEntity.initial();
}
