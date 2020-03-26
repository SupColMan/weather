//
//  ViewController.swift
//  Weather
//
//  Created by liujun on 2018/11/16.
//  Copyright © 2018 liujun. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    let weather = Weather()
    let appid = "b88524b575f8ab6e02b723fe26c0bd18"
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters//设置位置精度
        locationManager.requestLocation()//请求用户位置--只请求一次
    }
    
    //每当页面出现就会执行
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.requestWhenInUseAuthorization()//请求授权获取当前位置
    }
    
    //当请求用户位置的时候立刻调用这个方法--系统调用
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat = locations[0].coordinate.latitude
        let lon = locations[0].coordinate.longitude
        print(lat,lon)
        let paras = ["lat":"\(lat)","lon":"\(lon)","appid":appid]
        getWeather(paras: paras)
    }
    
    // 传值操作
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectCity"{
            //向下强制转换
            let vc = segue.destination as! SelectCityController
            vc.currentCity = weather.city
            vc.delegate = self
        }
    }
}




extension ViewController:CLLocationManagerDelegate,SelectCityDelegate{
    func didChangeCity(city: String) {
        let paras = ["q":city,"appid":appid]
        getWeather(paras: paras)
    }
    
    
    //请求API来获取数据
    func getWeather(paras:[String:String]){
        Alamofire.request("https://api.openweathermap.org/data/2.5/weather",parameters: paras).responseJSON { response in
            if let json = response.result.value {
                let weather = JSON(json)
                print(weather)
                self.createWeather(weatherJSON: weather)
                
                self.updateUI()
            }
        }
    }
    
    //给weather对象赋值
    func createWeather(weatherJSON:JSON){
        weather.city = weatherJSON["name"].stringValue
        weather.temp = Int(round(weatherJSON["main","temp"].doubleValue-273.15))
        weather.condition = weatherJSON["weather",0,"id"].intValue
    }
    
    //更新界面
    func updateUI(){
        cityLabel.text = weather.city
        tempLabel.text = "\(weather.temp)˚"
        imageView.image = UIImage(named: weather.icon)
    }
    
    
    //请求位置失败的时候调用
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "获取位置失败"
    }
}
