//
//  KilaVc2.swift
//  Text1App
//
//  Created by ios on 2018/1/3.
//  Copyright © 2018年 pcschool. All rights reserved.
//問老師
//一開始執行沒有去選選單 直接按結帳會當掉
//如果剛好使用者就是想選那個選項多話
//如何讓選單有預設選定值

import UIKit

class KilaVc2: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    var a:[String] = ["漢堡 35元","雞塊 30元","薯條 25元","蛋餅 15元","熱狗 10元"];
    var b:[String] = ["紅茶 15元","奶茶 20元","鮮奶茶 35元","柳橙汁 30元"];
    var aa:String = "";
    var bb:String = "";
    
    var item:[String] = ["漢堡","紅茶"];//記錄產品
    var price:[Int] = [35,15];//紀錄產品價格
    var totalP = 0;
    var totali = " ";
    var i = 0 , j = 0,  k = 0; //紀錄 第幾次按(j) 結帳 跟 price 是否為
    
    @IBOutlet weak var list: UIPickerView!
    //            && (price == [35,15] || price[0] == 35 || price[1] == 15)
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var totalItem: UILabel!
    @IBAction func cash(_ sender: UIButton)
    {
        
            item = [];
            price = [];
        print("price = \(price)")
        switch aa //add item[0] and price[0]
        {
        case "漢堡 35元":   item.append("漢堡");  price.append(35); break;
        case "雞塊 30元":   item.append("雞塊");  price.append(30); break;
        case "薯條 25元":   item.append("薯條");  price.append(25); break;
        case "蛋餅 15元":   item.append("蛋餅");  price.append(15); break;
        case "熱狗 10元":   item.append("熱狗");  price.append(10); break;
        default: break;
        }
        switch bb
        {//add item[1] and price[1]
        case "紅茶 15元":   item.append("紅茶");  price.append(15); break;
        case "奶茶 20元":   item.append("奶茶");  price.append(20); break;
        case "鮮奶茶 35元": item.append("鮮奶茶"); price.append(35); break;
        case "柳橙汁 30元": item.append("柳橙汁"); price.append(30); break;
        default: break;
        }
//        print("price = \(price)")
//        print("i = \(i) j = \(j) k = \(k)")
        if i == 0
        {
            switch k {
            case 0:
                item = ["漢堡","紅茶"];//給預設值
                price = [35,15];
                j = 0;
                i += 1;
                cashing()
                break;
            case 1:
                item[1] = "紅茶";//給預設值
                price[1] = 15;
                j = 0;
                i += 1;
                cashing()
                break;
            case 2:
                item[0] = "漢堡";//給預設值
                price[0] = 35;
                j = 0;
                i += 1;
                cashing()
                break;
            default:
                break;
            }
        }
        print("price = \(price)")
        cashing()
        j += 1;
        print("i = \(i) j = \(j) k = \(k)")
    }
    func cashing()
    {
        if price.count==0
        {
            
        }else{
            totalP = price[0] + price[1]
            totali = item[0] + " " + item[1]
            totalItem.text =    "您點的是 " + totali
            total.text =   "總共是" + String(totalP) + "元"
            
            
        }
        
        
        }
//    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
//        有兩個選單
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        //if 內 不一定會執行 故 有回傳值的func會有問題  一定要補return 看要回傳什麼資料型態
//        if 在 swift 不用加()
        if  component == 0//指定選單1  預設編號0
        {
            return a.count
        }
        else if component == 1
         {
            return b.count
         }
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0)
        {
           return a[row]
        }
        
        else if(component == 1)
        {
            return b[row]
        }
        return ""
   }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0)
        {
            aa =  a[row]
        }
        else if(component == 1)
        {
            bb = b[row]
        }
    }
    
    

    override func viewDidLoad() {
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
