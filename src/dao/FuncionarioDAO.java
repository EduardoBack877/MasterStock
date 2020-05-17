
package dao;

import apoio.IDAOT;
import entidade.Funcionario;
import entidade.Pessoa;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class FuncionarioDAO implements IDAOT<Funcionario> { 
    
      ResultSet resultadoQ = null;

      
     // public boolean salvar(Funcionario o) {
          //try {
            //Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            
            
          
          
      //}
    
    
    @Override
    public boolean salvar(Funcionario o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean atualizar(Funcionario o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean excluir(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Funcionario> consultarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Funcionario> consultar(String criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Funcionario consultarId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
