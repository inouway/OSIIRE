//
//  nextViewController.swift
//  OSIIRE
//
//  Created by 井上勇斗 on 2019/06/02.
//  Copyright © 2019 井上勇斗. All rights reserved.
//

import UIKit
import RealmSwift

class nextViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var collectionImage:CollectionImage!
    
    var hoge = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //6/4追加
        //保存ディレクトリの取得
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL
        //保存ディレクトリ　+ 画像パス
        let url = documentPath.appendingPathComponent(collectionImage!.path)
        //イメージビューに画像を反映
        imageView.image = UIImage(contentsOfFile: url!.path)
    }
    
    
    @IBAction func didClickRemove(_ sender: Any) {
        //アラートの画面を作成する
        let alert = UIAlertController(title: "Let's 断捨離!!", message:"SIMPLE IS THE BEST", preferredStyle: .alert)
        //選択肢の作成
        let yesAction = UIAlertAction(title: "する", style: .default){(UIAlertAction) in
            print("断捨離しました")
            self.removeImage()
            
        }
        //選択肢の追加
        alert.addAction(yesAction)
        
        let noAction = UIAlertAction(title: "しない", style: .destructive){(UIAlertAction) in
            print("断捨離しませんでした")
        }
        alert.addAction(noAction)
        //アラートの表示
        present(alert, animated: true, completion: nil)
        //画面を閉じる
        //self.dismiss(animated: true, completion: nil)
        
    }
    //画像をDBから削除する処理
    func removeImage() {
        // ディレクトリから削除
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL
        //保存ディレクトリ　+ 画像パス
        let url = documentPath.appendingPathComponent(collectionImage!.path)
        try! FileManager.default.removeItem(at: url!)
        
        // DBから削除
        let realm = try! Realm()
        try! realm.write {
            realm.delete(collectionImage)
        }
    }
    
    
    @IBAction func didClickBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
