//
//  FullRun+Performance.swift
//  Lioness
//
//  Created by Louis D'hauwe on 20/10/2016.
//  Copyright © 2016 - 2017 Silver Fox. All rights reserved.
//

import XCTest
@testable import Lioness

/// Performance tests for full run (from lexer to interpreter)
class FullRun_Performance: BaseTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLargeMathPerformance() {
		
		let runner = Runner(logDebug: false)
		
		let fileURL = getFilePath(for: "LargeMathOperation")
		
		guard let path = fileURL?.path else {
			XCTFail("Invalid path for test")
			return
		}
		
		guard let source = try? String(contentsOfFile: path, encoding: .utf8) else {
			XCTFail("Failed to get source")
			return
		}
				
        self.measure {

			do {
				try runner.run(source)
			} catch {
				XCTFail(error.localizedDescription)
			}
			
		}
    }

	func testComplexPerformance() {
		
		let runner = Runner(logDebug: false)
		
		let fileURL = getFilePath(for: "Complex")
		
		guard let path = fileURL?.path else {
			XCTFail("Invalid path for test")
			return
		}
		
		guard let source = try? String(contentsOfFile: path, encoding: .utf8) else {
			XCTFail("Failed to get source")
			return
		}
		
		self.measure {
			
			do {
				try runner.run(source)
			} catch {
				XCTFail(error.localizedDescription)
			}
			
		}
	}
	
}
