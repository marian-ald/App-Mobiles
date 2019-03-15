//
//  TP1Tests.swift
//  TP1Tests
//
//  Created by admin on 15/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import XCTest
@testable import TP1

class TP1Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testName() throws {
        let pers = Person.init(lastN : "last", firstN : "first")
        
        XCTAssertEqual(pers.lastname(), "last")
        XCTAssertEqual(pers.firstname(), "first")
        XCTAssertEqual(pers.fullname(), "first last")
    }
    
    func testBirthDate() throws {
        let pers: Person = Person.init(lastN : "last", firstN : "first")
        let d1: Date = Date()
        let d2: Date? = nil
        
        XCTAssertEqual(nil, d2)
        
        pers.birthdate(bDate: d1)
        
        XCTAssertEqual(pers.birthdate(), d1)
    }
    
    func testAge() throws {
        let pers: Person = Person.init(lastN : "last", firstN : "first")
        let dateString = "25/01/2011"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let d1 = dateFormatter.date(from: dateString)
        
        pers.birthdate(bDate: d1!)
        
        XCTAssertEqual(pers.age(), 8)
    }
    
    func testOperators() throws {
        let pers1: Person = Person.init(lastN : "last", firstN : "first")
        let pers2: Person = Person.init(lastN : "last2", firstN : "first2")
        
        let dateString = "25/01/2011"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let d1 = dateFormatter.date(from: dateString)
        
        pers1.birthdate(bDate: d1!)
        
        XCTAssertEqual(pers1 == pers1, true)
        XCTAssertEqual(pers1 != pers2, true)
    }
    
    /// 3 Tested functions for class PersonSet
    /// isEmpty + add + count
    func testIsEmpty() throws {
        let persSet: PersonSet = PersonSet.init()
        
        XCTAssertEqual(persSet.isEmpty(), true)
        
        persSet.add(p: Person.init(lastN: "l", firstN: "f"))
        XCTAssertEqual(persSet.isEmpty(), false)
        XCTAssertEqual(persSet.count(), 1)
    }
    
    /// 2 Tested functions for class PersonSet
    /// remove + contains
    func testRemove() throws {
        let persSet: PersonSet = PersonSet.init()
        let pers1: Person = Person.init(lastN: "l1", firstN: "f1")
        let pers2: Person = Person.init(lastN: "l2", firstN: "f2")
        
        pers1.birthdate(bDate: Date())
        pers2.birthdate(bDate: Date())
        
        persSet.add(p: pers1)
        persSet.add(p: pers2)
        
        XCTAssertEqual(persSet.contains(p: pers1), true)
        
        persSet.remove(p: pers1)
        
        XCTAssertEqual(persSet.count(), 1)
    }
    
    
    /// 2 Tested functions for class PersonSet
    /// indexOf + look(Person)
    func testIndexOf() throws {
        let persSet: PersonSet = PersonSet.init()
        let pers1: Person? = Person.init(lastN: "l1", firstN: "f1")
        let pers2: Person = Person.init(lastN: "l2", firstN: "f2")
        
        pers1!.birthdate(bDate: Date())
        pers2.birthdate(bDate: Date())
        
        persSet.add(p: pers1!)
        persSet.add(p: pers2)
        
        XCTAssertEqual(persSet.indexOf(person: pers2), 1)
        XCTAssertEqual(persSet.look(p: pers1!)! == pers1!, true)
        
    }
    
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
