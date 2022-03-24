//
//  CarTypeTableViewCell.swift
//  Autoresizing demo
//
//  Created by Shubham Shinde on 24/03/22.
//

import UIKit

class CarTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var carTypeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
