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

    @State private var showCamera: Bool = false

    @State private var selectedImage: UIImage?

    @State var photo: UIImage?

    @State var text: String = ""

    @State var showImage: Bool = false

    @State var showPoints: Bool = false

    @State var showButton: Bool = true
    
    @State var starSize: Double = 1.0

    

    var body: some View {

        ZStack{

//            Image("blueBackground3")

//                .resizable()

//                .aspectRatio(contentMode: .fit)

//                .scaleEffect(1.3)

//                .opacity(0.5)

            if let selectedImage{

                if showImage{

                    VStack{

                        Image(uiImage: selectedImage)

                            .resizable()

                            .scaledToFit()

                        Text("\(identifyImage(image: selectedImage, user2: user) == "water bottle" || identifyImage(image: selectedImage, user2: user) == "water jug" ? "plastic bottle" : "AAAAA")")

                            .font(.custom("Helvetica Neue Thin", size: 40))

                            .bold()

                            .foregroundColor(Color.lightMediumBlue)
                        HStack{
                            Button {

                                addPoints(type: identifyImage(image: selectedImage, user2: user), user2: user)

                                showImage.toggle() //false

                                showPoints.toggle() //true

                            } label: {

                                Text("Correct!")

                                    .font(.custom("Helvetica Neue Thin", size: 30))

                                    .bold()

                                    .foregroundColor(Color.lightMediumBlue)
                            }
                            Spacer()
                            Button {
                                showImage.toggle()
                                showButton.toggle()
                            } label: {
                                Text("Retake")
                                    .font(.custom("Helvetica Neue Thin", size: 30))

                                    .bold()

                                    .foregroundColor(Color.lightMediumBlue)
                            }

                        }
                        .padding([.leading, .trailing], 50)

                        

                    }
                    .onAppear{

                        DispatchQueue.main.asyncAfter(deadline: .now()){

                            showButton.toggle()

                        }

                    }

                }

                if showPoints{

                    HStack{

//                        Image("star")
//
//                            .resizable()
//
//                            .aspectRatio(contentMode: .fit)
//
//                            .frame(width: 100)

                        Text("+\(identifyImage(image: selectedImage, user2: user) == "water bottle" || identifyImage(image: selectedImage, user2: user) == "water jug" ? 15 : identifyImage(image: selectedImage, user2: user) == "carton" ? 20 : 0) Points!")
                            .fontWeight(.bold)
                            .font(.system(size: 30))
//                        Text("+")
//
//                            .fontWeight(.bold)
//
//                            .font(.system(size: 30))
                    }
                    .scaleEffect(starSize)
                    .onAppear{
                        withAnimation (.easeIn(duration: 0.2).delay(1)){
                            self.starSize = 1.2
                        }
                    }
                    .onAppear{
                        withAnimation (.easeIn(duration: 0.5).delay(1.2)){
                            self.starSize = 0.0
                        }
                    }
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            showPoints.toggle()//false
                            showButton.toggle()//true
                        }
                    }
                }

            }

            if showButton{

                VStack{

                    Spacer()

                    Text("Recycled? Take a picture!")

                        .font(.custom("Helvetica Neue Thin", size: 25))

                        .bold()

                        .foregroundColor(Color.black)

                        .offset(x:0, y:-100)

                    Button{

                        self.showCamera.toggle()

                        photo = self.selectedImage ?? UIImage()

                        showImage.toggle()//true

                    } label: {

                        Image("camera")

                            .resizable()

                            .aspectRatio(contentMode: .fit)

                            .frame(width: 150, height: 150)

                            .scaleEffect(2.4)

                    }

                    .fullScreenCover(isPresented: self.$showCamera) {

                        accessCameraView(selectedImage: self.$selectedImage)

                            .edgesIgnoringSafeArea(.all)

                    }

                }

                .padding(.bottom, 280)

            }

        }

    }

}



@MainActor func identifyImage(image: UIImage, user2: User) -> String /*[String : Double]*/{

    var classify: String = ""

    let user: User = user2

    

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



@MainActor func addPoints(type: String, user2: User) {

    //266.48

    let user: User = user2

    

    if type == "water bottle" || type == "water jug" {

        user.addBottle()

        user.updateStars()

        user.challengeUpdate()

    }
    
    else if type == "carton" {
        user.addCardboard()
        user.updateStars()
        user.challengeUpdate()
    }

    print("Amount of bottle recycled: \(user.getBottle())")

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
