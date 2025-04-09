# NIOLockedValue

这个项目的作用是锁住成员变量的属性，适用于多线程对属性的读写的情况，如果不加锁的话，可能会导致崩溃

使用了Apple的swift concurrency并发库里的NIOLock类

# 使用示例
```swift
class TestObject: @unchecked Sendable {
    
    // 加上这个属性包装器即不会崩溃
    @NIOLocked
    var dataSources = [String]()
    
    func testArray() {
        for i in 0..<1000 {
            Task.detached {
                self.dataSources.append("\(i)")
                print("写入：\(i)，数量：\(self.dataSources.count)")
            }
        }
    }
}
```
