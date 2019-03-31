//
//  FirstViewController.swift
//  基本控件2
//
//  Created by 方瑾 on 2019/1/11.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    
    @IBOutlet weak var showimageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    //delegate,dataSource
    //UItextFieldDelegate   被监听
    var imagePickView = UIPickerView()//
    var singleMonth = ""
    var singleDay = ""
    var monthArray = ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
    var dayArray = ["1日","2日","3日","4日","5日","6日","7日","8日","9日","10日","11日","12日","13日","14日","15日","16日","17日","18日","19日","10日","21日","22日","23日","24日","25日","26日","27日","28日","29日","30日","31日"]
    var chooseDay :[String] = []
    var dayArray1 = ["1日","2日","3日","4日","5日","6日","7日","8日","9日","10日","11日","12日","13日","14日","15日","16日","17日","18日","19日","10日","21日","22日","23日","24日","25日","26日l","27日","28日"]
    var dayArray2 = ["1日","2日","3日","4日","5日","6日","7日","8日","9日","10日","11日","12日","13日","14日","15日","16日","17日","18日","19日","10日","21日","22日","23日","24日","25日","26日","27日","28日","29日","30日"]
    
    
    var imageNames = ["刘胡兰","流弊","求毙","我有脑子"]//2
    var imageArray1 = ["流弊","求毙","我有脑子"]
    var imageArray2 = ["求毙","我有脑子"]
    var imageForm = ["流氓","傻瓜"]
//    var selectedImage: [String] = []
    @IBOutlet weak var imagePickerView: UIPickerView!
//    var imagePickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singleMonth = monthArray[0]
        singleDay = dayArray[0]
        textLabel.text = singleMonth + singleDay
//        selectedImage = imageArray1
        inputTextField.delegate = self
        inputTextField.inputView = imagePickerView
        imagePickerView.delegate = self
        imagePickerView.dataSource = self
        showimageView.image = UIImage(named: "刘胡兰")
        //        showimageView.image = #imageLiteral(resourceName: "流弊")
        
        
    }
    
    @IBAction func mainButtonBepressed(_ sender: UIButton) {
        //        let text = inputTextField.text!
        //        textLabel.text = text
        //        textLabel.text = ""
        
        let text = inputTextField.text
        if UIImage(named: text ?? "") != nil  {
            showimageView.image = UIImage(named: text ?? "")  //空合运算符
        } else {
            textLabel.text = "此人不在地球上"
        }
        inputTextField.text = ""
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textLabel.text = "即将开始编辑"
        return true//如果是false的话，接下来也不能编辑了
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textLabel.text = "正在编辑"
    }
    //按下按键进入-进入下面的方法-如果下面的方法返回值为true，将按下的内容显示到屏幕上
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {  //是否显示,shouldChangeCharactersIn : 外部参数    _ :内部参数
        let text = inputTextField.text!
        //MARK:此处限制的位数要注意
        if text.count > 5 {
            return false
        } else {
            return true

        }
    }

}

extension FirstViewController: UIPickerViewDelegate, UIPickerViewDataSource {//3
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //滑动起来是几列
//        return 2
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {//4
//        //有几行
//        if component == 0 {
//            return imageForm.count
//        } else {
//            return selectedImage.count
//        }
        if component == 0 {
            return monthArray.count
        } else {
            return chooseDay.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {//5
        //return imageNames[row]//每一行显示什么   这里面加载的是第几行
//        if component == 0 {
//            return imageForm[row]
//        } else {
//            return selectedImage[row]
//        }
        if component == 0 {
            return monthArray[row]
        } else {
            return chooseDay[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {//第几行显示什么图片
//        if component == 0 {
//            if row == 0 {
//                selectedImage = imageArray1
//            } else {
//                selectedImage = imageArray2
//            }
//            pickerView .reloadComponent(1)
//        } else {
//        showimageView.image = UIImage (named: imageNames[row])
//        textLabel.text = imageNames[row]
//        }
//
//    }
        if component == 0 {
            switch row {
            case 0,2,4,6,7,9,11 :
                chooseDay = dayArray
            case 1:
                chooseDay = dayArray1
            case 3,5,8,10 :
                chooseDay = dayArray2
            default:
                break
            }
            pickerView.reloadComponent(1)
        singleMonth = monthArray[row]
//        let dayRow = pickerView.selectedRow(inComponent: 1) //通过代码表示当前行表示函数
            pickerView.selectRow(0, inComponent: 1, animated: true)//动画，在选择月份的时候，日期直接调整到1号。调false就没有动画效果。但是不影响调取函数
        singleDay = dayArray[row]
       } else {
         singleDay = dayArray[row]
    }
        textLabel.text = singleMonth + singleDay
            
    }
    
    
}
