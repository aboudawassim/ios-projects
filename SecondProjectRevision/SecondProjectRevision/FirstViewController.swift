//
//  FirstViewController.swift
//  SecondProjectRevision
//
//  Created by Macbook Pro 2017 on 05/12/2021.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var tableProduits: [Product] = []
    var somme = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BreakFast Shop"
      //  let nib = UINib(nibName: "CellView", bundle: nil)
        
       // tableView.register(nib, forCellReuseIdentifier: "custom cell")
        
        let nib = UINib(nibName: "CellView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "custom cell")
        
      //  tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
     
    }
    override func viewWillAppear(_ animated: Bool) {
        getProducts()
    }
    func getProducts() {
        
        guard let url = URL(string: "https://mocki.io/v1/bd1f2842-f6b1-4a3f-9f5c-7a0a9d8b5b3d") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
    
let session = URLSession(configuration: .default)
      
session.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print(error)
    
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print(response)
                return
            }
            guard 200 ..< 300 ~= httpResponse.statusCode else{
                print(httpResponse.statusCode)
                return
            }
            if let data = data{
                do{
                let decoder = JSONDecoder()
                   
                    let products = try decoder.decode([Product].self, from: data)
                   
                    self.tableProduits = products
        DispatchQueue.main.async {
        self.tableView.reloadData()
                    }
                }
                catch let error as NSError{
                    print("Error:\(error)")
                }
            }
            else{
                print(data)
            }
        }.resume()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableProduits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom cell", for: indexPath) as! CellController
        
        
        cell.nameLabel.text = tableProduits[indexPath.row].name
        cell.priceLabel.text = "price:  "+String(tableProduits[indexPath.row].price)+" Dt"
        cell.quantiteLabel.text = String(tableProduits[indexPath.row].quantite)
        DispatchQueue.global().async {
            
            if let imageUrl = URL(string: self.tableProduits[indexPath.row].image) {
                if let data = try? Data(contentsOf: imageUrl) {
                    
        if let image = UIImage(data: data) {
                        
                        DispatchQueue.main.async {
                            cell.imageProduct.image = image
                        }
                    }
                }
            }
        }
      
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        somme = somme+tableProduits[indexPath.row].price
        totalLabel.text = "Total: "+String(somme)+" Dt"
        tableProduits[indexPath.row].quantite += 1
        tableView.reloadData()
    }
    
    @IBAction func acheterButton(_ sender: Any) {
        let alert = UIAlertController(title: "Facture", message: "Total: "+String(somme)+" Dt", preferredStyle: .alert)
        let payerAction = UIAlertAction(title: "Payer", style: .default, handler: nil)
        alert.addAction(payerAction)
        self.present(alert, animated: true, completion: nil)
//        let scnd = SecondViewController()
//        scnd.total = String(somme)
//        self.navigationController?.pushViewController(scnd, animated: true)
//        somme = 0
//        totalLabel.text = "Total: "+String(somme)+" Dt"
    }
}
