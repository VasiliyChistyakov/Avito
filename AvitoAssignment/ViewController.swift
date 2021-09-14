//
//  ViewController.swift
//  AvitoAssignment
//
//  Created by Чистяков Василий Александрович on 05.09.2021.
//

import UIKit

class EmployeesViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    
    var employee: Employee!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = employee.name
        phoneLabel.text = employee.phone_number
        skillsLabel.text = "\(employee.skills)"

    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
