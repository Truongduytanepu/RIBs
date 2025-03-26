//
//  FAQHeaderTBVCTableViewCell.swift
//  SolarVN
//
//  Created by Trương Duy Tân on 4/3/25.
//

import UIKit

class FAQHeaderTBVCTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with title: String) {
        titleLbl.text = title
    }
}
