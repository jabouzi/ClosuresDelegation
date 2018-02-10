//
//  ItemsViewController.swift
//  ClosuresDelegation
//
//  Created by Skander Jabouzi on 2018-01-31.
//  Copyright © 2018 Skander Jabouzi. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        addRighBarButton()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        cell.detailTextLabel?.text = items[indexPath.row].title
        cell.textLabel?.text = items[indexPath.row].content

        return cell
    }
    
    func addRighBarButton() {
        let save = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(ItemsViewController.addItem))
        self.navigationItem.rightBarButtonItem = save
    }
    
    @objc func addItem() {
        let viewController = AddItemViewController()        
        // Configure View Controller
        viewController.didAddItem = { (item) in
            // Add Item to List
            self.items.append(item)
            self.tableView.reloadData()
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
