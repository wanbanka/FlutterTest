import 'package:eventify/eventify.dart'
    show EventCallback, EventEmitter, Listener, Event;

class EventHandler {
  Function callback;

  EventCallback cb;

  EventEmitter emitter;

  Listener listener;

  EventHandler(this.callback);

  initSystem() {
    //Callback computing according to the given event
    this.cb = (ev, cont) {
      if (null != ev) {
        switch (ev.eventName) {
          case "add":
            this.callback();
            break;
        }
      }
    };

//Create a new EventEmitter

    this.emitter = new EventEmitter();

    this.listener = emitter.on("add", this, cb);
    //Emits the result of the event, with sending information or not
  }
}
