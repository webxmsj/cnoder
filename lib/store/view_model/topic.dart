import "package:flutter/material.dart";
import "package:redux/redux.dart";
import "../action/action.dart";
import "../root_state.dart";
import "../model/topic.dart";

class TopicViewModel{
  final Topic topic;
  final bool isLoading;
  final Function toggleLoading;
  final Function fetchTopic;
  final Function createReply;
  final Function likeReply;
  final Function toggleCollect;

  TopicViewModel({
    @required this.topic, 
    @required this.isLoading, 
    @required this.toggleLoading,
    @required this.fetchTopic,
    @required this.createReply,
    @required this.likeReply,
    @required this.toggleCollect
  });

  static TopicViewModel fromStore(Store<RootState> store) {
    return new TopicViewModel(
       topic: store.state.topic,
       isLoading: store.state.isLoading,
       toggleLoading: (bool isLoading) {
         store.dispatch(new ToggleLoading(isLoading));
       },
       fetchTopic: (String id) {
          store.dispatch(new ToggleLoading(true));
          store.dispatch(new RequestTopic(id));
       },
       createReply: (String id, String content, Function afterCreate) {
         store.dispatch(new StartCreateReply(id, content, afterCreate));
       },
       likeReply: (String id, bool status) {
         store.dispatch(new StartLikeReply(id, status));
       },
       toggleCollect: (String id, bool status) {
         store.dispatch(new StartToggleCollect(id, status));
       }
    );
  }
}