# ``Verge/Changes``

`Changes<State>` wraps primitive value inside and previous one.
This data structure enables to get differences between now one and previous one.
It helps us to prevent duplicated operation with the same value from the state.

![Changes structure](changes)

## How we update UI with the state uniquely in UIKit

In subscribing the state and binding UI, it’s most important to reduce the meaningless time to update UI.
What things are the meaningless? that is the update UI operations which contains no updates.
Basically, we can prevent this with like followings:

```swift
func updateUI(newState: State) {
  if self.label.text != newState.name {
    self.label.text = newState.name
  }
}
```

Although, this approach make the code a little bit complicated by increasing the code that updates UI.
Especially, same words come up a lot.

## Changes simplify the code

Actually, state property of Store returns `Changes<State>` implicitly.
From the power of `dynamicMemberLookup`, we can use the property of the State with we don’t know that is actually Changes object.

How to know there is differences is using `ifChanged`.

```swift
let store: MyStore
let state: Changes<MyState> = store.state

state.ifChanged(\.name) { name in
  // called when `name` changed only
}
```

## Patterns of `ifChanged`

`ifChanged` has a bunch of overloads.
Let’s take a look of patterns.

```swift
state.ifChanged(\.aaa, \.bbb) { aaa, bbb in
  // Executes every two properties change.
}
```

```swift
state.ifChanged({ "Mr." + $0.name }) { composedName in

}
```

```swift
state.ifChanged({ "Mr." + $0.name }, { $0 == $1 }) { aaa, bbb in

}
```

```swift
state.ifChanged({ ($0.aaa, $0.bbb, "Mr" + $0.name)}, ==) { composedName in
  // Returning tuple that contains composed value enables to do anything with the value you want.
  // It releases us from complicated streaming mixing.
  // Current Swift version does not support tuple conforming with Equatable,
  // You need passing `==` function in the second argument.
}
```

## Subscribing the state

```swift
class ViewController: UIViewController {

  var subscriptions = Set<UntilDeinitCancellable>()

  let store: MyStore

  override func viewDidLoad() {

    super.viewDidLoad()

    store.sinkChanges { [weak self] (changes) in
      // it will be called on the thread which committed
      self?.update(changes: changes)
    }
    .store(in: &subscriptions)
  }

  private func update(changes: Changes<MyState> {
    changes.ifChanged(\.name) { name in
      // called only name changed
    }
    ...
  }

}
```

## Make Changes object the first-time value

If you have a `Changes` from anywhere, it might have previous value,
Using `ifChanged` might return false because compared with the previous one.
You can create the Changed object that always returns true from `ifChanged` with followings:

```swift
let changes: Changes<State>

let firstTimeChanges: Changes<State> = changes.droppedPrevious()
```#  <#Title#>

