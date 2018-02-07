//
//  ViewController.swift
//  Text1App
//
//  Created by ios on 2017/12/30.
//  Copyright © 2017年 pcschool. All rights reserved.
//

//問題  當手續費開關（feeSW）關閉時  要如何關閉手續費滑桿（feeSL） 已解決
//使用 .isEnabled 屬性 用 =true（顯示） or =false（隱藏） 控制
import UIKit

class ViewController: UIViewController
{
    //IBOutlet 定義物件標籤
    @IBOutlet weak var rate: UITextField! //匯率
    @IBOutlet weak var usad: UITextField! //兌換金額
    @IBOutlet weak var feeSW: UISwitch! //手續費有無
    @IBOutlet weak var feeSL: UISlider! //手續費多寡
    @IBOutlet weak var feeVaule: UILabel!//手續費
    @IBOutlet weak var Tcount: UILabel! //總金額ＮＴ
    @IBOutlet weak var thanksword: UILabel!
    @IBOutlet weak var ok: UIButton!
    
    //IBAction 定義事件程序
    

    @IBAction func changUsad(_ sender: UITextField)
    {
        if (usad.text == "")
        {
            usad.text = "0"
        }
        totalcount()
    }
    var str = "0"
    @IBAction func changeFeeSW(_ sender: UISwitch)
    {
        totalcount()
        if feeSW.isOn
        {
          feeSL.isEnabled = true
          feeVaule.isEnabled = true
          feeSL.value = Float (str)!
          feeVaule.text = String(Int(feeSL.value))
        }
        else
        {
            feeSL.isEnabled = false
            feeVaule.isEnabled = false
            str = feeVaule.text!
            feeVaule.text = String(0)
            feeSL.value = 0.0
        }
        totalcount()
    }
    @IBAction func changefeeSL(_ sender: UISlider)
    {
        totalcount()
        if feeSW.isOn
        {
            feeVaule.text = String(Int(sender.value))
        }
    }
    @IBAction func changeRate(_ sender: UITextField)
    {
        totalcount()
    }
    @IBAction func chabgingRate(_ sender: UITextField) {
        if (rate.text == "")
        {
            rate.text = "0"
        }
        totalcount()
    }
    
    @IBAction func OKdown(_ sender: UIButton){thanksword.text = "兌換成功！"}
    func totalcount()
    {
        var money = Int(usad.text!)!
        var fee = 0
        var crate = Int(rate.text!)!
        if feeSW.isOn
        {
            fee = Int(feeVaule.text!)!
        }
        let sum = money * crate + fee
        Tcount.text = String(sum)
        thanksword.text = ""
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalcount()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

