//
//  Service.swift
//  VergeNeueDemo
//
//  Created by muukii on 2019/09/18.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation
import Combine

final class MockService {
  
  let database: MockDatabase
  let apiProvider: MockAPIProvider
  
  init(env: Env) {
    
    self.database = .init()
    self.apiProvider = .init()
    
  }
  
  func fetchPhotosPage1() -> AnyPublisher<[Photo], Error> {
    
    apiProvider
      .fetchPhotos()
      .tryMap { (json) -> [Photo] in
        try json.getArray().map {
          try Photo(from: $0)
        }
    }
    .eraseToAnyPublisher() // I don't want to do that.
      
  }
}
