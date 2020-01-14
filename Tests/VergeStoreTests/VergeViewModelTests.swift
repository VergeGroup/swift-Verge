//
//  VergeViewModelTests.swift
//  VergeViewModelTests
//
//  Created by muukii on 2019/11/24.
//  Copyright © 2019 muukii. All rights reserved.
//

import XCTest

import VergeStore

struct RootState {
  var count: Int = 0
}

fileprivate final class RootStore: StoreBase<RootState, Never> {
  
}

fileprivate final class RootDispatcher: DispatcherBase<RootState, Never> {
    
  func increment() -> Mutation<Void> {
    .mutation {
      $0.count += 1
    }
  }
}

struct MyViewModelState {
  var rootCount: Int = 0
  var count: Int = 0
}

final class MyViewModel: VergeViewModelBase<MyViewModelState, RootState, Never, Never> {
  
  override func updateState(state: inout MyViewModelState, by storeState: RootState) {
    state.rootCount = storeState.count
  }
    
  func increment() -> Mutation<Void> {
    .mutation {
      $0.count += 1
    }
  }
}

fileprivate class VergeViewModelTests: XCTestCase {
  
  let store = RootStore(initialState: .init(), logger: DefaultLogger.shared)
  lazy var dispatcher = RootDispatcher(target: store)
  lazy var viewModel = MyViewModel(initialState: .init(), parent: store, logger: DefaultLogger.shared)
    
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _ = viewModel
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testSyncRootStore() {
    dispatcher.commit { $0.increment() }
    XCTAssertEqual(viewModel.state.rootCount, 1)
  }
  
  func testIncrement() {
    
    viewModel.commit { $0.increment() }
    XCTAssertEqual(viewModel.state.count, 1)

  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
