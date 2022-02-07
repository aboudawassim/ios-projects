//
//  FruitCellController.swift
//  fruit
//
//  Created by mac on 18/11/2021.
//

import UIKit

class FruitCellController: UITableViewCell {

   
    
    @IBOutlet weak var imgFruit: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
