//
//  BookFacadeTests.swift
//  TermiteBookTests
//
//  Created by Konstantin Bondar on 30/11/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import XCTest
@testable import TermiteBook

class BookFacadeTests: XCTestCase {
    var bookFacade: BookFacade!
    
    override func setUp() {
        super.setUp()
        
        bookFacade = BookFacade()
    }
    
    func testEmptyBook() {
        let users = bookFacade.users()
        
        XCTAssertTrue(users.isEmpty)
    }
    
    func testAddingEmptyUser() {
        let user = BookModels.User(fullName: "Konstantin Termite Bondar", firstName: "Konstantin", lastName: "Bondar", middleName: "Termite", age: 22, phones: [], emails: [])
        
        bookFacade.save(user)
        
        guard let savedUser = bookFacade.users().first else {
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(savedUser.fullName, "Konstantin Termite Bondar")
        XCTAssertEqual(savedUser.firstName, "Konstantin")
        XCTAssertEqual(savedUser.lastName, "Bondar")
        XCTAssertEqual(savedUser.middleName, "Termite")
        XCTAssertEqual(savedUser.age, 22)
        XCTAssertTrue(savedUser.phones.isEmpty)
        XCTAssertTrue(savedUser.emails.isEmpty)
    }
    
    func testAddingUserWithPhone() {
        let phone = BookModels.Phone(fullNumber: "+380669917847", code: "+380", number: "669917847", mark: "HOME")
        let user = BookModels.User(fullName: "Konstantin Termite Bondar", firstName: "Konstantin", lastName: "Bondar", middleName: "Termite", age: 22, phones: [phone], emails: [])
        
        bookFacade.save(user)
        
        guard let savedPhone = bookFacade.users().first?.phones.first else {
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(savedPhone.fullNumber, "+380669917847")
        XCTAssertEqual(savedPhone.code, "+380")
        XCTAssertEqual(savedPhone.number, "669917847")
        XCTAssertEqual(savedPhone.mark, "HOME")
    }
    
    func testAddingUserWithEmail() {
        let email = BookModels.Email(email: "bondar.k.dev@gmail.com", service: "gmail", mark: "HOME")
        let user = BookModels.User(fullName: "Konstantin Termite Bondar", firstName: "Konstantin", lastName: "Bondar", middleName: "Termite", age: 22, phones: [], emails: [email])
        
        bookFacade.save(user)
        
        guard let savedEmail = bookFacade.users().first?.emails.first else {
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(savedEmail.email, "bondar.k.dev@gmail.com")
        XCTAssertEqual(savedEmail.service, "gmail")
        XCTAssertEqual(savedEmail.mark, "HOME")
    }
    
    

}
