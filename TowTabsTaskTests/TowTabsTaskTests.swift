//
//  TowTabsTaskTests.swift
//  TowTabsTaskTests
//
//  Created by Abdulla Alsahli on 01/05/1443 AH.
//

import XCTest
@testable import TowTabsTask
class TowTabsTaskTests: XCTestCase {

    func testMainModelWithNoUser() {
        let model = MainModel(user: nil)
        XCTAssertNil(model.user, "MainModel has no user data")
        }
    
    func testModelWithNoProfileImage() {
        let user = User(username: "test", name: "test", profileImage: nil)
        XCTAssertNil(user.profileImage, "user has no prifile image")
        }
    
    func testTheDateConverter() throws {
      let date = "07:05:45PM"
        XCTAssertEqual(date.ConvertDate(), "19:05:45")
    }
}
