//
//  SettingsViewController.swift
//  Meme1.0
//
//  Created by Ion M on 5/13/18.
//  Copyright © 2018 Ion M. All rights reserved.
//

import UIKit

protocol ChoosedFontDelegate {
    func didSelectFont(fontName: String)
}

protocol ChoosedColorDelegate {
    func didSelectColor(color: String)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var colorPicker: UIPickerView!
    
    var choosedFontDelegate: ChoosedFontDelegate?
    var choosedColorDelegate: ChoosedColorDelegate?
    
//    enum Color: String {
//        case red
//        case blue
//        case green
//
//        var create: UIColor {
//            switch self {
//            case .red:
//                return UIColor.red
//            case .blue:
//                return UIColor.blue
//            case .green:
//                return UIColor.green
//            }
//        }
//    }
    
    var fontFamilyName = [String]()
    var colorName = ["black", "white", "green", "orange", "red"]
//    var color = [Color]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        
        colorPicker.delegate = self
        colorPicker.dataSource = self
        
        for familyName in UIFont.familyNames {
            fontFamilyName.append("\(familyName)")
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == picker {
            return fontFamilyName.count
        } else {
            print(colorName.count)
            return colorName.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == picker {
            return fontFamilyName[row]
        } else {
            print(colorName[row])
            return colorName[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == picker {
            choosedFontDelegate?.didSelectFont(fontName: fontFamilyName[row])
        } else {
            choosedColorDelegate?.didSelectColor(color: colorName[row])
        }
    }
}
