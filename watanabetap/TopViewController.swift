//
//  TopViewController.swift
//  watanabetap
//
//  Created by 丸井優希 on 2022/12/24.
//
//タイトルの変更、押す文字の画像変更、プライバシーポリシーのurl変更
import UIKit
import AppTrackingTransparency

class TopViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
   
    
    
    @IBOutlet weak var textname: UITextField!
    
    
    @IBOutlet weak var textField: UITextField!
    var pickerView: UIPickerView = UIPickerView()
    let dataList = ["10","15","20"]
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textname.delegate = self
        picker()
        textField.text = UserDefaults.standard.string(forKey: "pract")
        textname.text = UserDefaults.standard.string(forKey: "user")
        textname.becomeFirstResponder()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in})
    }
    
    @IBAction func gameStartButton(_ sender: Any) {
        
        let practicetime = Int(textField.text ?? "0")
        let username = textname.text
        if practicetime != nil {
            if username != nil{
                
                
                UserDefaults.standard.set(textField.text, forKey: "pract")
                UserDefaults.standard.set(username, forKey: "user")
                let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                viewController.practicetime = practicetime!
                viewController.username = username!
                self.present(viewController, animated: true)}
            else{
                
                
                
                let alert: UIAlertController = UIAlertController(title: "エラー", message: "ユーザー名と回数を決めてからゲーム開始ボタンを押してください", preferredStyle:  .alert)
                
                // ② Actionの設定
                // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
                // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
                // OKボタン
                alert.addAction(UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction!) -> Void in
                    // 名前とスコアを保存
                    
                    
                })
                
                
                // ④ Alertを表示
                present(alert, animated: true, completion: nil)
                
            }
        }
            
        }
    
                                                             
    @IBAction func checkRankingButton(_ sender: Any) { let rankingViewController = self.storyboard?.instantiateViewController(withIdentifier: "RankingViewController") as! RankingViewController
        self.present(rankingViewController, animated: true)
    }
    
    
    @IBAction func privacyUrl(_ sender: Any) {
        guard let url = URL(string: "https://github.com/practicen/randomtap/blob/main/docs:Privacy%20Policy/randomtap%20Privacy%20Policy") else { return }
            UIApplication.shared.open(url)
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength: Int = 0
        
        switch (textField.tag){
        case 1:
            maxLength = 10
     
        default:
            break
        }
        let textFieldNumber = textField.text?.count ?? 0
        //入力された文字数
        let stringNumber = string.count
        
        return textFieldNumber + stringNumber <= maxLength
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        textField.endEditing(true)
    }
    
    //キーボード内に表示するピッカーの設定
    func picker(){
        // ピッカー設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // 決定・キャンセル用ツールバーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        toolbar.setItems([cancelItem, spaceItem, doneItem], animated: true)
        
        // インプットビュー設定
        textField.inputView = pickerView
        textField.inputAccessoryView = toolbar
        
        // デフォルト設定
        pickerView.selectRow(4  , inComponent: 0, animated: false)
        
        
    }
    
    // 決定ボタンのアクション指定
    @objc func done() {
        textField.endEditing(true)
        textField.text = "\(dataList[pickerView.selectedRow(inComponent: 0)])"
    }
    // キャンセルボタンのアクション指定
    @objc func cancel(){
        textField.endEditing(true)
    }
    // 画面タップでテキストフィールドを閉じる
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



// ピッカーの初期設定
extension TopViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    // ピッカービューの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // ピッカービューの行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    // ピッカービューに表示する内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }
    
}
