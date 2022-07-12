/// Written for Http Exception error
class HttpError implements Exception {
  String? message;

  HttpError([this.message]);

  @override
  String toString() {
    message ??= 'Genel bir hata var.';
    return message!;
  }
}

class ServerError extends HttpError {
  ServerError() : super('Server Hatası');
}

class InternetError extends HttpError {
  InternetError() : super('Internet bağlantı hatası');
}
