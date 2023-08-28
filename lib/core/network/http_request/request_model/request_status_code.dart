// ignore_for_file: constant_identifier_names

enum RequestStatusCode {
  success,
  phoneLoginSuccess,
  tokenExpired,
  failure,
}

extension RequestStatusExtension on RequestStatusCode {
  int get value {
    switch (this) {
      case RequestStatusCode.success:
        return 1;
      case RequestStatusCode.phoneLoginSuccess:
        return 16;
      case RequestStatusCode.tokenExpired:
        return 3;
      default:
        return 0;
    }
  }
}

enum SystemStatuses {
  cancelled,
}

extension SystemStatusesExtension on SystemStatuses {
  String get value {
    switch (this) {
      case SystemStatuses.cancelled:
        return 'Cancelled';
      default:
        return '';
    }
  }
}
