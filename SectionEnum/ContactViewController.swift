//
//  ViewController.swift
//  SectionEnum
//
//  Created by Mario Boikov on 2016-04-06.
//  Copyright © 2016 Red Shark AB. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var contactTableViewDataSource: ContactTableViewDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contact"

        let contact = Contact(
            name: (firstname: "My Firstname", lastname: "My Lastname"),

            address: [
                (title: "Home", street: "My Home street", zip: "12345", city: "Home Town"),
                (title: "Work", street: "My Work street", zip: "54321", city: "Work Town"),
            ],

            phone: [
                (title: "Home", phone: "+46 123-456789"),
                (title: "Work", phone: "+46 987-654321")
            ]
        )

        contactTableViewDataSource = ContactTableViewDataSource(contact: contact)
        tableView.dataSource = contactTableViewDataSource
    }
}
