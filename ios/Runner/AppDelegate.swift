import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    private let CHANNEL = "com.example.act_desafio_pokedex/channel"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
        methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "showDialog" {
                if let args = call.arguments as? [String: Any],
                   let name = args["name"] as? String,
                   let image = args["image"] as? String,
                   let id = args["id"] as? String,
                   let weight = args["weight"] as? String,
                   let height = args["height"] as? String {

                    let personDetail = PersonDetailEntity(name: name, image: image, id: id, weight: weight, height: height)
                    self?.showDialog(personDetail: personDetail, flutterResult: result)
                } else {
                    result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid or missing arguments", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func showDialog(personDetail: PersonDetailEntity, flutterResult: @escaping FlutterResult) {
        let alert = UIAlertController(title: "Pessoa Info", message: "Id: \(personDetail.id)\nNome: \(personDetail.name)\nImagem: \(personDetail.image)\nPeso: \(personDetail.weight)\nAltura: \(personDetail.height) cm", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            flutterResult("")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            flutterResult("")
        }))
        DispatchQueue.main.async {
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }

    struct PersonDetailEntity {
        let name: String
        let image: String
        let id: String
        let weight: String
        let height: String
    }
}