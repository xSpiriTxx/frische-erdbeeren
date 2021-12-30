//
//  StartViewController.swift
//  frische-erdbeeren-project
//
//  Created by Matthias Gassner on 30.12.21.
//

import UIKit

class StartViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let years:[String] = ["2021","2020","2019","2018","2017","2016","2015"]
    @IBOutlet weak var picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        picker.setValue(UIColor.white, forKey: "textColor")
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return years[row]
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = picker.selectedRow(inComponent: 0)
        
        print("PREPARE")
        if let viewController = segue.destination as? TableViewController {
            viewController.year = self.years[index]
            print(self.years[index])
        }
    }
    

}
