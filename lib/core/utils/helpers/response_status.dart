import '../values/enums.dart';

class ResponseStatus {
  ResponseType? resType;
  String? msg;

  ResponseStatus.sucess() : resType = ResponseType.success;
  ResponseStatus.loading() : resType = ResponseType.loading;
  ResponseStatus.error({String errormsg = "Something went wrong"})
      : resType = ResponseType.error,
        msg = errormsg;
}
