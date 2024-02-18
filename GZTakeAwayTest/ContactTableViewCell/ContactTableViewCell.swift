//
//  ContactTableViewCell.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    static let identifier = "ContactTableViewCell"
    
  
    @IBOutlet weak var userImageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
