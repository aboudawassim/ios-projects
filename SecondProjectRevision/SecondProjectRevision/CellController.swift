//
//  CellController.swift
//  SecondProjectRevision
//
//  Created by Macbook Pro 2017 on 05/12/2021.
//

import UIKit

class CellController: UITableViewCell {
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var quantiteLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
