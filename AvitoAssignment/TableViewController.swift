//
//  TableViewController.swift
//  AvitoAssignment
//
//  Created by Чистяков Василий Александрович on 29.08.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var employeesArray: AvitoModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingManager.shared.fetchData { [weak self] model in
            DispatchQueue.main.async {
                self?.employeesArray = model
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employeesArray?.company.employees.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = employeesArray.company.employees[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = employeesArray.company.employees[indexPath.row]
        
        let alert = UIAlertController(title: section.phone_number, message: section.skills.description, preferredStyle: .actionSheet)
        let profileAction = UIAlertAction(title: "Профиль", style: .default) { (alert) in
            self.performSegue(withIdentifier: "EmployeeVc", sender: indexPath)
        }
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in }
        alert.addAction(okAction)
        alert.addAction(profileAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmployeeVc" {
            let vc = segue.destination as! EmployeesViewController
            let indexPath = sender as! IndexPath
            
            let employee = employeesArray.company.employees[indexPath.row]
            vc.employee = employee
        }
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
