//
//  ContentView.swift
//  Team12_Assignment
//
//  Created by KHJ on 2023/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewModel = ContentViewModel()
    @State private var isSecured = true
    var body: some View {
        NavigationView {
            ZStack {
                // 배경 색
                Color(cgColor: CGColor(red: 206/255, green: 220/255, blue: 252/255, alpha: 1))
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    // 이메일 스택
                    VStack(alignment: .leading) {
                        Text("이메일")
                        TextField("이메일을 입력해주세요", text: $contentViewModel.email)
                            .onChange(of: contentViewModel.email) { email in
                                contentViewModel.isValidEmailAddr(string: email)
                            }
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                        Text(contentViewModel.helperTextForEmail)
                    }
                    .padding(.vertical)
                    // 비밀번호 스택
                    VStack(alignment: .leading ) {
                        Text("비밀번호")
                        if isSecured {
                            ZStack {
                                SecureField("비밀번호를 입력해주세요", text: $contentViewModel.password)
                                    .textFieldStyle(.roundedBorder)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                                HStack {
                                    Spacer()
                                    Button {
                                        isSecured.toggle()
                                    } label: {
                                        Image(systemName: "eye.slash")
                                            .foregroundStyle(.black)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        } else {
                            ZStack {
                                TextField("비밀번호를 입력해주세요", text: $contentViewModel.password)
                                    .textFieldStyle(.roundedBorder)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                                HStack {
                                    Spacer()
                                    Button {
                                        isSecured.toggle()
                                    } label: {
                                        Image(systemName: "eye")
                                            .foregroundStyle(.black)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        HStack {
                            StatusBar(password: $contentViewModel.password)
                        }
                        .padding(.vertical)
                        Text(contentViewModel.helperTextForPassword)
                    }
                    // 로그인 버튼
                    VStack(alignment: .center) {
                        Button {
                            contentViewModel.login()
                        } label: {
                            Text("로그인")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(contentViewModel.isButtonDisabled)
                    }
                    Spacer()
                }
                .padding()
                .alert(contentViewModel.alertTitle, isPresented: $contentViewModel.showingAlert) {
                } message: {
                    Text(contentViewModel.alertMessage)
                }
            }
            .navigationTitle("Hello World!")
            .background(Color(cgColor: CGColor(red: 206, green: 220, blue: 252, alpha: 0)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
