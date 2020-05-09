/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidade;

/**
 *
 * @author Back Rei Delas
 */
public class Nfe_has_produto {
    private int nfe_id ;
    private int produto_id;
    private int quantidade;
    private double valorprodutos;
    private char ativo;

    public int getNfe_id() {
        return nfe_id;
    }

    public void setNfe_id(int nfe_id) {
        this.nfe_id = nfe_id;
    }

    public int getProduto_id() {
        return produto_id;
    }

    public void setProduto_id(int produto_id) {
        this.produto_id = produto_id;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getValorprodutos() {
        return valorprodutos;
    }

    public void setValorprodutos(double valorprodutos) {
        this.valorprodutos = valorprodutos;
    }

    public char getAtivo() {
        return ativo;
    }

    public void setAtivo(char ativo) {
        this.ativo = ativo;
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
