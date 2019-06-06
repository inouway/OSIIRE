//
//  CameraViewController.swift
//  OSIIRE
//
//  Created by 井上勇斗 on 2019/05/15.
//  Copyright © 2019 井上勇斗. All rights reserved.
//

import UIKit
import RealmSwift

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //6/6追加
    var hoge = ""
    
    @IBOutlet weak var imageView: UIImageView!
    //画面が読み込まれたら
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //comand option 左 閉じることができる
    @IBAction func runCamera(_ sender: UIButton) {
        //このアプリでカメラを使用する事を許可されているかに確認
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            //カメラの画面作成
            let cameraPicker = UIImagePickerController()
            //起動するタイプをカメラに指定
            cameraPicker.sourceType = .camera
            cameraPicker.delegate = self
            //カメラの表示
            present(cameraPicker, animated: true, completion: nil)
        } else {
            print("カメラが使用できません")
        }
    }
    
    @IBAction func showAlbum(_ sender: UIButton) {
        //このアプリでカメラを使用することを許可されているか確認
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("フォトライブラリが使用できません")
        }
    }
    
    //    撮影または選択された画像の表示機能
    //    このメソッドは撮影または選択されたのちに自動で呼ばれるメソッド
    //    UIImagePickerControllerDelegateに用意されているメソッド
    
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
    
    
    @IBAction func savePhoto(_ sender: UIButton) {
        if let image = imageView.image {
            let fileName = getTimestamp() + ".png"
            //DBに保存
            saveFileName(fileName)
            //画像を保存
            savePhoto(image, fileName: fileName)
            //画面遷移
            performSegue(withIdentifier: "toTop", sender: nil)
        }
    }
    //画像を保存する処理
    func savePhoto(_ image: UIImage, fileName: String) {
        //PNGデータに変換
        let pngImage = image.pngData()
        do {
            //保存先ディレクトリの取得
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
            //
            let path = url!.path + "/" + fileName
            //
            try pngImage?.write(to: URL(fileURLWithPath: path), options: .atomic)
        } catch {
            print("画像の保存失敗")
            return
        }
    }
    
    func saveFileName(_ fileName: String) {
        let ci = CollectionImage()
        ci.path = fileName
        ci.category = fileName
        let realm = try! Realm()
        try! realm.write {
            realm.add(ci)
        }
    }
    
    //タイムスタンプを取得
    func getTimestamp() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyMMddHHmmss"
        //format.dateFormat = "yyy"
        return format.string(from: date)
    }
    
    
}
