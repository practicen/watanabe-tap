//
//  ResultViewController.swift
//  watanabetap
//
//  Created by 丸井優希 on 2022/12/24.
//
import UIKit
import NCMB
class ResultViewController: UIViewController {
var practicetime = Int()
 
    var username  = String()
    var timescore = Int()
    var timescoreString = String()
    var timerecord = Int()
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        timerecord = timescore * -1
        if practicetime == 10{
            let ms = timescore % 100
            let s = (timescore - ms) / 100 % 60
            let m = (timescore - ms - s) / 6000 % 100
            timescoreString = String(format: "%02d:%02d:%02d", m,s,ms)
            saveScore10(name10: username, score10: timerecord, timescoreresult10: timescoreString)
            scoreLabel.text = "\(timescoreString)です！"
        }else if practicetime == 15{
            let ms = timescore % 100
            let s = (timescore - ms) / 100 % 60
            let m = (timescore - ms - s) / 6000 % 100
            timescoreString = String(format: "%02d:%02d:%02d", m,s,ms)
            saveScore15(name15: username, score15: timerecord, timescoreresult15: timescoreString)
            scoreLabel.text = "\(timescoreString)です！"
        } else{
            let ms = timescore % 100
            let s = (timescore - ms) / 100 % 60
            let m = (timescore - ms - s) / 6000 % 100
            timescoreString = String(format: "%02d:%02d:%02d", m,s,ms)
            saveScore20(name20: username, score20: timerecord, timescoreresult20: timescoreString)
            scoreLabel.text = "\(timescoreString)です！"
        }
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func topButton(_ sender: Any) {

        let topViewController = self.storyboard?.instantiateViewController(withIdentifier: "TopViewController") as! TopViewController
            self.present(topViewController, animated: true)

        
    }
    
    @IBAction func rankingButton(_ sender: Any) {
        let rankingViewController = self.storyboard?.instantiateViewController(withIdentifier: "RankingViewController") as! RankingViewController
            self.present(rankingViewController, animated: true)
    }
    
    // 【mBaaS】データの保存
    func saveScore10 (name10: String, score10: Int, timescoreresult10: String) {
        // **********【問題１】名前とスコアを保存しよう！**********
        // 保存先クラスを作成
        let obj1 = NCMBObject(className: "GameScore10")
        // 値を設定
        obj1["name"] = name10
        obj1["score"] = score10
        obj1["timescoreresult"] = timescoreresult10
        
        // 保存を実施
        obj1.saveInBackground(callback: { result in
            switch result {
                case .success:
                    // 保存に成功した場合の処理
                    print("保存に成功しました。objectId:\(String(describing: obj1.objectId))")
                case let .failure(error):
                    // 保存に失敗した場合の処理
                    print("保存に失敗しました。エラーコード:\(error)")
            }
        })
      
        // **************************************************
    }
    func saveScore15 (name15: String, score15: Int, timescoreresult15: String) {
        
        let obj2 = NCMBObject(className: "GameScore15")
        // 値を設定
        obj2["name"] = name15
        obj2["score"] = score15
        obj2["timescoreresult"] = timescoreresult15
        // 保存を実施
        obj2.saveInBackground(callback: { result in
            switch result {
                case .success:
                    // 保存に成功した場合の処理
                    print("保存に成功しました。objectId:\(String(describing: obj2.objectId))")
                case let .failure(error):
                    // 保存に失敗した場合の処理
                    print("保存に失敗しました。エラーコード:\(error)")
            }
        })
        
    }
    func saveScore20 (name20: String, score20: Int, timescoreresult20: String) {
        
        let obj3 = NCMBObject(className: "GameScore20")
        // 値を設定
        obj3["name"] = name20
        obj3["score"] = score20
        obj3["timescoreresult"] = timescoreresult20
        // 保存を実施
        obj3.saveInBackground(callback: { result in
            switch result {
                case .success:
                    // 保存に成功した場合の処理
                    print("保存に成功しました。objectId:\(String(describing: obj3.objectId))")
                case let .failure(error):
                    // 保存に失敗した場合の処理
                    print("保存に失敗しました。エラーコード:\(error)")
            }
        })
        
    }
    /*
  
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func gameTopButton(_ sender: Any) {
        let topviewController = self.storyboard?.instantiateViewController(withIdentifier: "TopViewController") as! TopViewController
        self.present(topviewController, animated: true)
    }
    
    
    @IBAction func rankingCheckButton(_ sender: Any) {
    }
    
    @IBAction func sharebutton(_ sender: Any) {
        let shareText = "渡「邊」（わたなべ）さんを見つけ出せ！において\(practicetime)回を\(timescoreString)でクリアしました。"
           
       
        let shareImage = UIImage(named: "AppIcon")

        let activityItems = [shareText,shareImage] as [Any]

           // 初期化処理
           let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

           // 使用しないアクティビティタイプ
           let excludedActivityTypes = [
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.message,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.print
           ]

           activityVC.excludedActivityTypes = excludedActivityTypes

           // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
    }
    
}
