//
//  FoodTableViewCell.swift
//  25_UITable_View
//
//  Created by Pham Toan on 19/03/2021.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var imageFood : UIImageView!
    @IBOutlet weak var foodName : UILabel!
    @IBOutlet weak var foodRate : UILabel!
    @IBOutlet weak var foodDescipt : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
