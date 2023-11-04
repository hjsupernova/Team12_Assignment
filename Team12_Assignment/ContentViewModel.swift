//
//  ContentViewModel.swift
//  Team12_Assignment
//
//  Created by KHJ on 2023/10/27.
//

import Foundation
import UIKit

// MARK: - 변수
@MainActor
class ContentViewModel: ObservableObject {
    // 이메일
    @Published var email = ""
    @Published var isVaildEmail = false
    var helperTextForEmail: String {
        if isVaildEmail {
            return "사용 가능한 이메일 입니다."
        } else {
            return "이메일을 올바르게 입력해주세요"
        }
    }
    // 비밀번호
    @Published var password = ""
    @Published var helperTextForPassword = ""
    // 로그인
    // 로그인 버튼 변수 ( disabled니 반대)
    var isButtonDisabled: Bool {
        !isVaildEmail || !(password.count >= 2)
    }
    // Alert
    @Published var showingAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
}

// MARK: - 함수

extension ContentViewModel {
    func isValidEmailAddr(string: String) {
        if string.wholeMatch(of: /[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}/) == nil {
            isVaildEmail = false
        } else {
            isVaildEmail = true
        }
    }
    func login() {
        do {
            try loginValidate()
        } catch LoginError.wrongIdOrPassword(let message, let title) {
            alertTitle = title
            alertMessage = message
            showingAlert = true
        // Default catch
        } catch {
            alertTitle = "로그인 실패"
            alertMessage = "알 수 없는 오류가 발생했습니다."
        }
    }
    func loginValidate() throws {
        guard email == "ohtt@apple.com" && password == "happyswift1!" else {
            throw LoginError.wrongIdOrPassword(message: "아이디 혹은 비밀번호가 맞지 않습니다.", title: "로그인 실패")
        }
        UIApplication.shared.open(URL(string: "https://www.notion.so/12-9277e1deca8f4be9849cfe4f4d3defea")!)
    }
}

// MARK: - 에러

enum LoginError: Error {
    case wrongIdOrPassword(message: String, title: String)
}
