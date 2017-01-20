//
//  ContactTableViewController.swift
//  Contacts
//
//  Created by Michał Skalski on 17.01.2017.
//  Copyright © 2017 Michał Skalski. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleContacts()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadSampleContacts() {
        let image1 = UIImage(named: "zdjecie1")!
        let contact1 = Contact(name: "Jacek Kowalski", image: image1, phoneNum: "666 666 666", email: nil)
        
        let image2 = UIImage(named: "zdjecie2")!
        let contact2 = Contact(name: "Jan Nowak", image: image2, phoneNum: "123 456 789", email: "nowak@gmail.com")
        
        let image3 = UIImage(named: "zdjecie3")!
        let contact3 = Contact(name: "Paweł Makowski", image: image3, phoneNum: "987 654 321", email: nil)
        
        contacts += [contact1, contact2, contact3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "contactCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ContactTableViewCell
        
        let contact = contacts[indexPath.row]
        
        cell.nameLabel.text = contact.name
        cell.photoImageView.image = contact.image

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    @IBAction func prepareForUnwind(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ContactViewController, let contact = sourceViewController.contact {
            if let selectedPath = tableView.indexPathForSelectedRow {
                contacts[selectedPath.row] = contact
                tableView.reloadRows(at: [selectedPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: contacts.count, section: 0)
                contacts.append(contact)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            let destinationViewController = segue.destination as! ContactViewController
            if let selectedContactCell = sender as? ContactTableViewCell {
                let indexPath = tableView.indexPath(for: selectedContactCell)!
                let selectedContact = contacts[indexPath.row]
                destinationViewController.contact = selectedContact
            }
            
        } else if segue.identifier == "AddItem" {
            print("adding item")
        }
    }
    
    
    
    

}
