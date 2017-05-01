//
//  CartCell.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 01/05/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    var product: Product!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(product: Product) {
        self.product = product
        

    }

}
