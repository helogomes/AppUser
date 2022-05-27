//
//  EditViewController.swift
//  Protocol
//
//  Created by user218997 on 5/11/22.
//


import UIKit

protocol EditViewControllerProtocol: AnyObject{
    func updatePessoa(value: Pessoa)
}

class EditViewController: UIViewController{
    
    @IBOutlet weak var editNameTextField: UITextField!
    @IBOutlet weak var editLastNameTextField: UITextField!
    @IBOutlet weak var editAgeTextField: UITextField!
    @IBOutlet weak var editGenderTextField: UITextField!
    
    weak var delegate: EditViewControllerProtocol?
    
    var pessoaSelecionada: Pessoa?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _pessoaSelecionada = self.pessoaSelecionada{
            self.editNameTextField.text = _pessoaSelecionada.name
            self.editLastNameTextField.text = _pessoaSelecionada.lastName
            self.editAgeTextField.text = String(_pessoaSelecionada.age ?? 0)
            self.editGenderTextField.text = _pessoaSelecionada.gender?.rawValue
        }
        
        self.editNameTextField.delegate = self
        self.editLastNameTextField.delegate = self
        self.editAgeTextField.delegate = self
        self.editGenderTextField.delegate = self
        
        self.editNameTextField.becomeFirstResponder()
        self.editAgeTextField.keyboardType = .decimalPad
        
        self.addButtonOnKeyboard()
        
    }
    
    private func addButtonOnKeyboard(){
        
        let toolBar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonTapped))
        
        let items = [flexSpace, doneButton]
        
        toolBar.items = items
        toolBar.sizeToFit()
        
        self.editAgeTextField.inputAccessoryView = toolBar
    }
    
   @objc func doneButtonTapped(){
       self.editGenderTextField.becomeFirstResponder()
        
    }
    
}

extension EditViewController: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        switch textField{
        case self.editNameTextField:
            self.pessoaSelecionada?.name = textField.text
        case self.editLastNameTextField:
            self.pessoaSelecionada?.lastName = textField.text
        case self.editAgeTextField:
            self.pessoaSelecionada?.age = Int(textField.text ?? "0")
        default:
            self.pessoaSelecionada?.gender = Gender(rawValue: textField.text ?? "")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField{
        case self.editNameTextField:
            self.editLastNameTextField.becomeFirstResponder()
        case self.editLastNameTextField:
            self.editAgeTextField.becomeFirstResponder()
        case self.editAgeTextField:
            self.editGenderTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            
            if let _pessoaSelecionada = self.pessoaSelecionada{
                self.delegate?.updatePessoa(value: _pessoaSelecionada)
            }
        }
        return true
    }
    
}
