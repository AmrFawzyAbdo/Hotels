//
//  HotelsTableViewCell.swift
//  Webkeyz Hotels
//
//  Created by Amr Fawzy on 1/26/21.
//

import UIKit

class HotelsTableViewCell: UITableViewCell {
    //MARK:- Outlets
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Corner radius image
        hotelImage.roundCorners(with: [.layerMinXMinYCorner, .layerMaxXMinYCorner , .layerMinXMaxYCorner , .layerMaxXMaxYCorner], radius: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}


