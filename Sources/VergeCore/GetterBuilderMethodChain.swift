//
//  GetterBuilderMethodChain.swift
//  VergeCore
//
//  Created by muukii on 2020/03/27.
//  Copyright © 2020 muukii. All rights reserved.
//

import Foundation

public enum GetterBuilderTrait {
  public enum Rx {}
  public enum Combine {}
}

// MARK: - Method Chain

public struct GetterBuilderMethodChain<Trait, Container: ValueContainerType> {
  
  public typealias Input = Container.Value
  
  private let target: Container
  
  public init(target: Container) {
    self.target = target
  }
  
  /// Adding a filter to getter to map only when the input object changed.
  ///
  /// - Attention: Wheter to put `.map` before or after `.changed` should be considered according to the costs of `.map` and `.changed`.
  public func changed<PreComparingKey>(
    filter: EqualityComputerBuilder<Input, PreComparingKey>
  ) -> GetterBuilderPreFilterMethodChain<Trait, Container, PreComparingKey> {
    .init(target: target, preFilter: filter)
  }
  
  /// Adding a filter to getter to map only when the input object changed.
  ///
  /// - Attention: Wheter to put `.map` before or after `.changed` should be considered according to the costs of `.map` and `.changed`.
  public func changed<PreComparingKey>(
    keySelector: @escaping (Input) -> PreComparingKey,
    comparer: Comparer<PreComparingKey>
  )-> GetterBuilderPreFilterMethodChain<Trait, Container, PreComparingKey> {
    changed(filter: .init(keySelector: keySelector, comparer: comparer))
  }
  
  /// Adding a filter to getter to map only when the input object changed.
  ///
  /// - Attention: Wheter to put `.map` before or after `.changed` should be considered according to the costs of `.map` and `.changed`.
  public func changed(
    comparer: Comparer<Input>
  )-> GetterBuilderPreFilterMethodChain<Trait, Container, Input> {
    changed(keySelector: { $0 }, comparer: comparer)
  }
  
  /// Adding a filter to getter to map only when the input object changed.
  ///
  /// - Attention: Wheter to put `.map` before or after `.changed` should be considered according to the costs of `.map` and `.changed`.
  public func changed(
    _ equals: @escaping (Input, Input) -> Bool
  )-> GetterBuilderPreFilterMethodChain<Trait, Container, Input> {
    changed(comparer: .init(equals))
  }
  
  /// Projects input object into a new form.
  /// - Attention: No pre filter
  public func map<Output>(_ transform: @escaping (Input) -> Output) -> GetterBuilderTransformMethodChain<Trait, Container, Input, Output> {
    changed(filter: .noFilter)
      .map(transform)
  }
  
  /// No map
  /// - Attention: No pre filter
  public func noMap() -> GetterBuilderTransformMethodChain<Trait, Container, Input, Input> {
    changed(filter: .noFilter)
      .map { $0 }
  }
  
}

extension GetterBuilderMethodChain {
  
  /// Adding a filter to getter to map only when the input object changed.
  /// Filterling with Fragment
  public func changed<T>(_ fragmentSelector: @escaping (Input) -> Fragment<T>) -> GetterBuilderPreFilterMethodChain<Trait, Container, Input> {
    changed(comparer: .init(selector: {
      fragmentSelector($0).counter.rawValue
    }))
  }
  
  /// Projects input object into a new form.
  ///
  /// Filterling with Fragment and projects the wrapped value.
  public func map<Output>(_ transform: @escaping (Input) -> Fragment<Output>) -> GetterBuilderTransformMethodChain<Trait, Container, Input, Output> {
    changed(transform)
      .map { transform($0).wrappedValue }
  }
}

extension GetterBuilderMethodChain where Input : Equatable {
  
  /// Adding a filter to getter to map only when the input object changed.
  public func changed() -> GetterBuilderPreFilterMethodChain<Trait, Container, Input> {
    changed(keySelector: { $0 }, comparer: .init(==))
  }
  
  /// [Filter]
  /// Projects input object into a new form
  public func map<Output>(_ transform: @escaping (Input) -> Output) -> GetterBuilderTransformMethodChain<Trait, Container, Input, Output> {
    changed()
      .map(transform)
  }
    
  /// [Filter]
  /// No map
  public func noMap() -> GetterBuilderTransformMethodChain<Trait, Container, Input, Input> {
    changed()
      .map { $0 }
  }
  
}
