//
//  ViewController.swift
//  watanabetap
//
//  Created by 丸井優希 on 2022/12/24.
//
//広告のIDを変更、それぞれの文字を編集、全ての文字が20マッチになるようにね、減点と正解が決まってるのでそれに従って
import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADFullScreenContentDelegate {
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var timeDisplay: UILabel!
    
    @IBOutlet var tapImage1: UITapGestureRecognizer!
    
    @IBOutlet var tapImage2: UITapGestureRecognizer!
    
    @IBOutlet var tapImage3: UITapGestureRecognizer!
    
    @IBOutlet var tapImage4: UITapGestureRecognizer!
    private var interstitial: GADInterstitialAd?
    
    var timerRunning = false
    var timer = Timer()
    var timeCountNum = Int()
    var imagerandom = Int.random(in: 1...24)
    var adrandom = Int.random(in: 1...6)
    var counter = Int()
    var practicetime = Int()
    var username  = String()
    override func viewDidLoad() {   //画面起動時の処理
        super.viewDidLoad()
        print(adrandom)
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        }
        )
        
        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateDisplay), userInfo: nil, repeats: true)
        counter = 0
        counterLabel.text = "\(counter)/\(practicetime)"
        
        
        randomImage()
        
    }
    
    
    //ランダムに画像を表示してそのボタンにobjc funcを追加するメソッド
    func randomImage(){
        imagerandom = Int.random(in: 1...24)
        if imagerandom % 24 <= 5{
            image1.image = UIImage(named: "邊")
            if imagerandom % 24 == 0{
                image2.image = UIImage(named: "邉")
                image3.image = UIImage(named: "辺")
                image4.image = UIImage(named: "鍋")
            }
            if imagerandom % 24 == 1{
                image2.image = UIImage(named: "邉")
                image3.image = UIImage(named: "鍋")
                image4.image = UIImage(named: "辺")
                
            }
            
            if imagerandom % 24 == 2{
                image2.image = UIImage(named: "辺")
                image3.image = UIImage(named: "邉")
                image4.image = UIImage(named: "鍋")
                
            }
            
            if imagerandom % 24 == 3{
                image2.image = UIImage(named: "辺")
                image3.image = UIImage(named: "鍋")
                image4.image = UIImage(named: "邉")
                
            }
            
            if imagerandom % 24 == 4{
                image2.image = UIImage(named: "鍋")
                image3.image = UIImage(named: "邉")
                image4.image = UIImage(named: "辺")
                
            }
            
            if imagerandom % 24 == 5{
                image2.image = UIImage(named: "鍋")
                image3.image = UIImage(named: "辺")
                image4.image = UIImage(named: "邉")
                
            }
            
            
        }
        if imagerandom % 24 >= 6 && imagerandom % 24 <= 11{
            image1.image = UIImage(named: "邉")
            if imagerandom % 24 == 6{
                image2.image = UIImage(named: "邊")
                image3.image = UIImage(named: "辺")
                image4.image = UIImage(named: "鍋")
            }
            if imagerandom % 24 == 7{
                image2.image = UIImage(named: "邊")
                image3.image = UIImage(named: "鍋")
                image4.image = UIImage(named: "辺")
                
            }
            
            if imagerandom % 24 == 8{
                image2.image = UIImage(named: "辺")
                image3.image = UIImage(named: "邊")
                image4.image = UIImage(named: "鍋")
                
            }
            
            if imagerandom % 24 == 9{
                image2.image = UIImage(named: "辺")
                image3.image = UIImage(named: "鍋")
                image4.image = UIImage(named: "邊")
                
            }
            
            if imagerandom % 24 == 10{
                image2.image = UIImage(named: "鍋")
                image3.image = UIImage(named: "邊")
                image4.image = UIImage(named: "辺")
                
            }
            
            if imagerandom % 24 == 11{
                image2.image = UIImage(named: "鍋")
                image3.image = UIImage(named: "辺")
                image4.image = UIImage(named: "邊")
                
            }
            
        }
        if imagerandom % 24 >= 12 && imagerandom % 24 <= 17{
            image1.image = UIImage(named: "辺")
            if imagerandom % 24 == 12{
                image2.image = UIImage(named: "邊")
                image3.image = UIImage(named: "邉")
                image4.image = UIImage(named: "鍋")
            }
            if imagerandom % 24 == 13{
                image2.image = UIImage(named: "邊")
                image3.image = UIImage(named: "鍋")
                image4.image = UIImage(named: "邉")
                
            }
            
            if imagerandom % 24 == 14{
                image2.image = UIImage(named: "邉")
                image3.image = UIImage(named: "邊")
                image4.image = UIImage(named: "鍋")
                
            }
            
            if imagerandom % 24 == 15{
                image2.image = UIImage(named: "邉")
                image3.image = UIImage(named: "鍋")
                image4.image = UIImage(named: "邊")
                
            }
            
            if imagerandom % 24 == 16{
                image2.image = UIImage(named: "鍋")
                image3.image = UIImage(named: "邊")
                image4.image = UIImage(named:"邉")
                
            }
            
            if imagerandom % 24 == 17{
                image2.image = UIImage(named: "鍋")
                image3.image = UIImage(named: "邉")
                image4.image = UIImage(named: "邊")
                
            }
            
        }
        if imagerandom % 24 >= 18 && imagerandom % 24 <= 23{
            image1.image = UIImage(named: "鍋")
            if imagerandom % 24 == 18{
                image2.image = UIImage(named: "邊")
                image3.image = UIImage(named: "邉")
                image4.image = UIImage(named: "辺")
            }
            if imagerandom % 24 == 19{
                image2.image = UIImage(named: "邊")
                image3.image = UIImage(named: "辺")
                image4.image = UIImage(named: "邉")
                
            }
            
            if imagerandom % 24 == 20{
                image2.image = UIImage(named: "邉")
                image3.image = UIImage(named: "邊")
                image4.image = UIImage(named: "辺")
                
            }
            
            if imagerandom % 24 == 21{
                image2.image = UIImage(named: "邉")
                image3.image = UIImage(named: "辺")
                image4.image = UIImage(named: "邊")
                
            }
            
            if imagerandom % 24 == 22{
                image2.image = UIImage(named: "辺")
                image3.image = UIImage(named: "邊")
                image4.image = UIImage(named:"邉")
                
            }
            
            if imagerandom % 24 == 23{
                image2.image = UIImage(named: "辺")
                image3.image = UIImage(named: "邉")
                image4.image = UIImage(named: "邊")
                
            }
        }
        addTarget()
    }
    //ここまで
    
    
    
    //ターゲット削除メソッド
    func removeTarget() {
        self.tapImage1.removeTarget(self, action: #selector(self.tapCorrect))
        self.tapImage1.removeTarget(self, action: #selector(self.tapUncorrect))
        self.tapImage1.removeTarget(self, action: #selector(self.tapI))
        self.tapImage1.removeTarget(self, action: #selector(self.tapDon))
        self.tapImage2.removeTarget(self, action: #selector(self.tapCorrect))
        self.tapImage2.removeTarget(self, action: #selector(self.tapUncorrect))
        self.tapImage2.removeTarget(self, action: #selector(self.tapI))
        self.tapImage2.removeTarget(self, action: #selector(self.tapDon))
        self.tapImage3.removeTarget(self, action: #selector(self.tapCorrect))
        self.tapImage3.removeTarget(self, action: #selector(self.tapUncorrect))
        self.tapImage3.removeTarget(self, action: #selector(self.tapI))
        self.tapImage3.removeTarget(self, action: #selector(self.tapDon))
        self.tapImage4.removeTarget(self, action: #selector(self.tapCorrect))
        self.tapImage4.removeTarget(self, action: #selector(self.tapUncorrect))
        self.tapImage4.removeTarget(self, action: #selector(self.tapI))
        self.tapImage4.removeTarget(self, action: #selector(self.tapDon))
    }
    //ここまで
    
    
    //objc func を画像ごとにボタンに追加するメソッド
    func addTarget(){
        if image1.image == UIImage(named: "邉"){
            tapImage1.addTarget(self, action: #selector(self.tapUncorrect))
        }
        if image1.image == UIImage(named: "邊"){
            tapImage1.addTarget(self, action: #selector(self.tapCorrect))
        }
        if image1.image == UIImage(named: "辺"){
            tapImage1.addTarget(self, action: #selector(self.tapI))
        }
        if image1.image == UIImage(named: "鍋"){
            tapImage1.addTarget(self, action: #selector(self.tapDon))
        }
        
        if image2.image == UIImage(named: "邉"){
            tapImage2.addTarget(self, action: #selector(self.tapUncorrect))
        }
        if image2.image == UIImage(named: "邊"){
            tapImage2.addTarget(self, action: #selector(self.tapCorrect))
        }
        if image2.image == UIImage(named: "辺"){
            tapImage2.addTarget(self, action: #selector(self.tapI))
        }
        if image2.image == UIImage(named: "鍋"){
            tapImage2.addTarget(self, action: #selector(self.tapDon))
        }
        
        
        if image3.image == UIImage(named: "邉"){
            tapImage3.addTarget(self, action: #selector(self.tapUncorrect))
        }
        if image3.image == UIImage(named: "邊"){
            tapImage3.addTarget(self, action: #selector(self.tapCorrect))
        }
        if image3.image == UIImage(named: "辺"){
            tapImage3.addTarget(self, action: #selector(self.tapI))
        }
        if image3.image == UIImage(named: "鍋"){
            tapImage3.addTarget(self, action: #selector(self.tapDon))
        }
        
        
        if image4.image == UIImage(named: "邉"){
            tapImage4.addTarget(self, action: #selector(self.tapUncorrect))
        }
        if image4.image == UIImage(named: "邊"){
            tapImage4.addTarget(self, action: #selector(self.tapCorrect))
        }
        if image4.image == UIImage(named: "辺"){
            tapImage4.addTarget(self, action: #selector(self.tapI))
        }
        if image4.image == UIImage(named: "鍋"){
            tapImage4.addTarget(self, action: #selector(self.tapDon))
        }
        
        
        
    }
    //ここまで
    
    
    //ボタンを初期状態に戻すメソッド
    func buttonReset(){
        self.image1.alpha = 1.0
        self.image2.alpha = 1.0
        self.image3.alpha = 1.0
        self.image4.alpha = 1.0
        self.tapImage1.isEnabled = true
        self.tapImage2.isEnabled = true
        self.tapImage3.isEnabled = true
        self.tapImage4.isEnabled = true
    }
    //ここまで
    
    
    
    
    //判定して正解表示メソッド
    func discriminateCorrect(){
        if image1.image == UIImage(named: "邊"){
            self.image1.alpha = 0.0
            self.image2.alpha = 0.4
            self.image3.alpha = 0.4
            self.image4.alpha = 0.4
            self.image1.image = UIImage(named: "correct")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image1.alpha = 0.4
            }, completion: nil)
        }
        if image2.image == UIImage(named: "邊"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.0
            self.image3.alpha = 0.4
            self.image4.alpha = 0.4
            self.image2.image = UIImage(named: "correct")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image2.alpha = 0.4
            }, completion: nil)
            
        }
        if image3.image == UIImage(named: "邊"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.4
            self.image3.alpha = 0.0
            self.image4.alpha = 0.4
            self.image3.image = UIImage(named: "correct")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image3.alpha = 0.4
            }, completion: nil)
            
        }
        if image4.image == UIImage(named: "邊"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.4
            self.image3.alpha = 0.4
            self.image4.alpha = 0.0
            self.image4.image = UIImage(named: "correct")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image4.alpha = 0.4
            }, completion: nil)
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
            
            self.randomImage()
            self.buttonReset()
        }
        
        
    }
    //ここまで
    func discriminateUncorrect(){
        if image1.image == UIImage(named: "邉"){
            self.image1.alpha = 0.0
            self.image2.alpha = 0.4
            self.image3.alpha = 0.4
            self.image4.alpha = 0.4
            self.image1.image = UIImage(named: "1")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image1.alpha = 0.4
            }, completion: nil)
        }
        if image2.image == UIImage(named: "邉"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.0
            self.image3.alpha = 0.4
            self.image4.alpha = 0.4
            self.image2.image = UIImage(named: "1")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image2.alpha = 0.4
            }, completion: nil)
            
        }
        if image3.image == UIImage(named: "邉"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.4
            self.image3.alpha = 0.0
            self.image4.alpha = 0.4
            self.image3.image = UIImage(named: "1")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image3.alpha = 0.4
            }, completion: nil)
            
        }
        if image4.image == UIImage(named: "邉"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.4
            self.image3.alpha = 0.4
            self.image4.alpha = 0.0
            self.image4.image = UIImage(named: "1")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image4.alpha = 0.4
            }, completion: nil)
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
            
            self.randomImage()
            self.buttonReset()
        }
        
        
    }
    func discriminateI(){
        if image1.image == UIImage(named: "辺"){
            self.image1.alpha = 0.0
            self.image2.alpha = 0.4
            self.image3.alpha = 0.4
            self.image4.alpha = 0.4
            self.image1.image = UIImage(named: "3")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image1.alpha = 0.4
            }, completion: nil)
        }
        if image2.image == UIImage(named: "辺"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.0
            self.image3.alpha = 0.4
            self.image4.alpha = 0.4
            self.image2.image = UIImage(named: "3")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image2.alpha = 0.4
            }, completion: nil)
            
        }
        if image3.image == UIImage(named: "辺"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.4
            self.image3.alpha = 0.0
            self.image4.alpha = 0.4
            self.image3.image = UIImage(named: "3")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image3.alpha = 0.4
            }, completion: nil)
            
        }
        if image4.image == UIImage(named: "辺"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.4
            self.image3.alpha = 0.4
            self.image4.alpha = 0.0
            self.image4.image = UIImage(named: "3")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image4.alpha = 0.4
            }, completion: nil)
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
            
            self.randomImage()
            self.buttonReset()
        }
        
        
    }
    func discriminateDon(){
        if image1.image == UIImage(named: "鍋"){
            self.image1.alpha = 0.0
            self.image2.alpha = 0.4
            self.image3.alpha = 0.4
            self.image4.alpha = 0.4
            self.image1.image = UIImage(named: "7")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image1.alpha = 0.4
            }, completion: nil)
        }
        if image2.image == UIImage(named: "鍋"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.0
            self.image3.alpha = 0.4
            self.image4.alpha = 0.4
            self.image2.image = UIImage(named: "7")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image2.alpha = 0.4
            }, completion: nil)
            
        }
        if image3.image == UIImage(named: "鍋"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.4
            self.image3.alpha = 0.0
            self.image4.alpha = 0.4
            self.image3.image = UIImage(named: "7")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image3.alpha = 0.4
            }, completion: nil)
            
        }
        if image4.image == UIImage(named: "鍋"){
            self.image1.alpha = 0.4
            self.image2.alpha = 0.4
            self.image3.alpha = 0.4
            self.image4.alpha = 0.0
            self.image4.image = UIImage(named: "7")
            UIImageView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
                self.image4.alpha = 0.4
            }, completion: nil)
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
            
            self.randomImage()
            self.buttonReset()
        }
        
        
    }
    
    
    @objc func updateDisplay() {
        timeCountNum += 1
        let ms = timeCountNum % 100
        let s = (timeCountNum - ms) / 100 % 60
        let m = (timeCountNum - ms - s) / 6000 % 100
        timeDisplay.text = String(format: "%02d:%02d:%02d", m,s,ms)
    }
    
    
    @objc func tapCorrect(sender: Any) { //邊を押した時の処理
        counter += 1
        counterLabel.text = "\(counter)/\(practicetime)"
        
     
        
        
        
        
        if counter == practicetime {
            if adrandom % 7 == 0 {
                
                
                timer.invalidate()
                removeTarget()
                
                if interstitial != nil {
                    
                    interstitial?.present(fromRootViewController: self)
                } else {
                    print("Ad wasn't ready")
                  
                }
            }else{
                removeTarget()
                let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
                resultViewController.username = username
                resultViewController.timescore = timeCountNum
                resultViewController.practicetime = practicetime
               
                self.present(resultViewController, animated: true)
            }
        }else{
            
            removeTarget()
            discriminateCorrect()
           
        }
        
    }
    
    @objc func tapUncorrect(sender: Any) {  //邉を押した時の処理
        
        counterLabel.text = "\(counter)/\(practicetime)"
        timeCountNum += 100
        removeTarget()
        discriminateUncorrect()
        
        
    }
    @objc func tapI(sender: Any) {  //辺をタップした際の処理
        
        counterLabel.text = "\(counter)/\(practicetime)"
        timeCountNum += 300
        removeTarget()
        discriminateI()
        
    }
    @objc func tapDon(sender: Any) {   //鍋をタップした際の処理
        
        counterLabel.text = "\(counter)/\(practicetime)"
        timeCountNum += 700
        
        removeTarget()
        discriminateDon()
        
        
        
        
        
        
        
    }
    
    @IBAction func gameTopButton(_ sender: Any) {
        if adrandom % 7 == 0 {
            if interstitial != nil {
                
                interstitial?.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
   
                
            }
        }else{
            
            
            let topViewController = self.storyboard?.instantiateViewController(withIdentifier: "TopViewController") as! TopViewController
            self.present(topViewController, animated: true)
            
        }
    }
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
        if counter == practicetime{
            let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            resultViewController.username = username
            resultViewController.timescore = timeCountNum
            resultViewController.practicetime = practicetime
            self.present(resultViewController, animated: true)
           
            
        }else{
            let topviewController = self.storyboard?.instantiateViewController(withIdentifier: "TopViewController") as! TopViewController
            self.present(topviewController, animated: true)
        }
    }
}

