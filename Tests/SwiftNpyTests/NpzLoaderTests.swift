
import XCTest
@testable import SwiftNpy

class NpzLoaderTests: XCTestCase {
    func testLoadNpz() {
        let npzData: Npz = try! load(data: npz)
        
        XCTAssertEqual(Set(npzData.keys), ["a", "b"])
        let a: Npy = npzData.get("a")!
        XCTAssertEqual(a.shape, [3])
        let aElements: [Int] = a.elements()
        XCTAssertEqual(aElements, [0, 1, 2])
        let b: Npy = npzData.get("b")!
        XCTAssertEqual(b.shape, [4])
        let bElements: [Int] = b.elements()
        XCTAssertEqual(bElements, [0, 1, 2, 3])
    }
}


let npz = Data(bytes: [
    0x50, 0x4b, 0x03, 0x04, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2e, 0x75, 0x8c, 0x4a, 0x6f, 0xc5,
    0xde, 0x4a, 0x68, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x61, 0x2e,
    0x6e, 0x70, 0x79, 0x93, 0x4e, 0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64,
    0x65, 0x73, 0x63, 0x72, 0x27, 0x3a, 0x20, 0x27, 0x3c, 0x69, 0x38, 0x27, 0x2c, 0x20, 0x27, 0x66,
    0x6f, 0x72, 0x74, 0x72, 0x61, 0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46,
    0x61, 0x6c, 0x73, 0x65, 0x2c, 0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28,
    0x33, 0x2c, 0x29, 0x2c, 0x20, 0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
    0x20, 0x20, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4b, 0x03, 0x04, 0x14,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x2e, 0x75, 0x8c, 0x4a, 0x3c, 0x37, 0x1f, 0x5d, 0x70, 0x00, 0x00,
    0x00, 0x70, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x62, 0x2e, 0x6e, 0x70, 0x79, 0x93, 0x4e,
    0x55, 0x4d, 0x50, 0x59, 0x01, 0x00, 0x46, 0x00, 0x7b, 0x27, 0x64, 0x65, 0x73, 0x63, 0x72, 0x27,
    0x3a, 0x20, 0x27, 0x3c, 0x69, 0x38, 0x27, 0x2c, 0x20, 0x27, 0x66, 0x6f, 0x72, 0x74, 0x72, 0x61,
    0x6e, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x27, 0x3a, 0x20, 0x46, 0x61, 0x6c, 0x73, 0x65, 0x2c,
    0x20, 0x27, 0x73, 0x68, 0x61, 0x70, 0x65, 0x27, 0x3a, 0x20, 0x28, 0x34, 0x2c, 0x29, 0x2c, 0x20,
    0x7d, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4b,
    0x01, 0x02, 0x14, 0x03, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2e, 0x75, 0x8c, 0x4a, 0x6f, 0xc5,
    0xde, 0x4a, 0x68, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x81, 0x00, 0x00, 0x00, 0x00, 0x61, 0x2e, 0x6e, 0x70,
    0x79, 0x50, 0x4b, 0x01, 0x02, 0x14, 0x03, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2e, 0x75, 0x8c,
    0x4a, 0x3c, 0x37, 0x1f, 0x5d, 0x70, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x81, 0x8b, 0x00, 0x00, 0x00, 0x62,
    0x2e, 0x6e, 0x70, 0x79, 0x50, 0x4b, 0x05, 0x06, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00,
    0x66, 0x00, 0x00, 0x00, 0x1e, 0x01, 0x00, 0x00, 0x00, 0x00
])
