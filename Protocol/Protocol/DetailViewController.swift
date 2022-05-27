//
//  DetailViewController.swift
//  Protocol
//
//  Created by user218997 on 5/11/22.
//


import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailLastNameLabel: UILabel!
    @IBOutlet weak var detailGenderLabel: UILabel!
    @IBOutlet weak var detailAgeLabel: UILabel!
    
    var pessoaSelecioanda: Pessoa?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailImageView.image = UIImage(named: self.pessoaSelecioanda?.avatar ?? "")
        self.detailNameLabel.text = self.pessoaSelecioanda?.name
        self.detailLastNameLabel.text = self.pessoaSelecioanda?.lastName
        self.detailGenderLabel.text = self.pessoaSelecioanda?.gender?.rawValue
        self.detailAgeLabel.text = String(self.pessoaSelecioanda?.age ?? 0)
        
    }
}
