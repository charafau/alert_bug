Edit:

thanks to @jmolins this bug is fixed. Problem was, like I thought, BLoC object holding reference to old screen, after unsubscribing to it bug is fixed.

# Sample project showing my error

output:

```
Performing hot restart...
Restarted app in 2,516ms.
E/flutter (31481): [ERROR:topaz/lib/tonic/logging/dart_error.cc(16)] Unhandled exception:
E/flutter (31481): Looking up a deactivated widget's ancestor is unsafe.
E/flutter (31481): At this point the state of the widget's element tree is no longer stable. To safely refer to a widget's ancestor in its dispose() method, save a reference to the ancestor by calling inheritFromWidgetOfExactType() in the widget's didChangeDependencies() method.
E/flutter (31481):
E/flutter (31481): #0      Element._debugCheckStateIsActiveForAncestorLookup.<anonymous closure> (package:flutter/src/widgets/framework.dart:3203:9)
E/flutter (31481): #1      Element._debugCheckStateIsActiveForAncestorLookup (package:flutter/src/widgets/framework.dart:3212:6)
E/flutter (31481): #2      Element.ancestorStateOfType (package:flutter/src/widgets/framework.dart:3254:12)
E/flutter (31481): #3      Navigator.of (package:flutter/src/widgets/navigator.dart:1176:19)
E/flutter (31481): #4      SecondScreen.build.<anonymous closure>.<anonymous closure>.<anonymous closure> (package:alert_bug/second_screen.dart:22:27)
E/flutter (31481): <asynchronous suspension>
E/flutter (31481): #5      _RootZone.runUnaryGuarded (dart:async/zone.dart:1316:10)
E/flutter (31481): #6      _BufferingStreamSubscription._sendData (dart:async/stream_impl.dart:330:11)
E/flutter (31481): #7      _BufferingStreamSubscription._add (dart:async/stream_impl.dart:257:7)
E/flutter (31481): #8      _SyncBroadcastStreamController._sendData.<anonymous closure> (dart:async/broadcast_stream_controller.dart:387:20)
E/flutter (31481): #9      _BroadcastStreamController._forEachListener (dart:async/broadcast_stream_controller.dart:328:15)
E/flutter (31481): #10     _SyncBroadcastStreamController._sendData (dart:async/broadcast_stream_controller.dart:386:5)
E/flutter (31481): #11     _BroadcastStreamController.add (dart:async/broadcast_stream_controller.dart:254:5)
E/flutter (31481): #12     _AsBroadcastStreamController.add (dart:async/broadcast_stream_controller.dart:480:11)
E/flutter (31481): #13     _RootZone.runUnaryGuarded (dart:async/zone.dart:1316:10)
E/flutter (31481): #14     _BufferingStreamSubscription._sendData (dart:async/stream_impl.dart:330:11)
E/flutter (31481): #15     _BufferingStreamSubscription._add (dart:async/stream_impl.dart:257:7)
E/flutter (31481): #16     _SyncBroadcastStreamController._sendData (dart:async/broadcast_stream_controller.dart:379:20)
E/flutter (31481): #17     _BroadcastStreamController.add (dart:async/broadcast_stream_controller.dart:254:5)
E/flutter (31481): #18     Stream.asyncMap.onListen.<anonymous closure> (dart:async/stream.dart:443:22)
E/flutter (31481): #19     _RootZone.runUnaryGuarded (dart:async/zone.dart:1316:10)
E/flutter (31481): #20     _BufferingStreamSubscription._sendData (dart:async/stream_impl.dart:330:11)
E/flutter (31481): #21     _DelayedData.perform (dart:async/stream_impl.dart:578:14)
E/flutter (31481): #22     _StreamImplEvents.handleNext (dart:async/stream_impl.dart:694:11)
E/flutter (31481): #23     _PendingEvents.schedule.<anonymous closure> (dart:async/stream_impl.dart:654:7)
E/flutter (31481): #24     _microtaskLoop (dart:async/schedule_microtask.dart:41:21)
E/flutter (31481): #25     _startMicrotaskLoop (dart:async/schedule_microtask.dart:50:5)
```
