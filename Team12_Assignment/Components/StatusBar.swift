//
//  StatusBar.swift
//  Team12_Assignment
//
//  Created by KHJ on 2023/10/27.
//

import SwiftUI

struct StatusBar: View {
    @Binding var password: String
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 80, height: 2)
                .foregroundColor(password.count > 0 ? .red : .gray)
            Rectangle()
                .frame(width: 80, height: 2)
                .foregroundColor(
                    password.count >= 8 && stringHasNumber(password) ? .orange : .gray)
            Rectangle()
                .frame(width: 80, height: 2)
                .foregroundColor(
                    password.count >= 8 && stringHasNumber(password) &&
                    stringHasSpecialCharacter(password) ? .orange : .gray)
            Rectangle()
                .frame(width: 80, height: 2)
                .foregroundColor(
                    password.count >= 8 && stringHasNumber(password)
                    && stringHasMoreThanTwoSpecialCharacters(password) ? .green : .gray)
        }
    }
    // 숫자 있으면 true 없으면 false
    func stringHasNumber(_ string: String) -> Bool {
        return string.ranges(of: /\d/).count != 0
    }
    // 특수 문자 없는 경우에 true 있으면 false
    func stringHasSpecialCharacter(_ string: String) -> Bool {
        return string.ranges(of: /[^A-Za-z0-9]/).count != 0
    }
    func stringHasMoreThanTwoSpecialCharacters(_ string: String) -> Bool {
        return string.ranges(of: /[^A-Za-z0-9]/).count >= 2
    }
}

struct StatusBar_Previews: PreviewProvider {
    static var previews: some View {
        StatusBar(password: .constant("TestP2assworddd@@"))
    }
}
