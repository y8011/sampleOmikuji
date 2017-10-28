//
//  ViewController.swift
//  sampleOmikuji
//
//  Created by yuka on 27/10/2017.
//  Copyright © 2017 yuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var omikuji = [
        /*0*/"カナブンが一直線に飛んできた。私のファーストキスだった。"
        /*1*/,"これの色違いありますか」八百屋に妙な客が来た。"
        /*2*/,"兄の部屋から聞こえていた笙の音が止まった。吉"
        /*3*/,"ぬ、みたいなイヤホンをもたもたほどいて、この場が過ぎるのを待つ。"
        /*4*/,"担任に好かれている吉田と、ただの吉田がいた"
        /*5*/,"「またとびきり悲しいやつ、頼みますよ」と声をかけられ、シェークスピアはほとほと嫌気が差した。"
        /*6*/,"ヒーローたちの利害は複雑に絡み合っていた"
        /*出典：挫折を経て、猫は丸くなった。―書き出し小説名作集―　天久聖一／編*/
    ]
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myImageView.center.x = self.view.center.x
        label.center.x = self.view.center.x
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapUranai(_ sender: UIButton) {
        let r = Int(arc4random()) % omikuji.count
        var message:String
        
        print(arc4random())
        print("今日の書き出し小説:\(omikuji[r])")
        
        //TODO:おみくじ結果をアラートで表示しましょう
        //TODO:アラートにOKボタンをつけて、OKが押されたら、おみくじ結果に紐づいた画像を画面に表示するようにしてください
        //TODO:出来上がったらGithubへPushして提出
        message = uranau(id:r)
        
        alertAction_uranai(s_title: "書き出し小説",s_message: message, s_actmsg: "→", id:r)
        
    }
    
    
    func uranau(id:Int)->String {

        var message:String
        
        message = omikuji[id]
        
        return message
        
    }
    
    func alertAction_uranai(s_title:String, s_message:String, s_actmsg:String, id:Int){
        
        
        //部品となるアラート
        let alert = UIAlertController(
            title: s_title ,
            message: s_message,
            preferredStyle: .alert
        )
        
        //ボタンを増やしたいときは、addActionをもう一つ作ればよい
        alert.addAction(
            UIAlertAction(
                title: s_actmsg,
                style: .default,
                handler: {action in self.imgSelect(id: id)} )
        )
        
        //アラートを表示
        present(alert,
                animated: true,
                completion: nil
        )
        
    }
    
    func imgSelect(id:Int) {
        var imgName: String
        imgName = "uranai\(id).jpg"
        print(imgName)
        myImageView.image = UIImage(named: imgName)

    }

}

