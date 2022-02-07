//
//  SecondViewController.swift
//  NewProject
//
//  Created by Macbook Pro 2017 on 09/01/2022.
//

import UIKit

class SecondViewController: UIViewController {
    // Proprietes
    
    @IBOutlet weak var posterPicture: UIImageView!
    // on doit creer un model pour l'image
    var picture = ""
    
    
    // Methodes
    override func viewDidLoad() {
        super.viewDidLoad()

        // telechargement de l'image
        DispatchQueue.global().async {
                    
if let imageUrl = URL(string: self.picture) {
        if let data = try? Data(contentsOf: imageUrl) {
                            
    if let image = UIImage(data: data) {
                                
        DispatchQueue.main.async {
            self.posterPicture.image = image
                                }
                            }
                        }
                    }
                }

    }

    @IBAction func telecharger(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Le téléchargement va commencer dans quelques secondes", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    

}
