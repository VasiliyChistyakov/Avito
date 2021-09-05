//
//  ViewController.swift
//  AvitoAssignment
//
//  Created by Чистяков Василий Александрович on 05.09.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingManager.shared.fetchData { model in
            DispatchQueue.main.async {
                self.nameLabel.text = model.company.employees[0].name
                self.phoneLabel.text = "phone \(model.company.employees[0].phone_number)"
                self.skillsLabel.text = model.company.employees[0].skills[0]
                
            }
        }
        
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
