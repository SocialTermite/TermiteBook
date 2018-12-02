//
//  BookFacade.swift
//  TermiteBook
//
//  Created by Konstantin Bondar on 30/11/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//


class TRContactsStore {
    
    func contacts() -> [ContactModels.Contact] {
        #warning("TODO: Implement")
        let some = CNContactsStoreWrapper().fetchAllContacts()
        print(some)
        return []
    }
    
    func save(_ contact: ContactModels.Contact) {
        #warning("TODO: Implement")
    }
}
