import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Offers to copy the developer's address when no mail app accepts a `mailto:` link.
struct MailFallbackAlert: ViewModifier {
    @Binding var isPresented: Bool
    let email: String

    func body(content: Content) -> some View {
        content.alert(
            Text(LocalizedStringResource.module("Couldn't Open Mail")),
            isPresented: $isPresented
        ) {
            Button {
                copyEmail()
            } label: {
                Text(LocalizedStringResource.module("Copy Address"))
            }

            Button(role: .cancel) {} label: {
                Text(LocalizedStringResource.module("OK"))
            }
        } message: {
            Text(LocalizedStringResource.module("You can write to \(email) from any email app."))
        }
    }

    // SwiftUI has no clipboard API that works from a button on both platforms.
    private func copyEmail() {
        #if canImport(UIKit)
        UIPasteboard.general.string = email
        #elseif canImport(AppKit)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(email, forType: .string)
        #endif
    }
}

extension View {
    func mailFallbackAlert(isPresented: Binding<Bool>, email: String) -> some View {
        modifier(MailFallbackAlert(isPresented: isPresented, email: email))
    }
}
