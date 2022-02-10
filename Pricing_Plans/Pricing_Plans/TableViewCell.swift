//
//  TableViewCell.swift
//  Pricing_Plans
//
//  Created by Настя on 09.02.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var leftPathConstraint: NSLayoutConstraint!
    @IBOutlet weak var pathImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
