//
//  CustomCellController.swift
//  NewProject
//
//  Created by Macbook Pro 2017 on 09/01/2022.
//

import UIKit

class CustomCellController: UITableViewCell {
    //Proprietes
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var dateRelease: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
