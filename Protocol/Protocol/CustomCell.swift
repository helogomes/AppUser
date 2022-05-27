//
//  CustomCell.swift
//  Protocol
//
//  Created by user218997 on 5/11/22.
//

import UIKit

protocol CustomCellProtocol: AnyObject{
    
    func tappedEditButton(value: Pessoa)
    
}

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var perfilImage: UIImageView!
    
    private var pessoa: Pessoa?
    
    weak var delegate: CustomCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    func setup(value: Pessoa){
        
        self.pessoa = value
        self.nameLabel.text = value.name
        self.subtitleLabel.text = value.lastName
        self.perfilImage.image = UIImage(named: value.avatar ?? "")
    }
    
    @IBAction func tappedEditButton(_ sender: UIButton) {
        
        if let _pessoa = self.pessoa{
            print("tappedEditButton")
            self.delegate?.tappedEditButton(value: _pessoa)
        }
        
    }
}
