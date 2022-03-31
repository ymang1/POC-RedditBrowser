//
//  PocRedditBrowserTests.swift
//  PocRedditBrowserTests
//
//  Created by Yukti Mangla on 30/03/22.
//

import XCTest
@testable import PocRedditBrowser

class PocRedditBrowserTests: XCTestCase {

    let redditChildDatamodel = RedditChildrenDataModel(title: "[OC] I had such an amazing response from my embroideries yesterday! Here are some others", author: "Sa1tyWaffles", thumbnail: "https://b.thumbs.redditmedia.com/In4ZcEmgTpa-8YRF-SjKWKv68wZ9mSk-Mw6e5KaGBOg.jpg", url: "https://www.reddit.com/gallery/trp7or", created: 1648591604)
    
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

    // test Reddit Model
    func testRedditModel() {
        let redditChildModel = RedditChildrenModel(kind: "t3", data: redditChildDatamodel)
        let redditDataModel = RedditDataModel(children: [redditChildModel])
        
        XCTAssertEqual("Sa1tyWaffles", redditDataModel.children?.first?.data?.author)
        XCTAssertNotNil(redditDataModel.children?.first?.kind, "t4")
    }
    
    // test Reddit detail view
    func testRedditDetailView() {
        let redditDetailViewController = RedditDetailViewController()
        redditDetailViewController.redditChildrenModel = RedditChildrenModel(kind: "t3", data: redditChildDatamodel)
        
        XCTAssertNotEqual("Sa1tyWaffles", redditDetailViewController.redditChildrenModel?.data?.title)
        XCTAssertEqual("https://www.reddit.com/gallery/trp7or", redditDetailViewController.redditChildrenModel?.data?.url)
    }
}
