//
//  UInt256TestArithmetic.swift
//  UInt256
//
//  Created by Sjors Provoost on 06-07-14.
//

import XCTest
import UInt256Mac

class UInt256TestArithmetic: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd() {
        let a = UInt256(decimalStringValue: "14")
        let b = UInt256(decimalStringValue: "26")
        let c = UInt256(decimalStringValue: "40")
        
        XCTAssertEqual(a + b, c, "a + b = c");
        
    }
    
    func testAddHex() {
        let a = UInt256(hexStringValue: "14")
        let b = UInt256(hexStringValue: "26")
        let c = UInt256(hexStringValue: "3A")
        
        XCTAssertEqual(a + b, c, "a + b = c");
        
    }
    
    
    func testAddBig() {
        let a = UInt256(decimalStringValue: "14000000123400000001")
        let b = UInt256(decimalStringValue: "26000000123400000001")
        let c = UInt256(decimalStringValue: "40000000246800000002")
        
        XCTAssertEqual(a + b, c, "\(a) + \(b) = \( c )");
    }
    
    func testAddBigHex() {
        let a   = UInt256(hexStringValue:  "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF") // 128 bit
        let b   = UInt256(hexStringValue:  "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE") // 128 bit
        let sum = UInt256(hexStringValue: "1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD") // 129 bit
        let result = a + b
        
        XCTAssertEqual(result, sum, result.toHexString);
        
    }
    
    func testSubtract() {
        let a = UInt256(decimalStringValue: "40")
        let b = UInt256(decimalStringValue: "26")
        let c = UInt256(decimalStringValue: "14")
        
        XCTAssertEqual(a - b, c, "a - b = c");
        
    }
    
    func testSubtractHex() {
        let a = UInt256(hexStringValue: "3A")
        let b = UInt256(hexStringValue: "26")
        let c = UInt256(hexStringValue: "14")
        
        XCTAssertEqual(a - b, c, "a - b = c");
        
    }
    
    func testSubtractBig() {
        let a = UInt256(hexStringValue: "40000000000000000000")
        let b = UInt256(hexStringValue: "26000000000000000001")
        let c = UInt256(hexStringValue: "19FFFFFFFFFFFFFFFFFF")
        
        XCTAssertEqual(a - b, c, "a - b = c");
        
    }
    
    func testSubtractBigger() {
        let a = UInt256(decimalStringValue: "489155902448849041265494486330585906971")
        let b = UInt256(decimalStringValue: "340282366920938463463374607431768211297")
        
        let c = UInt256(decimalStringValue: "148873535527910577802119878898817695674")
        
        XCTAssertEqual(a - b, c, "a - b = c");
    }
    
    func testMultiply() {
        let a = UInt256(decimalStringValue: "32")
        let b = UInt256(decimalStringValue: "2")
        let c = UInt256(decimalStringValue: "64")
        
        let res: UInt256 =  a * b
        
        XCTAssertEqual(res, c, "\(a) * \(b) = \( res ) != \( c )");
        
    }
    
    func testSquare131070() {
        let a = UInt256(decimalStringValue: "131070")
        let b = UInt256(decimalStringValue: "131070")
        let product = UInt256(decimalStringValue: "17179344900") // 33 bits
        
        let res: UInt256 =  a * b
        
        XCTAssertEqual(res, product, res.description);
        
    }
    
    func testMultiplyShouldNotMutate() {
        let a = UInt256(decimalStringValue: "32")
        let b = UInt256(decimalStringValue: "2")
        let c = UInt256(decimalStringValue: "64")
        
        var res: UInt256 =  a * b
        res = a * b
        
        XCTAssertEqual(res, c, "Res mutated to \( res)");
        
        
    }
    
    func testMultiplyBig() {
        let a = UInt256(decimalStringValue: "32000000000")
        let b = UInt256(decimalStringValue:  "2000000000")
        let c = UInt256(decimalStringValue: "64000000000000000000")
        
        let res: UInt256 = a * b
        
        XCTAssertEqual(res, c, "\(a) * \(b) = \( res) != \( c )");
        
    }
    
    func testSquareUInt32Max() {
        let a = UInt256(hexStringValue: "FFFFFFFF")
        let c = UInt256(hexStringValue: "FFFFFFFE00000001")
        
        let res: UInt256 = a * a
        
        XCTAssertEqual(res, c, res.description);
        
    }
    
    func testSquareUInt60Max() {
        let a = UInt256(hexStringValue: "FFFFFFF")
        let c = UInt256(hexStringValue: "FFFFFFE0000001")
        
        let res: UInt256 = a * a
        
        XCTAssertEqual(res, c, res.description);
        
    }
    
    func testMultiplyUInt64MaxWith3() {
        let a = UInt256(hexStringValue: "FFFFFFFFFFFFFFFF") // UInt64.max
        let b = UInt256(hexStringValue: "3") // 0b0011
        
        let c = UInt256(hexStringValue: "2FFFFFFFFFFFFFFFD")
        
        let res: UInt256 = a * b
        
        XCTAssertEqual(res, c, res.description);
        
    }
    
    func testSquareUInt64Max() {
        let a = UInt256(hexStringValue: "FFFFFFFFFFFFFFFF") // UInt64.max
        let c = UInt256(hexStringValue: "FFFFFFFFFFFFFFFE0000000000000001")
        
        let res: UInt256 = a * a
        
        XCTAssertEqual(res, c, res.description);
        
    }
    
    func testMultiplyMax() {
        let a = UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        let c = UInt256(decimalStringValue: "115792089237316195423570985008687907852589419931798687112530834793049593217025") // 0.9999999...% of UInt256 max
        
        let res:UInt256 = a * a
        
        XCTAssertEqual(res, c, res.description);
        
    }
    
    
    
//    func testMultiplyOverflow() {
//        let a = UInt256(hexStringValue: "8888888888888888888888888888888888888888888888888888888888888888")
//        let b = UInt256(hexStringValue: "0000000000000000000000000000000000000000000000000000000000000002")
//        let c = UInt256(hexStringValue: "1111111111111111111111111111111111111111111111111111111111111110")
//        
//        // Should crash: 
//        let res = a * b
//        
//        // Unsafe multiply is not supported, so this will crash as well:
//        let res = a &* b
//        
//        XCTAssertTrue(res == c, "");
//    }
    
    func testMultiplyToTuple() {
        let a = UInt256(hexStringValue: "8888888888888888888888888888888888888888888888888888888888888888")
        let b = UInt256(hexStringValue: "0000000000000000000000000000000000000000000000000000000000000002")
        let c = (UInt256(hexStringValue: "0000000000000000000000000000000000000000000000000000000000000001"), UInt256(hexStringValue: "1111111111111111111111111111111111111111111111111111111111111110"))
        
        // Should crash: let res = a * b
        
        let (resLeft, resRight) = a * b
        let (cLeft, cRight) = c
        
        
        XCTAssertTrue(resLeft == cLeft && resRight == cRight, "( \(resLeft), \(resRight) )");
    }
    
    func testModuloFromTuple() {
        let tuple = (UInt256(hexStringValue: "33F23902074835C68CC1630F5EA81161C3720765CC78C137D6434422659760CC"),UInt256(hexStringValue: "493EF0F253A03B4AB649EA632C432258F7886805422976F65A3E63DE32D809D8"))
        
        let p = UInt256(hexStringValue: "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F")
        
        let modulo = UInt256(hexStringValue: "8FF2B776AAF6D91942FD096D2F1F7FD9AA2F64BE71462131AA7F067E28FEF8AC")
        
        let result = tuple % p
        
        XCTAssertEqual(result, modulo, result.toHexString)
    }
    

    func testDivide() {
        let a = UInt256(decimalStringValue: "640")
        let b = UInt256(decimalStringValue: "4")
        let c = UInt256(decimalStringValue: "160")
        
        let res =  a / b
        
        XCTAssertEqual(res, c, "\(a) / \(b) = \( res ) != \( c )");
        
    }
    
    func testModulo() {
        let a = UInt256(decimalStringValue: "23")
        let b = UInt256(decimalStringValue: "5")
        let c = UInt256(decimalStringValue: "3")
        
        let res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
    }
    
    
    func testModuloLarger() {
        let a = UInt256(decimalStringValue: "25000000000000000000000000000000000000000000000000000000000000000000000004")
        let b = UInt256(decimalStringValue: "5000000000000000000000000000000000000")
        let c = UInt256(decimalStringValue: "4")
        
        let res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
    }
    
    func testModuloMoreComplex() {
        let a = UInt256(decimalStringValue: "2145932040592314323128185")
        let b = UInt256(decimalStringValue: "897983433434")
        let c = UInt256(decimalStringValue: "3")
        
        let res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
    }
    
    func testDivideBig() {
        let a = UInt256(decimalStringValue: "115792089237316195423570985008687907852589419931798687112530834793049593217025")
        let b = UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        let c = UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        
        let res =  a / b
        
        XCTAssertEqual(res, c, "\(a) / \(b) = \( res ) != \( c )");
        
    }
    
    func testModuloLargest128bitPrime() {
        // According to http://primes.utm.edu/lists/2small/100bit.html, 2^128-159 is prime
        // According to Ruby that's: 340282366920938463463374607431768211297
        
        var a = UInt256(decimalStringValue: "340282366920938463463374607431768211298")
        var b = UInt256(decimalStringValue: "340282366920938463463374607431768211297")
        var c = UInt256(decimalStringValue: "1")
        
        var res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
        // (2**128 - 159) * 55 + 5 (according to Ruby)
        a = UInt256(decimalStringValue: "18715530180651615490485603408747251621340")
        b = UInt256(decimalStringValue: "340282366920938463463374607431768211297")
        c = UInt256(decimalStringValue: "5")
        
        res =  a % b
        
        // Fails:
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
        
    }
    
    func testModuloBig() {
        let a = UInt256(decimalStringValue: "115792089237316195423570985008687907852589419931798687112530834793049593217026")
        let b = UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        let c = UInt256(decimalStringValue: "1")
        
        let res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
    }
    
    func testModularMultiplicativeInverse() {
        let a = UInt256(hexStringValue: "FFFFFF")
        let m = UInt256(hexStringValue:  "fffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f")
        
        let aInverse = UInt256(hexStringValue: "6A94546A94546A94546A94546A94546A94546A94546A94546A94546A29C01493")
        
        let res = a.modInverse(m)
        
        XCTAssertEqual(res, aInverse, res.toHexString);
        
    }
    
    func testModularMultiplicativeInverseSmall() {
        let p: UInt256 = 11
        let a: UInt256 =  5
        
        let inverse: UInt256 = 9 // 9  * 5 = 45 -> 45 % 9 = 1
        
        let result = a.modInverse(p)
        
        XCTAssertEqual(inverse, result, result.toDecimalString);
    }
    

    func testMultiplicationAndModInSecp256k1() {

        let p = UInt256(0xffffffff, 0xffffffff, 0xffffffff,0xffffffff, 0xffffffff,0xffffffff, 0xfffffffe,0xfffffc2f)
        
        var a = UInt256(0x9b992796, 0x19237faf, 0x0c13c344, 0x614c46a9, 0xe7357341, 0xc6e4e042, 0xa9b1311a, 0x8622deaa)
        
        var b = UInt256(0xe7f1caa6, 0x36baa277, 0x9cfd6cf9, 0x696cf826, 0xf013db03, 0x7aa08f3d, 0x5c2dfaf9, 0xdb5d255b)
        
        
        var (left, right) = (UInt256(0x8cfa2912, 0x94cc8c2c, 0x827a9ef6, 0x977f6b69, 0x1d24b810, 0xf085c437, 0xabd13f27, 0x942da0b5), UInt256(0xede973cf, 0x7a14db61, 0x0dfe857e, 0x382bc650, 0x71af459e, 0x27425f0c, 0x36b67051, 0x0a55b86e))
        
        
        var product = UInt256(0x896cbfe5, 0xdd327035, 0x9b769bff, 0x82996a89, 0x9b57827b, 0xc19576ab, 0x11704459, 0x9336d1f0)
        
        var (resLeft, resRight) = a * b
        
        XCTAssertTrue(resLeft == left, resLeft.description);
        XCTAssertTrue(resRight == right, resRight.description);
        
        var result = (resLeft, resRight) % p
        
        XCTAssertTrue(result == product, result.description);
        
        a = UInt256(0xbaccf46f, 0xb8cf1f04, 0x04ba1b2c, 0x8670a4ed, 0x48d7332b, 0xfd7c2be7, 0x17ac8711, 0x5b90982d)
        
        b = UInt256(0xb404418f, 0x7da39ff5, 0xdfb1e64d, 0xbb641d89, 0x57e97ad1, 0xab4d1214, 0x0e2f9b3b, 0xee335cfb)
        
        
        (left, right) = (UInt256(0x835b36e9, 0x1deae5f3, 0x0786bfdf, 0x07a8b64f, 0x6aec6311, 0x48fa547e, 0x38dcd2ac, 0x8168b1ad), UInt256(0xf3aedbb4, 0x6e83c60d, 0x7fb73d7c, 0xd0aaea20, 0xce9e521b, 0x8fd69dda, 0x4f01a793, 0xe46c601f))
        
        
        product = UInt256(0x60b65152, 0xa3821a6c, 0x40a235f8, 0x76771249, 0x27bebb91, 0x4c0fe63e, 0x5685986f, 0x141e806b)
        
         (resLeft, resRight) = a * b
        
        XCTAssertTrue(resLeft == left, resLeft.description);
        XCTAssertTrue(resRight == right, resRight.description);
        
         result = (resLeft, resRight) % p
        
        XCTAssertTrue(result == product, result.description);

    }
    
    func testMultiplicationToTupleWithoutRecursion() {
        let p = UInt256(0xffffffff, 0xffffffff, 0xffffffff,0xffffffff, 0xffffffff,0xffffffff, 0xfffffffe,0xfffffc2f)

    
        // a and b chosen such that x₁ + x₀ and y₁_plus_y₀ don't overflow
        let a = UInt256(0x502b5092, 0x9d7b11ed, 0x52d00e63, 0x11cd10ff, 0x92956188, 0xdd566bc4, 0x52d0ebaa, 0x95f8234c)
    
        let b = UInt256(0x17c10759, 0xf6e128f2, 0x0704c711, 0x914fa8bf, 0xaa514b51, 0xa371522d, 0xfc5bd655, 0x162050ce)
    
        let (left, right) = (UInt256(0x07705732, 0x4641effd, 0x378f46bc, 0x92edec71, 0x75c31faf, 0xc2e21a5d, 0x69bfbb9f, 0x07abd941), UInt256(0x98baaae0, 0xf56e67d7, 0x455c1ce2, 0x8617a3a9, 0xc9cd081a, 0x1afb578a, 0xa0e2446b, 0x2a342728))
    
        let product = UInt256(0x42b961bc, 0x4ea293f4, 0xe216ff00, 0xb9de205b, 0xfa5b103e, 0x45a1b1aa, 0x44b97f03, 0xd4c97cb8)
        
        let (resLeft, resRight) = a * b
        
        XCTAssertTrue(resLeft == left, resLeft.description);
        XCTAssertTrue(resRight == right, resRight.description);
        
        let result = (resLeft, resRight) % p
        
        XCTAssertTrue(result == product, result.description);
    
    }

}