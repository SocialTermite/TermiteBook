//
//  User.swift
//  TermiteBook
//
//  Created by Konstantin Bondar on 30/11/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//


extension BookModels {
    struct User: Equatable {
        var fullName: String
        var firstName: String
        var lastName: String
        var middleName: String
        
        var age: Int
        var phones: [Phone]
        var emails: [Email]
    }
}
