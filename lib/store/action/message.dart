import "package:http/http.dart";
import "../model/message.dart";

class RequestMessages {
  final String accessToken;

  RequestMessages(this.accessToken);
}

class ResponseMessages {
  final Map<String, List<Message>> group;

  ResponseMessages(this.group);

  ResponseMessages.empty() : this({
    "read": [],
    "notRead": []
  });
}

class ResponseMessagesFailed extends ResponseMessages {
  final ClientException err;

  ResponseMessagesFailed(this.err) : super.empty();
}

class RequestMessageCount{}

class ResponseMessageCount{
  final int count;

  ResponseMessageCount(this.count);

  ResponseMessageCount.failed():this(0);
}

class ResponseMessageCountFailed extends ResponseMessageCount{
  final ClientException err;

  ResponseMessageCountFailed(this.err):super.failed();
}

class StartMarkAllAsRead{}

class FinishMarkAllAsRead{
  final List<int> ids;

  FinishMarkAllAsRead(this.ids);

  FinishMarkAllAsRead.failed():this([]);
}

class FinishMarkAllAsReadFailed extends FinishMarkAllAsRead{
  final ClientException err;

  FinishMarkAllAsReadFailed(this.err):super.failed();
}

class StartMarkAsRead{
  final int id;

  StartMarkAsRead(this.id);
}

class FinishMarkAsRead{
  final int id;

  FinishMarkAsRead(this.id);

  FinishMarkAsRead.failed():this(0);
}

class FinishMarkAsReadFailed extends FinishMarkAsRead{
  final ClientException err;

  FinishMarkAsReadFailed(this.err):super.failed();
}