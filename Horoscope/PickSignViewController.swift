//
//  ViewController.swift
//  Horoscope
//
//  Created by Lilia Yudina on 1/13/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class PickSignViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var signPicker: UIPickerView!
    
    private let signs = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"].sorted()
    private var signName: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        signPicker.dataSource = self
        signPicker.delegate = self
        signName = signs.first
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier = "openHoroscopeVC"
    }


}

extension PickSignViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return signs.count
  }
}

extension PickSignViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return signs[row]
  }
}
