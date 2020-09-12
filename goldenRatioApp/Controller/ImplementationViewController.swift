//
//  ImplementationViewController.swift
//  goldenRatioApp
//
//  Created by Swamita on 10/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import UIKit
import Vision
import ImageIO

class ImplementationViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var initialImageView: UIImageView!
    @IBOutlet weak var finalImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    let imagePicker = UIImagePickerController()
    var image : CIImage?
    var golden = false
    var message = "hello"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        messageLabel.isHidden = true
    }
    
    lazy var detectRectangleRequest: VNDetectRectanglesRequest = {
        return VNDetectRectanglesRequest(completionHandler:self.handleRectangles)
    }()
    
    lazy var detectTextRequest: VNDetectTextRectanglesRequest = {
        let textRequest = VNDetectTextRectanglesRequest(completionHandler: self.handleTextIdentifiaction)
        textRequest.reportCharacterBoxes = true
        return textRequest
    }()
    
    lazy var detectFaceRequest : VNDetectFaceRectanglesRequest = {
        let faceRequest = VNDetectFaceRectanglesRequest(completionHandler:self.handleFaceDetection)
        return faceRequest
    }()
    
    @IBAction func cameraTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Import Image", message: "From where do you want to import your image?", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Capture from Camera", style: .default, handler: { action in
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        alert.view.tintColor = UIColor(named: "Golden")
        self.present(alert, animated: true)
    }
    
}

//MARK: - UIImagePickerControllerDelegate Methods

extension ImplementationViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else { fatalError("Failed to load image!") }
        
        initialImageView.image = uiImage
        
        finalImageView.subviews.forEach({ $0.removeFromSuperview() }) 
        finalImageView.image = uiImage
        label.isHidden = true
        messageLabel.isHidden = false
        print("Image loaded")
        
        guard let ciImage = CIImage(image: uiImage)
            else { fatalError("Failed to convert UIImage to CIImage!") }
        print("Image converted")
        
        image = ciImage.oriented(forExifOrientation: Int32(uiImage.imageOrientation.rawValue))
                
        let handler = VNImageRequestHandler(ciImage: ciImage, orientation: CGImagePropertyOrientation(rawValue: CGImagePropertyOrientation.RawValue(Int32(uiImage.imageOrientation.rawValue)))!)
                
                DispatchQueue.global(qos: .userInteractive).async {
                    do {
                        try handler.perform([self.detectRectangleRequest,
                                             self.detectTextRequest,
                                             self.detectFaceRequest])
                    } catch {
                        print(error)
                    }
                }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        let alert = UIAlertController(title: "Result ✨", message: "Golden rectangles are shown in yellow. \nOther detected rectangles are shown in red.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        alert.view.tintColor = UIColor(named: "Golden")
        self.present(alert, animated: true, completion: nil)
            }
    
    func Outline(withColor : UIColor) -> UIView {
        
        let view = UIView()
        
        view.layer.borderColor = withColor.cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func transform(fromRect: CGRect , toViewRect :UIView) -> CGRect {
        
        var toRect = CGRect()
        toRect.size.width = fromRect.size.width * toViewRect.frame.size.width
        toRect.size.height = fromRect.size.height * toViewRect.frame.size.height
        toRect.origin.y =  (toViewRect.frame.height) - (toViewRect.frame.height * fromRect.origin.y )
        toRect.origin.y  = toRect.origin.y -  toRect.size.height
        toRect.origin.x =  fromRect.origin.x * toViewRect.frame.size.width
        
        
        let a = toRect.size.width
        let b = toRect.size.height
        
        if a>b {
            if a/b <= 1.8 {
                if a/b >= 1.4{
                    golden = true
                }
            }
        } else {
            if b/a <= 1.8 {
                if b/a >= 1.4{
                    golden = true
                }
            }
        }
        
        return toRect
    }
    
    func chosenColor(golden: Bool) -> UIColor {
        let color = golden==true ? UIColor.yellow : UIColor.red
        return color
    }
    
    func handleTextIdentifiaction (request: VNRequest, error: Error?) {
        
        guard let observations = request.results as? [VNTextObservation]
            else { print("Unexpected result type from VNTextObservation")
                return
            }
        guard observations.first != nil else {
            return
        }
        DispatchQueue.main.async {
            for box in observations {
                guard let chars = box.characterBoxes else {
                    print("no char values found")
                    return
                }
                for char in chars
                {
                    let view = self.Outline(withColor: self.chosenColor(golden: self.golden))
                    view.frame = self.transform(fromRect: char.boundingBox, toViewRect: self.finalImageView)
                    self.finalImageView.image = self.initialImageView.image
                    self.finalImageView.addSubview(view)
                }
            }
        }
    }
    
    
    func handleFaceDetection (request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNFaceObservation]
            else { print("unexpected result type from VNFaceObservation")
                return }
        guard observations.first != nil else {
            return
        }
        DispatchQueue.main.async {
            for face in observations
            {
                let view = self.Outline(withColor: self.chosenColor(golden: self.golden))
                view.frame = self.transform(fromRect: face.boundingBox, toViewRect: self.self.finalImageView)
                self.finalImageView.image = self.initialImageView.image
                self.finalImageView.addSubview(view)
            }
        }
    }
    
    func handleRectangles(request: VNRequest, error: Error?) {
        
        guard let observations = request.results as? [VNRectangleObservation]
            else { print("unexpected result type from VNDetectRectanglesRequest")
                    return
        }
        guard observations.first != nil else {
            return
        }
        DispatchQueue.main.async {
            for rect in observations
            {
                let view = self.Outline(withColor: self.chosenColor(golden: self.golden))
                view.frame = self.transform(fromRect: rect.boundingBox, toViewRect: self.finalImageView)
                self.finalImageView.image = self.initialImageView.image
                self.finalImageView.addSubview(view)
                
            }
        }
    }
}
