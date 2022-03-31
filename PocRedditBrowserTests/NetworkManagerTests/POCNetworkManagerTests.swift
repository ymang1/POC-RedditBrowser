//
//  POCNetworkManagerTests.swift
//  PocRedditBrowserTests
//
//  Created by Yukti Mangla on 30/03/22.
//

import XCTest
@testable import PocRedditBrowser

class POCNetworkManagerTests: XCTestCase {

    var session: URLSession!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        session = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        session = nil
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

    // test reddit pics url status code
    func testRedditPicsAPIStatusCode() {
        if let url = URL(string: UrlConstant.redditPicsUrl) {
            let promise = expectation(description: "Status code: 200")
            var statusCode: Int?
            var responseError: Error?
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                statusCode = (response as? HTTPURLResponse)?.statusCode
                responseError = error
                promise.fulfill()
            }
            dataTask.resume()
            wait(for: [promise], timeout: 5)
            XCTAssertNil(responseError)
            XCTAssertEqual(statusCode, 200)
        }
    }
}
