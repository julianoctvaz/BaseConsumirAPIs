//
//  ViewController.swift
//  ConsumirAPIs
//
//  Created by Francisco Soares Neto on 20/08/20.
//  Copyright © 2020 Francisco Soares Neto. All rights reserved.
//

import UIKit

class FilmListViewController: UITableViewController {

    var filmsRetornados: [Film] = []
    var quantidade_filmes = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.load()
    }

    
    /// Carrega os dados do webservice
    func load() {
        
        let stringURL = "https://ghibliapi.herokuapp.com/films"
        let siteQueQueroDerrubar = URL(string:stringURL)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: siteQueQueroDerrubar) { (data, response, error) in
            
            do{
                let decodificador = JSONDecoder()
                let filmsRetornados_DentroDaFuncao =  try decodificador.decode(Array<Film>.self, from: data!)
                
                DispatchQueue.main.async {
                    self.filmsRetornados = filmsRetornados_DentroDaFuncao
                    self.quantidade_filmes = filmsRetornados_DentroDaFuncao.count
                    print(self.quantidade_filmes)
                     print(self.filmsRetornados)
                    self.tableView.reloadData() //essa funcao aqui é importante para recarregar as coisas
                }
             }
            catch{
                    print("Json falhou miseralmente: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.filmsRetornados = [] //apsodkopaskdpaos
                    }
                }
        }
                
        task.resume()
        print(self.filmsRetornados)

        // TODO: Carregar dados do webservice
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsRetornados.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Studio Ghibli Films"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! FilmTableViewCell
        
        // configura a célula
        // TODO: Configurar a célula
        // ...
        
        cell.textLabel?.text = filmsRetornados[indexPath.row].title
        cell.backgroundColor? = .randomColor()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFilm", case let nextVC = segue.destination as? FilmViewController {
            nextVC?.film = filmsRetornados[tableView.indexPathForSelectedRow!.row]
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
