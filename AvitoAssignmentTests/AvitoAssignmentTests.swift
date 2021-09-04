//
//  AvitoAssignmentTests.swift
//  AvitoAssignmentTests
//
//  Created by Чистяков Василий Александрович on 31.08.2021.
//

import XCTest

@testable import AvitoAssignment
class AvitoAssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUrlSession() {
        let sut = NetwokingManager()
        
        var fetchRequest = sut.fetchRequest { avito in
           let employees = avito.company.employees
        }
        
        
        
        
    }


}
