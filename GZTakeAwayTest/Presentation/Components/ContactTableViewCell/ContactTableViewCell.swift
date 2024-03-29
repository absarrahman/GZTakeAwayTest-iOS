//
//  ContactTableViewCell.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import UIKit
import SDWebImage

class ContactTableViewCell: UITableViewCell {
    
    static let identifier = "ContactTableViewCell"
    
    
    @IBOutlet weak var userImageView: UIImageView!
    
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Since width and height are equal. Setting cornerRadius to half of height will make it circular
        userImageView.layer.cornerRadius = userImageView.bounds.height / 2
    }
    
    func configure(_ model: ContactModel?) {
        nameLabel.text = model?.fullName
        phoneNumberLabel.text = model?.phoneNumber?.formatPhoneNumber
        setImageFromUrl(urlString: model?.image ?? "")
    }
    
    // Sets image using image url fetched from the model
    private func setImageFromUrl(urlString: String) {
        userImageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil, options: [.progressiveLoad])
    }
    
}
