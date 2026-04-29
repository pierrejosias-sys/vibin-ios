import SwiftUI

struct ProfileView: View {
    @State private var isLoggedIn = false
    @State private var email = ""
    @State private var orders: [Order] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    if isLoggedIn {
                        // Logged In View
                        VStack(spacing: 16) {
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 80, height: 80)
                                .overlay(Text("👤").font(.system(size: 32)))
                            
                            Text(email)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .padding(.top, 20)
                        
                        // Orders
                        VStack(alignment: .leading, spacing: 12) {
                            Text("ORDERS")
                                .font(.system(size: 12, weight: .bold))
                                .kerning(3)
                                .foregroundColor(Color(red: 1.0, green: 0.4, blue: 0.3))
                            
                            if orders.isEmpty {
                                Text("No orders yet")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            } else {
                                ForEach(orders) { order in
                                    HStack {
                                        Text(order.id)
                                            .font(.system(size: 14, weight: .semibold))
                                        Spacer()
                                        Text(order.status.uppercased())
                                            .font(.system(size: 11))
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color.gray.opacity(0.1))
                                    }
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.05))
                        
                        Button(action: { isLoggedIn = false }) {
                            Text("LOG OUT")
                                .font(.system(size: 14, weight: .bold))
                                .kerning(2)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                    } else {
                        // Login View
                        VStack(spacing: 20) {
                            Text("VIBIN")
                                .font(.system(size: 36, weight: .black))
                            
                            Text("Log in to your account")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                            TextField("Email", text: $email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            
                            Button(action: {
                                if !email.isEmpty {
                                    isLoggedIn = true
                                }
                            }) {
                                Text("LOG IN")
                                    .font(.system(size: 14, weight: .bold))
                                    .kerning(2)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top, 60)
                    }
                }
            }
            .navigationTitle("PROFILE")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
