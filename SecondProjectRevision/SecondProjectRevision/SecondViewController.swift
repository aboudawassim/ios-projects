//
//  SecondViewController.swift
//  SecondProjectRevision
//
//  Created by Macbook Pro 2017 on 17/12/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var adresseTextField: UITextField!
    @IBOutlet weak var nomTextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    var total = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Panier"
        totalLabel.text = "Le Total est : "+total+" DT"
        // Do any additional setup after loading the view.
    }

    @IBAction func confirmerButton(_ sender: Any) {
        if let nom = nomTextField.text, let adresse = adresseTextField.text, let telephone = telephoneTextField.text{
            let third = ThirdViewController()
            third.nom = nom
            third.adresse = adresse
            third.telephone = telephone
            third.total = total
            self.navigationController?.pushViewController(third, animated: true)
        }
    }
    

}
