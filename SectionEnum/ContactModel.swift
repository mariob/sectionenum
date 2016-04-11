//
//  ContactModel.swift
//  SectionEnum
//
//  Created by Mario Boikov on 2016-04-06.
//  Copyright © 2016 Red Shark AB. All rights reserved.
//

import Foundation

typealias Name = (firstname: String, lastname: String)

typealias Address = (title: String, street: String, zip: String, city: String)

typealias Phone = (title: String, phone: String)

typealias Contact = (name: Name, address: [Address], phone: [Phone])
