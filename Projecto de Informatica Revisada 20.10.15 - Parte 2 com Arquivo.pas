Program Gestao_de_ARMAZEM_ACTUALIZADO;
 
const
  prod1= 'Computadores Desktops';
  prod2 = 'Computadores Laptops';
  prod3 = 'Discos Duros Externos';
  prod4 = 'Discos Duros Internos';
  prod5 = 'Flashes - USBs';
  prod6 = 'Memorias RAM';
  prod7 = 'Monitores';
  prod8 = 'Mouses';
  prod9 = 'Projectores';
  prod10 = 'Teclados';
  prod11 = 'UPS';
  prod18 = 'Precione 19 Adicionar Novo produto na lista';
  prod19 = 'Precione 0 para voltar ao Menu Principal';

type   
D_ENTRADAS,D_SAIDAS,D_DIASA  = record
													 Seg: integer;
													 ter: integer;
													 qua: integer;
													 qui: integer;
													 sex: integer;  
												
                          end;
type INFORMACAO_PESSOAL = record
                     nome,cargo, data: string[30];
                     idade : integer;
			               end;                   
type                          
   PRODUTO = record
          ITEM_NO_STOCK, Hnome, Hcargo, Hdata, HMES : string;
	      	QTD_ACTUAL, S_E, S_S, S_A, Hentrada,Hsaida, Hactual,Hidade: integer;
          ULT_ENTRADA, Sentrada, Ssaida,HDIA, HANO, Sactual: integer;
          ULT_SAIDA, DIA, MES, ANO, DIAH, MESH, ANOH: integer;
          DIASE : D_ENTRADAS;
          DIASS :  D_SAIDAS;
          DIASA : D_DIASA;
          INFO : INFORMACAO_PESSOAL;
    end;
													
type PRODT = array[1..20] of PRODUTO; 

var
PDI : file of PRODUTO; 
PROD : PRODT;

prod12,prod13,prod14,prod15, prod16, mesaux: string; 
numP, diaaux,anoaux ,I, Z, Eaux, Saux, Aaux,diareg,mesreg: integer;  Resp:char;


                                                                                  


procedure BOASVINDAS (I: integer) ;
begin
  textbackground(17);
  clrscr;
  delay(200);
  textbackground(17);
  textcolor(15);
  writeln;
  
  gotoxy(4,6);
  write(' |================================================================| ');
  gotoxy(4,10);
  write(' |================================================================| ');
  writeln; 
  textcolor(17);
  gotoxy(18,4);
  write (' INICIANDO O SOFTWARE DE GESTAO');
  writeln;
  delay(100);
  for I:= 5 to 70 do
  begin
    textcolor(12);
    gotoxy (I, 8);
    write('|');
    delay(10);
    
    textcolor(14);
    gotoxy (20, 15);
    write('CSG - Software 2015 ( All writes Reserved ) ');
    delay(100);
    
    gotoxy(25,3);
    write('.');
    gotoxy (17, 3);
    write ('               CARREGANDO...');
  end;
  delay(2000);
  textbackground(17);
  textcolor(15);
  gotoxy (17, 35);
  write ('          ENTER PARA CONTINUAR                               ');
  readln;
  for I:= 65 to 92 do
  begin
    textcolor(0);
    gotoxy(16,I);
    write(' .');
    delay(300);  
  end;
  clrscr;
  writeln;
  writeln;
  writeln;
  textcolor(14);
  gotoxy(3,6);
  write (' SEJA MUITO BEM VINDO AO SOFTWARE DE GESTAO DE ARMAZEM  ');
  delay(3000);
  gotoxy (19, 10);
  write (' CSG - SOFTWARE 2015    ');
  delay(2000);
  
end;

procedure BVtela1 (I: integer) ;
begin
  textbackground(17);
  clrscr;
  textbackground(17);
  textcolor(15);
  gotoxy(18,6);
  write (' INICIANDO O SOFTWARE DE GESTAO');
  gotoxy(4,12);
  write(' |================================================================| ');
  gotoxy(4,14);
  write(' |================================================================| ');
  writeln;
  
  for I:= 5 to 70 do
  begin
    textbackground(12);
    textcolor(12);
    gotoxy (I, 13);
    write(' ');
    delay(100);                                                                         
    
  end;
  
 
end; 



procedure Stockminimo (I, J: integer);
begin
  for I:= 1 to 45 do
  begin
    
    textcolor(0);
    gotoxy (I, 8);
    write('|');
    delay(50);
    textcolor(12);
    gotoxy(20,29);
    textcolor(12);
    write(' Stock Minimo Antigido !');
    delay(100);
    clrscr;
    
  end;
end;


	function DATA_VALIDA : boolean;             { INICIO DA FUNCAO DATA VALIDA }      { INICIO DA FUNCAO DATA VALIDA }
	var  D,M, A: string;  nr, ERRO, I: integer;
	
	 begin
	  
	  writeln;
	  write('       Digite a data no formato [ dd/mm/aaaa ]');
	  writeln;
	  writeln;
	  write('       Digite a data : '); read(PROD[1].INFO.data);
	  nr := length(PROD[1].INFO.data);
	  if (nr <> 10) then
	   begin
	     while (nr <> 10) do
	       begin
	        clrscr;
	        gotoxy(5,5);
	        textcolor(12);
	        write(' Formato errado, digite a data novamente');
	        writeln;
	        write(' Digite a data no formato [ dd/mm/aaaa ] : '); read(PROD[1].INFO.data);
	        nr := length(PROD[1].INFO.data);
	              
	      end;
	    end;
	   
	    D:= copy(PROD[1].INFO.data,1,2);
	    M:= copy(PROD[1].INFO.data,4,2);
	    A:= copy(PROD[1].INFO.data,7,4);    
	    
	    VAL(D ,PROD[1].DIA , ERRO);          { CONVERSAO DO STRING PARA INTEIRO }
	    VAL(M ,PROD[1].MES , ERRO);            
	    VAL(A ,PROD[1].ANO , ERRO);
	    textcolor(7);           
	    
		   if (PROD[1].ANO < 1000) or (PROD[1].MES > 10) or (PROD[1].INFO.data = '29/02/2015') or (PROD[1].DIA <= 0) or (PROD[1].DIA >31) then
	         begin
	          while ( nr <> 10 ) or (PROD[1].ANO < 2015) or (PROD[1].Mes > 10) or (PROD[1].INFO.data = '29/02/2015') or (PROD[1].DIA <= 0) or (PROD[1].DIA >31) do
	           begin
	             clrscr;
	             gotoxy(5,5);
	             textcolor(12);
	             write(' Ano/Mes nao validos, digite a data novamente');
	             writeln;
	             write(' Digite a data no formato [ dd/mm/aaaa ] : '); read(PROD[1].INFO.data);
	             nr := length(PROD[1].INFO.data);
	             D:= copy(PROD[1].INFO.data,1,2);
	             M:= copy(PROD[1].INFO.data,4,2);
	             A:= copy(PROD[1].INFO.data,7,4);    
	    
	             VAL(D ,PROD[1].DIA , ERRO);          { CONVERSAO DO STRING PARA INTEIRO }
	             VAL(M ,PROD[1].MES , ERRO);            
	             VAL(A ,PROD[1].ANO , ERRO);
	           end;   
	         end
	       else
	        begin
	           textbackground(0);
	           DATA_VALIDA:= TRUE;
	           clrscr;
	           writeln ;
	           writeln;
	           textcolor(11);
	           gotoxy(3, 7);
						 write (' Muito Obrigado ', PROD[1].INFO.nome,' a data : ',PROD[1].INFO.data,' é  Valida !');
						 writeln;
	           gotoxy(1, 5);
	           write ('=========================================================================');
	           
	           
	           for I:= 1 to 72 do
	           begin
	             gotoxy(I, 12);
	             write ('=');
	            delay(90);
	            if (I= 50) then
	             begin
	              gotoxy(23, 10);
	              write (' A Terminar de processar');
	             end;
	             
	             if (I = 50) then
	              begin
	                 gotoxy(I, 10);
	                 write('.');
	                 delay(210);
	              end;  
	              
	              if (I = 55) then
	                 begin
	                 gotoxy(I, 10);
	                 write('.');
	                 delay(210); 
	              end;
	              if (I = 60) then
	                 begin
	                 gotoxy(I, 10);
	                 write('.');
	                 delay(210); 
	              end;
	           end;
	          end;
	             
	  
	 end;                       { FIM DA FUNCAO DATA VALIDA }           { FIM DA FUNCAO DATA _VALIDA }
	 
	 
procedure CALCULO_H (var M: string);            { INICIO DA FUNCAO DATA VALIDA }      { INICIO DA FUNCAO DATA VALIDA }
var  nr, D, diasaux,days,I: integer;

begin
  case PROD[1].MES of
    1: M:= 'Janeiro';
    2: M:= 'Fevereiro';
    3: M:= 'Marco';
    4: M:= 'Abril';
    5: M:= 'Maio';
    6: M:= 'Junho';
    7: M:= 'Julho';
    8: M:= 'Agosto';
    9: M:= 'Setembro';
    10: M:= 'Outubro';
    11: M:= 'Novembro';
    12: M:= 'Dezembro';
  end;
  
 
  
		        for PROD[1].MES:= PROD[1].MES downto 1 do
		         begin
		          case PROD[1].MES of                                        
		            1, 3, 5, 7, 8, 10, 12: days:= 31;
		            4, 6, 9, 11: days:= 30;
		            2 : if (PROD[1].Ano mod 4 = 0) then
								     days:= 29
								    else
								     days:= 28;
		            else
		             writeln ;
		           end;
		           
		           diasaux:= diasaux + days;
		         end;
		         
		    		         
                   
end;                       { FIM DA FUNCAO DATA VALIDA }           { FIM DA FUNCAO DATA _VALIDA }

procedure MesRegistro(mes: integer; var M: string);             { INICIO DA FUNCAO DATA VALIDA }      { INICIO DA FUNCAO DATA VALIDA }
var  nr, D, diasaux,days,I: integer;

begin
  case MES of
    1: M:= 'Janeiro';
    2: M:= 'Fevereiro';
    3: M:= 'Marco';
    4: M:= 'Abril';
    5: M:= 'Maio';
    6: M:= 'Junho';
    7: M:= 'Julho';
    8: M:= 'Agosto';
    9: M:= 'Setembro';
    10: M:= 'Outubro';
    11: M:= 'Novembro';
    12: M:= 'Dezembro';
  end;

end;


 procedure MenuPrincipal (var I: char);        { INICIO DO MENU PRINCIPAL}
 begin 
   textbackground(17);
   clrscr;
   textbackground(17);
   textcolor(14);                                     //( INICIO DO MENU PRINCIPAL}
   writeln;
   writeln;
   writeln ('| ------------  Menu Principal do Programa SCG -----------------| ');
   writeln;
   textcolor(15);
   writeln;
   writeln ('                        ESCOLHA A OPCAO !!                        ');
   writeln;
   writeln ('  Digite o numero 1 = Para Visualizar o menu dos Itens no Stock    ');
   writeln;
   writeln;
   writeln ('  Digite o numero 2  = Para Visualizar o Balanco    ');
   writeln;
   writeln;
   writeln ('  Digite o numero 3  = Para Visualizar o Historico    ');
   writeln;
   writeln;
   writeln ('  Digite o numero 4  = Para Alterar algum registro no Historico    ');
   writeln;
   writeln;
   textcolor(12);
   writeln ('  Para Sair Digite 0  ( ZERO )   ');
   textcolor(15);                    //// MenuPrincipal
	 writeln;
	 write(' => '); read(I);


 end;                { END  DO MENU PRINCIPAL}

procedure Menu (I: integer);        { Menu dos itens no Stock}
begin
  textbackground(0);                                                                                
   clrscr;
   textbackground(0);
   textcolor(7);
{  prod1:= 'Computadores Desktops';
  prod2:= 'Computadores Laptops';
  prod3:= 'Discos Duros Externos';
  prod4:= 'Discos Duros Internos';
  prod5:= 'Flashes - USBs';
  prod6:= 'Memorias RAM';
  prod7:= 'Monitores';
  prod8:= 'Mouses';
  prod9:= 'Projectores';
  prod10:= 'Teclados';
  prod11:= 'UPS';
  prod12:= 'Adicionar Novo produto na lista';
  prod13:= 'Precione 0 para voltar ao Menu Principal'; }
  
  prod[1].ITEM_NO_STOCK := prod1;
  prod[2].ITEM_NO_STOCK := prod2;
  prod[3].ITEM_NO_STOCK := prod3;
  prod[4].ITEM_NO_STOCK := prod4;
  prod[5].ITEM_NO_STOCK := prod5;                 
  prod[6].ITEM_NO_STOCK := prod6;
  prod[7].ITEM_NO_STOCK := prod7;
  prod[8].ITEM_NO_STOCK := prod8;
  prod[9].ITEM_NO_STOCK := prod9;
  prod[10].ITEM_NO_STOCK := prod10;
  prod[11].ITEM_NO_STOCK := prod11;
  prod[12].ITEM_NO_STOCK := prod18;
  prod[13].ITEM_NO_STOCK := prod19;
  writeln;
  writeln;
  writeln (' .........Menu dos Itens no Stock (Selecione o Item Pelo Numero ).............');
  writeln;
  writeln ('|------------------------------------------|');
  writeln ;
  for I:= 1 to 20 do
  begin
   Z :=length(PROD[I].ITEM_NO_STOCK);
   if (Z <> 0) then
    begin
     writeln (' ',I,' - ',prod[I].ITEM_NO_STOCK);
     writeln;
    end;
  end;
  writeln;
  
	write(' => ');  read(numP);
  writeln;                                                                                                                                  
end;                                                                                                                                        

procedure NOVOMenu1 (I: integer);        { Menu dos itens no Stock}
begin
  textbackground(0);                                                                                
   clrscr;
   textbackground(0);
   textcolor(7);
  
  
  prod[1].ITEM_NO_STOCK := prod1;
  prod[2].ITEM_NO_STOCK := prod2;
  prod[3].ITEM_NO_STOCK := prod3;
  prod[4].ITEM_NO_STOCK := prod4;
  prod[5].ITEM_NO_STOCK := prod5;                 
  prod[6].ITEM_NO_STOCK := prod6;
  prod[7].ITEM_NO_STOCK := prod7;
  prod[8].ITEM_NO_STOCK := prod8;
  prod[9].ITEM_NO_STOCK := prod9;
  prod[10].ITEM_NO_STOCK := prod10;
  prod[11].ITEM_NO_STOCK := prod11;
  prod[12].ITEM_NO_STOCK := prod12;
  prod[13].ITEM_NO_STOCK := prod13;
  writeln;
  writeln;
  writeln (' .........Menu dos Itens no Stock (Selecione o Item Pelo Numero ).............');
  writeln;
  writeln ('|------------------------------------------|');
  writeln ;
  for I:= 1 to 13 do
  begin
    writeln (' ',I,' - ',prod[I].ITEM_NO_STOCK);
    writeln;
  end;
  writeln;
  
	write(' => ');  read(numP);
  writeln;                                                                                                                                  
end;                      
   
procedure compDesktop (var numD: integer); { Item - I}

begin
  textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Computador Desktop  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' ');  read(numD);
	write(' => ');
  writeln;
  
end;

procedure BalancoDesktop ;
begin
	
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock do Computadores Desktop ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Computador Desktop ');
  gotoxy (28,11);
  
  write (PROD[1].QTD_ACTUAL);
  gotoxy (48,11);
  
  write (PROD[1].ULT_ENTRADA);
  gotoxy (65,11);
  
  write (PROD[1].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
 
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                        
end;

procedure compLaptop (var numL: integer); { Item - I}

begin
	textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Computador Laptop  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln ;
	write(' => ');  read(numL);
  writeln;
  
end;
  
procedure BalancoLaptop ;
begin
 // read(PDI,PROD[2]);
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos Laptop ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Computadores Laptops');
  gotoxy (28,11);
  write (PROD[2].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[2].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[2].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                        
end;

procedure HDexterno (var numD: integer); { Item - I}

begin
	textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Disco Externo  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' => ');  read(numD);        
  writeln;
  
end;

procedure BalancoHDexterno ;
begin
 // read(PDI,PROD[3]);
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos Discos Externos ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Discos Externos ');
  gotoxy (28,11);
  write (PROD[3].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[3].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[3].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  read(PDI,PROD[1]);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                                                                    
end;

procedure HDinterno (var numD: integer); { Item - I}

begin
	textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Disco Interno  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' => ');  read(numD);        
  writeln;
  
end;

procedure BalancoHDinterno ;
begin
///  read(PDI,PROD[4]);
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos Discos Internos ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Discos Internos ');
  gotoxy (28,11);
  write (PROD[4].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[4].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[4].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                                                                    
end;

procedure Flashes (var numD: integer); { Item - I}

begin
  textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Flashes USB  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' ');  read(numD);
	write(' => ');
  writeln;
  
end;

procedure BalancoFlashes ;
begin
//  read(PDI,PROD[5]);
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos Flashes ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Flashes USB ');
  gotoxy (28,11);
  write (PROD[5].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[5].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[5].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                        
end;

procedure MemoriaRAM (var numD: integer); { Item - I}

begin
  
  textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Memorias RAM  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' ');  read(numD);
	write(' => ');
  writeln;
  
end;

procedure BalancoMemoriaRAM ;
begin
//  read(PDI,PROD[6]);
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock das Memorias');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Memorias RAM ');
  gotoxy (28,11);
  write (PROD[6].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[6].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[6].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                        
end;

procedure Monitor (var numD: integer); { Item - I}

begin
  textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Monitor ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' ');  read(numD);
	write(' => ');
  writeln;
  
end;

procedure BalancoMonitor ;
begin
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos Monitores ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Monitores ');
  gotoxy (28,11);
  write (PROD[7].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[7].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[7].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                        
end;

procedure Mouse (var numD: integer); { Item - I}

begin
	textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Mouse  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' => ');  read(numD);        
  writeln;
  
end;

procedure BalancoMouse ;
begin
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos Mouses ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Mouses ');
  gotoxy (28,11);
  write (PROD[8].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[8].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[8].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                                                                    
end;

procedure Projector (var numD: integer); { Item - I}

begin
  textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Projector  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' ');  read(numD);
	write(' => ');
  writeln;
  
end;

procedure BalancoProjector ;
begin
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos Projectores ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Projectores ');
  gotoxy (28,11);
  write (PROD[9].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[9].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[9].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                        
end;

procedure Teclado (var numD: integer); { Item - I}

begin
  textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : Teclado  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' ');  read(numD);
	write(' => ');
  writeln;
  
end;

procedure BalancoTeclado ;
begin
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos Teclados ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('Teclados ');
  gotoxy (28,11);
  write (PROD[10].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[10].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[10].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                        
end;

procedure UPS (var numD: integer); { Item - I}

begin
	textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(155);
  writeln;
  writeln;
  writeln ('    Item Selecionado : UPS  ');
  writeln;
  writeln;
  writeln (' O que deseja fazer ?');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' Selecione numero 1 = registrar a entrada');
  writeln ;
  writeln (' Selecione numero 2 = registrar a saida');
  writeln ;
  writeln (' Selecione numero 3 = Visualizar o Balanco');
  writeln ;
  writeln (' Selecione numero 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' => ');  read(numD);        
  writeln;
  
end;

procedure BalancoUPS ;
begin
  textbackground(21);
  clrscr;
  textbackground(21);
  textcolor(15);
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos UPS ');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  gotoxy (3,11);
  write ('UPS ');
  gotoxy (28,11);
  write (PROD[11].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[11].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[11].ULT_SAIDA);
  gotoxy (1,16);
  write ('|===========================================================================|');
  gotoxy (3,30);
  write ('Usuario A Visualizar o Balanco : ',PROD[1].INFO.nome);
  gotoxy (3,32);
  write ('Na Data de : ');
  gotoxy (3,34);
  write ('Dia : ',PROD[1].DIA);
  gotoxy (3,35);
  write ('Mes : ',PROD[1].MES);
  gotoxy (3,36);
  write ('Ano : ',PROD[1].ANO);
  gotoxy (25,46);
  textcolor(15);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                                                                    
end;

procedure AlterarReg (var numD: integer); { Item - I}

begin
  textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(10);
  writeln;
  writeln;
  writeln;
  writeln (' Selecione o registro a alterar pelo numero ');
  writeln;
  writeln;
  delay (1000);
  writeln ;
  writeln (' 1 : Nome');
  writeln (' 2 : Idade');
  writeln (' 3 : Cargo');
  writeln (' 4 : Data');
  writeln (' 5 : Quantidades de Entrada ');
  writeln (' 6 : Quantidades de Saida');
  textcolor(12);
  writeln (' 0 = Voltar ao Menu');
  writeln;
  writeln;
	write(' ');  
	write(' => '); read(numD);
  writeln;
  
end;


procedure MenuBalanco (var N: integer);
begin
  textbackground(0);
  clrscr;
  textbackground(0);
  textcolor(14);
  writeln;
	 writeln;
	 writeln ('          Esta no Submenu : Vizualizar o Balanco  ');
	 gotoxy(10,8);
	 writeln ('     Escolha o Balanco a Visualizar !       ');
	 writeln;
	 delay(2000);                                                     
	 writeln ('|============  *******  ********  *******  ********  ==================|');
	 writeln;
	 writeln;
	 writeln ('  Numero 1 = Visualizar Balanco Diario ');
  writeln ;
  writeln ('  Numero 2 = Visualizar Balanco Semanal ');
  writeln ;
  writeln ;
   textcolor(12);
  writeln ('  Numero 0 = Sair para O menu Principal ');
	 writeln ;
	 writeln ;
	 writeln ('|=======================================================================|');
   writeln;
   write(':> '); read(N);
                                                                                                         
end;

procedure BalancoDiario ;
begin
  textbackground(5);
  clrscr;
  textbackground(5);
  textcolor(14);
{   prod1:= 'Computadores Desktops';
  prod2:= 'Computadores Laptops';
  prod3:= 'Discos Duros Externos';
  prod4:= 'Discos Duros Internos';
  prod5:= 'Flashes - USBs';
  prod6:= 'Memorias RAM';
  prod7:= 'Monitores';
  prod8:= 'Mouses';
  prod9:= 'Projectores';
  prod10:= 'Teclados';
  prod11:= 'UPS';
  prod12:= 'Adicionar Novo produto na lista';
  prod13:= 'Precione 0 para voltar ao Menu Principal';
                                                        }
  prod[1].ITEM_NO_STOCK := prod1;
  prod[2].ITEM_NO_STOCK := prod2;
  prod[3].ITEM_NO_STOCK := prod3;
  prod[4].ITEM_NO_STOCK := prod4;
  prod[5].ITEM_NO_STOCK := prod5;
  prod[6].ITEM_NO_STOCK := prod6;
  prod[7].ITEM_NO_STOCK := prod7;
  prod[8].ITEM_NO_STOCK := prod8;
  prod[9].ITEM_NO_STOCK := prod9;
  prod[10].ITEM_NO_STOCK := prod10;
  prod[11].ITEM_NO_STOCK := prod11;
  prod[12].ITEM_NO_STOCK := prod12;
  prod[13].ITEM_NO_STOCK := prod13;
  gotoxy (14,4);
  write ('Balanco Actual do Stock dos Itens');
  gotoxy(1,7); 
  writeln ('|=======================================================================|');
  gotoxy(1,40);
  writeln ('|=======================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (25,9);
  write ('Qtd Actual ');
  gotoxy (40,9);
  write ('Ult. Qtd Entrada ');
  gotoxy (60,9);
  write ('Ult. Qtd Saida ');
  textcolor(15);
  gotoxy (3,11);
  write (PROD[1].ITEM_NO_STOCK);
  gotoxy (28,11);
  write (PROD[1].QTD_ACTUAL);
  gotoxy (48,11);
  write (PROD[1].ULT_ENTRADA);
  gotoxy (65,11);
  write (PROD[1].ULT_SAIDA);
  gotoxy (3,13);
  write (PROD[2].ITEM_NO_STOCK);
  gotoxy (28,13);
  write (PROD[2].QTD_ACTUAL);
  gotoxy (48,13);
  write (PROD[2].ULT_ENTRADA);
  gotoxy (65,13);
  write (PROD[2].ULT_SAIDA);
   gotoxy (3,15);
  write (PROD[3].ITEM_NO_STOCK);
  gotoxy (28,15);
  write (PROD[3].QTD_ACTUAL);
  gotoxy (48,15);
  write (PROD[3].ULT_ENTRADA);
  gotoxy (65,15);
  write (PROD[3].ULT_SAIDA);
  gotoxy (3,17);
  write (PROD[4].ITEM_NO_STOCK);
  gotoxy (28,17);
  write (PROD[4].QTD_ACTUAL);
  gotoxy (48,17);
  write (PROD[4].ULT_ENTRADA);
  gotoxy (65,17);
  write (PROD[4].ULT_SAIDA);
  gotoxy (3,19);
  write (PROD[5].ITEM_NO_STOCK);
  gotoxy (28,19);
  write (PROD[5].QTD_ACTUAL);
  gotoxy (48,19);
  write (PROD[5].ULT_ENTRADA);
  gotoxy (65,19);
  write (PROD[5].ULT_SAIDA);
  gotoxy (3,21);
  write (PROD[6].ITEM_NO_STOCK);
  gotoxy (28,21);
  write (PROD[6].QTD_ACTUAL);
  gotoxy (48,21);
  write (PROD[6].ULT_ENTRADA);
  gotoxy (65,21);
  write (PROD[6].ULT_SAIDA);
   gotoxy (3,23);
  write (PROD[7].ITEM_NO_STOCK);
  gotoxy (28,23);
  write (PROD[7].QTD_ACTUAL);
  gotoxy (48,23);
  write (PROD[7].ULT_ENTRADA);
  gotoxy (65,23);
  write (PROD[7].ULT_SAIDA);
  gotoxy (3,25);
  write (PROD[8].ITEM_NO_STOCK);
  gotoxy (28,25);
  write (PROD[8].QTD_ACTUAL);
  gotoxy (48,25);
  write (PROD[8].ULT_ENTRADA);
  gotoxy (65,25);
  write (PROD[8].ULT_SAIDA);
  gotoxy (3,27);
  write (PROD[9].ITEM_NO_STOCK);
  gotoxy (28,27);
  write (PROD[9].QTD_ACTUAL);
  gotoxy (48,27);
  write (PROD[9].ULT_ENTRADA);
  gotoxy (65,27);
  write (PROD[9].ULT_SAIDA);
  gotoxy (3,29);
  write (PROD[10].ITEM_NO_STOCK);
  gotoxy (28,29);
  write (PROD[10].QTD_ACTUAL);
  gotoxy (48,29);
  write (PROD[10].ULT_ENTRADA);
  gotoxy (65,29);
  write (PROD[10].ULT_SAIDA);
  gotoxy (3,31);
  write (PROD[11].ITEM_NO_STOCK);
  gotoxy (28,31);
  write (PROD[11].QTD_ACTUAL);
  gotoxy (48,31);
  write (PROD[11].ULT_ENTRADA);
  gotoxy (65,31);
  write (PROD[11].ULT_SAIDA);
  gotoxy (3,39);
  write ('Soma Total : ');
  gotoxy (28,39);
  write (PROD[1].Sactual);
  gotoxy (48,39);
  write (PROD[1].Sentrada);
  gotoxy (65,39);
  write (PROD[1].Ssaida);
  gotoxy (1,43);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                                                                                           
end;

procedure BalancoSemanal (N : integer) ;
var  I, X, CONT: integer;
begin
	textbackground(5);
  clrscr;
  textbackground(5);
  textcolor(14);
{  prod1:= 'Computadores Desktops';
  prod2:= 'Computador Laptops';
  prod3:= 'Discos Duros Externos';
  prod4:= 'Discos Duros Internos';
  prod5:= 'Flashes - USBs';
  prod6:= 'Memorias RAM';
  prod7:= 'Monitores';
  prod8:= 'Mouses';
  prod9:= 'Projectores';
  prod10:= 'Teclados';
  prod11:= 'UPS';
  prod12:= 'Adicionar Novo produto na lista';
  prod13:= 'Precione 0 para voltar ao Menu Principal';  }
  
  prod[1].ITEM_NO_STOCK := prod1;
  prod[2].ITEM_NO_STOCK := prod2;
  prod[3].ITEM_NO_STOCK := prod3;
  prod[4].ITEM_NO_STOCK := prod4;
  prod[5].ITEM_NO_STOCK := prod5;
  prod[6].ITEM_NO_STOCK := prod6;
  prod[7].ITEM_NO_STOCK := prod7;
  prod[8].ITEM_NO_STOCK := prod8;
  prod[9].ITEM_NO_STOCK := prod9;
  prod[10].ITEM_NO_STOCK := prod10;
  prod[11].ITEM_NO_STOCK := prod11;
  prod[12].ITEM_NO_STOCK := prod18;
  prod[13].ITEM_NO_STOCK := prod19;
  gotoxy (14,3);
  write ('Balanco Semanal do Stock dos Itens');
  gotoxy(1,7); 
  writeln ('|==============================================================================|');
  gotoxy(1,51);
    writeln ('|==============================================================================|');
  textcolor(12);
  X:= 1;
  for I:= 1 to 10 do
   begin
    X:= (4*I) + 7;
	  gotoxy (1,X);     // CICLO DAS LINHAS
  writeln ('|==============================================================================|');
   end;
  textcolor(14);
  for I:= 1 to 11 do
   begin
    X:= (4*I) + 5;          // CICLO DOS PRODUTOS NO STOCK
    gotoxy (2,X);
    write (PROD[I].ITEM_NO_STOCK);
   end;
     TEXTCOLOR(10);
   
  
    
     gotoxy(37,9);
     write(PROD[1].DIASE.seg);
     gotoxy(37,13);
     write(PROD[2].DIASE.seg);
     gotoxy(37,17);
     write(PROD[3].DIASE.seg);
     gotoxy(37,21);
     write(PROD[4].DIASE.seg);
     gotoxy(37,25);
     write(PROD[5].DIASE.seg);     // CONTROLO DAS ENTRADAS PARA A SEGUNDA
     gotoxy(37,29);
     write(PROD[6].DIASE.seg);
     gotoxy(37,33);
     write(PROD[7].DIASE.seg);
     gotoxy(37,37);
     write(PROD[8].DIASE.seg);
     gotoxy(37,41);
     write(PROD[9].DIASE.seg);
     gotoxy(37,45);
     write(PROD[10].DIASE.seg);
     gotoxy(37,49);
     write(PROD[11].DIASE.seg);    
     
     gotoxy(37,10);
     write(PROD[1].DIASS.seg);
     gotoxy(37,14);
     write(PROD[2].DIASS.seg);
     gotoxy(37,18);
     write(PROD[3].DIASS.seg);
     gotoxy(37,22);
     write(PROD[4].DIASS.seg);
     gotoxy(37,26);
     write(PROD[5].DIASS.seg);     // CONTROLO DAS SAIDAS PARA A SEGUNDA
     gotoxy(37,30);
     write(PROD[6].DIASS.seg);
     gotoxy(37,34);
     write(PROD[7].DIASS.seg);
     gotoxy(37,38);
     write(PROD[8].DIASS.seg);
     gotoxy(37,42);
     write(PROD[9].DIASS.seg);
     gotoxy(37,46);
     write(PROD[10].DIASS.seg);
     gotoxy(37,50);
     write(PROD[11].DIASS.seg);
     
     gotoxy(37,8);
     write(PROD[1].DIASA.seg);
     gotoxy(37,12);
     write(PROD[2].DIASA.seg);
     gotoxy(37,16);
     write(PROD[3].DIASA.seg);
     gotoxy(37,20);
     write(PROD[4].DIASA.seg);
     gotoxy(37,24);
     write(PROD[5].DIASA.seg);   // CONTROLO DAS ENTRADAS PARA A SEGUNDA
     gotoxy(37,28);
     write(PROD[6].DIASA.seg);
     gotoxy(37,32);
     write(PROD[7].DIASA.seg);
     gotoxy(37,36);
     write(PROD[8].DIASA.seg);
     gotoxy(37,40);
     write(PROD[9].DIASA.seg);
     gotoxy(37,44);
     write(PROD[10].DIASA.seg);
     gotoxy(37,48);
     write(PROD[11].DIASA.seg);
     
     gotoxy(45,9);
     write(PROD[1].DIASE.ter);
     gotoxy(45,13);
     write(PROD[2].DIASE.ter);
     gotoxy(45,17);
     write(PROD[3].DIASE.ter);
     gotoxy(45,21);
     write(PROD[4].DIASE.ter);
     gotoxy(45,25);
     write(PROD[5].DIASE.ter);
     gotoxy(45,29);                  // CONTROLO DAS ENTRADAS PARA A TERCA
     write(PROD[6].DIASE.ter);
     gotoxy(45,33);
     write(PROD[7].DIASE.ter);
     gotoxy(45,37);
     write(PROD[8].DIASE.ter);
     gotoxy(45,41);
     write(PROD[9].DIASE.ter);
     gotoxy(45,45);
     write(PROD[10].DIASE.ter);
     gotoxy(45,49);
     write(PROD[11].DIASE.ter);
    
     gotoxy(45,10);
     write(PROD[1].DIASS.ter);
     gotoxy(45,14);
     write(PROD[2].DIASS.ter);
     gotoxy(45,18);
     write(PROD[3].DIASS.ter);
     gotoxy(45,22);
     write(PROD[4].DIASS.ter);
     gotoxy(45,26);
     write(PROD[5].DIASS.ter);    // CONTROLO DAS SAIDAS PARA A SEGUNDA
     gotoxy(45,30);
     write(PROD[6].DIASS.ter);
     gotoxy(45,34);
     write(PROD[7].DIASS.ter);
     gotoxy(45,38);
     write(PROD[8].DIASS.ter);
     gotoxy(45,42);
     write(PROD[9].DIASS.ter);
     gotoxy(45,46);
     write(PROD[10].DIASS.ter);
     gotoxy(45,50);
     write(PROD[11].DIASS.ter);
			
	   gotoxy(45,8);
     write(PROD[1].DIASA.ter);
     gotoxy(45,12);
     write(PROD[2].DIASA.ter);
     gotoxy(45,16);
     write(PROD[3].DIASA.ter);
     gotoxy(45,20);
     write(PROD[4].DIASA.ter);
     gotoxy(45,24);
     write(PROD[5].DIASA.ter);// CONTROLO DAS ENTRADAS PARA A SEGUNDA
     gotoxy(45,28);
     write(PROD[6].DIASA.ter);
     gotoxy(45,32);
     write(PROD[7].DIASA.ter);
     gotoxy(45,36);
     write(PROD[8].DIASA.ter);
     gotoxy(45,40);
     write(PROD[9].DIASA.ter);
     gotoxy(45,44);
     write(PROD[10].DIASA.ter);
     gotoxy(45,48);
     write(PROD[11].DIASA.ter);
     
     gotoxy(53,9);
     write(PROD[1].DIASE.ter);
     gotoxy(53,13);
     write(PROD[2].DIASE.ter);
     gotoxy(53,17);                           // CONTROLO NAS QUARTAS
     write(PROD[3].DIASE.ter);
     gotoxy(53,21);
     write(PROD[4].DIASE.ter);
     gotoxy(53,25);
     write(PROD[5].DIASE.ter);
     gotoxy(53,29);
     write(PROD[6].DIASE.ter);
     gotoxy(53,33);
     write(PROD[7].DIASE.ter);
     gotoxy(53,37);
     write(PROD[8].DIASE.ter);
     gotoxy(53,41);
     write(PROD[9].DIASE.ter);
     gotoxy(53,45);
     write(PROD[10].DIASE.ter);
     gotoxy(53,49);
     write(PROD[11].DIASE.ter);
    
     gotoxy(53,10);
     write(PROD[1].DIASS.qua);
     gotoxy(53,14);
     write(PROD[2].DIASS.qua);
     gotoxy(53,18);
     write(PROD[3].DIASS.qua);
     gotoxy(53,22);
     write(PROD[4].DIASS.qua);
     gotoxy(53,26);
     write(PROD[5].DIASS.qua);   // CONTROLO DAS SAIDAS PARA A SEGUNDA
     gotoxy(53,30);
     write(PROD[6].DIASS.qua);
     gotoxy(53,34);
     write(PROD[7].DIASS.qua);
     gotoxy(53,38);
     write(PROD[8].DIASS.qua);
     gotoxy(53,42);
     write(PROD[9].DIASS.qua);
     gotoxy(53,46);
     write(PROD[10].DIASS.qua);
     gotoxy(53,50);
     write(PROD[11].DIASS.qua);
    
     gotoxy(53,8);
     write(PROD[1].DIASA.qua);
     gotoxy(53,12);
     write(PROD[2].DIASA.qua);
     gotoxy(53,16);
     write(PROD[3].DIASA.qua);
     gotoxy(53,20);
     write(PROD[4].DIASA.qua);
     gotoxy(53,24);
     write(PROD[5].DIASA.qua);    // CONTROLO DAS ENTRADAS PARA A SEGUNDA
     gotoxy(53,28);
     write(PROD[6].DIASA.qua);
     gotoxy(53,32);
     write(PROD[7].DIASA.qua);
     gotoxy(53,36);
     write(PROD[8].DIASA.qua);
     gotoxy(53,40);
     write(PROD[9].DIASA.qua);
     gotoxy(53,44);
     write(PROD[10].DIASA.qua);
     gotoxy(53,48);
     write(PROD[11].DIASA.qua);
     
    
     gotoxy(60,9);
     write(PROD[1].DIASE.qui);
     gotoxy(60,13);
     write(PROD[2].DIASE.qui);
     gotoxy(60,17);
     write(PROD[3].DIASE.qui);
     gotoxy(60,21);
     write(PROD[4].DIASE.qui);
     gotoxy(60,25);                                              // CONTROLO DAS ENTRADAS PARA AS QUINTAS
     write(PROD[5].DIASE.qui);
     gotoxy(60,29);
     write(PROD[6].DIASE.qui);
     gotoxy(60,33);
     write(PROD[7].DIASE.qui);
     gotoxy(60,37);
     write(PROD[8].DIASE.qui);
     gotoxy(60,41);
     write(PROD[9].DIASE.qui);
     gotoxy(60,45);
     write(PROD[10].DIASE.qui);
     gotoxy(60,49);
     write(PROD[11].DIASE.qui);
     
     gotoxy(60,10);
     write(PROD[1].DIASS.qui);
     gotoxy(60,14);
     write(PROD[2].DIASS.qui);
     gotoxy(60,18);
     write(PROD[3].DIASS.qui);
     gotoxy(60,22);
     write(PROD[4].DIASS.qui);
     gotoxy(60,26);
     write(PROD[5].DIASS.qui);   // CONTROLO DAS SAIDAS PARA A SEGUNDA
     gotoxy(60,30);
     write(PROD[6].DIASS.qui);
     gotoxy(60,34);
     write(PROD[7].DIASS.qui);
     gotoxy(60,38);
     write(PROD[8].DIASS.qui);
     gotoxy(60,42);
     write(PROD[9].DIASS.qui);
     gotoxy(60,46);
     write(PROD[10].DIASS.qui);
     gotoxy(60,50);
     write(PROD[11].DIASS.qui);
     
      gotoxy(60,8);
     write(PROD[1].DIASA.qui);
     gotoxy(60,12);
     write(PROD[2].DIASA.qui);
     gotoxy(60,16);
     write(PROD[3].DIASA.qui);
     gotoxy(60,20);
     write(PROD[4].DIASA.qui);
     gotoxy(60,24);
     write(PROD[5].DIASA.qui);  // CONTROLO DAS ENTRADAS PARA A SEGUNDA
     gotoxy(60,28);
     write(PROD[6].DIASA.qui);
     gotoxy(60,32);
     write(PROD[7].DIASA.qui);
     gotoxy(60,36);
     write(PROD[8].DIASA.qui);
     gotoxy(60,40);
     write(PROD[9].DIASA.qui);
     gotoxy(60,44);
     write(PROD[10].DIASA.qui);
     gotoxy(60,48);
     write(PROD[11].DIASA.qui);
     
   { for CONT:= 8 to 50 do
    begin
       I:=1;                                            // CONTROLO DAS ENTRADAS PARA AS QSEXTAS
      if (CONT mod 4 = 0) then
       begin
         X:= CONT+1;
         gotoxy(68,X);
         write(DIASE[I].sex);
       end;
       I := I + 1;
    end;       }
    
     gotoxy(68,9);
     write(PROD[1].DIASE.sex);
     gotoxy(68,13);
     write(PROD[2].DIASE.sex);
     gotoxy(68,17);
     write(PROD[3].DIASE.sex);
     gotoxy(68,21);
     write(PROD[4].DIASE.sex);
     gotoxy(68,25);
     write(PROD[5].DIASE.sex);
     gotoxy(68,29);
     write(PROD[6].DIASE.sex);
     gotoxy(68,33);
     write(PROD[7].DIASE.sex);
     gotoxy(68,37);
     write(PROD[8].DIASE.sex);
     gotoxy(68,41);
     write(PROD[9].DIASE.sex);
     gotoxy(68,45);
     write(PROD[10].DIASE.sex);
     gotoxy(68,49);
     write(PROD[11].DIASE.sex);
 
      gotoxy(68,10);
     write(PROD[1].DIASS.sex);
     gotoxy(68,14);
     write(PROD[2].DIASS.sex);
     gotoxy(68,18);
     write(PROD[3].DIASS.sex);
     gotoxy(68,22);
     write(PROD[4].DIASS.sex);
     gotoxy(68,26);
     write(PROD[5].DIASS.sex);  // CONTROLO DAS SAIDAS PARA A SEGUNDA
     gotoxy(68,30);
     write(PROD[6].DIASS.sex);
     gotoxy(68,34);
     write(PROD[7].DIASS.sex);
     gotoxy(68,38);
     write(PROD[8].DIASS.sex);
     gotoxy(68,42);
     write(PROD[9].DIASS.sex);
     gotoxy(68,46);
     write(PROD[10].DIASS.sex);
     gotoxy(68,50);
     write(PROD[11].DIASS.sex);
     
       gotoxy(68,8);
     write(PROD[1].DIASA.sex);
     gotoxy(68,12);
     write(PROD[2].DIASA.sex);
     gotoxy(68,16);
     write(PROD[3].DIASA.sex);
     gotoxy(68,20);
     write(PROD[4].DIASA.sex);
     gotoxy(68,24);
     write(PROD[5].DIASA.sex);    // CONTROLO DAS ENTRADAS PARA A SEGUNDA
     gotoxy(68,28);
     write(PROD[6].DIASA.sex);
     gotoxy(68,32);
     write(PROD[7].DIASA.sex);
     gotoxy(68,36);
     write(PROD[8].DIASA.sex);
     gotoxy(68,40);
     write(PROD[9].DIASA.sex);
     gotoxy(68,44);
     write(PROD[10].DIASA.sex);
     gotoxy(68,48);
     write(PROD[11].DIASA.sex);
     
 
   {  gotoxy(68,8)
     write(DIASE[1].sex
                          }
      
  
   
   textcolor(14);
   for I:= 8 to 50 do
    begin
      if (I mod 4 = 0) then
       begin
         gotoxy(25,I);
         write('Q. Actual :')
       end;
    end;
    
    for I:= 8 to 50 do
    begin
      if (I mod 4 = 0) then
       begin
         X:= I+1;
         gotoxy(25,X);
         write('Q. Entrada:')
       end;
    end;
    
    for I:= 8 to 50 do
    begin
      if (I mod 4 = 0) then
       begin
         X:= I+2;
         gotoxy(25,X);
         write('Q. Saida  :')
       end;
    end;
  
	textcolor(15);  

     gotoxy(74,9);
     write(PROD[1].S_E);
     gotoxy(74,13);
     write(PROD[2].S_E);
     gotoxy(74,17);
     write(PROD[3].S_E);
     gotoxy(74,21);
     write(PROD[4].S_E);
     gotoxy(74,25);
     write(PROD[5].S_E);
     gotoxy(74,29);
     write(PROD[6].S_E);
     gotoxy(74,33);
     write(PROD[7].S_E);
     gotoxy(74,37);
     write(PROD[8].S_E);
     gotoxy(74,41);
     write(PROD[9].S_E);
     gotoxy(74,45);
     write(PROD[10].S_E);
     gotoxy(74,49);
     write(PROD[11].S_E);
     
     gotoxy(74,10);
     write(PROD[1].S_S);
     gotoxy(74,14);
     write(PROD[2].S_S);
     gotoxy(74,18);
     write(PROD[3].S_S);
     gotoxy(74,22);
     write(PROD[4].S_S);
     gotoxy(74,26);
     write(PROD[5].S_S);
     gotoxy(74,30);
     write(PROD[6].S_S);
     gotoxy(74,34);
     write(PROD[7].S_S);
     gotoxy(74,38);
     write(PROD[8].S_S);
     gotoxy(74,42);
     write(PROD[9].S_S);
     gotoxy(74,46);
     write(PROD[10].S_S);
     gotoxy(74,50);
     write(PROD[11].S_S);
     
     gotoxy(74,8);
     write(PROD[1].S_A);
     gotoxy(74,12);
     write(PROD[2].S_A);
     gotoxy(74,16);
     write(PROD[3].S_A);
     gotoxy(74,20);
     write(PROD[4].S_A);
     gotoxy(74,24);
     write(PROD[5].S_A);
     gotoxy(74,28);
     write(PROD[6].S_A);
     gotoxy(74,32);
     write(PROD[7].S_A);
     gotoxy(74,36);
     write(PROD[8].S_A);
     gotoxy(74,40);
     write(PROD[9].S_A);
     gotoxy(74,44);
     write(PROD[10].S_A);
     gotoxy(74,48);
     write(PROD[11].S_A);
     
  textcolor(14);
	gotoxy (3,6);
  write ('Item ');
	gotoxy (38,6);
  write ('S ');
  gotoxy (45,6);
  write ('T ');
  gotoxy (53,6);
  write ('Q ');
  gotoxy (60,6);
  write ('Q ');
  gotoxy (68,6);
  write ('S ');
  textcolor(15);
  Gotoxy (73,6);
  write ('Total S');
  gotoxy (6,55);
  write ('Precione ENTER Para voltar ao menu');
  readln;                                                                                                                              
end;                                                                                                                                   


procedure BalancoMensal ;
var I, X: integer;
begin
	 
  textbackground(17);
  clrscr;
  textbackground(17);
  textcolor(15);
  gotoxy (28,4);
  write ('Balanco Mensal');
  gotoxy (1,7);
  write ('|===========================================================================|');
  gotoxy (3,9);
  write ('Item ');						 
  gotoxy (40,9);
  write ('Semana');
  gotoxy (40,10);
  write (PROD[1].DIA,'/',PROD[1].MES);
  gotoxy (50,9);
  write ('Semana ');
  gotoxy (50,10);
  write ((PROD[1].DIA+7),'/',PROD[1].MES);
  gotoxy (60,9);
  write ('Semana ');
  gotoxy (60,10);
  write ((PROD[1].DIA+14),'/',PROD[1].MES);
  gotoxy (68,9);
  write ('Semana ');
  gotoxy (69,10);
  write ((PROD[1].DIA+21),'/',PROD[1].MES);
   textcolor(15);
  for I:= 1 to 11 do
   begin
    X:= (4*I) + 5;          // CICLO DOS PRODUTOS NO STOCK
    gotoxy (2,X);
    write (PROD[I].ITEM_NO_STOCK);
   end;
    TEXTCOLOR(15);
  gotoxy (1,36);
  write ('|===========================================================================|');
   readln;                                                   
end;




procedure Historico (var P: integer) ;        {Parte - Fim - Mensagem do encerramento do Programa}
begin
  textbackground(14);
  clrscr;
  textbackground(14);
  textcolor(15);
  gotoxy(25,3);
  writeln ( ' Historico dos Acessos ' );
  delay(2000);
  gotoxy(2,6);
  write(' Escolha alguma Opcao Adicional');
  gotoxy(4,8);
  write(' Precione 1 = Para vizualizar o Historico Geral');
  gotoxy(4,10);
  write(' Precione 9 = Para voltar para o menu Principal');
  gotoxy(2,28);
  writeln ( ' Ultimo acesso Autorizado ' );
  gotoxy(2,32);
  writeln ( ' Nome : ', PROD[1].INFO.nome );
  gotoxy(2,33);
  writeln ( ' Idade : ', PROD[1].INFO.Idade ,' Anos');
  gotoxy(2,34);
  writeln ( ' Cargo : ', PROD[1].INFO.CARGO );   
  gotoxy(32,28);
  writeln ( ' Data ' );
  gotoxy(32,32);
  writeln ( ' Dia : ', PROD[1].DIA );
  gotoxy(32,33);
  writeln ( ' Mes : ', PROD[1].MES );
  gotoxy(32,34);
  writeln ( ' Ano : ', PROD[1].ANO );
  gotoxy(1,30);
  write('|----------------------------------------------------------------------|');
  gotoxy(1,36);
  write('|----------------------------------------------------------------------|');
  gotoxy(4,12);
  write('=> ');  read(P);
  
end;

PROCEDURE CONDICAOX (I: integer);
	begin
	  PROD[I].hDATA := PROD[1].INFO.DATA;
		PROD[I].HNOME:= PROD[1].INFO.nome;
		PROD[I].HIDADE:= PROD[1].INFO.idade;
		PROD[I].HCARGO:= PROD[1].INFO.cargo;
		PROD[I].hdia:= PROD[1].DIA;
		PROD[I].HMES:= MESAUX;
		//PROD[I].ANO:= Anoaux;
		PROD[I].HSAIDA:= Saux;
		PROD[I].HACTUAL:= PROD[1].Sactual;
		PROD[I].HENTRADA:= Eaux;
	
	end;


procedure HistoricoGeral (var P: integer) ;        {Parte - Fim - Mensagem do encerramento do Programa}
var X, Y, Z, K, J: integer;
begin
  textbackground(5);
  clrscr;
  textbackground(5);
  textcolor(14);
  gotoxy(25,3);
  writeln ( ' Historico Geral dos Acessos ' );
  textcolor(15);
  gotoxy(2,5);
  write(' DATA');
  gotoxy(23,5);
  write('Identificacao do Usuario');
  gotoxy(54,5);
  write('Historico dos Movimentos');
{  gotoxy(1,7);
  textcolor(15);
  write('|<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<|');
  gotoxy(1,51);
  write('|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>|');

   
   for I:= 1 to 10 do
   begin
    X:= (4*I) + 7;
	  gotoxy (1,X);     // CICLO DAS LINHAS HORIZONTAIS
  writeln ('|.............................................................................|');
   end;           }
   CALCULO_H;
   textcolor(11);
   for I:= 1 to 11 do
   begin
    X:= (4*I) + 4;          // CICLO  dos Dias
    gotoxy (2,X);
    write ('Dia : ',PROD[I].HDIA);
    Y:= (4*I) + 5;          // CICLO dos Meses
    gotoxy (2,Y);
    write ('Mes : ',PROD[I].HMES);
    Z:= (4*I) + 6;          // CICLO DOS Anos
    gotoxy (2,Z);
    write ('Ano : 2015');
   end;
   /////////////////////                            
   for I:= 1 to 11 do
   begin
    X:= (4*I) + 4;          // CICLO das Idade
    gotoxy (20,X);
    write ('Idade : ');
    Y:= (4*I) + 5;          // CICLO DOS Nomes
    gotoxy (20,Y);
    write ('Nome  : ');
    Z:= (4*I) + 6;          // CICLO DOS Cargos
    gotoxy (20,Z);
    write ('Cargo : ');
   end;
   
    /////////////////////
   for I:= 1 to 11 do
   begin
    X:= (4*I) + 4;          // CICLO das Idade
    gotoxy (53,X);
    write ('Total Adicionado  : ');
    Y:= (4*I) + 5;          // CICLO DOS Nomes
    gotoxy (53,Y);
    write ('Total Saida       : ');
    Z:= (4*I) + 6;          // CICLO DOS Cargos
    gotoxy (53,Z);
    write ('Total no Stock    : ');
   end;
   
             gotoxy (28,8);
            write (PROD[1].HIDADE);
            gotoxy (28,12);
            write (PROD[2].HIDADE);
            gotoxy (28,16);
            write (PROD[3].HIDADE);
            gotoxy (28,20);
            write (PROD[4].HIDADE);
            gotoxy (28,24);
            write (PROD[5].HIDADE);
            gotoxy (28,28);
            write (PROD[6].HIDADE);
            gotoxy (28,32);
            write (PROD[7].HIDADE);
            gotoxy (28,36);
            write (PROD[8].HIDADE);
            gotoxy (28,40);
            write (PROD[9].HIDADE);
            gotoxy (28,44);
            write (PROD[10].HIDADE);
            gotoxy (28,48);
            write (PROD[11].HIDADE);
            
            gotoxy (28,9);
            write (PROD[1].HNOME);
            gotoxy (28,13);
            write (PROD[2].HNOME);
            gotoxy (28,17);
            write (PROD[3].HNOME);
            gotoxy (28,21);
            write (PROD[4].HNOME);
            gotoxy (28,25);
            write (PROD[5].HNOME);
            gotoxy (28,29);
            write (PROD[6].HNOME);
            gotoxy (28,33);
            write (PROD[7].HNOME);
            gotoxy (28,37);
            write (PROD[8].HNOME);
            gotoxy (28,41);
            write (PROD[9].HNOME);
            gotoxy (28,45);
            write (PROD[10].HNOME);
            gotoxy (28,49);
            write (PROD[11].HNOME);
            
             gotoxy (28,10);
            write (PROD[1].HCARGO);
            gotoxy (28,14);
            write (PROD[2].HCARGO);
            gotoxy (28,18);
           write (PROD[3].HCARGO);
            gotoxy (28,22);
            write (PROD[4].HCARGO);
           gotoxy (28,26);
           write (PROD[5].HCARGO);
            gotoxy (28,30);
            write (PROD[6].HCARGO);
            gotoxy (28,34);
            write (PROD[7].HCARGO);
            gotoxy (28,38);
            write (PROD[8].HCARGO);
            gotoxy (28,42);
            write (PROD[9].HCARGO);
            gotoxy (28,46);
            write (PROD[10].HCARGO);
            gotoxy (28,50);
            write (PROD[11].HCARGO);
            
            
             gotoxy (72,8);
            write (PROD[1].Hentrada);
            gotoxy (72,12);
            write (PROD[2].Hentrada);
            gotoxy (72,16);
            write (PROD[3].Hentrada);
            gotoxy (72,20);
            write (PROD[4].Hentrada);
            gotoxy (72,24);
            write (PROD[5].Hentrada);
            gotoxy (72,28);
            write (PROD[6].Hentrada);
            gotoxy (72,32);
            write (PROD[7].Hentrada);
            gotoxy (72,36);
            write (PROD[8].Hentrada);
            gotoxy (72,40);
            write (PROD[9].Hentrada);
            gotoxy (72,44);
            write (PROD[10].Hentrada);
            gotoxy (72,48);
            write (PROD[11].Hentrada);
            
            
            gotoxy (72,9);
            write (PROD[1].Hsaida);
            gotoxy (72,13);
            write (PROD[2].Hsaida);
            gotoxy (72,17);
            write (PROD[3].Hsaida);
            gotoxy (72,21);
            write (PROD[4].Hsaida);
            gotoxy (72,25);
            write (PROD[5].Hsaida);
            gotoxy (72,29);
            write (PROD[6].Hsaida);
            gotoxy (72,33);
            write (PROD[7].Hsaida);
            gotoxy (72,37);
            write (PROD[8].Hsaida);
            gotoxy (72,41);
            write (PROD[9].Hsaida);
            gotoxy (72,45);
            write (PROD[10].Hsaida);
            gotoxy (72,49);
            write (PROD[11].Hsaida);
            
            
        gotoxy (72,10);
        write (PROD[1].Hactual);
        gotoxy (72,14);
        write (PROD[2].Hactual);
        gotoxy (72,18);
        write (PROD[3].Hactual);
        gotoxy (72,22);
        write (PROD[4].Hactual);
        gotoxy (72,26);
        write (PROD[5].Hactual);
        gotoxy (72,30);
        write (PROD[6].Hactual);
        gotoxy (72,34);
        write (PROD[7].Hactual);
        gotoxy (72,38);
        write (PROD[8].Hactual);
        gotoxy (72,42);
        write (PROD[9].Hactual);
        gotoxy (72,46);
        write (PROD[10].Hactual);
        gotoxy (72,50);
        write (PROD[11].Hactual);
   
   textcolor(15);
   gotoxy(26,55);
   writeln ( ' ENTER PARA VOLTAR ' );
  readkey;                                                                                                            
end;                                             





procedure Encerrar ;        {Parte - Fim - Mensagem do encerramento do Programa}
begin
  writeln;
  writeln;
  writeln;
  writeln;
  writeln;
  writeln ( ' .................................................... FIM DO PROGRAMA ' );
  writeln ('.............................. CSJ - Sofwares 2015 ( All Rights Reserved )');
  
end;



var              { VARIAVEIS LOCAL DO PROGRAMA PRINCIPAL }
passw, cont, P1,P2,P3,P4,P6,P7,P8, PSAIDA1, I1, I2, OP1 : integer;  OP, Rsp: char;

  

Begin      { INICIO DO PROGRAMA PRINCIPAL }      { INICIO DO PROGRAMA PRINCIPAL }   { INICIO DO PROGRAMA PRINCIPAL }
 //       HISTORICOGERAL;
  	assign(PDI,'C:\Android\Final.DAT');
	reset(PDI);
	//	rewrite(PDI);
	                    
	
 
  read(PDI,PROD[1]);
  read(PDI,PROD[2]);
  read(PDI,PROD[3]);
  read(PDI,PROD[4]);
  read(PDI,PROD[5]);
   read(PDI,PROD[6]);
  read(PDI,PROD[7]);
  read(PDI,PROD[8]);
  read(PDI,PROD[9]);
   read(PDI,PROD[10]);
  read(PDI,PROD[11]);        
                          
	 I:= filesize(PDI);
	 write(' O numero de registros e ', I);
	 readkey;	
	 I:= filepos(PDI);
	 write(' A posicao e ', I);
	 readkey;	    
   textbackground(0);                                                                                
   clrscr;
   textbackground(0);
   textcolor(7);
   gotoxy(4,4);
	 write(' O programa precisa de Algumas informacoes pessoais Basicas');
	 delay(500);
	 gotoxy(8,8);
	 write(' Forneca os seguintes dados :');
	 delay(500);
	 writeln;
	 writeln;
	 write('       O seu Nome : '); read(PROD[1].INFO.nome);                                                                                                                                 
	 write('       A sua Idade : '); read(PROD[1].INFO.idade);                                                                                                                                            
	 write('       O seu cargo ou profissao : '); read(PROD[1].INFO.cargo);                                                                                                     
	 writeln;
	 DATA_VALIDA;
	 delay(2000);
	 textcolor(15);
	 gotoxy(25,36);                                       
   write (' ENTER PARA CONTINUAR '); readln;  
	 textbackground(0);                                                                                
    clrscr;
    delay(1000);
    textbackground(0);
    gotoxy( 3, 4);
    textcolor(12);
    write (' AVISO:  ');
    write('Apenas os funcionarios internos tem permisao de usar o programa');
    writeln;
    gotoxy( 4,7 );
    write (' O senhor  ', PROD[1].INFO.nome,' e funcionario da empresa ?  S/N ? : '); read ( resp );         
    
		 case upcase(resp)  of  { INICIO DO CASE 1  ANTES DAS RAMIFICACOES }
        'N': Encerrar; { SE A RESPOSTA FOR NAO, TERMINA LOGO O PROGRAMA}  
	      'S': 
				    begin   { BEGIN DO CASE proncipal CASO SEJA SIM }   //BEGIN(1)
	        cont:= 0;
          repeat                                                { INICIO DO PRIMEIRO REPEAT }  //REPEAT (1)
					   gotoxy(4,(9 + (cont+2)));                                       
             write ('Digite o codigo Interno.: ');  read (passw);            
                                                                        
             if (passw = 12345) then
					     begin            { BEGIN (2) DO TESTE VERDADEIRO PARA PASSWORD }   //BEGIN (2)
						     repeat           { INICIO DO SEGUNDO REPEAT }  //REPEAT (2)
						      clrscr;
						      textcolor(15);
								  
									 
									  MenuPrincipal (OP);                  //// MenuPrincipal
							                                                                                   
						      textbackground(0);                                                                                
                  clrscr;
                  textbackground(0);
						       case OP of         { INICIO DO CASE 2  DO MENU PRINCIPAL }
						        '1':  begin           //BEGIN DA OP '1' REFERENTE AO MENU DOS ITEMS NO MENU PRINCIPAL
						                clrscr;
						                gotoxy(25,5);
						                write(' ESCOLHEU OPCAO - 1');
						                delay(2000);
													  gotoxy(24,7);
													  write('Menu dos Itens no Stock');
														delay(1500);
														numP:= 1;
														while (numP <> 0) do          //WHILE 1 DO MENU DOS PRODUTOS
						                begin            // BEGIN DO WHILE 1 DO MENU DOS PRODUTOS
						                  Menu;
						                  textbackground(0);
                              clrscr;
                              textbackground(0);
                              textcolor(7 );
														  case numP of    { INICIO DO CASE 3  DO MENU DOS ITENS NO STOCK }
														   1: begin       //BEGIN DA numP (1) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU COMPUTADOR
														       begin            // BEGIN DO WHILE 2 DO SUBMENU COMPUTADOR
														        compDesktop(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA COMP DESKTOP }
                                     1: begin      //BEGIN DA ( 1 ) (1 - DESKTOP) NO REGISTRO DE ENTRADA NO DESKTOP
                                         gotoxy (10, 7);
                                         write(' Quantos computadores deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[1].ULT_ENTRADA);
                                         clrscr;
                                         PROD[1].QTD_ACTUAL:= PROD[1].QTD_ACTUAL+PROD[1].ULT_ENTRADA;
                                         Eaux:= Eaux + PROD[1].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[1].ULT_ENTRADA,' computadores Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[1].QTD_ACTUAL,' Computadores '); 
															           delay (3000);
																				 if (PROD[1].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[1].DIASE.SEg:= PROD[1].ULT_ENTRADA; 
																				    
																				  end
																				 else
																				  begin
																				   if (PROD[1].DIASE.ter = 0) then 
																				    begin
																				      PROD[1].DIASE.ter:= PROD[1].ULT_ENTRADA;
																				      
																				    end
																				   else
																				    begin
																				      if (PROD[1].DIASE.Qua = 0) then
																							 begin
																							   PROD[1].DIASE.Qua:= PROD[1].ULT_ENTRADA;
																							   
																							 end
																							else
																							 begin
																							   if (PROD[1].DIASE.Qui = 0) then
																							    begin
																							      PROD[1].DIASE.Qui:= PROD[1].ULT_ENTRADA;
																							      
																							    end
																							   else
																							    begin
																							     PROD[1].DIASE.Sex:= PROD[1].ULT_ENTRADA;
																							    
																							    end;
																							 end; 
																				    end;
																				  end; 
																				    PROD[1].S_E:= 0;
																				    with PROD[1].DIASE do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[1].S_E:= PROD[1].S_E + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[1].S_E:= PROD[1].S_E + ter; 
																				          end;
																				           if (qua <> 0) then
																				          begin
																				            PROD[1].S_E:= PROD[1].S_E+ qua; 
																				          end;
																				           if (qui <> 0) then
																				          begin
																				            PROD[1].S_E:= PROD[1].S_E+ qui; 
																				          end;
																				           if (sex <> 0) then
																				          begin
																				            PROD[1].S_E:= PROD[1].S_E+ sex; 
																				          end;
																				          
																				     end;
													               Encerrar;
													               
													              end; //END DA ( 1 ) (1 - DESKTOP) NO REGISTRO DE ENTRADA NO DESKTOP
																		 2: begin //BEGIN DA ( 2 ) (1 - DESKTOP) NO REGISTRO DE SAIDA NO DESKTOP
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos computadores ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[1].ULT_SAIDA);
                                          Saux:= Saux + PROD[1].ULT_SAIDA;
																					                                                         //CONDICOES PARA A QUANTIDADES DE SAIDA DE COMPDESKTOP
																			    if (PROD[1].QTD_ACTUAL < PROD[1].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[1].QTD_ACTUAL,' Computadores ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - DESKTOP OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[1].ULT_SAIDA > PROD[1].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos computadores ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[1].ULT_SAIDA);
                                                          Saux:= Saux + PROD[1].ULT_SAIDA;
                                                           if (PROD[1].QTD_ACTUAL < PROD[1].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[1].QTD_ACTUAL,' Computadores');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;              { END DO WHILE 1 }
																			                  PROD[1].QTD_ACTUAL:= PROD[1].QTD_ACTUAL - PROD[1].ULT_SAIDA;
																			                 
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[1].ULT_SAIDA,' Computadores ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[1].QTD_ACTUAL,' Computadores');
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - DESKTOP OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[1].QTD_ACTUAL:= PROD[1].QTD_ACTUAL - PROD[1].ULT_SAIDA;
																			       if ( PROD[1].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[1].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE COMPDESKTOP
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 17);
                                                   write(' Stock de Computadores Desktops Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE COMPDESKTOP
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu Computador Desktop'); readkey;
                                                  clrscr;
                                                 
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[1].ULT_SAIDA,' computadores ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[1].QTD_ACTUAL,' Computadores ');
																								 delay (3000); 
																			         end;
																			     end;  
																					 if (PROD[1].DIASS.seg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[1].DIASS.SEg:= PROD[1].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[1].DIASS.ter = 0) then 
																				    begin
																				      PROD[1].DIASS.Ter:= PROD[1].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[1].DIASS.Qua = 0) then
																							 begin
																							   PROD[1].DIASS.Qua:= PROD[1].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[1].DIASS.Qui = 0) then
																							    begin
																							      PROD[1].DIASS.Qui:= PROD[1].ULT_SAIDA;
																							    end
																							   else
																							     PROD[1].DIASS.Sex:= PROD[1].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[1].S_S:= 0;
																				    with PROD[1].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[1].S_S:= PROD[1].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[1].S_S:= PROD[1].S_S + ter; 
																				          end;
																				           if (qua <> 0) then
																				          begin
																				            PROD[1].S_S:= PROD[1].S_S+ qua; 
																				          end;
																				           if (qui <> 0) then
																				          begin
																				            PROD[1].S_S:= PROD[1].S_S+ qui; 
																				          end;
																				           if (sex <> 0) then
																				          begin
																				            PROD[1].S_S:= PROD[1].S_S+ sex; 
																				          end;
																				     end;
																				     
																						     
																				 end; //END DA ( 2 ) (1 - DESKTOP) NO REGISTRO DE SAIDA NO DESKTOP
																			3: begin //BEGIN DA ( 3 ) (1 - DESKTOP) NO VISUALIZAR O BALANCO NO DESKTOP
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item Computador Desktop . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoDesktop;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (1 - DESKTOP) NO VISUALIZAR O BALANCO NO DESKTOP
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA COMP DESKTOP }
																		if (PROD[1].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[1].DIASA.SEg:= PROD[1].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[1].DIASA.ter = 0) then 
																				    begin
																				      PROD[1].DIASA.Ter:= PROD[1].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[1].DIASA.Qua = 0) then
																							 begin
																							   PROD[1].DIASA.Qua:= PROD[1].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[1].DIASA.Qui = 0) then
																							    begin
																							      PROD[1].DIASA.Qui:= PROD[1].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[1].DIASA.Sex:= PROD[1].QTD_ACTUAL; 
																							 end; 
																				    end;
																				    
																				  end;
																				  
																					PROD[1].S_A:= 0;
																				    with PROD[1].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[1].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[1].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[1].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[1].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[1].S_A:= seg
																								            
																								          end;
																								       end
																								    end;
																								   WRITE(PDI,PROD[1]); 
																								  end
																				          
																				            {S_A[1]:= S_A[1] + ter; 
																				          end;
																				           if (DIASA[1].qua <> 0) then
																				          begin
																				            S_A[1]:= S_A[1]+ qua; 
																				          end;
																				           if (DIASA[1].qui <> 0) then
																				          begin
																				            S_A[1]:= S_A[1]+ qui; 
																				          end;
																				           if (DIASA[1].sex <> 0) then
																				          begin
																				            S_A[1]:= S_A[1]+ sex; 
																				          end; }
																				     end;       
																	  end; // END DO WHILE 2 DO SUBMENU COMPUTADOR		  
														       end;      //FIM DA numP(1) NO MENU DOS ITENS NO STOCK
																	   
	////// FIM DE DESKTOP INICIO DE LAPTOP   **********************************************************************************************************************														   
														   2: begin       //BEGIN DA numP (2) NO MENU DOS ITENS NO STOCK
														      P1:= 1;
														      while (P1 <> 0) do   // WHILE 2 DO SUBMENU LAPTOP
														       begin      // BEGIN WHILE 2 DO SUBMENU LAPTOP
														        compLaptop(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA LAPTOP}
                                     1: begin      //BEGIN DA ( 1 ) (2 - LAPTOP) NO REGISTRO DE ENTRADA NO LAPTOP
                                         gotoxy (10, 7);
                                         write(' Quantos Laptops deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[2].ULT_ENTRADA);
                                          Eaux:= Eaux + PROD[2].ULT_ENTRADA;
                                         clrscr;
                                         PROD[2].QTD_ACTUAL:= PROD[2].QTD_ACTUAL+PROD[2].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[2].ULT_ENTRADA,' Laptops Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[2].QTD_ACTUAL,' Laptops '); 
															           delay (3000);
																				 if (PROD[2].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[2].DIASE.SEg:= PROD[2].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[2].DIASE.ter = 0) then 
																				    begin
																				      PROD[2].DIASE.Ter:= PROD[2].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[2].DIASE.Qua = 0) then
																							 begin
																							   PROD[2].DIASE.Qua:= PROD[2].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[2].DIASE.Qui = 0) then
																							    begin
																							      PROD[2].DIASE.Qui:= PROD[2].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[2].DIASE.Sex:= PROD[2].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end;
																					with PROD[2].DIASE do
																				     begin
																				       PROD[2].S_E:= seg + ter+qua+qui+sex;
																				     end;  
													               Encerrar;
													              end; //END DA ( 1 ) (2 - LAPTOP) NO REGISTRO DE ENTRADA NO LAPTOP
																		 2: begin //END DA ( 2 ) (2 - LAPTOP) NO REGISTRO DE SAIDA NO LAPTOP
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos Laptops ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[2].ULT_SAIDA);
                                          Saux:= Saux + PROD[2].ULT_SAIDA;                                                         //CONDICOES PARA A QUANTIDADES DE SAIDA DE COMPLAPTOP
																			    if (PROD[2].QTD_ACTUAL < PROD[2].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[2].QTD_ACTUAL,' Laptops ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - LAPTOP OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[2].ULT_SAIDA > PROD[2].QTD_ACTUAL) do   { INICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos Laptops ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[2].ULT_SAIDA);
                                                           if (PROD[2].QTD_ACTUAL < PROD[2].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[2].QTD_ACTUAL,' Laptops');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												 
																			                  end;              { END DO WHILE 1 }
																			                  PROD[2].QTD_ACTUAL:= PROD[2].QTD_ACTUAL - PROD[2].ULT_SAIDA;
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[2].ULT_SAIDA,' Laptops ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[2].QTD_ACTUAL,' Laptops');
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - LAPTOP OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[2].QTD_ACTUAL:= PROD[2].QTD_ACTUAL - PROD[2].ULT_SAIDA;
																			       if ( PROD[2].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[2].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (10, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE COMPLAPTOPS
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (10, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (10, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (10, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (10, 17);
                                                   write(' Stock de Laptops Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE COMPLAPTOPS
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu Computador Laptop'); readkey;
                                                  clrscr;
																									
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[2].ULT_SAIDA,' Laptops ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[2].QTD_ACTUAL,' Laptops ');
																								 delay (3000); 
																			         end;
																			     end;   
																	          if (PROD[2].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[2].DIASS.SEg:= PROD[2].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[2].DIASS.ter = 0) then 
																				    begin
																				      PROD[2].DIASS.Ter:= PROD[2].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[2].DIASS.Qua = 0) then
																							 begin
																							   PROD[2].DIASS.Qua:= PROD[2].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[2].DIASS.Qui = 0) then
																							    begin
																							      PROD[2].DIASS.Qui:= PROD[2].ULT_SAIDA;
																							    end
																							   else
																							     PROD[2].DIASS.Sex:= PROD[2].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[2].S_S:= 0;
																				    with PROD[2].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[2].S_S:= PROD[2].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[2].S_S:= PROD[2].S_S + ter; 
																				          end;
																				           if (PROD[2].DIASS.qua <> 0) then
																				          begin
																				            PROD[2].S_S:= PROD[2].S_S+ qua; 
																				          end;
																				           if (PROD[2].DIASS.qui <> 0) then
																				          begin
																				            PROD[2].S_S:= PROD[2].S_S+ qui; 
																				          end;
																				           if (PROD[2].DIASS.sex <> 0) then
																				          begin
																				            PROD[2].S_S:= PROD[2].S_S+ sex; 
																				          end;
																				     end;      
																				 end; //END DA ( 2 ) (2 - LAPTOP) NO REGISTRO DE SAIDA NO LAPTOP
																			3: begin //BEGIN DA ( 3 ) (2 - LAPTOP) NO VISUALIZAR O BALANCO NO LAPTOP
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item Computador Laptop . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoLaptop;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (2 - LAPTOP) NO VISUALIZAR O BALANCO NO LAPTOP	 
																		 end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA COMP LAPTOP }
																		 if (PROD[2].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[2].DIASA.SEg:= PROD[2].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[2].DIASA.ter = 0) then 
																				    begin
																				      PROD[2].DIASA.Ter:= PROD[2].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[2].DIASA.Qua = 0) then
																							 begin
																							   PROD[2].DIASA.Qua:= PROD[2].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[2].DIASA.Qui = 0) then
																							    begin
																							      PROD[2].DIASA.Qui:= PROD[2].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[2].DIASA.Sex:= PROD[2].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				 PROD[2].S_A:= 0;
																				    with PROD[2].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[2].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[2].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[2].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[2].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[2].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																								
																	  end; // END DO WHILE 2 DO SUBMENU LAPTOP
																		 WRITE(PDI,PROD[2]);	  
														       end;      //FIM DA numP (2) NO MENU DOS ITENS NO STOCK  
	//   FIM DE LAPTOP INICIO DE DISCO EXTERNO ********************************************************************************************************													 												      
												      
														   3: begin       //BEGIN DA numP (3) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU DISCO EXTERNO
														       begin            // BEGIN DO WHILE 2 DO SUBMENU DISCO EXTERNO
														        HDexterno(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA HD EXTERNO }
                                     1: begin      //BEGIN DA ( 1 ) (3 - HD EXTERNO) NO REGISTRO DE ENTRADA NO HD EXTERNO
                                         gotoxy (10, 7);
                                         write(' Quantos Discos Externos deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[3].ULT_ENTRADA);
                                         Eaux:= Eaux + PROD[3].ULT_ENTRADA;
                                         clrscr;
                                         PROD[3].QTD_ACTUAL:= PROD[3].QTD_ACTUAL+PROD[3].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[3].ULT_ENTRADA,' Discos Externos Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[3].QTD_ACTUAL,' Discos Externos '); 
															           delay (3000);
																				 if (PROD[3].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[3].DIASE.SEg:= PROD[3].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[3].DIASE.ter = 0) then 
																				    begin
																				      PROD[3].DIASE.Ter:= PROD[3].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[3].DIASE.Qua = 0) then
																							 begin
																							   PROD[3].DIASE.Qua:= PROD[3].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[3].DIASE.Qui = 0) then
																							    begin
																							      PROD[3].DIASE.Qui:= PROD[3].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[3].DIASE.Sex:= PROD[3].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end;
																					with PROD[3].DIASE do
																				     begin
																				       PROD[3].S_E:= seg + ter+qua+qui+sex;
																				     end;  
													               Encerrar;
													              end; //END DA ( 1 ) (3 - HD EXTERNO) NO REGISTRO DE ENTRADA NO HD EXTERNO
																		 2: begin //BEGIN DA ( 2 ) (3 - HD EXTERNO) NO REGISTRO DE SAIDA NO HD EXTERNO
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos Discos Externos ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[3].ULT_SAIDA);
                                          Saux:= Saux + PROD[3].ULT_SAIDA;                                                         //CONDICOES PARA A QUANTIDADES DE SAIDA DE HD EXTERNO
																			    if (PROD[3].QTD_ACTUAL < PROD[3].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[3].QTD_ACTUAL,' Discos Externos ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - HD EXTERNO OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[3].ULT_SAIDA > PROD[3].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos Discos Externos ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[3].ULT_SAIDA);
                                                           if (PROD[3].QTD_ACTUAL < PROD[3].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[3].QTD_ACTUAL,' Discos Externos');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;              { END DO WHILE 1 }
																			                  PROD[3].QTD_ACTUAL:= PROD[3].QTD_ACTUAL - PROD[3].ULT_SAIDA;
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[3].ULT_SAIDA,' Discos Externos ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[3].QTD_ACTUAL,' Discos Externos');
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - HD EXTERNO OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[3].QTD_ACTUAL:= PROD[3].QTD_ACTUAL - PROD[3].ULT_SAIDA;
																			       if ( PROD[3].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[3].QTD_ACTUAL = 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE HD EXTERNO
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (3, 17);
                                                   write(' Stock de Discos Externos Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE HD EXTERNO
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu HD EXTERNO'); readkey;
                                                  clrscr;
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[3].ULT_SAIDA,' Discos Externos ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[3].QTD_ACTUAL,' Discos Externos ');
																								 delay (3000); 
																			         end;
																			     end; 
																					  if (PROD[3].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[3].DIASS.SEg:= PROD[3].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[3].DIASS.ter = 0) then 
																				    begin
																				      PROD[3].DIASS.Ter:= PROD[3].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[3].DIASS.Qua = 0) then
																							 begin
																							   PROD[3].DIASS.Qua:= PROD[3].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[3].DIASS.Qui = 0) then
																							    begin
																							      PROD[3].DIASS.Qui:= PROD[3].ULT_SAIDA;
																							    end
																							   else
																							     PROD[3].DIASS.Sex:= PROD[3].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[3].S_S:= 0;
																				    with PROD[3].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[3].S_S:= PROD[3].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[3].S_S:= PROD[3].S_S + ter; 
																				          end;
																				           if (PROD[3].DIASS.qua <> 0) then
																				          begin
																				            PROD[3].S_S:= PROD[3].S_S+ qua; 
																				          end;
																				           if (PROD[3].DIASS.qui <> 0) then
																				          begin
																				            PROD[3].S_S:= PROD[3].S_S+ qui; 
																				          end;
																				           if (PROD[3].DIASS.sex <> 0) then
																				          begin
																				            PROD[3].S_S:= PROD[3].S_S+ sex; 
																				          end;
																				     end;        
																				 end; //END DA ( 2 ) (3 - HD EXTERNO) NO REGISTRO DE SAIDA NO HD EXTERNO
																			3: begin //BEGIN DA ( 3 ) (3 - HD EXTERNO) NO VISUALIZAR O BALANCO NO HD EXTERNO
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item  Disco Externo . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoHDinterno;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (3 - HD EXTERNO) NO VISUALIZAR O BALANCO NO HD EXTERNO
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA  HD EXTERNO }
																		if (PROD[3].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[3].DIASA.SEg:= PROD[3].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[3].DIASA.ter = 0) then 
																				    begin
																				      PROD[3].DIASA.Ter:= PROD[3].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[3].DIASA.Qua = 0) then
																							 begin
																							   PROD[3].DIASA.Qua:= PROD[3].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[3].DIASA.Qui = 0) then
																							    begin
																							      PROD[3].DIASA.Qui:= PROD[3].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[3].DIASA.Sex:= PROD[3].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				  
																					PROD[3].S_A:= 0;
																				    with PROD[3].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[3].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[3].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[3].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[3].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[3].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																	  end; // END DO WHILE 2 DO SUBMENU HD EXTERNO	
																		 WRITE(PDI,PROD[3]);	  
														       end;      //FIM DA numP(3) NO MENU DOS ITENS NO STOCK
														   
														   
////// FIM DE DISCO EXTERNO INICIO DE DISCO INTERNO   **********************************************************************************************************************															      
														   
															  4: begin       //BEGIN DA numP (4) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU DISCO INTERNO
														       begin            // BEGIN DO WHILE 2 DO SUBMENU DISCO INTERNO
														        HDinterno(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA HD INTERNO }
                                     1: begin      //BEGIN DA ( 1 ) (4 - HD INTERNO) NO REGISTRO DE ENTRADA NO HD INTERNO
                                         gotoxy (10, 7);
                                         write(' Quantos Discos Duros Internos deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[4].ULT_ENTRADA);
                                         Eaux:= Eaux + PROD[4].ULT_ENTRADA;
                                         clrscr;
                                         PROD[4].QTD_ACTUAL:= PROD[4].QTD_ACTUAL+PROD[4].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[4].ULT_ENTRADA,' Discos Internos Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[4].QTD_ACTUAL,' Discos Internos '); 
															           delay (3000);
																				 if (PROD[4].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[4].DIASE.SEg:= PROD[4].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[4].DIASE.ter = 0) then 
																				    begin
																				      PROD[4].DIASE.Ter:= PROD[4].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[4].DIASE.Qua = 0) then
																							 begin
																							   PROD[4].DIASE.Qua:= PROD[4].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[4].DIASE.Qui = 0) then
																							    begin
																							      PROD[4].DIASE.Qui:= PROD[4].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[4].DIASE.Sex:= PROD[4].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end;
																					with PROD[4].DIASE do
																				     begin
																				       PROD[4].S_E:= seg + ter+qua+qui+sex;
																				     end;  
													               Encerrar;
													              end; //END DA ( 1 ) (4 - HD INTERNO) NO REGISTRO DE ENTRADA NO HD INTERNO
																		 2: begin //BEGIN DA ( 2 ) (4 - HD INTERNO) NO REGISTRO DE SAIDA NO HD INTERNO
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos Discos Internos ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[4].ULT_SAIDA);
                                          Saux:= Saux + PROD[4].ULT_SAIDA;
                                                                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE HD INTERNO
																			    if (PROD[4].QTD_ACTUAL < PROD[4].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[4].QTD_ACTUAL,' Discos Internos ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - HD INTERNO OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[4].ULT_SAIDA > PROD[4].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos Discos Internos ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[4].ULT_SAIDA);
																													Saux:= Saux + PROD[4].ULT_SAIDA; 
                                                           if (PROD[4].QTD_ACTUAL < PROD[4].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[4].QTD_ACTUAL,' Discos Internos');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;              { END DO WHILE 1 }
																			                  PROD[4].QTD_ACTUAL:= PROD[4].QTD_ACTUAL - PROD[4].ULT_SAIDA;
																			                  
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[4].ULT_SAIDA,' Discos Internos ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[4].QTD_ACTUAL,' Discos Internos');
																			                  
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - HD INTERNO OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[4].QTD_ACTUAL:= PROD[4].QTD_ACTUAL - PROD[4].ULT_SAIDA;
																			       if ( PROD[4].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[4].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                             //CONDICOES PARA A QUANTIDADES DE SAIDA DE HD INTERNO
                                                   write (' Stock Estourado !!');
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   gotoxy (5, 17);
                                                   write(' Stock de Discos Externos Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE HD INTERNO
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu HD INTERNO '); readkey;
                                                  clrscr;
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[4].ULT_SAIDA,' Discos Internos ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[4].QTD_ACTUAL,' Discos Internos ');
																								 delay (3000); 
																			         end;
																			     end; 
																					  if (PROD[4].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[4].DIASS.SEg:= PROD[4].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[4].DIASS.ter = 0) then 
																				    begin
																				      PROD[4].DIASS.Ter:= PROD[4].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[4].DIASS.Qua = 0) then
																							 begin
																							   PROD[4].DIASS.Qua:= PROD[4].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[4].DIASS.Qui = 0) then
																							    begin
																							      PROD[4].DIASS.Qui:= PROD[4].ULT_SAIDA;
																							    end
																							   else
																							     PROD[4].DIASS.Sex:= PROD[4].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[4].S_S:= 0;
																				    with PROD[4].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[4].S_S:= PROD[4].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[4].S_S:= PROD[4].S_S + ter; 
																				          end;
																				           if (PROD[4].DIASS.qua <> 0) then
																				          begin
																				            PROD[4].S_S:= PROD[4].S_S+ qua; 
																				          end;
																				           if (PROD[4].DIASS.qui <> 0) then
																				          begin
																				            PROD[4].S_S:= PROD[4].S_S+ qui; 
																				          end;
																				           if (PROD[4].DIASS.sex <> 0) then
																				          begin
																				            PROD[4].S_S:= PROD[4].S_S+ sex; 
																				          end;
																				     end;        
																				 end; //END DA ( 2 ) (4 - HD INTERNO) NO REGISTRO DE SAIDA NO HD INTERNO
																			3: begin //BEGIN DA ( 3 ) (4 - HD INTERNO) NO VISUALIZAR O BALANCO NO HD INTERNO
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item  Disco Internos . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoHDinterno;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (4 - HD INTERNO) NO VISUALIZAR O BALANCO NO HD INTERNO
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA  HD INTERNO }
																		if (PROD[4].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[4].DIASA.SEg:= PROD[4].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[4].DIASA.ter = 0) then 
																				    begin
																				      PROD[4].DIASA.Ter:= PROD[4].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[4].DIASA.Qua = 0) then
																							 begin
																							   PROD[4].DIASA.Qua:= PROD[4].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[4].DIASA.Qui = 0) then
																							    begin
																							      PROD[4].DIASA.Qui:= PROD[4].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[4].DIASA.Sex:= PROD[4].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				  
																					PROD[4].S_A:= 0;
																				    with PROD[4].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[4].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[4].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[4].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[4].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[4].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																	  end; // END DO WHILE 2 DO SUBMENU HD INTERNO	
																		 WRITE(PDI,PROD[4]);	  
														       end;      //FIM DA numP(4) NO MENU DOS ITENS NO STOCK
														   
																
																
////// FIM DE DISCO INTERNO INICIO DE  FLASHES USB   **********************************************************************************************************************																									     
														      
														   5: begin       //BEGIN DA numP (5) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU FLASHES
														       begin            // BEGIN DO WHILE 2 DO SUBMENU COMPUTADOR
														        Flashes(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA FLASHES }
                                     1: begin      //BEGIN DA ( 1 ) (5 - DESKTOP) NO REGISTRO DE ENTRADA NO FLASH
                                         gotoxy (10, 7);
                                         write(' Quantos Flashes deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[5].ULT_ENTRADA);
                                         Eaux:= Eaux + PROD[5].ULT_ENTRADA;
                                         clrscr;
                                         PROD[5].QTD_ACTUAL:= PROD[5].QTD_ACTUAL+PROD[5].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[5].ULT_ENTRADA,' Flashes Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[5].QTD_ACTUAL,' Flashes '); 
															           delay (3000);
																				 if (PROD[5].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[5].DIASE.SEg:= PROD[5].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[5].DIASE.ter = 0) then 
																				    begin
																				      PROD[5].DIASE.Ter:= PROD[5].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[5].DIASE.Qua = 0) then
																							 begin
																							   PROD[5].DIASE.Qua:= PROD[5].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[5].DIASE.Qui = 0) then
																							    begin
																							      PROD[5].DIASE.Qui:= PROD[5].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[5].DIASE.Sex:= PROD[5].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end;
																					with PROD[5].DIASE do
																				     begin
																				       PROD[5].S_E:= seg + ter+qua+qui+sex;
																				     end;  
													               Encerrar;
													              end; //END DA ( 1 ) (5 - FLASHES) NO REGISTRO DE ENTRADA NO FLASHES
																		 2: begin //BEGIN DA ( 2 ) (5 - FLASHES) NO REGISTRO DE SAIDA NO FLASHES
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos Flashes ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[5].ULT_SAIDA);
                                          Saux:= Saux + PROD[5].ULT_SAIDA;                                                         //CONDICOES PARA A QUANTIDADES DE SAIDA DE FLASHES
																			    if (PROD[5].QTD_ACTUAL < PROD[5].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[5].QTD_ACTUAL,' Flashes ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - FLASHES OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[5].ULT_SAIDA > PROD[5].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos Flashes ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[5].ULT_SAIDA);
                                                           if (PROD[5].QTD_ACTUAL < PROD[5].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[5].QTD_ACTUAL,' Flashes');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;              { END DO WHILE 1 }
																			                  PROD[5].QTD_ACTUAL:= PROD[5].QTD_ACTUAL - PROD[5].ULT_SAIDA;
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[5].ULT_SAIDA,' Flashes ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[5].QTD_ACTUAL,' Flashes');
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - FLASHES OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[5].QTD_ACTUAL:= PROD[5].QTD_ACTUAL - PROD[5].ULT_SAIDA;
																			       if ( PROD[5].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[5].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE FLASHES
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 17);
                                                   write(' Stock de Flashes Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE FLASHES
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu  FLASH USB'); readkey;
                                                  clrscr;
                                                 
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[5].ULT_SAIDA,' Flashes ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[5].QTD_ACTUAL,' Flashes ');
																								 delay (3000); 
																			         end;
																			     end; 
																					  if (PROD[5].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[5].DIASS.SEg:= PROD[5].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[5].DIASS.ter = 0) then 
																				    begin
																				      PROD[5].DIASS.Ter:= PROD[5].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[5].DIASS.Qua = 0) then
																							 begin
																							   PROD[5].DIASS.Qua:= PROD[5].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[5].DIASS.Qui = 0) then
																							    begin
																							      PROD[5].DIASS.Qui:= PROD[5].ULT_SAIDA;
																							    end
																							   else
																							     PROD[5].DIASS.Sex:= PROD[5].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[5].S_S:= 0;
																				    with PROD[5].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[5].S_S:= PROD[5].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[5].S_S:= PROD[5].S_S + ter; 
																				          end;
																				           if (PROD[5].DIASS.qua <> 0) then
																				          begin
																				            PROD[5].S_S:= PROD[5].S_S+ qua; 
																				          end;
																				           if (PROD[5].DIASS.qui <> 0) then
																				          begin
																				            PROD[5].S_S:= PROD[5].S_S+ qui; 
																				          end;
																				           if (PROD[5].DIASS.sex <> 0) then
																				          begin
																				            PROD[5].S_S:= PROD[5].S_S+ sex; 
																				          end;
																				     end;        
																				 end; //END DA ( 2 ) (5 - FLASHES) NO REGISTRO DE SAIDA NO FLASHES
																			3: begin //BEGIN DA ( 3 ) (5 - FLASHES) NO VISUALIZAR O BALANCO NO FLASHES
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item Flashes USB . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoFlashes;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (5 - FLASHES) NO VISUALIZAR O BALANCO NO FLASHES
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA FLASHES  }
																		if (PROD[5].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[5].DIASA.SEg:= PROD[5].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[5].DIASA.ter = 0) then 
																				    begin
																				      PROD[5].DIASA.Ter:= PROD[5].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[5].DIASA.Qua = 0) then
																							 begin
																							   PROD[5].DIASA.Qua:= PROD[5].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[5].DIASA.Qui = 0) then
																							    begin
																							      PROD[5].DIASA.Qui:= PROD[5].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[5].DIASA.Sex:= PROD[5].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				  
																					PROD[5].S_A:= 0;
																				    with PROD[5].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[5].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[5].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[5].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[5].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[5].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																	  end; // END DO WHILE 2 DO SUBMENU FLASHES	
																		 WRITE(PDI,PROD[5]);	  
														       end;      //FIM DA numP(5) NO MENU DOS ITENS NO STOCK
																 
															   
														      
////// FIM DE FLASHES USB INICIO DE MEMORIA RAM   **********************************************************************************************************************																							      
														      
														   6: begin       //BEGIN DA numP (6) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU Memorias RAM 
														       begin            // BEGIN DO WHILE 2 DO SUBMENU Memorias RAM 
														        memoriaRAM(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA MEMORIAS RAM }
                                     1: begin      //BEGIN DA ( 1 ) (6 - MEMORIAS) NO REGISTRO DE ENTRADA NO MEMORIAS RAM
                                         gotoxy (10, 7);
                                         write(' Quantas Memorias deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[6].ULT_ENTRADA);
                                         Eaux:= Eaux + PROD[6].ULT_ENTRADA;
                                         clrscr;
                                         PROD[6].QTD_ACTUAL:= PROD[6].QTD_ACTUAL+PROD[6].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[6].ULT_ENTRADA,' Memorias Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[6].QTD_ACTUAL,' Memorias '); 
															           delay (3000);
																				 if (PROD[6].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[6].DIASE.SEg:= PROD[6].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[6].DIASE.ter = 0) then 
																				    begin
																				      PROD[6].DIASE.Ter:= PROD[6].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[6].DIASE.Qua = 0) then
																							 begin
																							   PROD[6].DIASE.Qua:= PROD[6].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[6].DIASE.Qui = 0) then
																							    begin
																							      PROD[6].DIASE.Qui:= PROD[6].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[6].DIASE.Sex:= PROD[6].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end;
																					with PROD[6].DIASE do
																				     begin
																				       PROD[6].S_E:= seg + ter+qua+qui+sex;
																				     end;  
													               Encerrar;
													              end; //END DA ( 1 ) (6 - MEMORIAS RAM) NO REGISTRO DE ENTRADA NO MEMORIAS RAM
																		 2: begin //BEGIN DA ( 2 ) (6 - MEMORIAS RAM) NO REGISTRO DE SAIDA NO MEMORIAS RAM
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantas Memorias ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[6].ULT_SAIDA);
                                          Saux:= Saux + PROD[6].ULT_SAIDA;                                                         //CONDICOES PARA A QUANTIDADES DE SAIDA DE MEMORIAS RAM
																			    if (PROD[6].QTD_ACTUAL < PROD[6].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[6].QTD_ACTUAL,' Memorias ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - MEMORIAS RAM OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[6].ULT_SAIDA > PROD[6].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantas Memorias ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[6].ULT_SAIDA);
                                                           if (PROD[6].QTD_ACTUAL < PROD[6].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[6].QTD_ACTUAL,' Memorias');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;              { END DO WHILE 1 }
																			                  PROD[6].QTD_ACTUAL:= PROD[6].QTD_ACTUAL - PROD[6].ULT_SAIDA;
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[6].ULT_SAIDA,' Memorias ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[6].QTD_ACTUAL,' Memorias');
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - MEMORIAS RAM OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[6].QTD_ACTUAL:= PROD[6].QTD_ACTUAL - PROD[6].ULT_SAIDA;
																			       if ( PROD[6].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[6].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE MEMORIAS RAM
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 17);
                                                   write(' Stock de Memorias RAM Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE MEMORIAS RAM
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu Memoria RAM'); readkey;
                                                  clrscr;
                                                 
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[6].ULT_SAIDA,' Memorias ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[6].QTD_ACTUAL,' Memorias ');
																								 delay (3000); 
																			         end;
																			     end; 
																					  if (PROD[6].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[6].DIASS.SEg:= PROD[6].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[6].DIASS.ter = 0) then 
																				    begin
																				      PROD[6].DIASS.Ter:= PROD[6].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[6].DIASS.Qua = 0) then
																							 begin
																							   PROD[6].DIASS.Qua:= PROD[6].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[6].DIASS.Qui = 0) then
																							    begin
																							      PROD[6].DIASS.Qui:= PROD[6].ULT_SAIDA;
																							    end
																							   else
																							     PROD[6].DIASS.Sex:= PROD[6].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[6].S_S:= 0;
																				    with PROD[6].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[6].S_S:= PROD[6].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[6].S_S:=PROD[6]. S_S + ter; 
																				          end;
																				           if (PROD[6].DIASS.qua <> 0) then
																				          begin
																				            PROD[6].S_S:= PROD[6].S_S+ qua; 
																				          end;
																				           if (PROD[6].DIASS.qui <> 0) then
																				          begin
																				            PROD[6].S_S:= PROD[6].S_S+ qui; 
																				          end;
																				           if (PROD[6].DIASS.sex <> 0) then
																				          begin
																				            PROD[6].S_S:= PROD[6].S_S+ sex; 
																				          end;
																				     end;        
																				 end; //END DA ( 2 ) (6 - MEMORIAS RAM) NO REGISTRO DE SAIDA NO MEMORIAS RAM
																			3: begin //BEGIN DA ( 3 ) (6 - MEMORIAS RAM) NO VISUALIZAR O BALANCO NO MEMORIAS RAM
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item Memorias . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoMemoriaRAM;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (6 - MEMORIAS RAM) NO VISUALIZAR O BALANCO NO MEMORIAS RAM
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA MEMORIAS RAM }
																		if (PROD[6].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[6].DIASA.SEg:= PROD[6].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[6].DIASA.ter = 0) then 
																				    begin
																				      PROD[6].DIASA.Ter:= PROD[6].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[6].DIASA.Qua = 0) then
																							 begin
																							   PROD[6].DIASA.Qua:= PROD[6].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[6].DIASA.Qui = 0) then
																							    begin
																							      PROD[6].DIASA.Qui:= PROD[6].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[6].DIASA.Sex:= PROD[6].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				  
																					PROD[6].S_A:= 0;
																				    with PROD[6].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[6].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[6].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[6].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[6].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[6].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																	  end; // END DO WHILE 2 DO SUBMENU MEMORIAS RAM
																		 WRITE(PDI,PROD[6]);		  
														       end;      //FIM DA numP(6) NO MENU DOS ITENS NO STOCK   
														      
														      
////// FIM DE  MEMORIA RAM INICIO DE MONITOR   **********************************************************************************************************************																							      
														      
														   7: begin       //BEGIN DA numP (7) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU MONITOR 
														       begin            // BEGIN DO WHILE 2 DO SUBMENU MONITOR
														        Monitor(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA MONITOR}
                                     1: begin      //BEGIN DA ( 1 ) (7 - MONITOR) NO REGISTRO DE ENTRADA NO MONITOR
                                         gotoxy (10, 7);
                                         write(' Quantas Monitores deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[7].ULT_ENTRADA);
                                         Eaux:= Eaux + PROD[7].ULT_ENTRADA;
                                         clrscr;
                                         PROD[7].QTD_ACTUAL:= PROD[7].QTD_ACTUAL+PROD[7].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[7].ULT_ENTRADA,' Monitores Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[7].QTD_ACTUAL,' Monitores '); 
															           delay (3000);
																				 if (PROD[7].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[7].DIASE.seg:= PROD[7].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[7].DIASE.ter = 0) then 
																				    begin
																				      PROD[7].DIASE.Ter:= PROD[7].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[7].DIASE.Qua = 0) then
																							 begin
																							   PROD[7].DIASE.Qua:= PROD[7].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[7].DIASE.Qui = 0) then
																							    begin
																							      PROD[7].DIASE.Qui:= PROD[7].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[7].DIASE.Sex:= PROD[7].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end;
																					with PROD[7].DIASE do
																				     begin
																				       PROD[7].S_E:= seg + ter+qua+qui+sex;
																				     end;  
													               Encerrar;
													              end; //END DA ( 1 ) (7 - MONITOR) NO REGISTRO DE ENTRADA NO MONITOR
																		 2: begin //BEGIN DA ( 2 ) (7 - MONITOR) NO REGISTRO DE SAIDA NO MONITOR
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos Monitores ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[7].ULT_SAIDA);
                                          Saux:= Saux + PROD[7].ULT_SAIDA;                                                        //CONDICOES PARA A QUANTIDADES DE SAIDA DE MONITOR
																			    if (PROD[7].QTD_ACTUAL < PROD[7].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[7].QTD_ACTUAL,' Monitores ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - MONITOR OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[7].ULT_SAIDA > PROD[7].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos Monitores ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[7].ULT_SAIDA);
                                                          Saux:= Saux + PROD[7].ULT_SAIDA;
                                                           if (PROD[7].QTD_ACTUAL < PROD[7].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[7].QTD_ACTUAL,' Monitores');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;              { END DO WHILE 1 }
																			                  PROD[7].QTD_ACTUAL:= PROD[7].QTD_ACTUAL - PROD[7].ULT_SAIDA;
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[7].ULT_SAIDA,' Monitores ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[7].QTD_ACTUAL,' Monitores');
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - MONITOR OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[7].QTD_ACTUAL:= PROD[7].QTD_ACTUAL - PROD[7].ULT_SAIDA;
																			       if ( PROD[7].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[7].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE MONITOR
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 17);
                                                   write(' Stock dos Monitores Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE MONITOR
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu Monitor '); readkey;
                                                  clrscr;
                                                 
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[7].ULT_SAIDA,' Monitores ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[7].QTD_ACTUAL,' Monitores ');
																								 delay (3000); 
																			         end;
																			     end; 
																					  if (PROD[7].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[7].DIASS.SEg:= PROD[7].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[7].DIASS.ter = 0) then 
																				    begin
																				      PROD[7].DIASS.Ter:= PROD[7].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[7].DIASS.Qua = 0) then
																							 begin
																							   PROD[7].DIASS.Qua:= PROD[7].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[7].DIASS.Qui = 0) then
																							    begin
																							      PROD[7].DIASS.Qui:= PROD[7].ULT_SAIDA;
																							    end
																							   else
																							     PROD[7].DIASS.Sex:= PROD[7].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[7].S_S:= 0;
																				    with PROD[7].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[7].S_S:= PROD[7].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[7].S_S:= PROD[7].S_S + ter; 
																				          end;
																				           if (PROD[7].DIASS.qua <> 0) then
																				          begin
																				            PROD[7].S_S:= PROD[7].S_S+ qua; 
																				          end;
																				           if (PROD[7].DIASS.qui <> 0) then
																				          begin
																				            PROD[7].S_S:= PROD[7].S_S+ qui; 
																				          end;
																				           if (PROD[7].DIASS.sex <> 0) then
																				          begin
																				            PROD[7].S_S:= PROD[7].S_S+ sex; 
																				          end;
																				     end;        
																				 end; //END DA ( 2 ) (7 - MONITOR) NO REGISTRO DE SAIDA NO MONITOR
																			3: begin //BEGIN DA ( 3 ) (7 - MONITOR) NO VISUALIZAR O BALANCO NO MONITOR
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item Monitores . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoMonitor;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (7 - MONITOR) NO VISUALIZAR O BALANCO NO MONITOR
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA MONITOR }
																		if (PROD[7].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[7].DIASA.SEg:= PROD[7].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[7].DIASA.ter = 0) then 
																				    begin
																				      PROD[7].DIASA.Ter:= PROD[7].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[7].DIASA.Qua = 0) then
																							 begin
																							   PROD[7].DIASA.Qua:= PROD[7].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[7].DIASA.Qui = 0) then
																							    begin
																							      PROD[7].DIASA.Qui:= PROD[7].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[7].DIASA.Sex:= PROD[7].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				  
																					PROD[7].S_A:= 0;
																				    with PROD[7].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[7].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[7].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[7].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[7].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[7].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																	  end; // END DO WHILE 2 DO SUBMENU MONITOR	
																		 WRITE(PDI,PROD[7]);	  
														       end;      //FIM DA numP(7) NO MENU DOS ITENS NO STOCK     
														   
															 
															 
////// FIM DE MONITOR INICIO DE MOUSE   **********************************************************************************************************************																								 
															 
															  8: begin       //BEGIN DA numP (8) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU MOUSES 
														       begin            // BEGIN DO WHILE 2 DO SUBMENU MOUSES
														        Mouse(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA MOUSES}
                                     1: begin      //BEGIN DA ( 1 ) (8 - MONITOR) NO REGISTRO DE ENTRADA NO MOUSES
                                         gotoxy (10, 7);
                                         write(' Quantos Mouses deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[8].ULT_ENTRADA);
                                         Eaux:= Eaux + PROD[8].ULT_ENTRADA;
                                         clrscr;
                                         PROD[8].QTD_ACTUAL:= PROD[8].QTD_ACTUAL+PROD[8].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[8].ULT_ENTRADA,' Mouses Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[8].QTD_ACTUAL,' Mouses '); 
															           delay (3000);
																				 if (PROD[8].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[8].DIASE.SEg:= PROD[8].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[8].DIASE.ter = 0) then 
																				    begin
																				      PROD[8].DIASE.Ter:= PROD[8].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[8].DIASE.Qua = 0) then
																							 begin
																							   PROD[8].DIASE.Qua:= PROD[8].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[8].DIASE.Qui = 0) then
																							    begin
																							      PROD[8].DIASE.Qui:= PROD[8].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[8].DIASE.Sex:= PROD[8].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end;
																					with PROD[8].DIASE do
																				     begin
																				       PROD[8].S_E:= seg + ter+qua+qui+sex;
																				     end;  
													               Encerrar;
													              end; //END DA ( 1 ) (8 - MOUSES) NO REGISTRO DE ENTRADA NO MOUSES
																		 2: begin //BEGIN DA ( 2 ) (8 - MOUSES) NO REGISTRO DE SAIDA NO MOUSES
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos Mouses ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[8].ULT_SAIDA);
                                          Saux:= Saux + PROD[8].ULT_SAIDA;                                                         //CONDICOES PARA A QUANTIDADES DE SAIDA DE MOUSES
																			    if (PROD[8].QTD_ACTUAL < PROD[8].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[8].QTD_ACTUAL,' Mouses ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - MOUSE OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[8].ULT_SAIDA > PROD[8].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos Mouses ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[8].ULT_SAIDA);
                                                          Saux:= Saux + PROD[8].ULT_SAIDA;
                                                           if (PROD[8].QTD_ACTUAL < PROD[8].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[8].QTD_ACTUAL,' Mouses');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;              { END DO WHILE 1 }
																			                  PROD[8].QTD_ACTUAL:= PROD[8].QTD_ACTUAL - PROD[8].ULT_SAIDA;
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[8].ULT_SAIDA,' Mouses ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[8].QTD_ACTUAL,' Mouses');
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - MOUSE OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[8].QTD_ACTUAL:= PROD[8].QTD_ACTUAL - PROD[8].ULT_SAIDA;
																			       if ( PROD[8].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[8].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE MOUSES
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 17);
                                                   write(' Stock dos Mouses Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE MOUSES
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu Mouse '); readkey;
                                                  clrscr;
                                                 
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[8].ULT_SAIDA,' Mouses ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[8].QTD_ACTUAL,' Mouses ');
																								 delay (3000); 
																			         end;
																			     end; 
																					  if (PROD[8].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[8].DIASS.SEg:= PROD[8].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[8].DIASS.ter = 0) then 
																				    begin
																				      PROD[8].DIASS.Ter:= PROD[8].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[8].DIASS.Qua = 0) then
																							 begin
																							   PROD[8].DIASS.Qua:= PROD[8].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[8].DIASS.Qui = 0) then
																							    begin
																							      PROD[8].DIASS.Qui:= PROD[8].ULT_SAIDA;
																							    end
																							   else
																							     PROD[8].DIASS.Sex:= PROD[8].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[8].S_S:= 0;
																				    with PROD[8].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[8].S_S:= PROD[8].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[8].S_S:= PROD[8].S_S + ter; 
																				          end;
																				           if (PROD[8].DIASS.qua <> 0) then
																				          begin
																				            PROD[8].S_S:= PROD[8].S_S+ qua; 
																				          end;
																				           if (PROD[8].DIASS.qui <> 0) then
																				          begin
																				            PROD[8].S_S:= PROD[8].S_S+ qui; 
																				          end;
																				           if (PROD[8].DIASS.sex <> 0) then
																				          begin
																				            PROD[8].S_S:= PROD[8].S_S+ sex; 
																				          end;
																				     end;        
																				 end; //END DA ( 2 ) (8 - MOUSES) NO REGISTRO DE SAIDA NO MOUSES
																			3: begin //BEGIN DA ( 3 ) (8 - MOUSES) NO VISUALIZAR O BALANCO NO MOUSES
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item Mouses . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoMouse;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (8 - MONITOR) NO VISUALIZAR O BALANCO NO MOUSES
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA MOUSES }
																		if (PROD[8].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[8].DIASA.SEg:= PROD[8].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[8].DIASA.ter = 0) then 
																				    begin
																				      PROD[8].DIASA.Ter:= PROD[8].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[8].DIASA.Qua = 0) then
																							 begin
																							   PROD[8].DIASA.Qua:= PROD[8].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[8].DIASA.Qui = 0) then
																							    begin
																							      PROD[8].DIASA.Qui:= PROD[8].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[8].DIASA.Sex:= PROD[8].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				  
																					PROD[8].S_A:= 0;
																				    with PROD[8].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[8].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[8].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[8].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[8].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[8].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																	  end; // END DO WHILE 2 DO SUBMENU MOUSES	
																		 WRITE(PDI,PROD[8]);	  
														       end;      //FIM DA numP(8) NO MENU DOS ITENS NO STOCK     
														   
															 
															 
															 
////// FIM DE MOUSE INICIO DE  PROJECTOR **********************************************************************************************************************																								 
															 
															  9: begin       //BEGIN DA numP (9) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU PROJECTORES 
														       begin            // BEGIN DO WHILE 2 DO SUBMENU PROJECTORES
														        Projector(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA PROJECTORES}
                                     1: begin      //BEGIN DA ( 1 ) (9 - PROJECTORES) NO REGISTRO DE ENTRADA NO PROJECTORES
                                         gotoxy (10, 7);
                                         write(' Quantos Projectores deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[9].ULT_ENTRADA);
                                         Eaux:= Eaux + PROD[9].ULT_ENTRADA;
                                         clrscr;
                                         PROD[9].QTD_ACTUAL:= PROD[9].QTD_ACTUAL+PROD[9].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[9].ULT_ENTRADA,' Projectores Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[9].QTD_ACTUAL,' Projectores '); 
															           delay (3000);
																				 if (PROD[9].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[9].DIASE.SEg:= PROD[9].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[9].DIASE.ter = 0) then 
																				    begin
																				      PROD[9].DIASE.Ter:= PROD[9].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[9].DIASE.Qua = 0) then
																							 begin
																							   PROD[9].DIASE.Qua:= PROD[9].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[9].DIASE.Qui = 0) then
																							    begin
																							      PROD[9].DIASE.Qui:= PROD[9].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[9].DIASE.Sex:= PROD[9].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end;
																					with PROD[9].DIASE do
																				     begin
																				       PROD[9].S_E:= seg + ter+qua+qui+sex;
																				     end;  
													               Encerrar;
													              end; //END DA ( 1 ) (9 - PROJECTORES) NO REGISTRO DE ENTRADA NO PROJECTORES
																		 2: begin //BEGIN DA ( 2 ) (9 - PROJECTORES) NO REGISTRO DE SAIDA NO PROJECTORES
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos Projectores ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[9].ULT_SAIDA);
                                                                                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE PROJECTORES
																			    if (PROD[9].QTD_ACTUAL < PROD[9].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[9].QTD_ACTUAL,' Projectores ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - PROJECTORES OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[9].ULT_SAIDA > PROD[9].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos Projectores ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[9].ULT_SAIDA);
                                                           if (PROD[9].QTD_ACTUAL < PROD[9].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[9].QTD_ACTUAL,' Projectores');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;
																												Saux:= Saux + PROD[9].ULT_SAIDA;              { END DO WHILE 1 }
																			                  PROD[9].QTD_ACTUAL:= PROD[9].QTD_ACTUAL - PROD[9].ULT_SAIDA;
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[9].ULT_SAIDA,' Projectores ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[9].QTD_ACTUAL,' Projectores');
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - PROJECTORES OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[9].QTD_ACTUAL:= PROD[9].QTD_ACTUAL - PROD[9].ULT_SAIDA;
																			       if ( PROD[9].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[9].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE PROJECTORES
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 17);
                                                   write(' Stock dos Projectores Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE PROJECTORES
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu Projector '); readkey;
                                                  clrscr;
                                                 
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[9].ULT_SAIDA,' Projectores ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[9].QTD_ACTUAL,' Projectores ');
																								 delay (3000); 
																			         end;
																			     end;
																					  if (PROD[9].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[9].DIASS.SEg:= PROD[9].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[9].DIASS.ter = 0) then 
																				    begin
																				      PROD[9].DIASS.Ter:= PROD[9].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[9].DIASS.Qua = 0) then
																							 begin
																							   PROD[9].DIASS.Qua:= PROD[9].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[9].DIASS.Qui = 0) then
																							    begin
																							      PROD[9].DIASS.Qui:= PROD[9].ULT_SAIDA;
																							    end
																							   else
																							     PROD[9].DIASS.Sex:= PROD[9].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[9].S_S:= 0;
																				    with PROD[9].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[9].S_S:= PROD[9].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[9].S_S:= PROD[9].S_S + ter; 
																				          end;
																				           if (PROD[9].DIASS.qua <> 0) then
																				          begin
																				            PROD[9].S_S:= PROD[9].S_S+ qua; 
																				          end;
																				           if (PROD[9].DIASS.qui <> 0) then
																				          begin
																				            PROD[9].S_S:= PROD[9].S_S+ qui; 
																				          end;
																				           if (PROD[9].DIASS.sex <> 0) then
																				          begin
																				            PROD[9].S_S:= PROD[9].S_S+ sex; 
																				          end;
																				     end;         
																				 end; //END DA ( 2 ) (9 - PROJECTORES) NO REGISTRO DE SAIDA NO PROJECTORES
																			3: begin //BEGIN DA ( 3 ) (9 - PROJECTORES) NO VISUALIZAR O BALANCO NO PROJECTORES
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item Projectores . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoProjector;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (9 - PROJECTORES) NO VISUALIZAR O BALANCO NO PROJECTORES
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA PROJECTORES }
																		if (PROD[9].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[9].DIASA.SEg:= PROD[9].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[9].DIASA.ter = 0) then 
																				    begin
																				      PROD[9].DIASA.Ter:= PROD[9].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[9].DIASA.Qua = 0) then
																							 begin
																							   PROD[9].DIASA.Qua:= PROD[9].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[9].DIASA.Qui = 0) then
																							    begin
																							      PROD[9].DIASA.Qui:= PROD[9].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[9].DIASA.Sex:= PROD[9].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				  
																					PROD[9].S_A:= 0;
																				    with PROD[9].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[9].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[9].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[9].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[9].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[9].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																	  end; // END DO WHILE 2 DO SUBMENU PROJECTORES	
																		 WRITE(PDI,PROD[9]);	  
														       end;      //FIM DA numP(9) NO MENU DOS ITENS NO STOCK  
															 
															 
															 
////// FIM DE PROJECTOR INICIO DE TECLADO  **********************************************************************************************************************																								 
															 
														 10:  begin       //BEGIN DA numP (10) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU TECLADOS 
														       begin            // BEGIN DO WHILE 2 DO SUBMENU TECLADOS
														        Teclado(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA TECLADOS}
                                     1: begin      //BEGIN DA ( 1 ) (10 - TECLADOS) NO REGISTRO DE ENTRADA NO TECLADOS
                                         gotoxy (10, 7);
                                         write(' Quantos Teclados deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[10].ULT_ENTRADA);
                                         Eaux:= Eaux + PROD[10].ULT_ENTRADA;
                                         clrscr;
                                         PROD[10].QTD_ACTUAL:= PROD[10].QTD_ACTUAL+PROD[10].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[10].ULT_ENTRADA,' Teclados Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[10].QTD_ACTUAL,' Teclados '); 
															           delay (3000);
																				 if (PROD[10].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[10].DIASE.SEg:= PROD[10].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[10].DIASE.ter = 0) then 
																				    begin
																				      PROD[10].DIASE.Ter:= PROD[10].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[10].DIASE.Qua = 0) then
																							 begin
																							   PROD[10].DIASE.Qua:= PROD[10].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[10].DIASE.Qui = 0) then
																							    begin
																							      PROD[10].DIASE.Qui:= PROD[10].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[10].DIASE.Sex:= PROD[10].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end; 
																					with PROD[10].DIASE do
																				     begin
																				       PROD[10].S_E:= seg + ter+qua+qui+sex;
																				     end; 
													               Encerrar;
													              end; //END DA ( 1 ) (10 - TECLADOS) NO REGISTRO DE ENTRADA NO TECLADOS
																		 2: begin //BEGIN DA ( 2 ) (10 - TECLADOS) NO REGISTRO DE SAIDA NO TECLADOS
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos Teclados ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[10].ULT_SAIDA);
                                                                                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE TECLADOS
																			    if (PROD[10].QTD_ACTUAL < PROD[10].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[10].QTD_ACTUAL,' Teclados ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - TECLADOS OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[10].ULT_SAIDA > PROD[10].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos Teclados ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[10].ULT_SAIDA);
                                                           if (PROD[10].QTD_ACTUAL < PROD[10].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[10].QTD_ACTUAL,' Teclados');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;              { END DO WHILE 1 }
																			                  PROD[10].QTD_ACTUAL:= PROD[10].QTD_ACTUAL - PROD[10].ULT_SAIDA;
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[10].ULT_SAIDA,' Teclados ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[10].QTD_ACTUAL,' Teclados');
																			                  delay(3000);
                                                     end;
                                                
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - TECLADOS OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[10].QTD_ACTUAL:= PROD[10].QTD_ACTUAL - PROD[10].ULT_SAIDA;
																			       if ( PROD[10].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[10].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE TECLADOS
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 17);
                                                   write(' Stock dos Teclados Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE TECLADOS
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu Teclado '); readkey;
                                                  clrscr;
                                                 
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[10].ULT_SAIDA,' Teclados ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[10].QTD_ACTUAL,' Teclados ');
																								 delay (3000); 
																			         end;
																			     end;
																					  if (PROD[10].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[10].DIASS.SEg:= PROD[10].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[10].DIASS.ter = 0) then 
																				    begin
																				      PROD[10].DIASS.Ter:= PROD[10].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[10].DIASS.Qua = 0) then
																							 begin
																							   PROD[10].DIASS.Qua:= PROD[10].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[10].DIASS.Qui = 0) then
																							    begin
																							      PROD[10].DIASS.Qui:= PROD[10].ULT_SAIDA;
																							    end
																							   else
																							     PROD[10].DIASS.Sex:= PROD[10].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[10].S_S:= 0;
																				    with PROD[10].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[10].S_S:= PROD[10].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[10].S_S:= PROD[10].S_S + ter; 
																				          end;
																				           if (PROD[10].DIASS.qua <> 0) then
																				          begin
																				            PROD[10].S_S:= PROD[10].S_S+ qua; 
																				          end;
																				           if (PROD[10].DIASS.qui <> 0) then
																				          begin
																				            PROD[10].S_S:= PROD[10].S_S+ qui; 
																				          end;
																				           if (PROD[10].DIASS.sex <> 0) then
																				          begin
																				            PROD[10].S_S:= PROD[10].S_S+ sex; 
																				          end;
																				     end;         
																				 end; //END DA ( 2 ) (10 - TECLADOS) NO REGISTRO DE SAIDA NO TECLADOS
																			3: begin //BEGIN DA ( 3 ) (10 - TECLADOS) NO VISUALIZAR O BALANCO NO TECLADOS
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item Projectores . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoTeclado;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
																			   end;  //END DA ( 3 ) (10 - TECLADOS) NO VISUALIZAR O BALANCO NO TECLADOS
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA TECLADOS }
																		if (PROD[10].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[10].DIASA.SEg:= PROD[10].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[10].DIASA.ter = 0) then 
																				    begin
																				      PROD[10].DIASA.Ter:= PROD[10].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[10].DIASA.Qua = 0) then
																							 begin
																							   PROD[10].DIASA.Qua:= PROD[10].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[10].DIASA.Qui = 0) then
																							    begin
																							      PROD[10].DIASA.Qui:= PROD[10].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[10].DIASA.Sex:= PROD[10].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				  
																					PROD[10].S_A:= 0;
																				    with PROD[10].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[10].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[10].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[10].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[10].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[10].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																	  end; // END DO WHILE 2 DO SUBMENU TECLADOS	
																		 WRITE(PDI,PROD[10]);	  
														       end;      //FIM DA numP(10) NO MENU DOS ITENS NO STOCK  
															 
															 
												
												
															 
////// FIM DE TECLADO INICIO DE UPS    **********************************************************************************************************************																								 
															 
														  11: begin       //BEGIN DA numP (11) NO MENU DOS ITENS NO STOCK     /////////////////////// - ( 1 )
														       P1:= 1;
														       while (P1 <> 0) do   // WHILE 2 DO SUBMENU UPS 
														       begin            // BEGIN DO WHILE 2 DO SUBMENU UPS
														        UPS(P1);
														        textbackground(0);
                                    clrscr;
                                    textbackground(0);
                                    textcolor(14 );
                                    delay (1000);
                                    writeln;
                                    case P1 of    { INICIO DO CASE 4  REFERENTE AS OPCOES PARA UPS}
                                     1: begin      //BEGIN DA ( 1 ) (11 - UPS) NO REGISTRO DE ENTRADA NO UPS
                                         gotoxy (10, 7);
                                         write(' Quantos UPS deseja Adicionar ? ');
                                         gotoxy (10,9);
                                         write(':+> ');  read(PROD[11].ULT_ENTRADA);
                                         Eaux:= Eaux + PROD[2].ULT_ENTRADA;
                                         clrscr;
                                         PROD[11].QTD_ACTUAL:= PROD[11].QTD_ACTUAL+PROD[11].ULT_ENTRADA;
                                         gotoxy (10, 7);
                                         write ('............. Relatorio.............');
                                         writeln;
                                         GOtoxy(5,12);
                                         write (PROD[11].ULT_ENTRADA,' UPS Foram adicionados ao stock');
	    	                                 writeln;
		                                     gotoxy(5,14);                  
		                                     write (' o novo stock e de ', PROD[11].QTD_ACTUAL,' UPS '); 
															           delay (3000);
																				 if (PROD[11].DIASE.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE SOBRE  DIAS DE SEMANAS
																				    PROD[11].DIASE.SEg:= PROD[11].ULT_ENTRADA 
																				  end
																				 else
																				  begin
																				   if (PROD[11].DIASE.ter = 0) then 
																				    begin
																				      PROD[11].DIASE.Ter:= PROD[11].ULT_ENTRADA;
																				    end
																				   else
																				    begin
																				      if (PROD[11].DIASE.Qua = 0) then
																							 begin
																							   PROD[11].DIASE.Qua:= PROD[11].ULT_ENTRADA;
																							 end
																							else
																							 begin
																							   if (PROD[11].DIASE.Qui = 0) then
																							    begin
																							      PROD[11].DIASE.Qui:= PROD[11].ULT_ENTRADA;
																							    end
																							   else
																							     PROD[11].DIASE.Sex:= PROD[11].ULT_ENTRADA;
																							 end; 
																				    end;
																				  end;
																					with PROD[11].DIASE do
																				     begin
																				       PROD[11].S_E:= seg + ter+qua+qui+sex;
																				     end;  
													               Encerrar;
													              end; //END DA ( 1 ) (11 - UPS) NO REGISTRO DE ENTRADA NO UPS
																		 2: begin //BEGIN DA ( 2 ) (11 - UPS) NO REGISTRO DE SAIDA NO UPS
																			    gotoxy (10, 7);
                                          write(' Deseja registrar a saida de Quantos UPS ? ');
                                          gotoxy (10,9);
                                          write(':-> ');  read(PROD[11].ULT_SAIDA);
                                                                                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE UPS
																			    if (PROD[11].QTD_ACTUAL < PROD[11].ULT_SAIDA) then
																			     begin
																			       textcolor(12);
																			       gotoxy(3, 10);
																			       writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
																			       delay (3000);
																			       gotoxy(3, 13);
																			       writeln (' Pois a Quantidade actual dos Itens no Stock e de : ',PROD[11].QTD_ACTUAL,' UPS ');
																			       delay (5000);
																			       clrscr;
																			       
																			       gotoxy(3,5);
																			       writeln('Deseja Registrar a saida de alguma outra Quantidade ? S/N ? ');
																			       gotoxy (10,9);
                                             write(':> ');  read(Rsp);
                                              case upcase(Rsp) of       { INICIO DO CASE 5  DA RESPOSTA SE CONTINUA NO - UPS OU NAO }
                                                'S': begin
                                                       I1:= 1;
                                                       while (I1 <= 3) and (PROD[11].ULT_SAIDA > PROD[11].QTD_ACTUAL) do   { IINICIO DO WHILE 1 }
                                                        begin         { BEGIN DO WHILE 1 }
                                                         clrscr;
                                                          gotoxy(3,10);
																			                    write(' Deseja registrar a saida de Quantos UPS ? ');
																			                    gotoxy (3,12);
                                                          write(':-> ');  read(PROD[11].ULT_SAIDA);
                                                           if (PROD[11].QTD_ACTUAL < PROD[11].ULT_SAIDA) then
                                                            begin
                                                              gotoxy (3,15);
                                                              writeln (' Nao e Possivel, retirar esta Quantidade do Stock ');
                                                              gotoxy (3,17);
                                                              writeln (' Registre Saida de uma quantidade valida, o Stock e de : ',PROD[11].QTD_ACTUAL,' UPS');
                                                              delay(3000);
                                                            end;
																												 I1:= I1 + 1;
																												  
																			                  end;              { END DO WHILE 1 }
																			                  PROD[11].QTD_ACTUAL:= PROD[11].QTD_ACTUAL - PROD[11].ULT_SAIDA;
																			                  gotoxy (3, 10);
																			                  write (' O ultimo Registro de saida foi de : ',PROD[11].ULT_SAIDA,' UPS ');
																			                  gotoxy (3, 12);
																			                  write (' O seu novo Stock e de : ', PROD[11].QTD_ACTUAL,' UPS');
																			                  delay(3000);
                                                     end;
                                              end;      { FIM DO CASE 5  DA RESPOSTA SE CONTINUA NO - UPS OU NAO }
																			       
																			       
																			     end
																			    else
																			     begin
																			       PROD[11].QTD_ACTUAL:= PROD[11].QTD_ACTUAL - PROD[11].ULT_SAIDA;
																			       if ( PROD[11].QTD_ACTUAL <= 50 ) then
																			        begin
																			          if ( PROD[11].QTD_ACTUAL <= 0 ) then
																			           begin
																			             textbackground(0);
																			             clrscr;
																			             textbackground(0);
																			             textcolor(12);
																			             gotoxy (5, 5);                            //CONDICOES PARA A QUANTIDADES DE SAIDA DE UPS
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 8);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 11);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 14);
                                                   write (' Stock Estourado !!');
                                                   delay(1000);
                                                   gotoxy (5, 17);
                                                   write(' Stock dos UPS Estourado !! ');
                                                   gotoxy (3,32);
                                                   delay(2500);
                                                   textcolor(15);
                                                   write(' CLICA ENTER PARA VOLTAR AO MENU');
                                                   readkey;
																			           end
																			          else                                   //CONDICOES PARA A QUANTIDADES DE SAIDA DE UPS
																			           begin
																			            Stockminimo;
                                                  gotoxy (10, 40);
                                                  textcolor(15);
                                                  write(' CLICA ENTER = Voltar ao Menu UPS '); readkey;
                                                  clrscr;
                                                 
																							 end;
																			        end   
																			       else                   // ELSE DE CASO HAVER SAIDA MAS O STOCK CONTINUAR SAUDAVEL!!
																			         begin
																			           clrscr;
                                                 gotoxy (10, 7);
                                                 write ('............. Relatorio.............');
                                                 gotoxy (5, 12);
                                                 write ('O ultimo registro de Saida foi de : ',PROD[11].ULT_SAIDA,' UPS ');
	    	                                         writeln;
		                                             gotoxy (5, 14);                 
		                                             writeln (' o novo stock e de ', PROD[11].QTD_ACTUAL,' UPS ');
																								 delay (3000); 
																			         end;
																			         
																			     end; 
																					  if (PROD[11].DIASS.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[11].DIASS.SEg:= PROD[11].ULT_SAIDA 
																				  end
																				 else
																				  begin
																				   if (PROD[11].DIASS.ter = 0) then 
																				    begin
																				      PROD[11].DIASS.Ter:= PROD[11].ULT_SAIDA;
																				    end
																				   else
																				    begin
																				      if (PROD[11].DIASS.Qua = 0) then
																							 begin
																							   PROD[11].DIASS.Qua:= PROD[11].ULT_SAIDA;
																							 end
																							else
																							 begin
																							   if (PROD[11].DIASS.Qui = 0) then
																							    begin
																							      PROD[11].DIASS.Qui:= PROD[11].ULT_SAIDA;
																							    end
																							   else
																							     PROD[11].DIASS.Sex:= PROD[11].ULT_SAIDA;
																							 end; 
																				    end;
																				  end;
																					PROD[11].S_S:= 0;
																				    with PROD[11].DIASS do
																				     begin 
																				        if (seg <> 0) then
																				          begin
																				            PROD[11].S_S:= PROD[11].S_S + seg
																				          end;
																				            if (ter <> 0) then
																				          begin
																				            PROD[11].S_S:= PROD[11].S_S + ter; 
																				          end;
																				           if (PROD[11].DIASS.qua <> 0) then
																				          begin
																				            PROD[11].S_S:= PROD[11].S_S+ qua; 
																				          end;
																				           if (PROD[11].DIASS.qui <> 0) then
																				          begin
																				            PROD[11].S_S:= PROD[11].S_S+ qui; 
																				          end;
																				           if (PROD[11].DIASS.sex <> 0) then
																				          begin
																				            PROD[11].S_S:= PROD[11].S_S+ sex; 
																				          end;
																				          Saux:= Saux + PROD[11].ULT_SAIDA;
																				     end;
																						Saux:= Saux + PROD[2].ULT_SAIDA;         
																				 end; //END DA ( 2 ) (11 - UPS) NO REGISTRO DE SAIDA NO UPS
																			3: begin //BEGIN DA ( 3 ) (11 - UPS) NO VISUALIZAR O BALANCO NO UPS
																			     clrscr;
                                           gotoxy (10, 7);
                                           write ('A Vizualizar o Balanco do Item UPS . . .');
                                           delay(3500);
                                           clrscr;
                                           BalancoUPS;
                                           textbackground(0);
                                           clrscr;
                                           textbackground(0);
                                           textcolor(15);
                                           writeln;
                                           Saux:= Saux + PROD[2].ULT_SAIDA;
																			   end;  //END DA ( 3 ) (11 - UPS) NO VISUALIZAR O BALANCO NO UPS
																			   
																		end;	{ END DO CASE 4  REFERENTE AS OPCOES PARA UPS }
																		if (PROD[11].DIASA.SEg = 0) then 
																				  begin                       //BEGIN DA PRIMEIRA ANALISE DAS SAIDAS SOBRE  DIAS DE SEMANAS
																				    PROD[11].DIASA.SEg:= PROD[11].QTD_ACTUAL; 
																				  end
																				 else
																				  begin
																				   if (PROD[11].DIASA.ter = 0) then 
																				    begin
																				      PROD[11].DIASA.Ter:= PROD[11].QTD_ACTUAL; 
																				    end
																				   else
																				    begin
																				      if (PROD[11].DIASA.Qua = 0) then
																							 begin
																							   PROD[11].DIASA.Qua:= PROD[11].QTD_ACTUAL; 
																							 end
																							else
																							 begin
																							   if (PROD[11].DIASA.Qui = 0) then
																							    begin
																							      PROD[11].DIASA.Qui:= PROD[11].QTD_ACTUAL; 
																							    end
																							   else
																							     PROD[11].DIASA.Sex:= PROD[11].QTD_ACTUAL; 
																							 end; 
																				    end;
																				  end;
																				  
																					PROD[11].S_A:= 0;
																				    with PROD[11].DIASA do
																				     begin 
																				        if (sex <> 0) then
																				          begin
																				            PROD[11].S_A:= sex;
																				          end
																				        else
																				          begin
																								   if (qui <> 0) then
																								    begin
																								      PROD[11].S_A:= qui
																								    end
																								   else
																								    begin
																								      if (qua <> 0) then
																								       begin
																								         PROD[11].S_A:= qua
																								       end
																								      else
																								       begin
																								         if (ter <> 0) then
																								          begin
																								            PROD[11].S_A:= ter
																								          end
																								         else
																								          begin
																								            PROD[11].S_A:= seg
																								          end;
																								       end
																								    end
																								  end
																								 end;
																								 
																								 for I:= 1 TO 11 DO
																								  begin
																								    if (PROD[I].QTD_ACTUAL <> 0 ) then
																								     begin
																								     Aaux:= Aaux + PROD[I].QTD_ACTUAL
																								     end;
																								  end
																	  end; // END DO WHILE 2 DO SUBMENU UPS	
																		 WRITE(PDI,PROD[11]);                         
														       end;      //FIM DA numP(11) NO MENU DOS ITENS NO STOCK  
															    
															    
															    
															    
////// FIM DE UPS INICIO DA OPCAO ADICIONAR NOVO PRODUTO  **********************************************************************************************************************																								    
															    
															 19: begin
															        P1:= 1;
														          while (P1 <> 0) do   // WHILE 2 DO SUBMENU ADICIONAR NOVO ITEM
														          begin            // BEGIN DO WHILE 2 DO SUBMENU COMPUTADOR
														      //     MenuAdorRemover(P1);
														           textbackground(0);
                                       clrscr;
                                       textbackground(0);
                                       textcolor(green );
                                       delay (1000);
                                       writeln;
                                       case P1 of
                                        1: begin
                                             while (upcase(resp)<> 'N') do
																						  begin
																							 gotoxy(5,6);
                                               write(' Escreva nome do Produto a cadastrar : '); read(prod12);
                                               gotoxy(5,8);
                                               write('Deseja cadastrar algum outro produto ?'); read(Resp);
                                               clrscr;
                                               gotoxy(5,6);
                                               write(' Escreva nome do Segundo Produto a cadastrar : '); read(prod13);
                                               gotoxy(5,8);
                                               write('Deseja cadastrar algum outro produto ?'); read(Resp);
                                               clrscr;
																							end; 
																							
                                           end;
                                       
                                       end;
															        end;
															     end;
															 
															 
															    
////// FIM DA OPCAO ADICIONAR NOVO PRODUTO   **********************************************************************************************************************																								    
													
													       
														  end;    { FIM DO CASE 3  DO MENU DOS ITENS NO STOCK }
														  PROD[1].Sactual:= 0;
														  for I:= 1 to 11 do
													        begin        
													         if (PROD[I].QTD_ACTUAL <> 0) then
													          PROD[1].Sactual:= PROD[1].Sactual + PROD[I].QTD_ACTUAL;
													        end;
													      
																PROD[1].Sentrada:= 0;  
													      for I:= 1 to 11 do
													        begin
													         if (PROD[I].ULT_ENTRADA <> 0) then
													         PROD[1].Sentrada:= PROD[1].Sentrada + PROD[I].ULT_ENTRADA;
													        end;
														  
														  PROD[1].Ssaida:=0;
														    for I:= 1 to 11 do
													        begin
													         if (PROD[I].ULT_SAIDA <> 0) then
													          PROD[1].Ssaida:= PROD[1].Ssaida + PROD[I].ULT_SAIDA;
													        end;
														   
														  
													 end;      // END DO WHILE 1 DO MENU DOS PRODUTOS                    //////////////////////////											  
													 
						              end;       //END DA OP '1' REFERENTE AO MENU DOS ITEMS NO MENU PRINCIPAL
						        '2':  begin        //BEGIN DA OP '2' REFERENTE AO BALANCO NO MENU PRINCIPAL
						                clrscr;
						                gotoxy(25,5);
						                write(' ESCOLHEU OPCAO - 2');
						                delay(2000);
														gotoxy(24,7);
														write('Visualisar o Balanco ');
														delay(1500);
														clrscr;
														P1:= 1;
														while (P1 <> 0) do
														  begin    //BEGIN DO WHILE DO MENU DOS BALANCOS
														   MenuBalanco(P1);
													    	case P1 of //BEGIN DO CASE REFERENTE AS OPCOES DO MENU DOS BALANCOS
														     1 : begin           
														             clrscr;
						                             gotoxy(25,5);
						                             write(' ESCOLHEU OPCAO - 1');
						                             delay(1000);
														             gotoxy(24,7);
														             write('Visualisar o Balanco Diario');
														             delay(1000);
														             clrscr;
														             BalancoDiario ;
														           end;      
														           
														     2 : begin
																         clrscr;
						                             gotoxy(25,5);
						                             write(' ESCOLHEU OPCAO - 2');       //Balanco Semanal
						                             delay(1000);
														             gotoxy(24,7);
														      //       Data_semana;
														             
														             BalancoSemanal ;                 																      
														           end;
														           
														     3 : begin
																         clrscr;
						                             gotoxy(25,5);
						                             write(' ESCOLHEU OPCAO - 3');       //Balanco Semanal
						                             delay(1000);
														             gotoxy(24,7);
																        
																      
														           end;
														           
														//     '4' : begin
																         //Balanco Trimestral
																 
																//       end;
																       
																										           
														    end;    //END DO CASE REFERENTE AS OPCOES DO MENU DOS BALANCOS
														    
														    
														  end;  //END DO WHILE DO MENU DOS BALANCOS
															 
						              end;           //END DA OP '2' REFERENTE AO BALANCO NO MENU PRINCIPAL
						        '3':  begin     //BEGIN DA OP '3' REFERENTE AO HISTORICO NO MENU PRINCIPAL
						                clrscr;
						                gotoxy(25,5);
						                write(' ESCOLHEU OPCAO - 3');
						                delay(2000);
														gotoxy(24,7);
														write('Visualizar o Historico');
														delay(1500);
														clrscr;
														Historico(P1);
														 case P1 of
														  1: begin
														       gotoxy(4,5);														  
														       writeln ('A visualizar o Historico Geral de  acesso');
														       delay(2000);
														        
												           //     PROD[1].hDATA := '0';
												           
													          if (PROD[1].hDIA = 0 ) or ((PROD[1].HDIA = PROD[1].DIA) and ('PROD[1].HMES' = 'PROD[1].MES')) then         
													           begin
													            CALCULO_H(MESAUx);
													            I1:= 1;
													            CONDICAOX(I1);
													            write(PDI,PROD[1]);
													           end
													         else
													           begin
													            if (PROD[2].hDIA = 0 ) or ((PROD[2].HDIA = PROD[1].DIA) and ('PROD[2].HMES' = 'PROD[1].MES')) then
													             begin
													               CALCULO_H(MESAUX);
													               I1:= 2;
													               CONDICAOX(I1);
													               write(PDI,PROD[2]);
													     
													             end ;
													            if (PROD[3].hDIA = 0 ) or ((PROD[3].HDIA = PROD[1].DIA) and ('PROD[3].HMES' = 'PROD[1].MES')) then
													              begin
													                CALCULO_H(MESAUX);
													                I1:= 3;
													                CONDICAOX(I1);
													                write(PDI,PROD[3]);
													              end
													            else
													              if (PROD[4].hDIA = 0 ) or (PROD[4].HDIA = PROD[1].DIA) then
													              begin
													                CALCULO_H(MESAUX);
													                I1:= 4;
													                CONDICAOX(I1);
													                write(PDI,PROD[4]);
													              end
													             else
													              begin
													                if (PROD[5].hDIA = 0 ) or (PROD[5].HDIA = PROD[1].DIA) then
													                 begin
													                  CALCULO_H(MESAUX);
													                  I1:= 5;
													                  CONDICAOX(I1);
													                  write(PDI,PROD[5]);
													                  end
													                 else
													                  begin
													                    if (PROD[6].HDIA =0 ) or (PROD[6].HDIA = PROD[1].DIA)then
													                     begin
													                       CALCULO_H(MESAUX);
													                       I1:= 6;
													                       CONDICAOX(I1);
													                       write(PDI,PROD[6]);
													                     end
													                    else
													                     if (PROD[7].HDIA = 0 ) or (PROD[7].HDIA = PROD[1].DIA) then
													                      begin
													                         CALCULO_H(MESAUX);
													                         I1:= 7;
													                         CONDICAOX(I1);
													                         write(PDI,PROD[7]);
													                      end
													                     else
													                      begin
													                        if (PROD[8].HDIA = 0) or (PROD[8].HDIA = PROD[1].DIA) then
													                         begin
													                           CALCULO_H(MESAUX);
													                           I1:= 8;
													                           CONDICAOX(I1);
													                           write(PDI,PROD[8]);
													                         end
													                        else
													                         begin
													                          if (PROD[9].HDIA = 0) OR (PROD[9].HDIA = PROD[1].DIA) then
													                           begin
													                            CALCULO_H(MESAUX);
													                            I1:= 9;
													                            CONDICAOX(I1);
													                            write(PDI,PROD[9]);
													                           end
													                         end;
													                      end
													                  end;
													              end;
													           end;
														       clrscr;
														       HistoricoGeral;
														     end;
														  end;  
						              end;      //END DA OP '3' REFERENTE AO HISTORICO NO MENU PRINCIPAL
						        '4':  begin
						                cont:= 0;
						                repeat 
						                 writeln ;
						                 write('Para Poder Alterar Qualquer Dado do Registro precisa ter Permissao: ');
						                 writeln; 
						                 write('Deseja continuar ? S/N ? : '); read(Resp);
						                 clrscr;
						                 case upcase(resp) of
						                  'N': begin
						                          
						                       end;
						                  'S': begin      // BEGIN DO 'S'
						                        repeat      //BEGIN DO REPEAT (1)
						                         textcolor(green);
						                         gotoxy(3,5);
																		 write('Digite o Codigo do Administrator : ');
																		 read(passw);
																		 if (passw = 12345) then
																		  begin   ///////////// BEGIN DO IF (1)
																		   repeat               //////REPEAT DO MENU
																		   AlterarReg(P1);      
																		   
																		    case P1 of
																		    1: begin       // BEGIN DO P1 (1)        
																		    repeat    // REPEAT (2)
																		     clrscr;
																		     gotoxy(2,4);
														             write('Digite o dia que contem o nome que deseja alterar');
														             delay(1000);
														             writeln;
														             write('Digite O dia no formato [dd] : '); read(diareg);
                                         write('Digite O Mes no formato [mm] : '); read(mesreg);
                                         MesRegistro(mesreg,mesaux);
                                         seek(PDI,0);
                                         
                                         cont:= 0;
                                         for I:= 1 to 20 do 
                                         begin           /// BEGIN DO FOR (1)
                                          with PROD[I] do
                                          begin          // BEGIN DO COMANDO WITH
                                           read(PDI,PROD[I]);          
                                  
                                           if (HDIa = diaReg) or ('mesreg' = 'HMES') then
                                            begin                                  //BEGIN DO IF (1)
                                    				writeln;
                                    				writeln('Nome actual: ',HNOME);
															     					writeln('Cargo: ',HCARGO);
																   					writeLN('Idade : ', HIDADE);
																   					writeln('Quantidade actual: ',HACTUAL);
															     				  writeln('Quantidade de Saida : ',HSAIDA);
																   				  writeln('Quantidade de Entrada : ', HENTRADA);
																   					writeln;
																   				  writeln;
																    			  write('Digite o Novo Nome para Alterar o Nome Actual : '); read(HNOME);
																    
																    			  seek(PDI,filepos(PDI)-1);
																    			  write(PDI,PROD[I]);
																						 
																						break;             
															    				 end   ///// FIM DO IF (1)
															    				 else 
															    				  begin
															    				   cont:= cont + 1;
															    				  end;
															            END;    // END DO COMANDO WITH
															            if (cont = 20) then
															             begin
															               clrscr;
															               textcolor(12);
															               gotoxy(2,6);
															               writeln ('Registro de Data nao Encontrado !');
															               delay(2500);
															             end;
															           end;   /// END DO FOR (1)
															             textcolor(green);
															            clrscr;
															            gotoxy(1,3);
															            write('Deseja Alterar Nome de Algum outro Registro ? S/N ? : '); read(rsp);
															           
                                        until (Upcase(rsp) = 'N'); //UNTIL DO REPAT  (2)
                                       end;  // END DO P1 (1)
                                        2 : begin       // BEGIN DO P1 (2)
																		    repeat    // REPEAT (2)
																		     clrscr;
																		     gotoxy(2,4);
														             write('Digite o dia que contem a Idade que deseja Alterar');  
														             delay(1000);
														             writeln;
														             write('Digite O dia no formato [dd] : '); read(diareg);
                                         write('Digite O Mes no formato [mm] : '); read(mesreg);
                                         MesRegistro(mesreg,mesaux);
                                         seek(PDI,0);
                                         
                                         cont:= 0;
                                         for I:= 1 to 20 do 
                                         begin           /// BEGIN DO FOR (1)
                                          with PROD[I] do
                                          begin          // BEGIN DO COMANDO WITH
                                           read(PDI,PROD[I]);          
                                  
                                           if (HDIa = diaReg) or ('mesreg' = 'HMES') then
                                            begin                                  //BEGIN DO IF (1)
                                    				writeln;
                                    				writeln('Nome actual: ',HNOME);
															     					writeln('Cargo: ',HCARGO);
																   					writeLN('Idade : ', HIDADE);
																   					writeln('Quantidade actual: ',HACTUAL);
															     				  writeln('Quantidade de Saida : ',HSAIDA);
																   				  writeln('Quantidade de Entrada : ', HENTRADA);
																   					writeln;
																   				  writeln;
																    			  write('Digite a Nova Idade para Alterar a Idade Actual : '); read(HIdade);
																    
																    			  seek(PDI,filepos(PDI)-1);
																    			  write(PDI,PROD[I]);
																						 
																						break;             
															    				 end   ///// FIM DO IF (1)
															    				 else 
															    				  begin
															    				   cont:= cont + 1;
															    				  end;
															            END;    // END DO COMANDO WITH
															            if (cont = 20) then
															             begin
															               clrscr;
															               textcolor(12);
															               gotoxy(2,6);
															               writeln ('Registro de Data nao Encontrado !');
															               delay(2500);
															             end;
															           end;   /// END DO FOR (1)
															             textcolor(green);
															            clrscr;
															            gotoxy(1,3);
															            write('Deseja Alterar Idade de Algum outro Registro ? S/N ? : '); read(rsp);
															           
                                        until (Upcase(rsp) = 'N'); //UNTIL DO REPAT  (2)
                                       end;  // END DO P1 (2)
																				
																				3 : begin       // BEGIN DO P1 (3)
																		    repeat    // REPEAT (2)
																		     clrscr;
																		     gotoxy(2,4);
														             write('Digite o dia que contem o Cargo que deseja Alterar');  
														             delay(1000);
														             writeln;
														             write('Digite O dia no formato [dd] : '); read(diareg);
                                         write('Digite O Mes no formato [mm] : '); read(mesreg);
                                         MesRegistro(mesreg,mesaux);
                                         seek(PDI,0);
                                         
                                         cont:= 0;
                                         for I:= 1 to 20 do 
                                         begin           /// BEGIN DO FOR (1)
                                          with PROD[I] do
                                          begin          // BEGIN DO COMANDO WITH
                                           read(PDI,PROD[I]);          
                                  
                                           if (HDIa = diaReg) or ('mesreg' = 'HMES') then
                                            begin                                  //BEGIN DO IF (1)
                                    				writeln;
                                    				writeln('Nome actual: ',HNOME);
															     					writeln('Cargo: ',HCARGO);
																   					writeLN('Idade : ', HIDADE);
																   					writeln('Quantidade actual: ',HACTUAL);
															     				  writeln('Quantidade de Saida : ',HSAIDA);
																   				  writeln('Quantidade de Entrada : ', HENTRADA);
																   					writeln;
																   				  writeln;
																    			  write('Digite o Novo Cargo para Alterar o Cargo Actual : '); read(Hcargo);
																    
																    			  seek(PDI,filepos(PDI)-1);
																    			  write(PDI,PROD[I]);
																						 
																						break;             
															    				 end   ///// FIM DO IF (1)
															    				 else 
															    				  begin
															    				   cont:= cont + 1;
															    				  end;
															            END;    // END DO COMANDO WITH
															            if (cont = 20) then
															             begin
															               clrscr;
															               textcolor(12);
															               gotoxy(2,6);
															               writeln ('Registro de Data nao Encontrado !');
															               delay(2500);
															             end;
															           end;   /// END DO FOR (1)
															             textcolor(green);
															            clrscr;
															            gotoxy(1,3);
															            write('Deseja Alterar Cargo de Algum outro Registro ? S/N ? : '); read(rsp);
															           
                                        until (Upcase(rsp) = 'N'); //UNTIL DO REPAT  (2)
                                       end;  // END DO P1 (3)
																				    
																			 	4 : begin       // BEGIN DO P1 (4)
																		    repeat    // REPEAT (2)
																		     clrscr;
																		     gotoxy(2,4);
														             write('Digite o dia que contem a Data que deseja Alterar');  
														             delay(1000);
														             writeln;
														             write('Digite O dia no formato [dd] : '); read(diareg);
                                         write('Digite O Mes no formato [mm] : '); read(mesreg);
                                         MesRegistro(mesreg,mesaux);
                                         seek(PDI,0);
                                         
                                         cont:= 0;
                                         for I:= 1 to 20 do 
                                         begin           /// BEGIN DO FOR (1)
                                          with PROD[I] do
                                          begin          // BEGIN DO COMANDO WITH
                                           read(PDI,PROD[I]);          
                                  
                                           if (HDIa = diaReg) or ('mesreg' = 'HMES') then
                                            begin                                  //BEGIN DO IF (1)
                                    				writeln;
                                    				writeln('Nome actual: ',HNOME);
															     					writeln('Cargo: ',HCARGO);
																   					writeLN('Idade : ', HIDADE);
																   					writeln('Quantidade actual: ',HACTUAL);
															     				  writeln('Quantidade de Saida : ',HSAIDA);
																   				  writeln('Quantidade de Entrada : ', HENTRADA);
																   				  writeln('O dia Actual e : ',HDIA);
																   				  writeln('O Mes Actual e : ', HMes);
																   					writeln;
																   				  writeln;
																   				  gotoxy(2,15);
																    			  write('Digite O novo dia no formato [dd] para Alterar o Dia Actual : '); read(HDia);
																    			  write('Digite O novo Mes no formato [mm] para Alterar o Mes Actual : '); read(I);
																            MesRegistro(I,mesaux);
																            Hmes:= mesaux;
																    			  seek(PDI,filepos(PDI)-1);
																    			  write(PDI,PROD[I]);
																						 
																						break;             
															    				 end   ///// FIM DO IF (1)
															    				 else 
															    				  begin
															    				   cont:= cont + 1;
															    				  end;
															            END;    // END DO COMANDO WITH
															            if (cont = 20) then
															             begin
															               clrscr;
															               textcolor(12);
															               gotoxy(2,6);
															               writeln ('Registro de Data nao Encontrado !');
															               delay(2500);
															             end;
															           end;   /// END DO FOR (1)
															             textcolor(10);
															            clrscr;
															            gotoxy(1,3);
															            write('Deseja Alterar Data de Algum outro Registro ? S/N ? : '); read(rsp);
															           
                                        until (Upcase(rsp) = 'N'); //UNTIL DO REPAT  (2)
                                       end;  // END DO P1 (2)
																				5 : begin       // BEGIN DO P1 (5)
																		    repeat    // REPEAT (2)
																		     clrscr;
																		     gotoxy(2,4);
														             write('Digite o dia que contem as Quantidades de Entrada que deseja Alterar');  
														             delay(1000);
														             writeln;
														             write('Digite O dia no formato [dd] : '); read(diareg);
                                         write('Digite O Mes no formato [mm] : '); read(mesreg);
                                         MesRegistro(mesreg,mesaux);
                                         seek(PDI,0);
                                         
                                         cont:= 0;
                                         for I:= 1 to 20 do 
                                         begin           /// BEGIN DO FOR (1)
                                          with PROD[I] do
                                          begin          // BEGIN DO COMANDO WITH
                                           read(PDI,PROD[I]);          
                                  
                                           if (HDIa = diaReg) or ('mesreg' = 'HMES') then
                                            begin                                  //BEGIN DO IF (1)
                                    				writeln;
                                    				writeln('Nome : ',HNOME);
															     					writeln('Cargo: ',HCARGO);
																   					writeLN('Idade : ', HIDADE);
																   					writeln('Quantidade actual: ',HACTUAL);
															     				  writeln('Quantidade de Saida : ',HSAIDA);
																   				  writeln('Quantidade de Entrada : ', HENTRADA);
																   					writeln;
																   				  writeln;
																    			  write('Digite a Nova Quantidade de Entrada para Alterar a Actual : '); read(Hentrada);
																    
																    			  seek(PDI,filepos(PDI)-1);
																    			  write(PDI,PROD[I]);
																						 
																						break;             
															    				 end   ///// FIM DO IF (1)
															    				 else 
															    				  begin
															    				   cont:= cont + 1;
															    				  end;
															            END;    // END DO COMANDO WITH
															            if (cont = 20) then
															             begin
															               clrscr;
															               textcolor(12);
															               gotoxy(2,6);
															               writeln ('Registro de Data nao Encontrado !');
															               delay(2500);
															             end;
															           end;   /// END DO FOR (1)
															             textcolor(green);
															            clrscr;
															            gotoxy(1,3);
															            write('Deseja Alterar Alguma outra Quantidade de entrada do Registro ? S/N ? : '); read(rsp);
															           
                                        until (Upcase(rsp) = 'N'); //UNTIL DO REPAT  (2)
                                       end;  // END DO P1 (5)
																				6 : begin       // BEGIN DO P1 (6)
																		    repeat    // REPEAT (2)
																		     clrscr;
																		     gotoxy(2,4);
														             write('Digite o dia que as Quantidades de saida que deseja Alterar');  
														             delay(1000);
														             writeln;
														             write('Digite O dia no formato [dd] : '); read(diareg);
                                         write('Digite O Mes no formato [mm] : '); read(mesreg);
                                         MesRegistro(mesreg,mesaux);
                                         seek(PDI,0);
                                         
                                         cont:= 0;
                                         for I:= 1 to 20 do 
                                         begin           /// BEGIN DO FOR (1)
                                          with PROD[I] do
                                          begin          // BEGIN DO COMANDO WITH
                                           read(PDI,PROD[I]);          
                                  
                                           if (HDIa = diaReg) or ('mesreg' = 'HMES') then
                                            begin                                  //BEGIN DO IF (1)
                                    				writeln;
                                    				writeln('Nome actual: ',HNOME);
															     					writeln('Cargo: ',HCARGO);
																   					writeLN('Idade : ', HIDADE);
																   					writeln('Quantidade actual: ',HACTUAL);
															     				  writeln('Quantidade de Saida : ',HSAIDA);
																   				  writeln('Quantidade de Entrada : ', HENTRADA);
																   					writeln;
																   				  writeln;
																    			  write('Digite a Nova Quantidade de Saida : '); read(Hcargo);
																    
																    			  seek(PDI,filepos(PDI)-1);
																    			  write(PDI,PROD[I]);
																						 
																						break;             
															    				 end   ///// FIM DO IF (1)
															    				 else 
															    				  begin
															    				   cont:= cont + 1;
															    				  end;
															            END;    // END DO COMANDO WITH
															            if (cont = 20) then
															             begin
															               clrscr;
															               textcolor(12);
															               gotoxy(2,6);
															               writeln ('Registro de Data nao Encontrado !');
															               delay(2500);
															             end;
															           end;   /// END DO FOR (1)
															             textcolor(green);
															            clrscr;
															            gotoxy(1,3);
															            write('Deseja Alterar Cargo de Algum outro Registro ? S/N ? : '); read(rsp);
															           
                                        until (Upcase(rsp) = 'N'); //UNTIL DO REPAT  (2)
                                       end;  // END DO P1 (6)
																				    
                                       end;
                                       
                                       cont:= cont + 1;
                                       until (P1 = 0) or (cont = 5);        //// UNTIL DO REPEAT DO MENU
																		  end    /////////////////// END DO IF (1)
																	 	 else
																		  begin
																		   textcolor(12);
																		   gotoxy(3,10);
																		   writeln ('Digitou codigo errado');
																		   delay(1500);
																		   clrscr;
																		  end;
																		
																		cont:= cont + 1;
																		until (passw = 12345) or (cont = 4); // UNTIL DO REPEAT (1)
						                       end;      //END DO 'S'
						                 end;
						                 
												     cont:= 1;		
											      until (passw = 001) or (cont= 1) or (upcase(resp)= 'N');		
						              end;
						      //   END;
						        '0':  begin      //BEGIN DA OP '0' REFERENTE AO ENCERRAMENTO NO MENU PRINCIPAL
						                textbackground(17);
						                clrscr;
						                textbackground(17);
						                   
						                Close(PDI);
						                textcolor(15);
						                gotoxy(16,6);
						                write(' Escolheu sair do Programa ');
						                delay(2000);                                                   
						                gotoxy(16,10);
						                writeln ('Terminando de salvar as alteracoes Efectuadas');
						                delay (3000);        
						                for I:= 60 to 65 do
						                 begin
						                     if (I = 61) then
	                                 begin
	                                  gotoxy(I, 10);
	                                  write('.');
	                                  delay(3000);
	                                 end;
	              
	                                if (I = 63) then
	                                  begin
	                                   gotoxy(I, 10);
	                                   write('.');
	                                   delay(3000); 
	                                  end;
	                               if (I = 65) then
	                                  begin
	                                    gotoxy(I, 10);
	                                    write('.');
	                                    delay(2000);
	                                  end;
						                  end;
						                  delay(2000);
						                  textcolor(12);
						                  delay(1500);
						                  gotoxy(1, 28);
						              //    write(PDI,PROD[1]);
						                  Encerrar;
						              end;       //END DA OP '0' REFERENTE AO ENCERRAMENTO NO MENU PRINCIPAL
						        else
										 begin    //BEGIN DO ELSE DAS OPCOES DO MENU PRINCIPAL
										 
										 end;         //END DO ELSE DAS OPCOES DO MENU PRINCIPAL
						       end;                { FIM DO CASE 2  DO MENU PRINCIPAL }
						     until (OP = '0');    { FIM DA CONDICAO DO SEGUNDO REPEAT }	  //FIM REPEAT (2) 
						
					     end;              { FIM (2) DO TESTE VERDADEIRO PARA PASSWORD }    //END (2)
					  
					  cont:= cont + 1;
					  if (cont = 4) then
					   begin
					   
					     clrscr;
					     gotoxy(5,9);
					     writeln (PROD[1].INFO.nome, ', Errou a senha mais de 4 vezes, o programa esta a encerrar ... ');
					     delay(4000);
							 
					     Encerrar;   
					   end;
					      
					until (passw = 002015) or (cont = 4);      { FIM DA CONDICAO DO PRIMEIRO REPEAT }	  //FIM REPEAT (1)
					  
				end;    { END DO CASE principal CASO SEJA SIM }     //END (1)
				else
				 begin
				  writeln ('Digitou uma tecla errada, encerrando...');
				  Encerrar;
				 end;
		 end;     { END DO CASE 1 (PRIMEIRO )CASE DO PROGRAMA PRINCIPAL }
//			write(PDI,PROD[1]);
		Close(PDI);
End.              { END DOPROGRAMA PRINCIPAL }