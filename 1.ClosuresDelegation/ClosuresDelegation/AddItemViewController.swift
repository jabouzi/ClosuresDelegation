//
//  AddItemViewController.swift
//  ClosuresDelegation
//
//  Created by Skander Jabouzi on 2018-01-31.
//  Copyright © 2018 Skander Jabouzi. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    typealias DidAddItemHandler = (Item) -> ()
    var didAddItem: DidAddItemHandler?
    private var item: Item?

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var contentText: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addRighBarButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addRighBarButton() {
        let save = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(AddItemViewController.save))
        self.navigationItem.rightBarButtonItem = save
    }
    
    @objc func save() {
        item = Item(title: titleText?.text  as! String, content: contentText?.text as! String)
        if let item = item, let didAddItem = didAddItem {
            didAddItem(item)
            self.navigationController?.popViewController(animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
