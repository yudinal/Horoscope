//
//  DetailViewController.swift
//  Horoscope
//
//  Created by Lilia Yudina on 1/14/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signNameLabel: UILabel!
    @IBOutlet weak var todayHoroscope: UITextView!

    var pickedSign = 1
    var pickedSignStr: String = ""
    var userName: String = ""
    var horoscope: Horoscope? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     loadHoroscopes(with: "libra")
       updateUI()
    }
    

    private func loadHoroscopes(with horoscope: String) {
        HoroscopeAPIClient.getHoroscope(for: horoscope) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "App Error", message: "\(appError)")
                }
            case .success(let horoscopes):
                self?.horoscope = horoscopes
            }
        }
    }
    
    func updateUI() {
        signNameLabel.text = horoscope?.sunsign
        todayHoroscope.text = horoscope?.horoscope
        if let name = UserPreference.shared.getName() {
            nameLabel.text = name
        }
        if let sign = UserPreference.shared.getSign() {
            signNameLabel.text = sign
            loadHoroscopes(with: sign)
            
        }
        
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let pickSignViewController = segue.source as? PickSignViewController else {
            fatalError("error")
        }
        let sign = pickSignViewController.userSelectedSign
        loadHoroscopes(with: sign.lowercased())
        let name = pickSignViewController.names
        nameLabel.text = name
    }
}
