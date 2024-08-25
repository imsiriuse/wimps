unit Unit_DataTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumnClasses, NxColumns, StdCtrls, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, Unit_Hlavicka, Unit_Tabulka,
  Unit_Intervaly, Globalne_Premenne, DateUtils, Math;
type
  TDataTest = class(TForm)
    TabChyb: TNextGrid;
    Spusti: TButton;
    Zavriet: TButton;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    NxIncrementColumn1: TNxIncrementColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZavrietClick(Sender: TObject);
    procedure SpustiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataTest: TDataTest;
  DataTestOpened: Boolean;
implementation

uses Unit_Main;

{$R *.dfm}

procedure TDataTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
  DataTestOpened:=false;
end;

procedure TDataTest.ZavrietClick(Sender: TObject);
begin
  close;
end;

procedure TDataTest.SpustiClick(Sender: TObject);

procedure error(position, name, number: string);
{Parametre: umiestnenie chyby, nazov chyby, cislo chyby}
begin
  TabChyb.AddRow;
  TabChyb.Cells[2,TabChyb.RowCount-1]:=position;
  TabChyb.cells[3,TabChyb.RowCount-1]:=name;
  TabChyb.Cells[1,TabChyb.RowCount-1]:=number;
end;

function numbertest(retazec: string):boolean;
var
  I: integer;
begin
  result:=false;
  for I:=1 to length(retazec) do
    if not (retazec[I] in ['0'..'9'])
      then
        result:=true;
end;

function chartest(retazec: string):boolean;
var
  I:integer;
begin
  result:=false;
  for I:=1 to length(retazec) do
    if (retazec[I] in ['0'..'9'])
      then
        result:=true;
end;

function intcheck(zac,kon, chzac, chkon: real):boolean;
begin
  result:=false;
  If Kon<Zac
    then
      Kon:=Kon+24;

  if Zac>chzac
    then
      chzac:=chzac+24;
  if Kon<chzac
    then
      result:=true;

  if zac>chkon
    then
      chkon:=chKon+24;

  if Kon<ChKon
    then
      result:=true;
end;

function timecheck(zac, kon, ch: real):boolean;
begin
  result:=false;
  If Kon<Zac
    then
      Kon:=Kon+24;
  if Zac>ch
    then
      ch:=ch+24;
  if Kon<ch
    then
      result:=true;
end;

function TimeVyskaCheck(horizont: integer; Cas: real; datum:string; alfa, delta, fi, lambda: real): boolean;
var
  h,JD: real;
begin

  JD:=datetimeToJulianDate(strtodatetime(datum));
  h:= 18.697374558 + 24.06570982441908*(JD-2451545);
  h:=(h/24-trunc(h/24))*24;
  h:=h + 1.0027379093*(cas)+lambda/15;
  h:=(h/24-trunc(h/24))*24;
  h:=(h-alfa/15)*15;
  h:=cos(DegToRad(delta))*cos(DegToRad(h))*cos(DegToRad(fi))+
     sin(DegToRad(delta))*sin(DegToRad(fi));
  h:=ArcSin(h);
  h:=RadToDeg(h);

  if h<horizont
    then
      result:=true;
end;

function RojVyskaCheck(roj: integer; horizont: integer; zac,kon: real; datum:string; alfa, delta, fi, lambda: real): boolean;
var
  h, JD, cas, da, dd, max: real;
begin
  result:= false;

  if Zac>Kon
    then
      Kon:=Kon+24;

 repeat
  cas:=zac;

  JD:=datetimeToJulianDate(strtodatetime(datum));
  max:=datetimeToJulianDate(strtodatetime(
       pozorovanie.roje[roj].max[3]+pozorovanie.roje[roj].max[4]+'. '+
       pozorovanie.roje[roj].max[1]+pozorovanie.roje[roj].max[2]+'. '+
       inttostr(yearOf(strtodate(pozorovanie.Datum)))
       ));

  da:=strtoint(pozorovanie.roje[roj].da)/10;
  dd:=strtoint(pozorovanie.roje[roj].dd)/10;

  alfa:=strtoint(pozorovanie.roje[roj].rec)+da*(JD-max);
  alfa:=alfa+(da/24)*cas;
  delta:=strtoint(pozorovanie.roje[roj].dec)+dd*(JD-max);
  delta:=delta+(dd/24)*cas;

  h:= 18.697374558 + 24.06570982441908*(JD-2451545);
  h:=(h/24-trunc(h/24))*24;
  h:=h + 1.0027379093*(Cas)+lambda/15;
  h:=(h/24-trunc(h/24))*24;
  h:=(h-alfa/15)*15;
  h:=cos(DegToRad(delta))*cos(DegToRad(h))*cos(DegToRad(fi))+
     sin(DegToRad(delta))*sin(DegToRad(fi));
  h:=ArcSin(h);
  h:=RadToDeg(h);

  if horizont>h
    then
      result:=true;

  zac:=zac+0.25;
 until zac>=kon;

end;

function IntVyskaCheck(horizont: integer; zac,kon: real; datum:string; alfa, delta, fi, lambda: real): boolean;
var
  h,JD, cas: real;
begin
 result:= false;
 if Zac>Kon
   then
     Kon:=Kon+24;
 repeat

 cas:=zac;
 JD:=datetimeToJulianDate(strtodatetime(datum));
    if Cas>24
      then
        begin
          JD:=JD+1;
          Cas:=(Cas/24-trunc(Cas/24))*24;
        end;

    h:= 18.697374558 + 24.06570982441908*(JD-2451545);
    h:=(h/24-trunc(h/24))*24;
    h:=h + 1.0027379093*(Cas)+lambda/15;
    h:=(h/24-trunc(h/24))*24;
    h:=(h-alfa/15)*15;
    h:=cos(DegToRad(delta))*cos(DegToRad(h))*cos(DegToRad(fi))+
       sin(DegToRad(delta))*sin(DegToRad(fi));
    h:=ArcSin(h);
    h:=RadToDeg(h);

    if horizont>h
      then
        result:=true;

    zac:=zac+0.25;
 until zac>=kon;

end;

function AkyJeToInterval(cas: real): integer;
var
  I: integer;
  kon,zac,H: real;
begin
  result:=0;
  for I:=1 to pozorovanie.IntPocet do
    begin
      H:=cas;
      zac:=strtoint(pozorovanie.intervaly[I].zacH)+strtoint(pozorovanie.intervaly[I].zacM)/60;
      kon:=strtoint(pozorovanie.intervaly[I].konH)+strtoint(pozorovanie.intervaly[I].konM)/60;
      If Kon<Zac
        then
          Kon:=Kon+24;
      if Zac>h
        then
          h:=h+24;
      if Kon>=h
        then
          result:=I;
    end;
end;

function AkyJeToPozorovatel(cas: real; poz: string): integer;
var
  x,I:integer;
  kon,zac,H: real;
begin
  result:=0;
  for x:=1 to pozorovanie.IntPocet do
    begin
    H:=cas;
    zac:=strtoint(pozorovanie.intervaly[x].zacH)+strtoint(pozorovanie.intervaly[x].zacM)/60;
    kon:=strtoint(pozorovanie.intervaly[x].konH)+strtoint(pozorovanie.intervaly[x].konM)/60;
    If Kon<Zac
      then
        Kon:=Kon+24;
    if Zac>h
      then
        h:=h+24;
    if Kon>=h
      then
        I:=x;
    end;

  for x:=1 to pozorovanie.intervaly[I].PozPocet do
    if poz=pozorovanie.intervaly[I].pozorovatelia[x].cislo
      then
        result:=x;
end;

function AkaJeToLimitka(cas: real; poz: string): integer;
var
  x,I,J: integer;
  Zac,Kon,H:real;
begin
  result:=0;
  for x:=1 to pozorovanie.IntPocet do
    begin
      H:=cas;
      zac:=strtoint(pozorovanie.intervaly[x].zacH)+strtoint(pozorovanie.intervaly[x].zacM)/60;
      kon:=strtoint(pozorovanie.intervaly[x].konH)+strtoint(pozorovanie.intervaly[x].konM)/60;
      If Kon<Zac
        then
          Kon:=Kon+24;
      if Zac>h
        then
          h:=h+24;
      if Kon>=h
        then
          I:=x;
    end;

  for x:=1 to pozorovanie.intervaly[I].PozPocet do
    if poz=pozorovanie.intervaly[I].pozorovatelia[x].cislo
      then
        J:=x;

  zac:=strtoint(pozorovanie.intervaly[I].zacH)+strtoint(pozorovanie.intervaly[I].zacM)/60;
  kon:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[1].Hod)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[1].Hod)/60;
  H:=cas;
  If Kon<Zac
    then
      Kon:=Kon+24;
  if Zac>h
    then
      h:=h+24;
  if Kon>=h
    then
      result:=1;
  for x:=1 to pozorovanie.intervaly[I].pozorovatelia[J].limpocet-1 do
    begin
      H:=cas;
      zac:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[x].Hod)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[x].Hod)/60;
      kon:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[x+1].Hod)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[x+1].Hod)/60;
      If Kon<Zac
        then
          Kon:=Kon+24;
      if Zac>h
        then
          h:=h+24;
      if Kon>=h
        then
          result:=x;
    end;
    zac:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[pozorovanie.intervaly[I].pozorovatelia[J].limpocet].Hod)+
         strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[pozorovanie.intervaly[I].pozorovatelia[J].limpocet].Hod)/60;
    kon:=strtoint(pozorovanie.intervaly[I].konH)+strtoint(pozorovanie.intervaly[I].konM)/60;
  H:=cas;
  If Kon<Zac
    then
      Kon:=Kon+24;
  if Zac>H
    then
      H:=H+24;
  if Kon>=H
    then
      result:=pozorovanie.intervaly[I].pozorovatelia[J].limpocet;
end;

var
  I,J,K,L,M:integer;
  chyba: boolean;
  H, G: real;
  ch: char;
  spravne: boolean;
  DlzkaHodnota: real;
  SirkaHodnota: real;
  DatumZac, DatumKon: real;
begin
  TabChyb.ClearRows;
  pozorovanie.Tested:=true;
  chyba:=false;

  if pozorovanie.Datum=''
    then
      begin
        chyba:=true;
        error('Date','Missing value', '1');
      end;

  if pozorovanie.zaciatokH=''
    then
      begin
        chyba:=true;
        error('Observation begin','Missing value', '1');
      end;

  if pozorovanie.zaciatokM=''
    then
      begin
        chyba:=true;
        error('Observation begin','Missing value', '1');
      end;

  if pozorovanie.KoniecH=''
    then
      begin
        chyba:=true;
        error('Observation end','Missing value', '1');
      end;

  if pozorovanie.KoniecM=''
    then
      begin
        chyba:=true;
        error('Observation end','Missing value', '1');
      end;
	  
  if pozorovanie.miesto.DlzkaH=''
    then
      begin
        chyba:=true;
        error('Longitude','Missing value', '1');
      end;

  if pozorovanie.miesto.DlzkaM=''
    then
      begin
        chyba:=true;
        error('Longitude','Missing value', '1');
      end;

  if pozorovanie.miesto.DlzkaS=''
    then
      begin
        chyba:=true;
        error('Longitude','Missing value', '1');
      end;
	  
  if pozorovanie.miesto.SirkaH=''
    then
      begin
        chyba:=true;
        error('Latitude','Missing value', '1');
      end;

  if pozorovanie.miesto.SirkaM=''
    then
      begin
        chyba:=true;
        error('Latitude','Missing value', '1');
      end;

  if pozorovanie.miesto.SirkaS=''
    then
      begin
        chyba:=true;
        error('Latitude','Missing value', '1');
      end;

  if pozorovanie.miesto.Meno=''
    then
      begin
        chyba:=true;
        error('Place name','Missing value', '1');
      end;
  
  if pozorovanie.miesto.Stat=''
    then
      begin
        chyba:=true;
        error('State','Missing value', '1');
      end;
 
  if pozorovanie.miesto.Vyska=''
    then
      begin
        chyba:=true;
        error('Altitude','Missing value', '1');
      end;
	  
  if pozorovanie.pozPocet=0 then
    begin
      chyba:=true;
      error('Observers','No data', '4');
    end;	
  
  for I:=1 to pozorovanie.pozPocet do
    begin
      if pozorovanie.pozorovatel[I].Imokod=''
        then
          begin
            chyba:=true;
            error('Observer['+inttostr(I)+'](IMO code)','Missing value', '1');
          end;
	  
	  if pozorovanie.pozorovatel[I].meno=''
        then
          begin
            chyba:=true;
            error('Observer['+inttostr(I)+'](name)','Missing value', '1');
          end;
	  
	  if pozorovanie.pozorovatel[I].Priezvisko=''
        then
          begin
            chyba:=true;
            error('Observer['+inttostr(I)+'](surname)','Missing value', '1');
          end;
	end;	
  
  if pozorovanie.RojPocet=0
    then
      begin
        chyba:=true;
        error('Showers','No data','4');
      end;
  
  if pozorovanie.IntPocet=0
    then
      begin
        chyba:=true;
        error('Intervals','No data', '4');
      end;

  for I:=1 to pozorovanie.intPocet do
    if pozorovanie.intervaly[I].PozPocet=0
      then
        begin
          chyba:=true;
          error('Interval ['+inttostr(I)+'] observers','No data', '4');
        end;
		
  for I:=1 to pozorovanie.IntPocet do
    for J:=1 to pozorovanie.intervaly[I].PozPocet do
      if pozorovanie.intervaly[I].pozorovatelia[J].LimPocet=0
        then
          begin
            chyba:=true;
            error('Interval ['+inttostr(I)+'] observer ['+inttostr(J)+'] Lim. magnitude','No data', '4');
          end;

  (* Dalsie testy ktore nevyzaduju ine zistovania predtym*)
  if (length(pozorovanie.miesto.IMOkod)<>5) and
         (length(pozorovanie.miesto.IMOkod)<>0)
        then
          begin
            chyba:=true;
            error('Place IMO code','Wrong value', '3');
          end;
		  
  if (length(pozorovanie.zapisovatel.Imokod)<>5) and
     (length(pozorovanie.zapisovatel.Imokod)<>0)
    then
      begin
        chyba:=true;
        error('Recorder IMO code','Wrong value', '3');
      end;		  
   
  for I:=1 to pozorovanie.pozPocet do
    begin
      if (length(pozorovanie.pozorovatel[I].Imokod)<>5) and
         (length(pozorovanie.pozorovatel[I].Imokod)<>0)
        then
          begin
            chyba:=true;
            error('Observer ['+inttostr(I)+'] IMO code','Wrong type of value', '3');
          end;

      if chartest(pozorovanie.pozorovatel[I].Imokod)=true
        then
          begin
            chyba:=true;
            error('Observer ['+inttostr(I)+'] IMO code','Invalid character', '2');
          end;

      if numbertest(pozorovanie.pozorovatel[I].IMOcislo)=true
        then
          begin
            chyba:=true;
            error('Observer ['+inttostr(I)+'] IMO number','Invalid character', '2');
          end;

      if (length(pozorovanie.pozorovatel[I].IMOcislo)<>5) and
         (length(pozorovanie.pozorovatel[I].IMOcislo)<>0)
        then
          begin
            chyba:=true;
            error('Observer ['+inttostr(I)+'] IMO number','Wrong type of value', '3');
          end;

      if chartest(pozorovanie.pozorovatel[I].meno)=true
        then
          begin
            chyba:=true;
            error('Observer ['+inttostr(I)+'] name','Invalid character', '2');
          end;

      if chartest(pozorovanie.pozorovatel[I].priezvisko)=true
        then
          begin
            chyba:=true;
            error('Observer ['+inttostr(I)+'] surname','Invalid character', '2');
          end;
  end;

  for I:=1 to pozorovanie.RojPocet do
    if pozorovanie.roje[I].znak='-' then
      begin
        chyba:=true;
        error('Shower ['+inttostr(I)+'] ID','Invalid character', '2');
      end;
  
  if pozorovanie.tabulka.count=0
    then
	  begin
        chyba:=true;
        error('Meteors','No data', '4');
      end;

  H:=0;

  for K:=0 to (pozorovanie.Tabulka.Count div 10) -1 do
    begin
	  I:=K*10;
    inc(I);
    if numbertest(pozorovanie.Tabulka[I])=true
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Invalid character', '2');
          end;
	  if numbertest(pozorovanie.Tabulka[I+1])=true
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Invalid character', '2');
          end;

    if pozorovanie.Tabulka[I+1]<>''
	    then
          if strtoint(pozorovanie.Tabulka[I+1])>60
            then
              begin
                chyba:=true;
                error('Meteor: '+inttostr((I div 10)+1), 'Wrong value', '3');
              end;	  

	  if (pozorovanie.Tabulka[I]<>'') and
       (pozorovanie.tabulka[I+1]<>'')
        then
          begin
            H:=strtoint(pozorovanie.Tabulka[I])+strtoint(pozorovanie.Tabulka[I+1])/60;
            if H>24
              then
                begin
                  chyba:=true;
                  error('Meteor: '+inttostr((I div 10)+1), 'Wrong value', '3');
                end;
          end;

	  inc(I);
    inc(I);
	  if pozorovanie.Tabulka[I]=''
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Missing observer', '14');
          end;

      if numberTest(pozorovanie.Tabulka[I])=true
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Invalid character', '2');
          end;
	  
	  inc(I);
	  inc(I);

	   if pozorovanie.Tabulka[I]=''
        then
          pozorovanie.Tabulka[I]:=pref.rojovost;
	  
      spravne:=false;
      for J:=1 to pozorovanie.RojPocet do
        if (pozorovanie.Tabulka[I]=pozorovanie.roje[J].znak) or
           (pozorovanie.Tabulka[I]='-')
          then
            spravne:=true;
            
        if spravne=false
          then
            begin
              chyba:=true;
              error('Meteor: '+inttostr((I div 10)+1),'Absent shower', '20');
            end;
	  
	    inc(I);

      if pozorovanie.Tabulka[I]=''
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Missing value', '1');
          end;

      for J:=1 to length(pozorovanie.Tabulka[I]) do
        if  not(pozorovanie.Tabulka[I][J] in ['0'..'9']) and (pozorovanie.Tabulka[I][J]<>'-')
          then
            begin
              chyba:=true;
              error('Meteor: '+inttostr((I div 10)+1),'Invalid character', '2');
            end;
	  
	  inc(I);
		if pozorovanie.tabulka[I]=''
          then
            pozorovanie.Tabulka[I]:=pref.stopa;

	  if (pozorovanie.Tabulka[I]<>'+') and
       (pozorovanie.tabulka[I]<>'-')
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Invalid character', '2');
          end;

	  inc(I);
	  if numbertest(pozorovanie.Tabulka[I])=true
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Invalid character', '2');
          end;
          
    inc(I);
    if pozorovanie.tabulka[I]=''
        then
          pozorovanie.tabulka[I]:=pref.kvalita;
	end;

  (*doplnenie praznych policok casov*)
  if chyba=false
  then
  begin
    if pozorovanie.Tabulka[1]=''
      then
        begin
          pozorovanie.Tabulka[1]:=pozorovanie.intervaly[1].ZacH;
          if pozorovanie.Tabulka[2]=''
            then
              pozorovanie.Tabulka[2]:=pozorovanie.intervaly[1].ZacM;
        end;

    if pozorovanie.tabulka[2]=''
      then
        pozorovanie.Tabulka[2]:='00';

  for K:=0 to (pozorovanie.Tabulka.Count div 10) -1 do
    begin
	  I:=K*10;
    inc(I);
    if pozorovanie.Tabulka[I]=''
      then
        begin
          pozorovanie.Tabulka[I]:=pozorovanie.tabulka[I-10];
          if pozorovanie.Tabulka[I+1]=''
            then
              pozorovanie.Tabulka[I+1]:=pozorovanie.tabulka[I+1-10];
          end;

    if pozorovanie.tabulka[I+1]=''
      then
        pozorovanie.Tabulka[I+1]:='00';
    end;
  end;

  (* TEST REALNOSTI ciselneho vstupu*)
  if chyba=false
  then
	begin

  if strtodate(pozorovanie.Datum)<strtodate('1. 1. 1900')
    then
      begin
        chyba:=true;
        error('Date','Wrong value', '3');
      end;

	  if (strtoint(pozorovanie.ZaciatokM)>60)
        then
          begin
            chyba:=true;
            error('Observation begin', 'Wrong value', '3');
          end;
		  
	  H:=strtoint(pozorovanie.zaciatokH)+ strtoint(pozorovanie.ZaciatokM)/60;
	  if (H>24)
        then
		  begin
        chyba:=true;
        error('Observation begin', 'Wrong value', '3');
      end;
		  
	  if (strtoint(pozorovanie.KoniecM)>60)
        then
          begin
            chyba:=true;
            error('Observation end', 'Wrong value', '3');
          end;
		  
	  H:=strtoint(pozorovanie.KoniecH)+ strtoint(pozorovanie.KoniecM)/60;
	  if (H>24)
        then
          begin
            chyba:=true;
            error('Observation end', 'Wrong value', '3');
          end;
		  
	  if (strtoint(pozorovanie.miesto.DlzkaM)>60)
        then
          begin
            chyba:=true;
            error('Longitude', 'Wrong value', '3');
          end;
		  
	  if (strtoint(pozorovanie.miesto.DlzkaS)>60)
        then
          begin
            chyba:=true;
            error('Longitude', 'Wrong value', '3');
          end;

	  DlzkaHodnota:=strtoint(pozorovanie.miesto.DlzkaH)+
                      strtoint(pozorovanie.miesto.DlzkaM)/60+
                      strtoint(pozorovanie.miesto.DlzkaS)/3600;
        if pozorovanie.miesto.DlzkaP='W'
          then
            DlzkaHodnota:=-DlzkaHodnota;
			
      SirkaHodnota:=strtoint(pozorovanie.miesto.SirkaH)+
                      strtoint(pozorovanie.miesto.SirkaM)/60+
                      strtoint(pozorovanie.miesto.SirkaS)/3600;
        if pozorovanie.miesto.SirkaP='S'
          then
            SirkaHodnota:=-SirkaHodnota;

      if (DlzkaHodnota>180) or (DlzkaHodnota<-180)
        then
          begin
            chyba:=true;
            error('Longitude', 'Wrong value', '3');
          end;
		  
      if (strtoint(pozorovanie.miesto.SirkaM)>60)
        then
          begin
            chyba:=true;
            error('Latitude', 'Wrong value', '3');
          end;	
		  
      if (strtoint(pozorovanie.miesto.SirkaS)>60)
        then
          begin
            chyba:=true;
            error('Latitude', 'Wrong value', '3');
          end;	
		  
      if (SirkaHodnota>90) or (SirkaHodnota<-90)
        then
          begin
            chyba:=true;
            error('Latitude', 'Wrong value', '3');
          end;	
    for I:=1 to pozorovanie.RojPocet do
      begin

        datumZac:=DateTimeToJulianDate(strtodate(pozorovanie.roje[I].zac[3]+pozorovanie.roje[I].zac[4]+'. '+
                  pozorovanie.roje[I].zac[1]+pozorovanie.roje[I].zac[2]+'. '+
                  inttostr(yearOf(strtodate(pozorovanie.Datum)))));

        datumKon:=DateTimeToJulianDate(strtodate(pozorovanie.roje[I].kon[3]+pozorovanie.roje[I].kon[4]+'. '+
                  pozorovanie.roje[I].kon[1]+pozorovanie.roje[I].kon[2]+'. '+
                  inttostr(yearOf(strtodate(pozorovanie.Datum))+strtoint(pozorovanie.roje[I].kon[5]))));

        if (DateTimeToJulianDate(strtodate(pozorovanie.Datum))<DatumZac) and
            (DateTimeToJulianDate(strtodate(pozorovanie.Datum))>DatumKon)
          then
            begin
              chyba:=true;
              error('Shower ['+inttostr(I)+']','Shower out of activity', '6');
            end;
      end;

	  for I:=1 to pozorovanie.IntPocet do
        begin
		  if strtoint(pozorovanie.intervaly[I].ZacM)>60
            then
              begin
                chyba:=true;
                error('Interval ['+inttostr(I)+']','Wrong value', '3');
              end;

		  H:=strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60;
          if H>24
            then
              begin
                chyba:=true;
                error('Interval ['+inttostr(I)+']','Wrong value', '3');
              end;
              
		  if strtoint(pozorovanie.intervaly[I].KonM)>60
            then
              begin
                chyba:=true;
                error('Interval ['+inttostr(I)+']','Wrong value', '3');
              end;

          H:=strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60;
          if H>24
            then
              begin
                chyba:=true;
                error('Interval ['+inttostr(I)+']','Wrong value', '3');
              end;
		  
		end;
		
      for I:=1 to pozorovanie.IntPocet do
      for J:=1 to pozorovanie.intervaly[I].PozPocet do
        if (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].cislo)>pozorovanie.pozPocet)
          then
            begin
              chyba:=true;
              error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Number','Wrong value', '3');
            end;

      for I:=1 to pozorovanie.IntPocet do
      for J:=1 to pozorovanie.intervaly[I].PozPocet do
        if (pozorovanie.intervaly[I].pozorovatelia[J].StredRec>360)
          then
            begin
              chyba:=true;
              error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Rec','Wrong value', '3');
            end;

      for I:=1 to pozorovanie.IntPocet do
      for J:=1 to pozorovanie.intervaly[I].PozPocet do
        if (pozorovanie.intervaly[I].pozorovatelia[J].StredDec>90) or
           (pozorovanie.intervaly[I].pozorovatelia[J].StredDec<-90)
          then
            begin
              chyba:=true;
              error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Dec','Wrong value', '3');
            end;

      for I:=1 to pozorovanie.pozPocet do
      begin
        spravne:=false;
      for J:=1 to pozorovanie.IntPocet do
      for K:=1 to pozorovanie.intervaly[J].PozPocet do
        if strtoint(pozorovanie.intervaly[J].pozorovatelia[K].cislo)=I
          then
            spravne:=true;
      if spravne=false
        then
          begin
            chyba:=true;
              error('Observer ['+inttostr(I)+']','Unused observer', '29');
          end;
      end;
      
      for I:=1 to pozorovanie.IntPocet do
      for J:=1 to pozorovanie.intervaly[I].PozPocet do
      for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet do
        begin
          if strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM)>60
            then
              begin
                chyba:=true;
                error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Breaks ['+inttostr(K)+']','Wrong value', '3');
              end;

        H:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM)/60;
        if H>24
          then
            begin
              chyba:=true;
              error('Intervaly['+inttostr(I)+'] Observer ['+inttostr(J)+'] Breaks ['+inttostr(K)+']','Wrong value', '3');
           end;

         if strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM)>60
           then
             begin
               chyba:=true;
               error('Intervaly['+inttostr(I)+'] Observer ['+inttostr(J)+'] Breaks ['+inttostr(K)+']','Wrong value', '3');
             end;

         H:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM)/60;
         if H>24
           then
             begin
               chyba:=true;
               error('Intervaly['+inttostr(I)+'] Observer ['+inttostr(J)+'] Breaks ['+inttostr(K)+']','Wrong value', '3');
            end;
      end;	  
      
	  (*Test ci su duplicitne hodnoty*)
	  
      if (strtoint(pozorovanie.ZaciatokH)+strtoint(pozorovanie.ZaciatokM)/60)=
         (strtoint(pozorovanie.KoniecH)+strtoint(pozorovanie.KoniecM)/60)
        then
          begin
            chyba:=true;
            error('Observation begin', 'Rovnak� �asy', '7');
          end;
	  
      for I:=1 to pozorovanie.pozPocet-1 do
      for J:=I+1 to pozorovanie.pozpocet do
        begin
          if pozorovanie.pozorovatel[J].Imokod=pozorovanie.pozorovatel[I].Imokod
           then
             begin
               chyba:=true;
               error('Observer ['+inttostr(I)+'] IMO code','Duplicate value', '5');
             end;  
        end;

	  for I:=1 to pozorovanie.pozPocet-1 do
      for J:=I+1 to pozorovanie.pozpocet do
        begin
          if (pozorovanie.pozorovatel[J].IMOcislo<>'') and
             (pozorovanie.pozorovatel[I].IMOcislo<>'')
            then
          if pozorovanie.pozorovatel[J].IMOcislo=pozorovanie.pozorovatel[I].IMOcislo
            then
              begin
                chyba:=true;
                error('Observer ['+inttostr(I)+'] IMO number','Duplicate value', '5');
              end;
        end;
	  
	  for I:=1 to pozorovanie.rojpocet-1 do
      for J:=I+1 to pozorovanie.rojpocet do
        begin
          if pozorovanie.roje[J].meno=pozorovanie.roje[I].meno then
            begin
              chyba:=true;
              error('Shower ['+inttostr(I)+'] name','Duplicate value', '5');
            end;
        end;
      
      for I:=1 to pozorovanie.rojpocet-1 do
      for J:=I+1 to pozorovanie.rojpocet do
        begin
          if pozorovanie.roje[J].znak=pozorovanie.roje[I].znak then
            begin
              chyba:=true;
              error('Shower ['+inttostr(I)+'] ID','Duplicate value', '5');
            end;
        end;	  
      
      for I:=1 to pozorovanie.IntPocet do
      for J:=1 to pozorovanie.intervaly[I].PozPocet-1 do
      for K:=J+1 to pozorovanie.intervaly[I].PozPocet do
        begin
          if pozorovanie.intervaly[I].pozorovatelia[J].cislo=pozorovanie.intervaly[I].pozorovatelia[K].cislo then
            begin
              chyba:=true;
              error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+']','Duplicate value', '5');
            end;
        end;	  
		
	  for I:=1 to pozorovanie.IntPocet do
      for J:=1 to pozorovanie.intervaly[I].PozPocet do
      for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
        begin
          if strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM)>60
            then
              begin
                chyba:=true;
                error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(K)+']','Wrong value', '3');
              end;

      H:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM)/60;
      if H>24
        then
          begin
            chyba:=true;
            error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(K)+']','Wrong value', '3');
          end;

      if strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM)>60
        then
          begin
            chyba:=true;
            error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(K)+']','Wrong value', '3');
          end;

       H:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM)/60;
       if H>24
         then
           begin
             chyba:=true;
             error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(K)+']','Wrong value', '3');
           end;

      if strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].percenta)>100
        then
          begin
            chyba:=true;
            error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(K)+']','Wrong value', '3');
          end;
      end;
	
	  for I:=1 to pozorovanie.IntPocet do
      for J:=1 to pozorovanie.intervaly[I].PozPocet do
      for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
        begin
          if strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].min)>60
            then
              begin
                chyba:=true;
                error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Limit magnitude ['+inttostr(K)+']','Wrong value', '3');
              end;

       H:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hod)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].min)/60;
       if H>24
         then
           begin
             chyba:=true;
             error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Limit magnitude ['+inttostr(K)+']','Wrong value', '3');
           end;

       H:=strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].limitka)/100;
       if (H<3.00) or (H>7.50)
         then
           begin
             chyba:=true;
             error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Limit magnitude ['+inttostr(K)+']','Wrong value', '3');
           end;
        end;
		
	  for I:=1 to pozorovanie.IntPocet do
      if (strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60)=(strtoint(pozorovanie.intervaly[I].konH)+strtoint(pozorovanie.intervaly[I].konM)/60)
        then
          begin
            chyba:=true;
            error('Interval ['+inttostr(I)+']','Same times', '7');
          end;
      
      for I:=1 to pozorovanie.IntPocet do
      for J:=1 to pozorovanie.intervaly[I].PozPocet do
      for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet do
        if (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM)/60)=
           (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM)/60)
          then
            begin
              chyba:=true;
              error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Break ['+inttostr(K)+']','Same times', '7');
            end;	
			
	  for I:=1 to pozorovanie.IntPocet do
      for J:=1 to pozorovanie.intervaly[I].PozPocet do
      for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
        if (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM)/60)=
           (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM)/60)
          then
            begin
              chyba:=true;
              error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(K)+']','Same times', '7');
            end;
      
      for I:=1 to pozorovanie.intpocet do
      if intcheck((strtoint(pozorovanie.ZaciatokH)+strtoint(pozorovanie.ZaciatokM)/60),
                  (strtoint(pozorovanie.KoniecH)+strtoint(pozorovanie.KoniecM)/60),
                  (strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60),
                  (strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60))=true
        then
          begin
            chyba:=true;
            error('Interval ['+inttostr(I)+']','Interval out of observation', '8');
          end;

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet do
    if intcheck((strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60),
                (strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60),
                (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM)/60),
                (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM)/60))=true
        then
          begin
            chyba:=true;
            error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Break ['+inttostr(K)+']','Event out of interval', '9');
          end;

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
    if intcheck((strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60),
                (strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60),
                (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM)/60),
                (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonH)+strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM)/60))=true
        then
          begin
            chyba:=true;
            error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(K)+']','Event out of interval', '9');
          end;



  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
    if timecheck((strtoint(pozorovanie.intervaly[I].ZacH)+
                  strtoint(pozorovanie.intervaly[I].ZacM)/60),
                 (strtoint(pozorovanie.intervaly[I].KonH)+
                  strtoint(pozorovanie.intervaly[I].KonM)/60),
                 (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].Hod)+
                  strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].Min)/60))=true
      then
        begin
          chyba:=true;
          error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Limit magnitude ['+inttostr(K)+']','Event out of interval', '9');
        end;

  for I:=2 to pozorovanie.IntPocet do
  if timecheck(strtoint(pozorovanie.intervaly[I-1].ZacH)+strtoint(pozorovanie.intervaly[I-1].ZacM)/60,
                strtoint(pozorovanie.intervaly[I-1].KonH)+Strtoint(pozorovanie.intervaly[I-1].KonM)/60,
                strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60)=false
    then
      begin
        chyba:=true;
        error('Interval ['+inttostr(I)+']','Intervaly sa prekr�vaj�', '10');
      end;

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=2 to pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet do
  if timecheck(strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K-1].ZacH)+
               strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K-1].ZacM)/60,
               strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K-1].KonH)+
               Strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K-1].KonM)/60,
               strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacH)+
               strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM)/60)=false
    then
      begin
        chyba:=true;
        error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Break ['+inttostr(K-1)+']','Overlayed interval', '10');
      end;

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=2 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet-1 do
  for L:=K+1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
  if (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].Hod)+
      strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].Min)/60)=
     (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[L].Hod)+
      strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[L].Min)/60)
    then
      begin
        chyba:=true;
        error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Limit magnitude ['+inttostr(L)+']','Overlayed interval', '10');
      end;

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=2 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
  if timecheck(strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K-1].ZacH)+
               strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K-1].ZacM)/60,
               strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K-1].KonH)+
               Strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K-1].KonM)/60,
               strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacH)+
               strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM)/60)=false
    then
      begin
        chyba:=true;
        error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(-1)+']','Overlayed interval', '10');
      end;

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].brkPocet do
  for L:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
    if (timecheck(strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacH)+
                  strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM)/60,
                  strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH)+
                  Strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM)/60,
                  strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[L].Hod)+
                  strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[L].min)/60)=false)
      then
        begin
          chyba:=true;
          error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Limit magnitude ['+inttostr(L)+']','Event during a break', '28');
        end;

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].brkPocet do
  for L:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
    if (timecheck(strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacH)+
                  strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM)/60,
                strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH)+
                Strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM)/60,
                strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[L].ZacH)+
                strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[L].ZacM)/60)=false)
    then
      begin
        chyba:=true;
        error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(L)+']','Event during a break', '28');
      end;

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].brkPocet do
  for L:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
    if (timecheck(strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacH)+
                  strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM)/60,
                strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH)+
                Strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM)/60,
                strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[L].KonH)+
                strtoint(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[L].KonM)/60)=false)
    then
      begin
        chyba:=true;
        error('Interval ['+inttostr(I)+'] Observer ['+inttostr(J)+'] Clouds ['+inttostr(L)+']','Event during a break', '28');
      end;

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].brkPocet do
  for L:=0 to (pozorovanie.Tabulka.Count div 10) -1 do
      begin
	      M:=K*10;
        M:=M+1;
        if pozorovanie.intervaly[I].pozorovatelia[J].cislo=pozorovanie.Tabulka[M+2]
          then
        if timecheck(strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacH)+
                    strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM)/60,
                    strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH)+
                    Strtoint(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM)/60,
                    strtoint(pozorovanie.Tabulka[M])+
                    strtoint(pozorovanie.tabulka[M+1])/60)=false
          then
            begin
              chyba:=true;
              error('Interval ['+inttostr(I)+']  Observer ['+inttostr(J)+'] Meteor: '+inttostr(L+1),'Event during a break', '28');
            end;

      end;

	 { Kontrola ci je objekt pod obzorom }
   { IntVyskaCheck(horizont, zac, kon, datum, alfa, delta, fi, lambda) }

  for I:=1 to pozorovanie.intpocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
  if IntVyskaCheck(
     pref.horizont,
     strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60,
     strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60,
     pozorovanie.Datum,
     pozorovanie.intervaly[I].pozorovatelia[J].StredRec,
     pozorovanie.intervaly[I].pozorovatelia[J].StredDec,
     SirkaHodnota,
     DlzkaHodnota)=true
    then
      begin
        chyba:=true;
        error('Interval ['+inttostr(I)+'], Observer ['+inttostr(J)+']','Observing array below horizont', '11');
      end;

  for I:=1 to pozorovanie.RojPocet do
    begin
      if RojVyskaCheck(I,
         pref.horizont,
         strtoint(pozorovanie.ZaciatokH)+strtoint(pozorovanie.ZaciatokM)/60,
         strtoint(pozorovanie.KoniecH)+strtoint(pozorovanie.KoniecM)/60,
         pozorovanie.Datum,
         strtoint(pozorovanie.roje[I].rec),
         strtoint(pozorovanie.roje[I].dec),
         SirkaHodnota,
         DlzkaHodnota)=true
        then
          begin
            chyba:=true;
            error('Shower ['+inttostr(I)+']','Radiant below horizont', '12');
          end;

    end;
    (*
    for I:=1 to pozorovanie.IntPocet do
    for J:=1 to pozorovanie.intervaly[I].PozPocet do
    for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
      begin
        if pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].trojuholnik<>''
        then
        if TimeVyskaCheck(
           pref.horizont,
           strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].Hod)+
           strtoint(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].Min)/60,
           pozorovanie.Datum,
           pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].rec,
           pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].dec,
           SirkaHodnota,
           DlzkaHodnota)=true
          then
            begin
              chyba:=true;
              error('Intervaly['+inttostr(I)+'], Pozorovate� ['+inttostr(J)+'] Lim. magnit�dy ['+inttostr(K)+']','Limitny trojuholnik pod obzorom', '13');
            end;
      end;
    *)
	  for I:=1 to pozorovanie.IntPocet do
        begin
          spravne:=false;
          for J:=0 to (pozorovanie.Tabulka.Count div 10)-1 do
            if timecheck(strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60,
                         strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60,
                         strtoint(pozorovanie.tabulka[J*10+1])+strtoint(pozorovanie.tabulka[J*10+2])/60)=false
              then
                spravne:=true;
            if spravne=false
              then
                begin
                  chyba:=true;
                  error('Interval ['+inttostr(I)+']','No meteor in interval', '25');
                end;
        end;
    
	for K:=0 to (pozorovanie.Tabulka.Count div 10) -1 do
      begin
	    I:=K*10;
      inc(I);
		
	  if pozorovanie.Tabulka[I]=''
        then
          begin
            pozorovanie.Tabulka[I]:=pozorovanie.tabulka[I-10];
            if pozorovanie.Tabulka[I+1]=''
              then
                pozorovanie.Tabulka[I+1]:=pozorovanie.tabulka[I-9];
          end;

      if pozorovanie.tabulka[I+1]=''
        then
          pozorovanie.Tabulka[I+1]:='00';

      if I>10 then
        if (strtoint(pozorovanie.Tabulka[I])=strtoint(pozorovanie.Tabulka[I-10])) and
           (strtoint(pozorovanie.Tabulka[I+1])<strtoint(pozorovanie.Tabulka[I-9]))
          then
            begin
              chyba:=true;
              error('Meteor: '+inttostr((I div 10)+1), 'Incorrect time sequence', '17');
            end;
	  
      if AkyJeToInterval(strtoint(pozorovanie.Tabulka[I])+strtoint(pozorovanie.Tabulka[I+1])/60)=0
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1), 'Meteor out of interval', '15');
          end;
      
	  inc(I);
    inc(I);
    inc(I);

	  J:=I+10;
    while J<pozorovanie.Tabulka.count do
      begin
        if pozorovanie.Tabulka[J]=''
          then
            begin
              J:=J+10;
              continue;
            end;
        if pozorovanie.Tabulka[I]<>pozorovanie.Tabulka[J]
          then
            break;
        if pozorovanie.Tabulka[I-1]=pozorovanie.Tabulka[J-1]
          then
            begin
              chyba:=true;
              error('Meteor: '+inttostr((I div 10)+1),'Joined meteor to same observer', '19');
            end;
        J:=J+10;
      end;

    J:=I+10;
    while J<pozorovanie.Tabulka.count do
      begin
        if pozorovanie.Tabulka[J]=''
          then
            begin
              J:=J+10;
              continue;
            end;
        if pozorovanie.Tabulka[I]<>pozorovanie.Tabulka[J]
          then
            break;

        H:=strtoint(pozorovanie.Tabulka[I-3])+strtoint(pozorovanie.Tabulka[I-2])/60;
        G:=strtoint(pozorovanie.Tabulka[J-3])+strtoint(pozorovanie.Tabulka[J-2])/60;
        if H<>G
          then
            begin
              chyba:=true;
              error('Meteor: '+inttostr((I div 10)+1),'Joined meteor in a different times', '18');
            end;
        J:=J+10;
      end;

      J:=I;
      if pozorovanie.Tabulka[J]<>'' then
      begin
        H:=1;
        L:=J+10;
        while L<pozorovanie.tabulka.count do
          begin
            if pozorovanie.Tabulka[J]=pozorovanie.Tabulka[L]
              then
                H:=H+1
              else
                if pozorovanie.Tabulka[L]<>''
                  then
                    break;
            L:=L+10;
          end;

        L:=J-10;
        while L>0 do
          begin
            if pozorovanie.Tabulka[J]=pozorovanie.Tabulka[L]
              then
                H:=H+1
              else
                if pozorovanie.Tabulka[L]<>''
                  then
                    break;
            L:=L-10;
          end;

        if H=1
         then
            begin
              chyba:=true;
              error('Meteor: '+inttostr((I div 10)+1),'Only one joined meteor', '26');
            end;
       end;

	   inc(I);
	   inc(I);
	   if (((strtoint(pozorovanie.Tabulka[I]) mod 5)<>0) or (length(pozorovanie.tabulka[I])>3))
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Incorrect unround form', '21');
          end;

		inc(I);
		inc(I);
		
		if pozorovanie.Tabulka[I]<>'' then
      if (strtoint(pozorovanie.Tabulka[I]) mod 5 )<>0
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Incorrect unround form', '21');
          end;

      if pozorovanie.Tabulka[I]<>'' then
      if strtoint(pozorovanie.Tabulka[I])<pref.horizont
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Meteor below horizont', '23');
          end;

	    inc(I);

      if (pozorovanie.tabulka[I]<>'1') and (pozorovanie.tabulka[I]<>'2') and (pozorovanie.tabulka[I]<>'3')
        then
          begin
            chyba:=true;
            error('Meteor: '+inttostr((I div 10)+1),'Invalid character', '2');
          end;

	  end;
    (*
    for J:=1 to pozorovanie.RojPocet do
    begin
      spravne:=false;
    for K:=0 to (pozorovanie.Tabulka.Count div 10) -1 do
      begin
	      I:=K*10;
        I:=I+5;
        if pozorovanie.Tabulka[I]=pozorovanie.roje[J].Znak
          then
            spravne:=true;
      end;
        if spravne=false
          then
            begin
              chyba:=true;
              error('Shower ['+inttostr(J)+']','No meteor of shower', '27');
            end;
    end;
   *)
  end;


  if chyba=false
  then
  for K:=0 to (pozorovanie.Tabulka.Count div 10) -1 do
  begin
    I:=K*10;
    spravne:=false;

    for J:=1 to pozorovanie.intervaly[AkyJeToInterval(strtoint(pozorovanie.Tabulka[I+1])+strtoint(pozorovanie.tabulka[I+2])/60)].PozPocet do
      if pozorovanie.intervaly[AkyJeToInterval(strtoint(pozorovanie.Tabulka[I+1])+strtoint(pozorovanie.tabulka[I+2])/60)].pozorovatelia[J].cislo=pozorovanie.Tabulka[I+3]
        then
          spravne:=true;

    if spravne=false
      then
        begin
          chyba:=true;
          error('Meteor: '+inttostr((I div 10)+1),'Observer out of interval', '16');
        end;
  end;

    if chyba=false
  then
  for K:=0 to (pozorovanie.Tabulka.Count div 10) -1 do
  begin
    I:=K*10;

    H:=strtoint(
       pozorovanie.intervaly[
       AkyJeToInterval(strtoint(pozorovanie.tabulka[I+1])+strtoint(pozorovanie.tabulka[I+2])/60)
       ].pozorovatelia[
       AkyJeToPozorovatel(strtoint(pozorovanie.tabulka[I+1])+strtoint(pozorovanie.tabulka[I+2])/60,pozorovanie.Tabulka[I+3])
       ].limitky[
       AkaJeToLimitka(strtoint(pozorovanie.tabulka[I+1])+strtoint(pozorovanie.tabulka[I+2])/60,pozorovanie.Tabulka[I+3])
       ].limitka)/100;

    if (strtoint(pozorovanie.Tabulka[I+6])/10)>(H-0.5)
      then
        begin
          chyba:=true;
          error('Meteor: '+inttostr((I div 10)+1),'Meteor below the limit magnitude', '24');
        end;
  end;

  if chyba=true
    then
      pozorovanie.tested:=false;

end;
end.


