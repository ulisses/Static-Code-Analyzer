grammar livrofact;

tokens{
	TAGidfact = '@idfact:';
	TAGide = '@ide:';
	TAGnome = '@nome:';
	TAGnif = '@nif:';
	TAGmorada = '@morada:';
	TAGnib = '@nib:';
	TAGidr = '@idr:';
	TAGcorpo = '@corpo';
	TAGfimcorpo = '@fimcorpo';
	TAGproduto = '@p:';
}

@header{
	;
}

@members{

/*===========  Classe Emissor ============= */
public class Emissor{

	public String nome;
	public String morada;
	public int nib;
	public int nif;
	
	public Emissor(){
		this.nome = "";
		this.morada = "";
		this.nib = 0;
		this.nif = 0;
	}
	
	public Emissor(String name, String street, int enib, int enif){
		this.nome = name;
		this.morada = street;
		this.nib = enib;
		this.nif = enif;
	}
	
	public String toString(){
		return "\nDados Emissor" + "\nNome: " + this.nome + "\nMorada: " + this.morada + "\n";
		//return "\nEmissor\n";
	}

}

/*===========  Classe Receptor ============= */
public class Receptor{

	public String nome;
	public String morada;
	public int nif;
	
	public Receptor(){
		this.nome = "";
		this.morada = "";
		this.nif = 0;
	}
	
	public Receptor(String name, String street, int enif){
		this.nome = name;
		this.morada = street;
		this.nif = enif;
	}
	
	public String toString(){
		return "\nDados Receptor" + "\nNome: " + this.nome + "\nMorada: " + this.morada + "\n";
		//return "\nReceptor\n";
	}

}

/*===========  Produto ============= */
public class Produto{
	public String referencia;
	public String descricao;
	public int quantidade;
	public int precouni;
	
	public Produto(){
		this.referencia = "";
		this.descricao = "";
		this.precouni = 0;
		this.quantidade = 0;
	}
	
	public Produto(String ref, String desc, int pu, int qtd){
		this.referencia = ref;
		this.descricao = desc;
		this.precouni = pu;
		this.quantidade = qtd;
	}
	
	public String toString(){
		return "Produto -> " + this.referencia + "\nDescricao: " + this.descricao + "\nPreco por unidade: " + 
		this.precouni + "\nQuantidade" + this.quantidade + "\n";
	}
	
	public int precoTotal(){
		return this.precouni * this.quantidade;
	}
}

/*===========  Factura ============= */
public class Factura{
	public Emissor emi;
	public Receptor rec;
	public String id;
	public ArrayList<Produto> al;
	
	public Factura(){
		this.id = "";
		this.emi = new Emissor();
		this.rec = new Receptor();
		this.al = new ArrayList<Produto>();
	}
	
	public Factura(Emissor e, Receptor r){
		this.id = "";
		this.emi = new Emissor(e.nome, e.morada, e.nib, e.nif);
		this.rec = new Receptor(r.nome, r.morada, r.nif);
		this.al = new ArrayList<Produto>();
	}
	
	public void addProduto(Produto p){
		this.al.add(p);
	}
	
	public String toString(){
		int custo = 0;
		for(Produto p : this.al){
			custo += p.precoTotal();
		}
	
		return "\nFactura " + this.id + "\n" +
			this.emi.toString() + 
			this.rec.toString() + 
			"\nTotal de Produtos = " + this.al.size() +
			"\nCusto Total = " + custo;
	}
}

}

livrofact 
@init{ArrayList<Factura> livrof_in = new ArrayList<Factura>();}
	:	(factura {livrof_in.add($factura.factura_out);})+ {System.out.println("Livro de Facturas\n"); 
						for(Factura f : livrof_in){System.out.println(f.toString());}}
	;

factura 
returns[Factura factura_out]
@init{Factura factura_in = new Factura();}
	:	cabec[factura_in] {  }//System.out.println(factura_in.toString());}
		corpo[factura_in] { factura_out = factura_in; }
	;
	
cabec [Factura factura_in]

	:	idfact {$factura_in.id = $idfact.id_out;}
		ide[factura_in.emi]
		idr[factura_in.rec]
	;
	
corpo [Factura factura_in]	
	:	TAGcorpo
		(produto{$factura_in.addProduto($produto.prod_out);})+
		TAGfimcorpo
	;	
	
produto 
returns[Produto prod_out]
@init{Produto prod_in = new Produto();}	
	:	(TAGproduto	
		referencia {prod_in.referencia = $referencia.id_out;}
		precouni {prod_in.precouni = $precouni.pu_out;}
		quantidade {prod_in.quantidade = $quantidade.qtd_out;} 
		descricao {prod_in.descricao = $descricao.descri_out;}) {$prod_out = prod_in;}
		
	;	
	
referencia
returns[String id_out]
	:	ID{$id_out = $ID.text;}
	;	
	
descricao
returns[String descri_out]
	:	STRINGPLUS{$descri_out = $STRINGPLUS.text;}
	;	
	
quantidade	
returns[int qtd_out]
	:	NUM{$qtd_out = Integer.parseInt($NUM.text);}
	;	
	
precouni
returns[int pu_out]	
	:	NUM{$pu_out = Integer.parseInt($NUM.text);}
	;	
	
	
idfact 
returns[String id_out]
	:	numfact {$id_out = $numfact.id_out;}
	;
	
numfact
returns[String id_out]
	:	TAGidfact	ID{$id_out = $ID.text;}
	;
	
ide [Emissor emissor_in]

	:	TAGide	
		nome	{$emissor_in.nome = $nome.nome_out;}
		nif	{$emissor_in.nif = $nif.nif_out;}
		morada	{$emissor_in.morada = $morada.morada_out;}
		nib	{$emissor_in.nib = $nib.nib_out;}
	;
	
idr [Receptor receptor_in]	

	:	TAGidr	
		nome	{$receptor_in.nome = $nome.nome_out;}
		nif	{$receptor_in.nif = $nif.nif_out;}
		morada	{$receptor_in.morada = $morada.morada_out;}
	;

nome
returns[String nome_out]
	:	TAGnome	STRING{$nome_out = $STRING.text;}
	;
	
nif
returns[int nif_out]
	:	TAGnif	NUM{$nif_out = Integer.parseInt($NUM.text);}
	;

morada
returns[String morada_out]
	:	TAGmorada	STRINGPLUS{$morada_out = $STRINGPLUS.text;}
	;

nib
returns[int nib_out]
	:	TAGnib	NUM{$nib_out = Integer.parseInt($NUM.text);}
	;

NUM 	:	('0'..'9')+
	;

STRING	:	('a'..'z'|'A'..'Z')+
	;

ID	:	('a'..'z'|'A'..'Z'|'0'..'9')+
	;
	
STRINGPLUS	:	('a'..'z'|'A'..'Z'|'0'..'9'|'\.'|'º'|' ')+
	;

NS	:  	(' ' | '\t' | '\n' | 'r') { skip(); }
   	;