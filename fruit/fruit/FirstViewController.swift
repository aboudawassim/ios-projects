//
//  FirstViewController.swift
//  fruit
//
//  Created by mac on 18/11/2021.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

{
  
    @IBOutlet weak var fruitTable: UITableView!
    var tableFruits : [Fruit] = [Fruit(name: "Apple", price: "5 dinars", Description: "an apple is a sweet, edible fruit" , img:"img_apple") ,Fruit(name: "Banana", price: "6 dinars", Description: "Bananas are a popular fruit with many potential health benefits" , img:"img_banana") ,Fruit(name: "Lemon", price: "3 dinars", Description: "Lemon are a refreshing fruit" , img:"img_lemon") ,Fruit(name: "Mango", price: "8 dinars", Description: "Mango is .... " , img:"img_mango") ,Fruit(name: "Orange", price: "2 dinars", Description: "an Orange is ...." , img:"img_orange") ]
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "FruitView", bundle: nil)
        fruitTable.register(nib, forCellReuseIdentifier: "custum cell" )
        fruitTable.delegate = self
        fruitTable.dataSource = self
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableFruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custum cell", for: indexPath) as! FruitCellController
        cell.imgFruit.image=UIImage(named: tableFruits [indexPath.row].img)
        cell.nameLabel.text = tableFruits[indexPath.row].name
        cell.priceLabel.text = tableFruits[indexPath.row].price
        cell.descLabel.text = tableFruits[indexPath.row].Description
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let scnd = ScndViewController()
        scnd.imgf = tableFruits[indexPath.row].img
        scnd.title = tableFruits[indexPath.row].name
        self .navigationController?.pushViewController(scnd, animated: true)
    }
}
