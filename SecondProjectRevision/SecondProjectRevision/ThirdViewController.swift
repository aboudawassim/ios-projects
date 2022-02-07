//
//  ThirdViewController.swift
//  SecondProjectRevision
//
//  Created by Macbook Pro 2017 on 17/12/2021.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var nom = ""
    var adresse = ""
    var telephone = ""
    var total = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Facture"
        nomLabel.text = nom
        adresseLabel.text = adresse
        telephoneLabel.text = telephone
        totalLabel.text = "Total est : "+total+" DT"

        
    }



}
