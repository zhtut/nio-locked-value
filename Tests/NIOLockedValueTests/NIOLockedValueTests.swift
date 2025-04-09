import Testing
@testable import NIOLockedValue

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

@Test func example() {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let obj = TestObject()
    obj.testArray()
    
    #expect(true)
}
