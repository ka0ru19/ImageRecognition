//
//  ViewController.swift
//  ImageRecogination
//
//  Created by 井上航 on 2016/09/26.
//  Copyright © 2016年 Wataru Inoue. All rights reserved.
//

import UIKit
import ImageRecognition

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if let theImage = imageView.image {
            search(theImage)
        }
    }
    
    @IBAction func onTappedAlbumButton(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .PhotoLibrary
            picker.delegate = self
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    // 写真が選択された時に呼び出されるメソッド
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func search(image: UIImage) {
        
//        let recognize = ImageRecognition()
        let requestUrl = "https://api.apigw.smt.docomo.ne.jp/imageRecognition/v1/concept/classify/"
        let requestParams = RequestParams()
        requestParams.apiKey = "4c69522e6c6f616e52467936476d2f384b7233583452556369764466716f422e4c676b51646e38654b5835"
        requestParams.recognitionType = "flower"
        requestParams.contentType = "multipart/form-data"
        requestParams.image = image
        
//        do {
//            let resultData = try recognize.recognize(requestParams)
//            print(resultData)
//        } catch {
//            print("error: xcodeの問題")
//        }
    }
}

