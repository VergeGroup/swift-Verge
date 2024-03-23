import Combine
import Atomics

/**
 A subscription that is compatible with Combine’s Cancellable.
 You can manage asynchronous tasks either call the ``cancel()`` to halt the subscription, or allow it to terminate upon instance deallocation, and by implementing the ``storeWhileSourceActive()`` technique, the subscription’s active status is maintained until the source store is released.
 */
public final class StoreActivitySubscription: Hashable, Cancellable, @unchecked Sendable {

  public static func == (lhs: StoreActivitySubscription, rhs: StoreActivitySubscription) -> Bool {
    lhs === rhs
  }

  public func hash(into hasher: inout Hasher) {
    ObjectIdentifier(self).hash(into: &hasher)
  }

  private let wasCancelled = ManagedAtomic(false)

  private let source: EventEmitterCancellable

  // TODO: can't be sendable
  private weak var storeCancellable: VergeAnyCancellable?
  private var associatedStore: (any StoreType)?
  private var associatedReferences: [AnyObject] = []

  init(
    _ eventEmitterCancellable: EventEmitterCancellable,
    storeCancellable: VergeAnyCancellable
  ) {
    self.source = eventEmitterCancellable
    self.storeCancellable = storeCancellable
  }

  public func cancel() {

    guard wasCancelled.compareExchange(expected: false, desired: true, ordering: .relaxed).exchanged else { return }

    storeCancellable?.dissociate(self)
    source.cancel()
    associatedStore = nil
  }

  /**
   Make this subscription alive while the source is active.
   the source means a root data store which is Store.

   In case of Derived, the source will be Derived's upstream.
   If the upstream invalidated, this subscription will stop.
   */
  @discardableResult
  public func storeWhileSourceActive() -> StoreActivitySubscription {
    ensureAlive()
    assert(storeCancellable != nil)
    storeCancellable?.associate(self)
    return self
  }

  @inline(__always)
  private func ensureAlive() {
    assert(wasCancelled.load(ordering: .relaxed) == false)
  }

  /**
   Converts to Combine.AnyCancellable to make it auto cancellable.
   */
  public func asAny() -> AnyCancellable {
    return .init { [self] in
      self.cancel()
    }
  }

  deinit {
    cancel()
  }
}

