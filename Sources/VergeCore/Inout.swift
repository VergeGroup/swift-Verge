//
// Copyright (c) 2020 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

@dynamicMemberLookup
public final class Inout<State> {

  public private(set) var hasModified = false

  private let pointer: UnsafeMutablePointer<State>

  public init(pointer: UnsafeMutablePointer<State>, onModified: @escaping () -> Void) {
    self.pointer = pointer
  }

  public subscript<T> (dynamicMember keyPath: WritableKeyPath<State, T>) -> T {
    get {
      pointer.pointee[keyPath: keyPath]
    }
    set {
      hasModified = true
      pointer.pointee[keyPath: keyPath] = newValue
    }
  }

  public subscript<T> (dynamicMember keyPath: WritableKeyPath<State, T?>) -> T? {
    get {
      pointer.pointee[keyPath: keyPath]
    }
    set {
      markAsModified()
      pointer.pointee[keyPath: keyPath] = newValue
    }
  }

  public subscript<T> (dynamicMember keyPath: KeyPath<State, T>) -> T {
    return pointer.pointee[keyPath: keyPath]
  }

  public subscript<T> (dynamicMember keyPath: KeyPath<State, T?>) -> T? {
    return pointer.pointee[keyPath: keyPath]
  }

  public subscript<T> (keyPath keyPath: WritableKeyPath<State, T>) -> T {
    get {
      pointer.pointee[keyPath: keyPath]
    }
    set {
      markAsModified()
      pointer.pointee[keyPath: keyPath] = newValue
    }
  }

  public subscript<T> (keyPath keyPath: WritableKeyPath<State, T?>) -> T? {
    get {
      pointer.pointee[keyPath: keyPath]
    }
    set {
      markAsModified()
      pointer.pointee[keyPath: keyPath] = newValue
    }
  }

  public subscript<T> (keyPath keyPath: KeyPath<State, T>) -> T {
    return pointer.pointee[keyPath: keyPath]
  }

  public subscript<T> (keyPath keyPath: KeyPath<State, T?>) -> T? {
    return pointer.pointee[keyPath: keyPath]
  }

  public func replace(with newValue: State) {
    markAsModified()
    pointer.pointee = newValue
  }

  public func markAsModified() {
    hasModified = true
  }

  public func map<U>(keyPath: WritableKeyPath<State, U>) -> Inout<U> {
    return withUnsafeMutablePointer(to: &pointer.pointee[keyPath: keyPath]) { (pointer) in
      Inout<U>.init(pointer: pointer) {
        self.markAsModified()
      }
    }
  }

  public func map<U>(keyPath: WritableKeyPath<State, U?>) -> Inout<U>? {

    guard pointer.pointee[keyPath: keyPath] != nil else {
      return nil
    }

    return withUnsafeMutablePointer(to: &pointer.pointee[keyPath: keyPath]!) { (pointer) in
      Inout<U>.init(pointer: pointer) {
        self.markAsModified()
      }
    }

  }

}
