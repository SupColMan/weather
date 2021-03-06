//
//  SelectCityController.swift
//  Weather
//
//  Created by liujun on 2018/11/18.
//  Copyright © 2018 liujun. All rights reserved.
//

import UIKit

//自定义传值协议
protocol SelectCityDelegate {
    func didChangeCity(city:String)
}

class SelectCityController: UIViewController {

    var currentCity = ""
    var delegate:SelectCityDelegate?
    
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var cityInput: UITextField!
    

    @IBAction func changeCity(_ sender: Any) {
       
        delegate?.didChangeCity(city: cityInput.text!)
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCityLabel.text = currentCity
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
