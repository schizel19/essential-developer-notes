//
//  SampleViewControllerTests.swift
//  RequirementAnalysisTests
//
//  Created by Patrick Domingo on 7/26/22.
//

import XCTest
@testable import RequirementAnalysis

class SampleViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOutputTextIsInputTextOnLoad() throws {
        let viewController = SampleViewController()
        viewController.inputText = "Hello"
        viewController.sampleton = MockSampleton()
        
        let expectation = expectation(description: "output text is input text")
        viewController.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) { [weak expectation] in
            expectation?.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
                
        XCTAssertEqual(viewController.inputText, viewController.outputText)
    }
}

fileprivate class MockSampleton: Sampleton {
    override func loadText(_ text: String, completion: @escaping (Output) -> Void) {
        completion(Output(text: text))
    }
}

