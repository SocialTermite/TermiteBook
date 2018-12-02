//
//  CNContactsStoreWrapper.swift
//  TermiteBook
//
//  Created by Konstantin Bondar on 01/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import Contacts

class CNContactsStoreWrapper {
    private let contactsStore = CNContactStore()
    
    func fetchAllContacts() -> [CNContact] {
        var contacts = [CNContact]()
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        try? contactsStore.enumerateContacts(with: request, usingBlock: { contact, stop in contacts.append(contact) })
        
        return contacts
    }
    
    func clearStorage() {
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)
        try? contactsStore.enumerateContacts(with: request) {[weak self] (contact, stop) in
            self?.delete(contact)
        }
    }
    
    func add(_ contact: CNContact) {
        let saveRequest = CNSaveRequest()
        let mutableContact = contact.mutableCopy() as! CNMutableContact
        saveRequest.add(mutableContact, toContainerWithIdentifier: nil)
        
        try? contactsStore.execute(saveRequest)
    }
    
    func update(_ contact: CNContact) {
        let saveRequest = CNSaveRequest()
        let mutableContact = contact.mutableCopy() as! CNMutableContact
        saveRequest.update(mutableContact)
        
        try? contactsStore.execute(saveRequest)
    }
    
    func delete(_ contact: CNContact) {
        let saveRequest = CNSaveRequest()
        let mutableContact = contact.mutableCopy() as! CNMutableContact
        saveRequest.delete(mutableContact)
        
        try? contactsStore.execute(saveRequest)
    }
}

