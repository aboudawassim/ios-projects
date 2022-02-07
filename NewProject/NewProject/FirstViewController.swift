//
//  FirstViewController.swift
//  NewProject
//
//  Created by Macbook Pro 2017 on 09/01/2022.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    // Proprietes
    @IBOutlet weak var tableView: UITableView!
    // on doit creer un model pour le tableView
    var tableMovies: [Movie] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Liste des Films"
        //le nibName on doit donner le nom de la view de custom cell, donc on doit d'abord creer la custom cell
        let nib = UINib(nibName: "CustomCellView", bundle: nil)

        // Enregistrement de tableView
        tableView.register(nib, forCellReuseIdentifier: "custom cell")// on doit creer un nib
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMovies()
                }
     
     
    func getMovies() {
     
     guard let url = URL(string: "https://mocki.io/v1/7a92c4ee-a51a-4352-9321-6e86ca8f34a9") else {return}
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
                       
        let movies = try decoder.decode([Movie].self, from: data)
                       
            self.tableMovies = movies
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
        return tableMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom cell", for: indexPath) as! CustomCellController
        
        cell.nameLabel.text = tableMovies[indexPath.row].name
        cell.ratingLabel.text = tableMovies[indexPath.row].rating
        cell.dateRelease.text = tableMovies[indexPath.row].dateRelease
        // telechargement de l'image
        DispatchQueue.global().async {
                    
if let imageUrl = URL(string: self.tableMovies[indexPath.row].posterImg) {
                        if let data = try? Data(contentsOf: imageUrl) {
                            
                if let image = UIImage(data: data) {
                                
                                DispatchQueue.main.async {
                                    cell.posterImg.image = image
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
    // Fonction de clique ou selection d'une cellule
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secon = SecondViewController()
        secon.title = tableMovies[indexPath.row].name
        secon.picture = tableMovies[indexPath.row].posterImg
        
        self.navigationController?.pushViewController(secon, animated: true)
    }
}
