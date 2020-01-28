//
//  ContentView.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 20/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var userSettings: UserSettings
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var processingLogin: Bool = false
    @State var loginErrorMessage: String = ""
    
    var body: some View {
        ZStack {
            Color(red:0.97, green:0.97, blue:0.97)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Image("logo-jetty-green")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 200.0, height: 96.0)
                .padding(Edge.Set.bottom, 10)
                
                Text("Buen Viaje. Siempre.")
                .bold()
                .font(.subheadline)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0))
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
                
                TextField("Correo electrónico", text: $email)
                .padding()
                .cornerRadius(4.0)
                .border(Color(red:0.49, green:0.50, blue:0.50), width: 2)
                .padding(.bottom, 10)
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                                
                SecureField("Contraseña", text: $password)
                .padding()
                .cornerRadius(4.0)
                .border(Color(red:0.49, green:0.50, blue:0.50), width: 2)
                .padding(.bottom, 10)
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
                
                Button(action: loginSubmit) {
                    HStack {
                        Spacer()
                        if self.processingLogin {
                        Text("Iniciando sesión..").fontWeight(.semibold)
                        } else {
                        Text("Iniciar sesión").fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(red:0.29, green:0.75, blue:0.66))
                    .cornerRadius(4.0)
                    .foregroundColor(.white)
                }.disabled(self.processingLogin)
                
                if self.loginErrorMessage.count > 0 {
                    Text(self.loginErrorMessage)
                    .bold()
                    .font(.subheadline)
                    .padding(.top, 20)
                    .foregroundColor(Color.red)
                }
                
            }
            .padding()
            .contentShape(Rectangle())
            .onTapGesture {
                self.endEditing()
            }
        }
    }
    
    func loginSubmit() {
        if !self.isValidInputs() {
            return
        }
        
        self.loginErrorMessage = ""
        self.processingLogin = true
        
        
        JettyApi.login(self.email, password: self.password, success: {
            DispatchQueue.main.async {
                self.userSettings.loggedIn = true
            }
        }) { (error) in
            
            DispatchQueue.main.async {
                self.processingLogin = false
                self.loginErrorMessage = error.localizedDescription
            }

        }
    }
    
    fileprivate func isValidInputs() -> Bool {
        
        if !self.email.isEmailFormatted() {
            self.loginErrorMessage = "Ingresa un email valido"
            return false
        }
        
        if self.password.isEmpty {
            self.loginErrorMessage = "Ingresa una contraseña"
            return false
        }
        
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
