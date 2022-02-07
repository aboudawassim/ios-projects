//
//  ScndViewController.swift
//  fruit
//
//  Created by mac on 18/11/2021.
//

import UIKit

class ScndViewController: UIViewController {

    @IBOutlet weak var fruitImg: UIImageView!
    var imgf = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitImg.image = UIImage(named: imgf)

        // Do any additional setup after loading the view.
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
