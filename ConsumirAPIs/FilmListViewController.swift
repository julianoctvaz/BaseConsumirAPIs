//
//  ViewController.swift
//  ConsumirAPIs
//
//  Created by Francisco Soares Neto on 20/08/20.
//  Copyright © 2020 Francisco Soares Neto. All rights reserved.
//

import UIKit

class FilmListViewController: UITableViewController {
//
    var colecaoDeFeatures: Location?
    var qtd_localizacao = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.load()
    }

    
    /// Carrega os dados do webservice
    func load() {
        let stringURL = "https://bikewise.org/api/v2/locations"
        //let stringURL = "https://bikewise.org/api/v2/incidents"
        let siteQueQueroDerrubar = URL(string:stringURL)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: siteQueQueroDerrubar) { (data, response, error) in
           //-------------------
            
            do{
                let decodificador = JSONDecoder()
                let colecaoDeFeatures_DentroDaFuncao = try decodificador.decode(Location.self, from: data!)
                
                DispatchQueue.main.async {
                   self.colecaoDeFeatures = colecaoDeFeatures_DentroDaFuncao
                    self.qtd_localizacao = colecaoDeFeatures_DentroDaFuncao.features.count
                    print(colecaoDeFeatures_DentroDaFuncao)
                    print("imprimindo agora o array omc os dados quardados \(String(describing: self.colecaoDeFeatures))")
                    self.tableView.reloadData() //essa funcao aqui é importante para recarregar as coisas
                }
             }
            catch{
                    print("Json falhou miseralmente: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                   //     self.colecaoDeFeatures = [] //apsodkopaskdpaos
                    }
                }
        //------------
                /* outra forma de fazer
                                                                 
                                                                 
    func processa(dados: Data?, resposta: URLResponse?, erro: Error?) {
        
        if let data = dados {
            
            let decoder = JSONDecoder()
            if let films = try? decoder.decode([Film].self, from: data) {
            
                DispatchQueue.main.async {
                    self.films = films
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
ai chama o completionHandler: processa na linha 30, inves em vez de fazer um closure (clausura by Castor)
                                                                 
        */                                                         
        }
                
        task.resume()
        print("Dps de rodar o resume")
        print(self.colecaoDeFeatures)

        // TODO: Carregar dados do webservice
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.qtd_localizacao
        //return self.colecaoDeFeatures.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Studio Ghibli Films"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! FilmTableViewCell
        
        // configura a célula
        // TODO: Configurar a célula
        // ...
        
       // cell.textLabel?.text = colecaoDeFeatures[indexPath.row].title
        cell.textLabel?.text = (colecaoDeFeatures?.features[indexPath.row].properties.type).map { $0.rawValue }
       // cell.textLabel?.text = (colecaoDeFeatures?.features[indexPath.row].type).map { $0.rawValue }
        cell.backgroundColor? = .randomColor()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFilm", case _ = segue.destination as? FilmViewController {
        //    nextVC?.film = colecaoDeFeatures[tableView.indexPathForSelectedRow!.row]
        }
    }
}

extension UIColor {
    class func randomColor(randomAlpha: Bool = false) -> UIColor {
        let redValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let greenValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let blueValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let alphaValue = randomAlpha ? CGFloat(arc4random_uniform(255)) / 255.0 : 1;

        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
}
