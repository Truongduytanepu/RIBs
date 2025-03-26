//
//  FAQTBVC.swift
//  SolarVN
//
//  Created by Trương Duy Tân on 4/3/25.
//

import UIKit

class FAQTBVC: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var showDescriptionBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    var toggleDescription: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    private func setUpUI() {
        containerView.layer.cornerRadius = 8
    }
    
    func configure(with item: FAQItem?, indexpath: IndexPath) {
        let isDescriptionVisible = item?.isShowDescription ?? false
        let buttonImage = isDescriptionVisible ? UIImage(named: "ic_up") : UIImage(named: "ic_down")
        titleLbl.text = "\(indexpath.row + 1). \(item?.title ?? "")"
        descriptionLbl.text = item?.description
        descriptionLbl.isHidden = !isDescriptionVisible
        showDescriptionBtn.setImage(buttonImage, for: .normal)
    }
    
    @IBAction func showDescriptionBtnTapped(_ sender: Any) {
        toggleDescription?()
    }
}
