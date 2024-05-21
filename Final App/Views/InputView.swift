//
//  InputView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import PhotosUI
import CoreML
import Vision

struct InputView: View {
    
    @EnvironmentObject var user: User
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State var photo: UIImage?
    
    var body: some View {
        /*VStack {
            Spacer()
            
            Button {
                user.addBottle()
                print("\(user.waterBottle)")
            } label: {
                Text("Add Water Bottle")
            }
            
            Spacer()
            
            Button {
                user.addCan()
                print("\(user.aluminumCan)")
            } label: {
                Text("Add Aluminum Can")
            }
            
            Spacer()
            
            Button {
                user.addCardboard()
                print("\(user.cardboard)")
            } label: {
                Text("Add Cardboard")
            }
            
            Spacer()
            
            Button {
                user.addBag()
                print("\(user.groceryBag)")
            } label: {
                Text("Add Grocery Bag")
            }
            
            Spacer()
        }*/
        ZStack{
            VStack{
                if let selectedImage{
                    ZStack{
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                        Text(identifyImage(image: selectedImage))
                            .fontWeight(.bold)
                            .font(.system(size: 50))
                            .foregroundColor(Color.red)
                    }
                }
                
                Button{
                    self.showCamera.toggle()
                    photo = self.selectedImage ?? UIImage()
                } label: {
                    Text("Open Camera")
                }
                .fullScreenCover(isPresented: self.$showCamera) {
                    accessCameraView(selectedImage: self.$selectedImage)
                }
            }
        }
    }
}

func identifyImage(image: UIImage) -> String /*[String : Double]*/{
    var classify: String

    do{
        let config = MLModelConfiguration()
        let model = try MobileNetV2(configuration: config)
        let actualImage = convertImage(image: image)
        let prediction = try model.prediction(image: actualImage!)
//        classify = prediction.classLabelProbs
        classify = prediction.classLabel
    }catch{
        //classify = ["Unknown" : 100.0]
        classify = "Unknown"
    }
    return classify
}

func convertImage(image: UIImage) -> CVPixelBuffer? {

  let newSize = CGSize(width: 224.0, height: 224.0)
  UIGraphicsBeginImageContext(newSize)
  image.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
  
  guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else {
      return nil
  }
  
  UIGraphicsEndImageContext()
  
  // convert to pixel buffer
  
  let attributes = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
                    kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
  var pixelBuffer: CVPixelBuffer?
  let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                   Int(newSize.width),
                                   Int(newSize.height),
                                   kCVPixelFormatType_32ARGB,
                                   attributes,
                                   &pixelBuffer)
  
  guard let createdPixelBuffer = pixelBuffer, status == kCVReturnSuccess else {
      return nil
  }
  
  CVPixelBufferLockBaseAddress(createdPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
  let pixelData = CVPixelBufferGetBaseAddress(createdPixelBuffer)
  
  let colorSpace = CGColorSpaceCreateDeviceRGB()
  guard let context = CGContext(data: pixelData,
                                width: Int(newSize.width),
                                height: Int(newSize.height),
                                bitsPerComponent: 8,
                                bytesPerRow: CVPixelBufferGetBytesPerRow(createdPixelBuffer),
                                space: colorSpace,
                                bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue) else {
                                  return nil
  }
  
  context.translateBy(x: 0, y: newSize.height)
  context.scaleBy(x: 1.0, y: -1.0)
  
  UIGraphicsPushContext(context)
  resizedImage.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
  UIGraphicsPopContext()
  CVPixelBufferUnlockBaseAddress(createdPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
  
  return createdPixelBuffer
}

struct accessCameraView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    
    func makeUIViewController(context: Context) -> UIImagePickerController{
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context){
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    var picker: accessCameraView
    
    init(picker: accessCameraView){
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}


struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
            .environmentObject(User())
    }
}
