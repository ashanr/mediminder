// import 'package:dietplans/plans/add_diet1_plans/errors1.dart';

import 'package:mediminder/plans/add_diet1_plans/errors1.dart';
import 'package:rxdart/rxdart.dart';

class NewPlan2Block {
  BehaviorSubject<Diet2EntryError>? _error2State$;
  BehaviorSubject<Diet2EntryError>? get error2State$ => _error2State$;

  NewPlan2Block() {
    _error2State$ = BehaviorSubject<Diet2EntryError>();
  }

  void submitError(Diet2EntryError error2) {
    _error2State$!.add(error2);
  }
}
