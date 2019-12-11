//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Borja Giraldez Gonzalez on 11/12/2019.
//  Copyright © 2019 Borja Giraldez Gonzalez. All rights reserved.
//

import XCTest
@testable import StringCalculator

enum NegativeError: Error {
    case negativeNotAllowed
}
class StringCalculatorTests: XCTestCase {
    

    let scenarios = [("",0),("1",1),("1,2",3),("1\n2",3),("11,22,33",66)]
    
    
//    func testScenarios() {
//        scenarios.forEach { (input, expected) in
//            let result = add(numbers: input)
//
//            XCTAssertEqual(expected, result)
//        }
//    }
    
    func testNegativeNumbers () {
        let result = try! add(numbers: "-1,1")
        
        XCTAssertEqual(0, result)
    }
    
     func add (numbers: String) throws -> Int {
        guard !numbers.isEmpty else {
            return 0
        }
        let arrayNumbers: [String] = numbers.components(separatedBy: [",","\n"])
        var sum = 0
        for number in arrayNumbers {
            if (Int(number)! < 0) {
                throw NegativeError.negativeNotAllowed
            }
            sum += Int(number)!
        }
        return sum
      }

}
