//
//  ContentView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 22.04.2022.
//

import SwiftUI
import Combine


// MARK: Content
struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var shoulShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge(NotificationCenter.default.publisher(for: UIResponder.keyboardDidChangeFrameNotification)
        .map { _ in true }, NotificationCenter.default.publisher(for: UIResponder.keyboardDidChangeFrameNotification)
        .map { _ in false }
    )
        .removeDuplicates()
    
    private let backgroundImage = Image("backgroundImage")
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                backgroundImage
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geometry.size.width,  maxHeight: geometry.size.height)
            }
            
            ScrollView(showsIndicators: false) {
                VStack {
                    if shoulShowLogo {
                        Text("VK")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .bold()
                            .padding(.top, 100)
                    }
                    
                    VStack {
                        
                        HStack {
                            Text("Login:")
                            Spacer()
                            TextField("", text: $login)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(maxWidth: 200)
                        }
                        
                        HStack {
                            Text("Password:")
                            Spacer()
                            TextField("", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(maxWidth: 200)
                        }
                    } // VStack
                    .frame(maxWidth: 300)
                    .padding(.top, 20)
                    
                    Button(action: {print("Hello")}) {
                        Text("Log in")
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                    .disabled(login.isEmpty || password.isEmpty)
                    //                    .buttonStyle(.bordered)
                    
                    Button(action: {
                        login = ""
                        password = ""
                        print("Bye")
                    }) {
                        Text("Log out")
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                    //                    .buttonStyle(.bordered)
                    
                } // VStack
                
            } // ScrollView
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) { self.shoulShowLogo = !isKeyboardOn }
            }
            
        } // ZStack
        .onTapGesture { UIApplication.shared.endEditing() }
        
    } // body
    
} // ContentView


// MARK:  Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}


// MARK:  UIApplication
extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
