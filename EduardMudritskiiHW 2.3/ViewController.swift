//
//  ViewController.swift
//  EduardMudritskiiHW 2.3
//
//  Created by Эдуард on 26.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let login = "User"
    let password = "Password"

    override func viewDidLoad() {
        super.viewDidLoad()
        // тут приводим текстфилды к делегату, чтоб потом проверять их
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
  // тут проверяем лщгин и пароль и вы водим аллерт если не подходят
    @IBAction func logInButton() {
        if loginTextField.text == login && passwordTextField.text == password {
        performSegue(withIdentifier: "goToWelcomeViewController", sender: nil)
        } else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
        }
   }
  // это аллерты напоминания
    @IBAction func reminderLogin() {
        showAlert(title: "Oops!", message: "Your name is User 🙁")
    }
    
    @IBAction func reminderPassword() {
        showAlert(title: "Oops!", message: "Your password is Password 🙁")
    }
}
// это создание аллерта
extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
// тут создаем переход курсора с поля логин в поле пароля
extension ViewController: UITextFieldDelegate {
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    // тут переводим имя юзера в лейбл на втором экране
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
        welcomeViewController.userName = loginTextField.text ?? ""
    }
    // тут очищаем поля после возврата, но пока не работает)))
    
    @IBAction  func unwind(segue: UIStoryboardSegue) {
        //guard let welcomeViewController = segue.source as? WelcomeViewController else { return }
        self.loginTextField.text = nil
        self.passwordTextField.text = nil
        
        guard segue.source is WelcomeViewController else { return }
        
    }
}
