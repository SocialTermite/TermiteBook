//
//  BookFacadeTests.swift
//  TermiteBookTests
//
//  Created by Konstantin Bondar on 30/11/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import XCTest
@testable import TermiteBook

class TRContactsStoreTests: XCTestCase {
    var contactsStore: TRContactsStore!
    
    override func setUp() {
        super.setUp()
        
        contactsStore = TRContactsStore()
        CNContactsStoreWrapper().clearStorage()
    }
    
    func testEmptyBook() {
        let contacts = contactsStore.contacts()
        
        XCTAssertTrue(contacts.isEmpty)
    }
    
    func testAddingEmptyContact() {
        let contact = ContactModels.Contact(fullName: "Konstantin Termite Bondar", firstName: "Konstantin", lastName: "Bondar", middleName: "Termite", age: 22, phones: [], emails: [])
        
        contactsStore.save(contact)
        
        guard let savedContact = contactsStore.contacts().first else {
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(savedContact.fullName, "Konstantin Termite Bondar")
        XCTAssertEqual(savedContact.firstName, "Konstantin")
        XCTAssertEqual(savedContact.lastName, "Bondar")
        XCTAssertEqual(savedContact.middleName, "Termite")
        XCTAssertEqual(savedContact.age, 22)
        XCTAssertTrue(savedContact.phones.isEmpty)
        XCTAssertTrue(savedContact.emails.isEmpty)
    }
    
    func testAddingContactWithPhone() {
        let phone = ContactModels.Phone(fullNumber: "+380669917847", code: "+380", number: "669917847", mark: "HOME")
        let contact = ContactModels.Contact(fullName: "Konstantin Termite Bondar", firstName: "Konstantin", lastName: "Bondar", middleName: "Termite", age: 22, phones: [phone], emails: [])
        
        contactsStore.save(contact)
        
        guard let savedPhone = contactsStore.contacts().first?.phones.first else {
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(savedPhone.fullNumber, "+380669917847")
        XCTAssertEqual(savedPhone.code, "+380")
        XCTAssertEqual(savedPhone.number, "669917847")
        XCTAssertEqual(savedPhone.mark, "HOME")
    }
    
    func testAddingContactWithEmail() {
        let email = ContactModels.Email(email: "bondar.k.dev@gmail.com", service: "gmail", mark: "HOME")
        let contact = ContactModels.Contact(fullName: "Konstantin Termite Bondar", firstName: "Konstantin", lastName: "Bondar", middleName: "Termite", age: 22, phones: [], emails: [email])
        
        contactsStore.save(contact)
        
        guard let savedEmail = contactsStore.contacts().first?.emails.first else {
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(savedEmail.email, "bondar.k.dev@gmail.com")
        XCTAssertEqual(savedEmail.service, "gmail")
        XCTAssertEqual(savedEmail.mark, "HOME")
    }
    
    

}
