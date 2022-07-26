//
//  SampleViewControllerTests.swift
//  RequirementAnalysisTests
//
//  Created by Patrick Domingo on 7/26/22.
//

import XCTest
@testable import RequirementAnalysis

class SampleViewControllerTests: XCTestCase {

    func testOutputTextIsInputTextOnLoad() throws {
        let viewController = SampleViewController()
        viewController.inputText = "Hello"
        viewController.sampleton = MockSampleton()
        
        _ = viewController.view
        
        XCTAssertEqual(viewController.inputText, viewController.outputText)
    }
}

fileprivate class MockSampleton: Sampleton {
    override func loadText(_ text: String, completion: @escaping (Output) -> Void) {
        completion(Output(text: text))
    }
}

