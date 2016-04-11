//
//  ContactTableViewDataSource.swift
//  SectionEnum
//
//  Created by Mario Boikov on 2016-04-06.
//  Copyright © 2016 Red Shark AB. All rights reserved.
//

import UIKit

class ContactTableViewDataSource: NSObject, UITableViewDataSource {

    // MARK: Types

    private enum Section: Int {
        case Name
        case Address
        case Phone

        init?(indexPath: NSIndexPath) {
            self.init(rawValue: indexPath.section)
        }

        static var numberOfSections: Int { return 3 }
    }


    // MARK: Private vars

    private var contact: Contact


    // MARK: Life cycle

    init(contact: Contact) {
        self.contact = contact
    }


    // MARK: Data source adotion

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Section.numberOfSections
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .Name?:    return 1
        case .Address?: return contact.address.count
        case .Phone?:   return contact.phone.count
        case .None:     return 0
        }
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section(rawValue: section) {
        case .Name?:    return "Name"
        case .Address?: return "Address"
        case .Phone?:   return "Phone"
        case .None:     return nil
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell: UITableViewCell

        if let dequeudCell = tableView.dequeueReusableCellWithIdentifier("ContactCell") {
            cell = dequeudCell
        } else {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "ContactCell")
        }

        switch Section(indexPath: indexPath) {
        case .Name?:    configureCell(cell, withName: contact.name)
        case .Address?: configureCell(cell, withAddress: contact.address[indexPath.row])
        case .Phone?:   configureCell(cell, withPhone: contact.phone[indexPath.row])
        case .None:     break
        }

        return cell
    }


    // MARK: Private helpers

    private func configureCell(cell: UITableViewCell, withName name: Name) {
        cell.textLabel?.text = "\(name.firstname) \(name.lastname)"
    }

    private func configureCell(cell: UITableViewCell, withAddress address: Address) {
        cell.textLabel?.text = "\(address.street), \(address.zip) \(address.city)"
        cell.detailTextLabel?.text = address.title
    }

    private func configureCell(cell: UITableViewCell, withPhone phone: Phone) {
        cell.textLabel?.text = phone.phone
        cell.detailTextLabel?.text = phone.title
    }
}
