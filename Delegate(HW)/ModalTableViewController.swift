//
//  ModalTableViewController.swift
//  Delegate(HW)
//
//  Created by Yernur Adilbek on 12/4/24.
//

import UIKit

class ModalTableViewController: UITableViewController, SelectCategoryProtocol {

    var categoryArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setCategory(_ category: String) {
        categoryArray.append(category)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = categoryArray[indexPath.row]
        return cell
    }
    
    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.delegate = self
        present(vc, animated: true)
    }
    
}
