//
// Copyright (c) 2020 Hiroshi Kimura(Muukii) <muukii.app@gmail.com>
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

#if !COCOAPODS
import Verge
import Combine
#endif

import RxSwift

extension VergeAnyCancellable: RxSwift.Disposable {
  public func dispose() {
    cancel()
  }
}

extension Publisher {
  /// Returns an Observable<Output> representing the underlying
  /// Publisher. Upon subscription, the Publisher's sink pushes
  /// events into the Observable. Upon disposing of the subscription,
  /// the sink is cancelled.
  ///
  /// - returns: Observable<Output>
  func asObservable() -> Observable<Output> {
    Observable<Output>.create { observer in
      let cancellable = self.sink(
        receiveCompletion: { completion in
          switch completion {
          case .finished:
            observer.onCompleted()
          case .failure(let error):
            observer.onError(error)
          }
        },
        receiveValue: { value in
          observer.onNext(value)
        })
      
      return Disposables.create { cancellable.cancel() }
    }
  }
}
