//
//  RankingViewController.swift
//  watanabetap
//
//  Created by 丸井優希 on 2022/12/24.
//

import Foundation
import UIKit
import NCMB
class RankingViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var rankingTableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    var pickerView: UIPickerView = UIPickerView()
    let dataList = ["10","15","20"]
    
    var condition = Int()
    
    
    
    
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
        pickerView.selectRow(4, inComponent: 0, animated: false)
        
        
    }
    
    // 決定ボタンのアクション指定
    @objc func done() {
        textField.endEditing(true)
        textField.text = "\(dataList[pickerView.selectedRow(inComponent: 0)])"
        checkRanking()
    }
    // キャンセルボタンのアクション指定
    @objc func cancel(){
        textField.endEditing(true)
    }
    // 画面タップでテキストフィールドを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.endEditing(true)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    // 「rankingTableView」ランキングを表示するテーブル
    
    
    // ランキング取得数
    let rankingNumber = 500
    // 取得したデータを格納する配列
    var rankingArray: Array<NCMBObject> = []
    
    // 画面表示時に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
        // 保存したデータの検索と取得
        
       
        picker()
    }
    func checkRanking() {
        let count = Int(textField.text ?? "0")
        condition = count!
        if condition == 10{
            
            print(condition)
            // **********【問題２】ランキングを表示しよう！**********
            // GameScoreクラスを検索するクエリを作成
            var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "GameScore10")
            // scoreの降順でデータを取得するように設定する
            query.order = ["-score"]
            // 検索件数を設定
            query.limit = rankingNumber
            // データストアを検索
            query.findInBackground(callback: { result in
                switch result {
                case let .success(array):
                    // 検索に成功した場合の処理
                    print("検索に成功しました。")
                    DispatchQueue.main.async {
                        // 取得したデータを格納
                        self.rankingArray = array
                        // テーブルビューをリロード
                        self.rankingTableView.reloadData()
                    }
                case let .failure(error):
                    // 検索に失敗した場合の処理
                    print("検索に失敗しました。エラーコード：\(error)")
                }
            })
        }else if condition == 15{     // **********【問題２】ランキングを表示しよう！**********
            // GameScoreクラスを検索するクエリを作成
            var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "GameScore15")
            // scoreの降順でデータを取得するように設定する
            query.order = ["-score"]
            // 検索件数を設定
            query.limit = rankingNumber
            // データストアを検索
            query.findInBackground(callback: { result in
                switch result {
                case let .success(array):
                    // 検索に成功した場合の処理
                    print("検索に成功しました。")
                    DispatchQueue.main.async {
                        // 取得したデータを格納
                        self.rankingArray = array
                        // テーブルビューをリロード
                        self.rankingTableView.reloadData()
                    }
                case let .failure(error):
                    // 検索に失敗した場合の処理
                    print("検索に失敗しました。エラーコード：\(error)")
                }
            })
            
        }else if condition == 20{
                // **********【問題２】ランキングを表示しよう！**********
                // GameScoreクラスを検索するクエリを作成
                var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "GameScore20")
                // scoreの降順でデータを取得するように設定する
                query.order = ["-score"]
                // 検索件数を設定
                query.limit = rankingNumber
                // データストアを検索
                query.findInBackground(callback: { result in
                    switch result {
                    case let .success(array):
                        // 検索に成功した場合の処理
                        print("検索に成功しました。")
                        DispatchQueue.main.async {
                            // 取得したデータを格納
                            self.rankingArray = array
                            // テーブルビューをリロード
                            self.rankingTableView.reloadData()
                        }
                    case let .failure(error):
                        // 検索に失敗した場合の処理
                        print("検索に失敗しました。エラーコード：\(error)")
                    }
                })}
        
        
        
        
        // **************************************************
    }
    
    // rankingTableViewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingNumber
    }
    
    // rankingTableViewのセルの内容を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        // キーを「cell」としてcellデータを取得
        let cell = rankingTableView.dequeueReusableCell(withIdentifier: "rankingTableCell", for: indexPath as IndexPath)
        var object: NCMBObject?
        // 「表示件数」＜「取得件数」の場合のobjectを作成
        
        if indexPath.row < rankingArray.count {
            object = self.rankingArray[indexPath.row]
        }
        // 順位の表示
        let ranking = cell.viewWithTag(1) as! UILabel
        ranking.text = "\(indexPath.row+1)位"
        
        if let unwrapObject:NCMBObject = object {
            // 名前の表示
            let name = cell.viewWithTag(2) as! UILabel
            name.text = "\(unwrapObject["name"]! as String)"
            // スコアの表示
            let score = cell.viewWithTag(3) as! UILabel
            score.text = "\(unwrapObject["timescoreresult"]! as String)"
        }
        
        return cell
    }
    
    
    @IBAction func gameTopButton(_ sender: Any) {
        let topViewController = self.storyboard?.instantiateViewController(withIdentifier: "TopViewController") as! TopViewController
            self.present(topViewController, animated: true)
    }
    
}



// ピッカーの初期設定
extension RankingViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
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

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    override func prepareForReuse() {
        label1.text = ""
        label2.text = ""
        label3.text = ""
        
    }
}
