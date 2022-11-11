//
//  UserCell.swift
//  finalv1
//
//  Created by Test VPN on 03/11/2022.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet var  idLabel : UILabel!
    @IBOutlet var  namedLabel : UILabel!
    @IBOutlet var salaryLabel : UILabel!
    @IBOutlet var  ageLabel : UILabel!
    class var identifier: String {return String(describing: self)}
    class var nib: UINib {return UINib(nibName: identifier, bundle: nil)}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
       
    }
    func initView(){
        backgroundColor = .clear
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
