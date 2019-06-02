//
//  nextViewController.swift
//  OSIIRE
//
//  Created by 井上勇斗 on 2019/06/02.
//  Copyright © 2019 井上勇斗. All rights reserved.
//

import UIKit

class nextViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didClickRemove(_ sender: Any) {
        //アラートの画面を作成する
        let alert = UIAlertController(title: "Let's 断捨離!!", message:"SIMPLE IS THE BEST", preferredStyle: .alert)
        //選択肢の作成
        let yesAction = UIAlertAction(title: "する", style: .default){(UIAlertAction) in
            print("断捨離しました")
        }
        //選択肢の追加
        alert.addAction(yesAction)
        
        let noAction = UIAlertAction(title: "しない", style: .destructive){(UIAlertAction) in
            print("断捨離しませんでした")
        }
        alert.addAction(noAction)
        
        //let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel){(UIAlertAction) in
            //print("キャンセルが押されました")
        //}
        //alert.addAction(cancelAction)
        
        //アラートの選択肢の種類
        //        default:通常の選択肢
        //        destructive:否定的な選択肢　赤文字になる
        //        cancel:アラートな内に一つだけ作成できる

        //        アラートの表示
        present(alert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //infoには写真以外にも様々なデータが詰まっているので、写真を取り出す
        //if letには定義と条件分岐を同時に行なっている
        //取り出せたらブロック内が実行される
        if let pickedImage = info[.originalImage] as? UIImage {
            //            取り出した画像の反映
            imageView.image = pickedImage
            //            縦横比率の設定
            imageView.contentMode = .scaleAspectFit
        }
        //        表示しているカメラ画面やフォトライブラリ画面を閉じる
        picker.dismiss(animated: true, completion: nil)
    }

}
