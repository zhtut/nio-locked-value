// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@propertyWrapper
public class NIOLocked<Value> {
    
    var _lockedBox: NIOLockedValueBox<Value>
    
    public var wrappedValue: Value {
        get {
            _lockedBox.withLockedValue({ $0 })
        }
        set {
            _lockedBox.withLockedValue({ $0 = newValue })
        }
    }
    
    public init(wrappedValue: Value) {
        self._lockedBox = NIOLockedValueBox(wrappedValue)
        self.wrappedValue = wrappedValue
    }
}
