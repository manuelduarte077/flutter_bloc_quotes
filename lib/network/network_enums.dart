enum NetworkResponseErrorType {
  socket,
  exception,
  responseEmpty,
  didNotSucceed
}

enum CallBackParameterName {
  all,
}

extension CallbackParameterNameException on CallBackParameterName {
  dynamic getJson(json) {
    if (json == null) {
      switch (this) {
        case CallBackParameterName.all:
          return json;
      }
    }
  }
}
