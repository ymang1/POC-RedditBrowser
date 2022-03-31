//
//  RedditImageDelegateTests.swift
//  PocRedditBrowserTests
//
//  Created by Yukti Mangla on 30/03/22.
//

import XCTest
@testable import PocRedditBrowser

class RedditImageDelegateTests: XCTestCase, RedditImageDelegate {
    private var expectation: XCTestExpectation!
    private var index: Int!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // test thumbnail image tapped action
    func testImageTappedMethod() {
        expectation = expectation(description: "Index")
        
        let imageView = UIImageView()
        imageView.tag = 1
        
        let redditCell = RedditCell()
        redditCell.imageDelegate = self
        redditCell.imageTappedMethod(imageView)
        
        // Waits 30 seconds for results.
        // Timeout is always treated as a test failure.
        waitForExpectations(timeout: 30)
        XCTAssertNotEqual(self.index, 1)
    }

    func tapOnThumbnailImage(_ index: Int) {
        self.index = index
        expectation.fulfill()
    }
    
}
