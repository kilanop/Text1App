//
//  KilaVc1.swift
//  Text1App
//
//  Created by ios on 2018/1/3.
//  Copyright © 2018年 pcschool. All rights reserved.
//

import UIKit

class KilaVc1: UIViewController,UIPickerViewDataSource,
UIPickerViewDelegate//協定不要漏打
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //選單數量
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  iosarray.count //選項數量
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return iosarray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        result = iosarray[row]
    }
    
    @IBOutlet weak var ans: UILabel!
    @IBOutlet weak var anspick: UIPickerView!
    @IBOutlet weak var ansp: UIImageView!
    
    var no = UIImage(named: "err.jpg")!
    var yes = UIImage(named: "good.jpeg")!
    @IBAction func anscheck(_ sender: UIButton)
    {
        
        
        if (result == "ios 8")
        {
           ans.text = "正確"
            ansp.image = yes
        }
        else
        {
           ans.text = "答錯了,再試試！"
            ansp.image = no
        }
    }
    
    var iosarray:[String] = [];
    var result: String = "";
    

    override func viewDidLoad() {
        iosarray.append("ios 5")
        iosarray.append("ios 6")
        iosarray.append("ios 7")
        iosarray.append("ios 8")
        iosarray.append("ios 9")
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
