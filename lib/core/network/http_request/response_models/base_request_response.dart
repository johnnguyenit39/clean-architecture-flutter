class BaseRequestResponse {
  final int? status;
  final String? userMessage;
  final dynamic data;

  BaseRequestResponse({
    this.status,
    this.userMessage,
    this.data,
  });

  BaseRequestResponse.fromJson(Map<String, dynamic> json)
      : status = json['Status'] as int?,
        userMessage = json['Message'] as String?,
        data = json['Data'];

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Message': userMessage,
        'Data': data,
      };
}
