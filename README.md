# Verge - a full-stack flux library for iOS App - SwiftUI / UIKit

[![Swift 5.2](https://img.shields.io/badge/swift-5.2-ED523F.svg?style=flat)](https://swift.org/download/)
![Tests](https://github.com/muukii/Verge/workflows/Tests/badge.svg)
![cocoapods](https://img.shields.io/cocoapods/v/Verge)


<sub>A Store-Pattern based data-flow architecture. Highly inspired by Vuex</sub><br>
<sub>🎪 Verge 7.0 release is almost there! (Currently quality checking)</sub>

<img width="480px" src="https://user-images.githubusercontent.com/1888355/81477721-268e7580-9254-11ea-94fa-1c2135cdc16f.png"/>

## Overview

The concept of Verge Store is inspired by [Redux](https://redux.js.org/), [Vuex](https://vuex.vuejs.org/) and [ReSwift](https://github.com/ReSwift/ReSwift).

Plus, releasing from so many definition of the actions.<br>
To be more Swift's Style on the writing code.

`store.myOperation()` instead of `store.dispatch(.myOperation)`

The characteristics are

* Creates one or more Dispatcher. \(Single store, multiple dispatcher\)
* A dispatcher can have dependencies service needs. \(e.g. API Client, DB\)
* Method based dispatching action
* Emits any events that isolated from State It's for SwiftUI's onReceive\(:\)
* Supports Logging \(Commit, Performance monitoring\)
* Supports binding with Combine and RxSwift
* Supports normalizing the state with ORM.

<details><summary>🌟 Differences between other Flux libraries in iOS</summary>
<p>

Firstly, Verge provides the functions to keep excellent performance in using Store-Pattern.

Verge focuses on using in the real-world.

For example, the application must have many features depends on its business.<br>
Such as the application might be getting complicated.

To solve this issue, we can choose Store-Pattern such as flux.

At a glance, Flux architecture is amazing.<br>
However, we have to follow the disadvantages behind it.

They are coming from the application runs with Data-Driven (Mostly).<br>
Data-Driven will cause some expensive calculations in the application that depends on the complexity of the application.<br>
Sometimes, we may face some performance issues we can't overlook it.

Redux and Vuex are already following that.

- Redux
  - reselect
  - ORM
- Vuex
  - Getters
  - ORM

Verge is trying to do that in iOS application with Swift.

Specifically:
- Derived
- ORM

</p>
</details>

<details><summary>🌟 Example code</summary>
<p>

```swift
struct State: StateType {
  var name: String = ""
  var age: Int = 0
}

enum Activity {
  case somethingHappen
}

// 🌟with UIKit
class ViewController: UIViewController {
  
  ...  
  
  let store = Store<State, Activity>(initialState: .init(), logger: nil)
  
  ...
            
  func update(changes: Changes<State>) {
    
    changes.ifChanged(\.name) { (name) in
      nameLabel.text = name
    }
    
    changes.ifChanged(\.age) { (age) in
      ageLabel.text = age.description
    }
    
  }
}


// 🌟with SwiftUI
struct MyView: View {
  
  @EnvironmentObject var store: Store<State, Activity>
  
  var body: some View {
    Group {
      Text(store.state.name)
      Text(store.state.age)
    }
  }
}
```

</p>
</details>

## Modules overview

### 📦 Store

It provides core functions of Store-pattern.

- State supports computed property with caching (like [Vuex's Getters](https://vuex.vuejs.org/guide/getters.html))
- Derived object to create derived data from state-tree with performant (like [redux/reselect](https://github.com/reduxjs/reselect))

### 📦 ORM

It provides the function that manages performant many entity objects.<br>
Technically, using Normalization.

In the application that uses many entity objects, we sure highly recommend using such as ORM using Normalization.

About more detail,
https://redux.js.org/recipes/structuring-reducers/normalizing-state-shape

### 📦 Rx Extensions

It provides several observable that compatible with RxSwift.

## Usage

[**🔗 You can see more detail of Verge on Documentation**](https://muukii-app.gitbook.io/verge/)

## Prepare moving to SwiftUI from now with Verge

SwiftUI's concept is similar to the concept of React, Vue, and Elm. <br>
Therefore, the concept of state management will become to be similar as well.

That is Redux or Vuex and more.

Now, almost of iOS Applications are developed on top of UIKit.<br>
And We can't say SwiftUI is ready for top production. <br>
However, it would change.

It's better to use the state management that fits SwiftUI from now. It's not only for that, current UIKit based applications can get more productivity as well.

## Installation

With Cocoapods,

VergeStore

```ruby
pod 'Verge/Store'
```

VergeORM

```ruby
pod 'Verge/ORM'
```

VergeRx

```ruby
pod 'Verge/Rx'
```

These are separated with subspecs in Podspec.<br>
After installed, these are merged into single module as `Verge`.

To use Verge in your code, define import decralation following.

```swift
import Verge
```

## Author

[muukii](https://github.com/muukii)

## License

Verge is released under the MIT license.


