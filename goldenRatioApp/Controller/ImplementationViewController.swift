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
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
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
            }
    
    func Outline(withColor : UIColor) -> UIView {
        var golden = false
        let view = UIView()
        let a = view.bounds.width
        let b = view.bounds.height
        
        if a<b {
            if a/b <= 1.7 {
                if a/b >= 1.5{
                    golden = true
                }
            }
        } else {
            if b/a <= 1.7 {
                if b/a >= 1.5{
                    golden = true
                }
            }
        }
        
        if golden == true {
            print("Golden!")
        }
        
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
        
        return toRect
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
            self.finalImageView.subviews.forEach({ (s) in
                s.removeFromSuperview()
            })
            for box in observations {
                guard let chars = box.characterBoxes else {
                    print("no char values found")
                    return
                }
                for char in chars
                {
                    let view = self.Outline(withColor: UIColor.yellow)
                    view.frame = self.transform(fromRect: char.boundingBox, toViewRect: self.finalImageView)
                    self.finalImageView.image = self.initialImageView.image
                    self.finalImageView.addSubview(view)
                    print("Text subview added")
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
        // Show the pre-processed image
        DispatchQueue.main.async {
            self.finalImageView.subviews.forEach({ (s) in
                s.removeFromSuperview()
            })
            for face in observations
            {
                let view = self.Outline(withColor: UIColor.yellow)
                view.frame = self.transform(fromRect: face.boundingBox, toViewRect: self.self.finalImageView)
                self.finalImageView.image = self.initialImageView.image
                self.finalImageView.addSubview(view)
                print("Face subview added")
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
        // Show the pre-processed image
        DispatchQueue.main.async {
            self.finalImageView.subviews.forEach({ (s) in
                s.removeFromSuperview()
            })
            for rect in observations
            {
                let view = self.Outline(withColor: UIColor.yellow)
                view.frame = self.transform(fromRect: rect.boundingBox, toViewRect: self.finalImageView)
                self.finalImageView.image = self.initialImageView.image
                self.finalImageView.addSubview(view)
                print("Rectangle subview added")
            }
        }
    }
}
