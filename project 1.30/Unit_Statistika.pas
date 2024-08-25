unit Unit_Statistika;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Globalne_Premenne, ComCtrls, StdCtrls, ExtCtrls, TeeProcs, DateUtils,
  TeEngine, Chart, Math, Grids, NxColumns, NxColumnClasses,
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, Series, Menus ;
type
  TStatistika = record
end;
type
  TOknoStatistiky = class(TForm)
    PageControl: TPageControl;
    Sumarne: TTabSheet;
    Hlavicka: TGroupBox;
    Datum: TLabel;
    Zaciatok: TLabel;
    Koniec: TLabel;
    Label1: TLabel;
    Meno: TLabel;
    Stat: TLabel;
    KodMiesta: TLabel;
    Label5: TLabel;
    dlzka: TLabel;
    sirka: TLabel;
    vyska: TLabel;
    Roje: TGroupBox;
    Info: TGroupBox;
    LabelZHR: TLabel;
    LabelLimitna: TLabel;
    LabelRojove: TLabel;
    LabelSporadicke: TLabel;
    LabelMraky: TLabel;
    LabelTeff: TLabel;
    RastZHRGroup: TGroupBox;
    LimitkyGroup: TGroupBox;
    FrekvenciaZHR: TGroupBox;
    PocetMeteorov: TGroupBox;
    Zapisovatel: TGroupBox;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    IMO: TTabSheet;
    IMOTabs: TTabControl;
    FName: TLabel;
    SName: TLabel;
    Country: TLabel;
    Label13: TLabel;
    IMOkod: TLabel;
    Label15: TLabel;
    Longitude: TLabel;
    Latitude: TLabel;
    NadmVyska: TLabel;
    MenoMiesta: TLabel;
    MiestoStat: TLabel;
    IMOKodMiesta: TLabel;
    Label18: TLabel;
    TimeBegin: TLabel;
    TimeEnd: TLabel;
    Label6: TLabel;
    ShowerGrid: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    PeriodsGrid: TNextGrid;
    NxTextColumn4: TNxTextColumn;
    NxTextColumn5: TNxTextColumn;
    NxTextColumn6: TNxTextColumn;
    NxTextColumn7: TNxTextColumn;
    NxTextColumn8: TNxTextColumn;
    NxTextColumn9: TNxTextColumn;
    MagnitudeDistributionsGrid: TNextGrid;
    NxTextColumn11: TNxTextColumn;
    NxTextColumn12: TNxTextColumn;
    NxTextColumn17: TNxTextColumn;
    NxTextColumn13: TNxTextColumn;
    NxTextColumn14: TNxTextColumn;
    NxTextColumn15: TNxTextColumn;
    NxTextColumn16: TNxTextColumn;
    NxTextColumn18: TNxTextColumn;
    NxTextColumn19: TNxTextColumn;
    NxTextColumn20: TNxTextColumn;
    NxTextColumn21: TNxTextColumn;
    NxTextColumn22: TNxTextColumn;
    NxTextColumn23: TNxTextColumn;
    NxTextColumn24: TNxTextColumn;
    NxTextColumn25: TNxTextColumn;
    NxTextColumn26: TNxTextColumn;
    NxTextColumn27: TNxTextColumn;
    Prestavky: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    LabelSporZHR: TLabel;
    IMOSkratka: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure IMOShow(Sender: TObject);
    procedure IMOTabsChange(Sender: TObject);
    procedure PozorovatelCreate(Poz: integer);
    procedure SumarneShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Tshower = record
    Graf: TChart;
    Info: TListBox;
    Series: TLineSeries;
end;

type
  TInfoSum = record
    Teff: real;
    Cloud: real;
    Roj: Integer;
    Spor: integer;
    ZHR: real;
    limitka: real;
end;

type
  TZapisovatel = record
    pocetZapisov: integer;
    MaxFrekvenciaZapisov: integer;
    PocetPozorovatelov: integer;
end;

type
  TPozorovatel = record
    Group: TGroupBox;
    LabelTeff: TLabel;
    LabelBreaky:TLabel;
    LabelZhr: TLabel;
    LabelSporZHR: Tlabel;
    LabelRojove: TLabel;
    LabelSporadicke: TLabel;
    LabelLimitka: TLabel;
    LabelCloudy: TLabel;
    LabelMeno: TLabel;
    LabelPriezvisko: TLabel;
    LabelImoKod: TLabel;
    LabelIMOCislo: TLabel;
    LabelPocPrestavok:Tlabel;
end;

var
  OknoStatistiky: TOknoStatistiky;
  StatistikaOpened: Boolean;
  shower: array of TShower;
  infoSum: TInfoSum;
  ZHRGraf: TChart;
  ZHRSeries: TLineSeries;
  LimitkyGraf: Tchart;
  LimitkySeries: TFastLineSeries;
  FrekvenciaGraf: TChart;
  FrekvenciaSeries: TBarSeries;
  PoctyMeteorovGraf: TChart;
  PoctyMeteorovSeries: TPieSeries;
  PoctySMeteorovGraf: TChart;
  PoctySMeteorovSeries: TPieSeries;
  PrestavkyGraf: TChart;
  PrestavkySeries: TPieSeries;
  TeffGraf: TChart;
  TeffSeries: TPieSeries;
  Pozorovatel: array of TPozorovatel;
  VelkostSumarne: integer;
  Longitude: real;
  Latitude: real;
  Date: TDate;
implementation

{$R *.dfm}



procedure TOknoStatistiky.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
  StatistikaOpened:=false;
end;

procedure TOknoStatistiky.PozorovatelCreate(Poz: integer);

function nachadza(int, poz: integer): boolean;
var
  I:integer;
begin
  result:=false;
  for I:=1 to pozorovanie.intervaly[int].PozPocet do
    if (strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=poz)
      then
        result:=true;
end;

procedure magnitudedistribution(zac, kon: real; roj: string; r: integer);
function nach(z, k, ch: real):boolean;
begin
  result:=false;
  If K<Z
    then
      K:=K+24;
  if Z>ch
    then
      ch:=ch+24;
  if K<ch
    then
      result:=true;
end;

var
  I,J:integer;
  pos: real;
  mag: array[1..14] of integer;
  tot: integer;

procedure Add1(m: integer);
begin
  mag[m]:=mag[m]+10;
end;

procedure Add2(m: integer);
begin
  mag[m]:=mag[m]+5;
  mag[m+1]:=mag[m+1]+5;
end;

begin
  for J:=0 to (pozorovanie.Tabulka.Count div 10) - 1 do
    begin
      I:=J*10;
      pos:=strtoint(pozorovanie.Tabulka[I+1])+strtoint(pozorovanie.Tabulka[I+2])/60;
      if nach(zac,kon,pos)=false
        then
         if ((strtoint(pozorovanie.Tabulka[I+3])=poz) and
             (pozorovanie.Tabulka[I+5]=roj))
            then
              begin
                if strtoint(pozorovanie.Tabulka[I+6])=-60
                  then
                    add1(1);
                if strtoint(pozorovanie.Tabulka[I+6])=-55
                  then
                    Add2(1);
                if strtoint(pozorovanie.Tabulka[I+6])=-50
                  then
                    add1(2);
                if strtoint(pozorovanie.Tabulka[I+6])=-45
                  then
                    Add2(2);
                if strtoint(pozorovanie.Tabulka[I+6])=-40
                  then
                    add1(3);
                if strtoint(pozorovanie.Tabulka[I+6])=-35
                  then
                    Add2(3);
                if strtoint(pozorovanie.Tabulka[I+6])=-30
                  then
                    add1(4);
                if strtoint(pozorovanie.Tabulka[I+6])=-25
                  then
                    Add2(4);
                if strtoint(pozorovanie.Tabulka[I+6])=-20
                  then
                    add1(5);
                if strtoint(pozorovanie.Tabulka[I+6])=-15
                  then
                    Add2(5);
                if strtoint(pozorovanie.Tabulka[I+6])=-10
                  then
                    add1(6);
                if strtoint(pozorovanie.Tabulka[I+6])=-5
                  then
                    Add2(6);
                if strtoint(pozorovanie.Tabulka[I+6])<-60
                  then
                    add1(1);
                if strtoint(pozorovanie.Tabulka[I+6])=0
                  then
                    add1(7);
                if strtoint(pozorovanie.Tabulka[I+6])=5
                  then
                    Add2(7);
                if strtoint(pozorovanie.Tabulka[I+6])=10
                  then
                    add1(8);
                if strtoint(pozorovanie.Tabulka[I+6])=15
                  then
                    Add2(8);
                if strtoint(pozorovanie.Tabulka[I+6])=20
                  then
                    add1(9);
                if strtoint(pozorovanie.Tabulka[I+6])=25
                  then
                    Add2(9);
                if strtoint(pozorovanie.Tabulka[I+6])=30
                  then
                    add1(10);
                if strtoint(pozorovanie.Tabulka[I+6])=35
                  then
                    Add2(10);
                if strtoint(pozorovanie.Tabulka[I+6])=40
                  then
                    add1(11);
                if strtoint(pozorovanie.Tabulka[I+6])=45
                  then
                    Add2(11);
                if strtoint(pozorovanie.Tabulka[I+6])=50
                  then
                    add1(12);
                if strtoint(pozorovanie.Tabulka[I+6])=55
                  then
                    Add2(12);
                if strtoint(pozorovanie.Tabulka[I+6])=60
                  then
                    add1(13);
                if strtoint(pozorovanie.Tabulka[I+6])=65
                  then
                    add2(13);
                if strtoint(pozorovanie.Tabulka[I+6])=70
                  then
                    add1(14);
                if strtoint(pozorovanie.Tabulka[I+6])>60
                  then
                    add1(14);
          end;
    end;
  for I:=1 to 14 do
    tot:=tot+mag[I];
  for I:=1 to 14 do
    magnitudeDistributionsGrid.cells[I+1,r]:=inttostr(mag[I] div 10)+'.'+inttostr(mag[I] mod 10);
  magnitudeDistributionsGrid.Cells[16,r]:=inttostr(tot div 10);

end;

procedure popocitajMeteory(zac, kon: real; roj: string; s,r: integer);
function nach(z,k,p:real):boolean;
begin
  result:=false;
  if z>k
    then
      k:=K+24;
  if z>p
    then
      p:=p+24;
  if k<p
    then
      result:=true;
end;

var
  I,J:integer;
  pos: real;
  tot: integer;

begin
  tot:=0;
  for J:=0 to (pozorovanie.Tabulka.Count div 10) - 1 do
    begin
      I:=J*10;
      pos:=strtoint(pozorovanie.Tabulka[I+1])+strtoint(pozorovanie.Tabulka[I+2])/60;
      if nach(zac,kon,pos)=false
        then
          if ((strtoint(pozorovanie.Tabulka[I+3])=poz) and
             (pozorovanie.Tabulka[I+5]=roj))
            then
              inc(tot);
    end;
  PeriodsGrid.Cells[s,r]:=inttostr(tot)+'C';
end;

procedure Cas(Int,r: integer);
var
  zac,kon,teff: real;
  I,P:integer;
begin
  P:=0;
  for I:=1 to pozorovanie.intervaly[int].PozPocet do
    if strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=poz
      then
        P:=I;

  zac:=strtoint(pozorovanie.intervaly[Int].ZacH)+
       strtoint(pozorovanie.intervaly[Int].ZacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].KonH)+
       strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  teff:=kon-zac;

  for I:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].BrkPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].ZacH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].ZacM)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].KonH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].KonM)/60;

      if zac>kon
        then
          kon:=kon+24;

      teff:=teff-(kon-zac);

    end;

  periodsGrid.Cells[3,r]:=Format('%f',[teff]);
end;

procedure mraky(Int,r:integer);
function nach(z,k,p:real):boolean;
begin
  result:=false;
  if z>k
    then
      k:=K+24;
  if z>p
    then
      p:=p+24;
  if k>p
    then
      result:=true;
end;

var
  I,J,P:integer;
  zac,kon,f,teff: real;
begin
  f:=0;
  P:=0;
  for I:=1 to pozorovanie.intervaly[int].PozPocet do
    if strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=poz
      then
        P:=I;

  for I:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].CldPOcet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].oblacnost[I].ZacH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].oblacnost[I].ZacM)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].oblacnost[I].KonH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].oblacnost[I].KonM)/60;
      if zac>kon
        then
          kon:=kon+24;
      teff:=kon-zac;
      for J:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].brkpocet do
        if nach(zac, kon, strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].zacH)+
                          strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].zacM)/60)=true
          then
            begin
              zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60;
              kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonM)/60;
              teff:=teff-(kon-zac);
            end;
      f:=f+strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].oblacnost[I].percenta)*teff;
    end;

  zac:=strtoint(pozorovanie.intervaly[Int].ZacH)+
       strtoint(pozorovanie.intervaly[Int].ZacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].KonH)+
       strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  teff:=kon-zac;

  for I:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].BrkPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].ZacH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].ZacM)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].KonH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].KonM)/60;
      if zac>kon
        then
          kon:=kon+24;

      teff:=teff-(kon-zac);

    end;

  f:=f/teff;
  F:=100/(100-f);

  periodsGrid.Cells[4,r]:=Format('%f',[f]);
end;

procedure Limitna(Int, r: integer);
function nach(z,k,p:real):boolean;
begin
  result:=false;
  if z>k
    then
      k:=K+24;
  if z>p
    then
      p:=p+24;
  if k>p
    then
      result:=true;
end;

var
  I,J,P:integer;
  zac,kon,lim,teff:real;
begin
  Lim:=0;
  P:=0;
  for I:=1 to pozorovanie.intervaly[int].PozPocet do
    if strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=poz
      then
        P:=I;

  if P<>0
  then
  begin
  zac:=strtoint(pozorovanie.intervaly[Int].ZacH)+
       strtoint(pozorovanie.intervaly[Int].ZacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[1].Hod)+
       strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[1].Min)/60;
  if zac>kon
    then
      kon:=kon+24;
  teff:=kon-zac;
  for J:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].brkpocet do
        if nach(zac, kon, strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                          strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60)=true
          then
            begin
              zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60;
              kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonM)/60;
              teff:=teff-(kon-zac);
            end;

  lim:=lim+strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[1].limitka)*teff;

  for I:=2 to pozorovanie.intervaly[Int].pozorovatelia[p].LimPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I-1].Hod)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I-1].Min)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I].Hod)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I].Min)/60;
      if zac>kon
        then
          kon:=kon+24;

  teff:=kon-zac;
  for J:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].brkpocet do
        if nach(zac, kon, strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                          strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60)=true
          then
            begin
              zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60;
              kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonM)/60;
              teff:=teff-(kon-zac);
            end;

  lim:=lim+strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I].limitka)*teff;
    end;

  zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[pozorovanie.intervaly[Int].pozorovatelia[p].LimPocet].Hod)+
       strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[pozorovanie.intervaly[Int].pozorovatelia[p].LimPocet].Min)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].KonH)+
       strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  teff:=kon-zac;
  for J:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].brkpocet do
        if nach(zac, kon, strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                          strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60)=true
          then
            begin
              zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60;
              kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonM)/60;
              teff:=teff-(kon-zac);
            end;

  lim:=lim+strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[pozorovanie.intervaly[Int].pozorovatelia[p].LimPocet].limitka)*teff;

  zac:=strtoint(pozorovanie.intervaly[Int].ZacH)+
       strtoint(pozorovanie.intervaly[Int].ZacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].KonH)+
       strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  teff:=kon-zac;

  for I:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].BrkPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].ZacH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].ZacM)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].KonH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].KonM)/60;

      if zac>kon
        then
          kon:=kon+24;

      teff:=teff-(kon-zac);

    end;

  lim:=lim/teff;

  lim:=lim/100;

  periodsGrid.Cells[5,r]:=Format('%f',[lim]);
  end;
end;

var
  p,I,J,K:integer;
begin
  ShowerGrid.Height:=0;
  ShowerGrid.ClearRows;
  PeriodsGrid.Height:=0;
  PeriodsGrid.ClearRows;
  MagnitudeDistributionsGrid.Height:=0;
  MagnitudeDistributionsGrid.ClearRows;

  PageControl.Height:=300;
  ShowerGrid.Height:=20+pozorovanie.RojPocet*17;
  PageControl.Height:=PageControl.Height+ShowerGrid.Height;
  ShowerGrid.AddRow(pozorovanie.RojPocet);

  for I:=0 to pozorovanie.RojPocet-1 do
    begin
      ShowerGrid.Cells[0,I]:=pozorovanie.roje[I+1].ImoCod;
      ShowerGrid.Cells[1,I]:=pozorovanie.roje[I+1].rec+'°';
      ShowerGrid.Cells[2,I]:=pozorovanie.roje[I+1].dec+'°';
    end;

  p:=0;
  for I:=1 to pozorovanie.IntPocet do
    for J:=1 to pozorovanie.intervaly[I].PozPocet do
      if (strtoint(pozorovanie.intervaly[I].pozorovatelia[J].cislo)=poz)
        then
          inc(p);

  PeriodsGrid.Top:=PageControl.Height-35;
  PeriodsGrid.Height:=20+p*17;
  PageControl.Height:=PageControl.Height+PeriodsGrid.Height;
  PeriodsGrid.AddRow(p);

  MagnitudeDistributionsGrid.Top:=PageControl.Height-25;
  MagnitudeDistributionsGrid.AddRow((pozorovanie.RojPocet+1)*p);
  MagnitudeDistributionsGrid.Height:=20+(pozorovanie.RojPocet+1)*p*17;
  Pagecontrol.Height:=PageControl.Height+MagnitudeDistributionsGrid.Height+10;

  FName.Caption:='First name: '+pozorovanie.pozorovatel[poz].meno;
  SName.Caption:='Surname: '+pozorovanie.pozorovatel[poz].priezvisko;
  Country.Caption:='Country: '+pozorovanie.miesto.Stat;
  IMOKod.Caption:='IMO Number: '+pozorovanie.pozorovatel[poz].Imocislo;
  IMOSkratka.Caption:='IMO Code:'+pozorovanie.pozorovatel[poz].Imokod;
  NadmVyska.Caption:='Height: '+pozorovanie.miesto.Vyska;
  IMOKodMiesta.Caption:='IMO Code: '+pozorovanie.miesto.IMOkod;
  MiestoStat.Caption:='Country: '+ pozorovanie.miesto.Stat;
  MenoMiesta.Caption:='Name: '+pozorovanie.miesto.Meno;
  Longitude.Caption:='Longitude: '+pozorovanie.miesto.DlzkaH+'° '+
                                   pozorovanie.miesto.DlzkaM+chr(39)+' '+
                                   pozorovanie.miesto.DlzkaS+'" '+
                                   pozorovanie.miesto.DlzkaP;
  Latitude.Caption:='Latitude: '+pozorovanie.miesto.SirkaH+'°'+
                 pozorovanie.miesto.SirkaM+ chr(39)+' '+
                 pozorovanie.miesto.SirkaS+'" '+
                 pozorovanie.miesto.SirkaP;
  TimeBegin.Caption:='Observation start (Universal Time): '
                     + pozorovanie.zaciatokH+':'+pozorovanie.zaciatokM+
                     ', '+pozorovanie.Datum;
  if (strtoint(pozorovanie.ZaciatokH)+strtoint(pozorovanie.ZaciatokM)/60)>
     (strtoint(pozorovanie.KoniecH)+strtoint(pozorovanie.KoniecM)/60)
       then
         I:=1
       else
         I:=0;

  TimeEnd.Caption:='Observation end (Universal Time): '
                   + pozorovanie.koniecH+':'+pozorovanie.koniecM+
                   ', '+ inttostr(dayof(date)+I)+' .'+
                         inttostr(monthOf(date))+' .'+
                         inttostr(yearOf(date));
  J:=0;
  for I:=1 to pozorovanie.IntPocet do
    if nachadza(I, poz)=true
      then
        begin
          periodsGrid.Cells[0,J]:=pozorovanie.intervaly[I].ZacH+':'+
                                  pozorovanie.intervaly[I].ZacM+'-'+
                                  pozorovanie.intervaly[I].KonH+':'+
                                  pozorovanie.intervaly[I].KonM;
          periodsGrid.Cells[1,J]:=inttostr(pozorovanie.intervaly[I].pozorovatelia[poz].StredRec)+' °';
          periodsGrid.Cells[2,J]:=inttostr(pozorovanie.intervaly[I].pozorovatelia[poz].StredDec)+' °';
          for K:=1 to pozorovanie.RojPocet do
            PopocitajMeteory(strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60,
                             strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60,
                             pozorovanie.roje[K].Znak,
                             pozorovanie.RojPocet+5,J);
          PopocitajMeteory(strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60,
                             strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60,
                             '-',
                             6+pozorovanie.RojPocet,J);
          Cas(I,J);
          Mraky(I,J);
          Limitna(I,J);
          inc(J);
        end;
  J:=0;
  for K:=1 to pozorovanie.RojPocet do
  for I:=1 to pozorovanie.IntPocet do
  if nachadza(I, poz)=true
    then
      begin
        MagnitudeDistributionsGrid.Cells[0,J]:=pozorovanie.roje[K].ImoCod;
        MagnitudeDistributionsGrid.Cells[1,J]:=pozorovanie.intervaly[I].ZacH+':'+
                                               pozorovanie.intervaly[I].ZacM+'-'+
                                               pozorovanie.intervaly[I].KonH+':'+
                                               pozorovanie.intervaly[I].KonM;
        MagnitudeDistribution(strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60,
                              strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60,
                              pozorovanie.roje[K].Znak,
                              J);
        inc(J);
      end;

  for I:=1 to pozorovanie.IntPocet do
  if nachadza(I, poz)=true
    then
      begin
        MagnitudeDistributionsGrid.Cells[0,J]:='SPO';
        MagnitudeDistributionsGrid.Cells[1,J]:=pozorovanie.intervaly[I].ZacH+':'+
                                               pozorovanie.intervaly[I].ZacM+'-'+
                                               pozorovanie.intervaly[I].KonH+':'+
                                               pozorovanie.intervaly[I].KonM;
        MagnitudeDistribution(strtoint(pozorovanie.intervaly[I].ZacH)+strtoint(pozorovanie.intervaly[I].ZacM)/60,
                              strtoint(pozorovanie.intervaly[I].KonH)+strtoint(pozorovanie.intervaly[I].KonM)/60,
                              '-',
                              J);
        inc(J);
      end;
end;

procedure TOknoStatistiky.FormCreate(Sender: TObject);

function Zapisy: integer;
var
  max, tot, pos: integer;
  u1, u2: real;
begin
  u1:=0;
  u2:=0;
  max:=0;
  pos:=0;
  repeat
    tot:=0;
    repeat
      if pos+10<pozorovanie.tabulka.count
        then
          begin
            u1:=strtoint(pozorovanie.tabulka[pos+1])+strtoint(pozorovanie.tabulka[pos+2])/60;
            u2:=strtoint(pozorovanie.tabulka[pos+1+10])+strtoint(pozorovanie.tabulka[pos+2+10])/60;
          end;
        tot:=tot+1;
        pos:=pos+10;
      until (u1<>u2) or (pos>=pozorovanie.Tabulka.Count);
    if tot>max
      then
        max:=tot;
  until pos>=pozorovanie.Tabulka.Count-10;

  result:=max;
end;

function SporMeteory: integer;
var
  pos,tot: integer;
  nach: boolean;
begin
  tot:=0;
  pos:=0;
  repeat
    repeat
      if pozorovanie.Tabulka[pos+5]='-'
        then
          nach:=true
        else
          nach:=false;

      pos:=pos+10;
      if pos>=pozorovanie.Tabulka.Count
        then
          break;
    until (pozorovanie.Tabulka[pos+4]='') or (pozorovanie.Tabulka[pos+4-10]<>pozorovanie.Tabulka[pos+4]);

    if nach=true
      then
        tot:=tot+1;
  until pos>=pozorovanie.Tabulka.Count;

  result:=tot;
end;

function Meteory(roj: string): integer;
var
  pos,tot: integer;
  nach: boolean;
begin
  tot:=0;
  pos:=0;
  repeat
    nach:=false;
    repeat
      if pozorovanie.Tabulka[pos+5]=roj
        then
          nach:=true;
      pos:=pos+10;

      if pos>=pozorovanie.Tabulka.Count
        then
          break;
    until (pozorovanie.Tabulka[pos+4]='') or (pozorovanie.Tabulka[pos+4-10]<>pozorovanie.Tabulka[pos+4]);

    if nach=true
      then
        tot:=tot+1;
  until pos>=pozorovanie.Tabulka.Count;

  result:=tot;
end;

function PozMeteory(roj: string; poz: integer): integer;
var
  I,J:integer;
  tot: integer;
begin
  tot:=0;
  for J:=0 to (pozorovanie.Tabulka.Count div 10) - 1 do
    begin
      I:=J*10;
      if ((strtoint(pozorovanie.Tabulka[I+3])=poz) and
         (pozorovanie.Tabulka[I+5]=roj))
        then
          inc(tot);
    end;
  result:=tot;
end;

function mraky(Int,p: integer):real;
function nach(z,k,p:real):boolean;
begin
  result:=false;
  if z>k
    then
      k:=K+24;
  if z>p
    then
      p:=p+24;
  if k>p
    then
      result:=true;
end;

var
  I,J,poz:integer;
  zac,kon,cld,teff:real;
begin
  cld:=0;
  Poz:=0;
  for I:=1 to pozorovanie.intervaly[Int].PozPocet do
    if strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=p
      then
        Poz:=I;
  for I:=1 to pozorovanie.intervaly[Int].pozorovatelia[poz].cldpocet do
  begin

    zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].oblacnost[I].ZacH)+
         strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].oblacnost[I].ZacM)/60;
    kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].oblacnost[I].KonH)+
         strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].oblacnost[I].KonM)/60;

    if zac>kon
      then
        kon:=kon+24;

    teff:=kon-zac;

    for J:=1 to pozorovanie.intervaly[Int].pozorovatelia[poz].brkpocet do
      if nach(zac, kon, strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[J].ZacH)+
                        strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[J].ZacM)/60)=true
        then
          begin
            zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[J].ZacH)+
                 strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[J].ZacM)/60;
            kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[J].KonH)+
                 strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[J].KonM)/60;
            if zac>kon
              then
                kon:=kon+24;
                
            teff:=teff-(kon-zac);
          end;

    cld:=cld+strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].oblacnost[I].percenta)*teff;
  end;

  zac:=strtoint(pozorovanie.intervaly[Int].ZacH)+
       strtoint(pozorovanie.intervaly[Int].ZacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].KonH)+
       strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  teff:=kon-zac;

  for I:=1 to pozorovanie.intervaly[Int].pozorovatelia[poz].BrkPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[I].ZacH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[I].ZacM)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[I].KonH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[poz].prestavky[I].KonM)/60;
      if zac>kon
        then
          kon:=kon+24;

      teff:=teff-(kon-zac);

    end;

  result:=cld/teff;
end;

function Lim(Int,poz: integer):real;
function nach(z,k,p:real):boolean;
begin
  result:=false;
  if z>k
    then
      k:=K+24;
  if z>p
    then
      p:=p+24;
  if k>p
    then
      result:=true;
end;

var
  I,J,P:integer;
  zac,kon,lim,teff:real;
begin
  P:=0;
  for I:=1 to pozorovanie.intervaly[Int].PozPocet do
    if strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=poz
      then
        P:=I;

  zac:=strtoint(pozorovanie.intervaly[Int].ZacH)+
       strtoint(pozorovanie.intervaly[Int].ZacM)/60;

  kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[1].Hod)+
       strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[1].Min)/60;

  if zac>kon
    then
      kon:=kon+24;

  teff:=kon-zac;

  for J:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].brkpocet do
        if nach(zac, kon, strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                          strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60)=true
          then
            begin
              zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60;
              kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonM)/60;
               if zac>kon
              then
                kon:=kon+24;
              teff:=teff-(kon-zac);
            end;

  lim:=lim+strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[1].limitka)*teff;
  for I:=2 to pozorovanie.intervaly[Int].pozorovatelia[p].LimPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I-1].Hod)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I-1].Min)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I].Hod)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I].Min)/60;

      if zac>kon
        then
          kon:=kon+24;

      teff:=kon-zac;

      for J:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].brkpocet do
        if nach(zac, kon, strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                          strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60)=true
          then
            begin
              zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60;
              kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonM)/60;
                    if zac>kon
              then
                kon:=kon+24;
              teff:=teff-(kon-zac);
            end;

      lim:=lim+strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[I].limitka)*teff;
    end;

  zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[pozorovanie.intervaly[Int].pozorovatelia[p].LimPocet].Hod)+
       strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[pozorovanie.intervaly[Int].pozorovatelia[p].LimPocet].Min)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].KonH)+
       strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  teff:=kon-zac;

  for J:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].brkpocet do
        if nach(zac, kon, strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                          strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60)=true
          then
            begin
              zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].ZacM)/60;
              kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonH)+
                   strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[J].KonM)/60;
                    if zac>kon
              then
                kon:=kon+24;
              teff:=teff-(kon-zac);
            end;

  lim:=lim+strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].limitky[pozorovanie.intervaly[Int].pozorovatelia[p].LimPocet].limitka)*teff;

  zac:=strtoint(pozorovanie.intervaly[Int].ZacH)+
       strtoint(pozorovanie.intervaly[Int].ZacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].KonH)+
       strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  teff:=kon-zac;

  for I:=1 to pozorovanie.intervaly[Int].pozorovatelia[p].BrkPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].ZacH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].ZacM)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].KonH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].KonM)/60;
      if zac>kon
        then
          kon:=kon+24;

      teff:=teff-(kon-zac);

    end;

  lim:=lim/teff;

  lim:=lim/100;

  result:=lim;

end;

function nachadza(int, poz: integer): boolean;
var
  I:integer;
begin
  result:=false;
  for I:=1 to pozorovanie.intervaly[int].PozPocet do
    if (strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=poz)
      then
        result:=true;
end;

function time(cas: real): string;
var
  str: string;
begin
  Cas:=(Cas/24-trunc(Cas/24))*24;
  str:='';
  if trunc(cas)<10
    then
      str:=str+'0';

  str:=str+inttostr(trunc(cas));
  str:=str+':';
  if round((cas-trunc(cas))*60)<10
    then
      str:=str+'0';

  str:=str+inttostr(round((cas-trunc(cas))*60));
  result:=str;
end;

function AkaJeToLimitka(cas:real; int, p:integer):real;

function nach(z,k,p: real):boolean;
begin
  result:=false;
  if z>k
    then
      k:=K+24;
  if z>p
    then
      p:=p+24;
  if k>p
    then
      result:=true;
end;

var
  I,poz:integer;
  zac, kon: real;
begin
  result:=0;
  poz:=0;
  cas:=(cas/24-trunc(cas/24))*24;
  for I:=1 to pozorovanie.intervaly[Int].PozPocet do
    if strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=p
      then
        poz:=I;

  if poz<>0
  then
  begin

  zac:=strtoint(pozorovanie.intervaly[Int].zacH)+
       strtoint(pozorovanie.intervaly[Int].zacM)/60;
  Kon:=strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[1].Hod)+
       strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[1].min)/60;

  if nach(zac, kon, cas)=true
    then
      result:=strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[1].limitka)/100;

  for I:=2 to pozorovanie.intervaly[int].pozorovatelia[poz].LimPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[I-1].Hod)+
           strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[I-1].min)/60;
      kon:=strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[I].Hod)+
           strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[I].min)/60;

      if nach(zac, kon, cas)=true
        then
          result:=strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[I-1].limitka)/100;
    end;

  zac:=strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[pozorovanie.intervaly[int].pozorovatelia[poz].LimPocet].Hod)+
       strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[pozorovanie.intervaly[int].pozorovatelia[poz].LimPocet].min)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].konH)+
       strtoint(pozorovanie.intervaly[Int].konM)/60;

  if nach(zac, kon, cas)=true
    then
      result:=strtoint(pozorovanie.intervaly[int].pozorovatelia[Poz].limitky[pozorovanie.intervaly[int].pozorovatelia[poz].LimPocet].limitka)/100;
  end;

end;

function VyskaRadiantu(cas: real; datum:string; fi, lambda: real; roj: integer): real;
var
  h: real;
  alfa, delta: real;
  max, JD: real;
  da,dd: real;
begin
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

  h:=18.697374558+24.06570982441908*(JD-2451545);
  h:=(h/24-trunc(h/24))*24;
  h:=h + 1.0027379093*(Cas)+lambda/15;
  h:=(h/24-trunc(h/24))*24;
  h:=(h-alfa/15)*15;
  h:=cos(DegToRad(delta))*cos(DegToRad(h))*cos(DegToRad(fi))+
     sin(DegToRad(delta))*sin(DegToRad(fi));
  h:=ArcSin(h);
  h:=RadToDeg(h);
  result:=h;
  //showmessage(format('%f',[H]));
end;

function ZHR(int, poz: integer; roj: integer; sirka, dlzka: real; datum: string): real;

function Meteory(int,poz: integer; roj: string): integer;
function nach(z,k,p:real):boolean;
begin
  result:=false;
  if z>k
    then
      k:=K+24;
  if z>p
    then
      p:=p+24;
  if k<p
    then
      result:=true;
end;

var
  I,J:integer;
  pos,zac,kon: real;
  tot: integer;

begin
  tot:=0;

  zac:=strtoint(pozorovanie.intervaly[Int].zacH)+strtoint(pozorovanie.intervaly[Int].zacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].konH)+strtoint(pozorovanie.intervaly[Int].KonM)/60;

  for J:=0 to (pozorovanie.Tabulka.Count div 10) - 1 do
    begin
      I:=J*10;
      pos:=strtoint(pozorovanie.Tabulka[I+1])+strtoint(pozorovanie.Tabulka[I+2])/60;
      if nach(zac,kon,pos)=false
        then
          if ((strtoint(pozorovanie.Tabulka[I+3])=poz) and
             (pozorovanie.Tabulka[I+5]=roj))
            then
              inc(tot);
    end;

  result:=tot;
end;

var
  I,P:integer;
  zac,kon: real;
  n,teff,K1,K2,K3: real;
begin
  p:=0;
  K3:=0;

  K1:=lim(int,poz);
  K1:=power((strtoint(pozorovanie.roje[roj].f[1])+strtoint(pozorovanie.roje[roj].f[3])/10),(6.5-K1));

  K2:=mraky(int,poz);
  K2:=100/(100-K2);

  zac:=strtoint(pozorovanie.intervaly[Int].zacH)+strtoint(pozorovanie.intervaly[Int].zacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].konH)+strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  repeat
    K3:=K3+VyskaRadiantu(zac,Datum, sirka, dlzka, roj);
    P:=P+1;
    zac:=zac+0.1;
  until zac>=kon;

  K3:=K3/P;
  K3:=90-K3;
  K3:=1/cos(degToRad(K3));

  n:=meteory(int,poz,pozorovanie.roje[roj].Znak);

  zac:=strtoint(pozorovanie.intervaly[Int].zacH)+strtoint(pozorovanie.intervaly[Int].zacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].konH)+strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  Teff:=kon-zac;

  P:=0;
  for I:=1 to pozorovanie.intervaly[Int].PozPocet do
    if strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=poz
      then
        P:=I;

  for I:=1 to pozorovanie.intervaly[int].pozorovatelia[p].BrkPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].zacH)+
           strtoint(pozorovanie.intervaly[int].pozorovatelia[p].prestavky[I].zacM)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].konH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].konM)/60;
      if zac>kon
        then
          kon:=kon+24;
      Teff:=Teff-(kon-zac);
    end;
  result:=(n/teff)*K1*K2*K3;
end;

function SporZHR(int, poz: integer; sirka, dlzka: real; datum: string): real;

function Meteory(int,poz: integer; roj: string): integer;
function nach(z,k,p:real):boolean;
begin
  result:=false;
  if z>k
    then
      k:=K+24;
  if z>p
    then
      p:=p+24;
  if k<p
    then
      result:=true;
end;

var
  I,J:integer;
  pos,zac,kon: real;
  tot: integer;

begin
  tot:=0;

  zac:=strtoint(pozorovanie.intervaly[Int].zacH)+strtoint(pozorovanie.intervaly[Int].zacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].konH)+strtoint(pozorovanie.intervaly[Int].KonM)/60;

  for J:=0 to (pozorovanie.Tabulka.Count div 10) - 1 do
    begin
      I:=J*10;
      pos:=strtoint(pozorovanie.Tabulka[I+1])+strtoint(pozorovanie.Tabulka[I+2])/60;
      if nach(zac,kon,pos)=false
        then
          if ((strtoint(pozorovanie.Tabulka[I+3])=poz) and
             (pozorovanie.Tabulka[I+5]=roj))
            then
              inc(tot);
    end;

  result:=tot;
end;

var
  I,P:integer;
  zac,kon: real;
  n,teff,K1,K2: real;
begin
  K1:=lim(int,poz);
  K1:=power(2.95,(6.5-K1));

  K2:=mraky(int,poz);
  K2:=100/(100-K2);

  n:=meteory(int,poz,'-');

  zac:=strtoint(pozorovanie.intervaly[Int].zacH)+strtoint(pozorovanie.intervaly[Int].zacM)/60;
  kon:=strtoint(pozorovanie.intervaly[Int].konH)+strtoint(pozorovanie.intervaly[Int].KonM)/60;

  if zac>kon
    then
      kon:=kon+24;

  Teff:=kon-zac;

  P:=0;
  for I:=1 to pozorovanie.intervaly[Int].PozPocet do
    if strtoint(pozorovanie.intervaly[Int].pozorovatelia[I].cislo)=poz
      then
        P:=I;

  for I:=1 to pozorovanie.intervaly[int].pozorovatelia[p].BrkPocet do
    begin
      zac:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].zacH)+
           strtoint(pozorovanie.intervaly[int].pozorovatelia[p].prestavky[I].zacM)/60;
      kon:=strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].konH)+
           strtoint(pozorovanie.intervaly[Int].pozorovatelia[p].prestavky[I].konM)/60;
      if zac>kon
        then
          kon:=kon+24;
      Teff:=Teff-(kon-zac);
    end;

  result:=(n/teff)*K1*K2;
end;

var
  I,J,K,P:integer;
  zac,kon,cas, H, T, limitka, cloud, chyba, ZHRhod, ZHRchyba: real;
  dlzkaHodnota,sirkaHodnota: real;
  spolu,jeden: real;
begin

  date:=strtodate(pozorovanie.Datum);

  for I:=1 to pozorovanie.pozPocet do
    IMOTabs.Tabs.Add('Observer '+ inttostr(I));

  if (strtoint(pozorovanie.ZaciatokH)+strtoint(pozorovanie.ZaciatokM)/60)>
     (strtoint(pozorovanie.KoniecH)+strtoint(pozorovanie.KoniecM)/60)
    then
      Datum.Caption:=Datum.Caption+
                     inttostr(dayof(date))+'/'+
                     inttostr(dayof(date)+1)+' .'+
                     inttostr(monthOf(date))+' .'+
                     inttostr(yearOf(date))
    else
      datum.Caption:=datum.Caption+pozorovanie.Datum;

  Zaciatok.Caption:=Zaciatok.Caption+
                    pozorovanie.ZaciatokH+':'+
                    pozorovanie.ZaciatokM;
  Koniec.Caption:=Koniec.Caption+
                  pozorovanie.KoniecH+':'+
                  pozorovanie.KoniecM;
  Meno.Caption:=Meno.Caption+pozorovanie.miesto.Meno;
  Stat.Caption:=Stat.Caption+pozorovanie.miesto.Stat;
  KodMiesta.Caption:=KodMiesta.Caption+pozorovanie.miesto.IMOkod;
  dlzka.Caption:=dlzka.Caption+
                 pozorovanie.miesto.DlzkaH+'° '+
                 pozorovanie.miesto.DlzkaM+chr(39)+' '+
                 pozorovanie.miesto.DlzkaS+'" '+
                 pozorovanie.miesto.DlzkaP;
  sirka.Caption:=sirka.Caption+
                 pozorovanie.miesto.SirkaH+'°'+
                 pozorovanie.miesto.SirkaM+ chr(39)+' '+
                 pozorovanie.miesto.SirkaS+'" '+
                 pozorovanie.miesto.SirkaP;
  vyska.Caption:=vyska.Caption+
                 pozorovanie.miesto.Vyska;

  SirkaHodnota:=strtoint(pozorovanie.miesto.SirkaH)+
                strtoint(pozorovanie.miesto.SirkaM)/60+
                strtoint(pozorovanie.miesto.SirkaS)/3600;

    if pozorovanie.miesto.SirkaP='S'
      then
        SirkaHodnota:=-SirkaHodnota;
  DlzkaHodnota:=strtoint(pozorovanie.miesto.DlzkaH)+
                strtoint(pozorovanie.miesto.DlzkaM)/60+
                strtoint(pozorovanie.miesto.DlzkaS)/3600;
  if pozorovanie.miesto.DlzkaP='W'
    then
      DlzkaHodnota:=-DlzkaHodnota;

  if pref.ContVyskaRADiantu=true
    then
  begin
  SetLength(Shower, pozorovanie.RojPocet);
  roje.Height:=220;
  roje.Height:=200*pozorovanie.RojPocet+20;
  roje.Top:=PageControl.Height-30;
  pageControl.Height:=pageControl.Height+roje.Height;
  for I:=0 to pozorovanie.RojPocet-1 do
    begin
      shower[I].Info:=TListBox.Create(Roje);
      with shower[I].Info do
        begin
          top:=20+200*I;
          left:=10;
          Parent:=roje;
          width:=160;
          height:=180;
          items.Add('Name: '+ pozorovanie.roje[I+1].meno );
          items.Add('IMO code: '+ pozorovanie.roje[I+1].ImoCod );
          items.Add('Begin activity: '+ pozorovanie.roje[I+1].zac[3]+
                                       pozorovanie.roje[I+1].zac[4]+'.'+
                                       pozorovanie.roje[I+1].zac[1]+
                                       pozorovanie.roje[I+1].zac[2]);
          items.Add('End activity: '+ pozorovanie.roje[I+1].Kon[3]+
                                       pozorovanie.roje[I+1].Kon[4]+'.'+
                                       pozorovanie.roje[I+1].Kon[1]+
                                       pozorovanie.roje[I+1].Kon[2]);
          items.Add('Maximum: '+       pozorovanie.roje[I+1].Max[3]+
                                       pozorovanie.roje[I+1].Max[4]+'.'+
                                       pozorovanie.roje[I+1].Max[1]+
                                       pozorovanie.roje[I+1].Max[2]);
          items.Add('Right ascension: '+pozorovanie.roje[I+1].rec+ ' °');
          items.Add('Declination: '+pozorovanie.roje[I+1].dec+ ' °');
          items.Add('Daily motion (Rec): '+pozorovanie.roje[I+1].da[1]+pozorovanie.roje[I+1].da[2]+'.'+pozorovanie.roje[I+1].da[3]+ ' °');
          items.Add('Daily motion (Dec): '+pozorovanie.roje[I+1].da[1]+pozorovanie.roje[I+1].dd[2]+'.'+pozorovanie.roje[I+1].da[3]+ ' °');
          items.Add('Geocentric velocity: '+ pozorovanie.roje[I+1].vel );
          items.Add('Population index: '+ pozorovanie.roje[I+1].f );
        end;
      shower[I].Graf:=TChart.Create(roje);

      with shower[I].Graf do
        begin
          top:=20+200*I;
          left:=180;
          Parent:=roje;
          width:=350;
          height:=180;
          title.Text.Add('Radiant altitude');
          legend.Visible:=false;
        end;
    end;
  end;

  if pref.ContRastZhr=true
    then
  begin
    rastZHRGroup.Visible:=true;
    rastZHRGroup.Height:=190;
    RastZHRGroup.Top:=PageControl.Height-25;
    PageControl.Height:=PageControl.Height+RastZHRGroup.Height+10;
    ZHRGraf:=TChart.Create(RastZHRGroup);
    with ZHRGraf do
      begin
        top:=20;
        left:=20;
        Parent:=RastZhrGroup;
        width:=500;
        height:=160;
        legend.Visible:=true;
      end;
  end;

  if pref.ContLimitky=true
    then
  begin
    LimitkyGroup.Visible:=true;
    LimitkyGroup.Height:=190;
    LimitkyGroup.Top:=PageControl.Height-25;
    PageControl.Height:=PageControl.Height+LimitkyGroup.Height+10;
    LimitkyGraf:=TCHart.Create(LimitkyGroup);
    with LimitkyGraf do
      begin
        top:=20;
        left:=20;
        Parent:=LimitkyGroup;
        width:=500;
        height:=160;
        legend.Visible:=true;
        bottomWall.Color:=clGray;
        LeftAxis.Automatic:=false;
        LeftAxis.Maximum:=7.0;
        LeftAxis.Minimum:=5.5;
        Leftaxis.Increment:=0.25;
        LeftAxis.TickLength:=15;
      end;
  end;

  if pref.ContFrekvenciaZHR=true
    then
  begin
    FrekvenciaZHR.Visible:=true;
    FrekvenciaZHR.Height:=190;
    FrekvenciaZHR.Top:=PageControl.Height-25;
    PageControl.Height:=PageControl.Height+FrekvenciaZHR.Height+10;
    FrekvenciaGraf:=TChart.Create(FrekvenciaZHR);
    with FrekvenciaGraf do
      begin
        top:=20;
        left:=20;
        Parent:=FrekvenciaZHR;
        width:=500;
        height:=160;
        legend.Visible:=false;
      end;
  end;

  if pref.ContPoctyMeteorov=true
    then
  begin
    PocetMeteorov.Visible:=true;
    PocetMeteorov.Height:=390;
    PocetMeteorov.Top:=PageControl.Height-25;
    PageControl.Height:=PageControl.Height+PocetMeteorov.Height+10;
    Label8.top:=16;
    Label8.left:=16;
    Label12.Top:=200;
    Label12.Left:=16;
    PoctyMeteorovGraf:=TChart.Create(PocetMeteorov);
    with PoctyMeteorovGraf do
      begin
        top:=36;
        left:=20;
        Parent:=PocetMeteorov;
        width:=500;
        height:=160;
        legend.Visible:=false;
        marginTop:=0;
        marginBottom:=0;
      end;
    PoctySMeteorovGraf:=TChart.Create(PocetMeteorov);
    with PoctySMeteorovGraf do
      begin
        top:=218;
        left:=20;
        Parent:=PocetMeteorov;
        width:=500;
        height:=160;
        legend.Visible:=false;
        marginTop:=0;
        marginBottom:=0;
      end;
  end;

  if pref.ContPrestavky=true
    then
  begin
    Prestavky.Visible:=true;
    Prestavky.Height:=390;
    Prestavky.Top:=PageControl.Height-25;
    PageControl.Height:=PageControl.Height+Prestavky.Height+10;
    PrestavkyGraf:=TChart.Create(Prestavky);
    Label4.Top:=16;
    Label4.Left:=16;
    Label7.Top:=200;
    Label7.Left:=16;
    with PrestavkyGraf do
      begin
        top:=36;
        left:=20;
        Parent:=prestavky;
        width:=500;
        height:=160;
        legend.Visible:=false;
        marginTop:=0;
        marginBottom:=0;
      end;

    TeffGraf:=TChart.Create(Prestavky);
    with TeffGraf do
      begin
        Top:=218;
        left:=20;
        parent:=prestavky;
        width:=500;
        height:=160;
        legend.Visible:=false;
        marginTop:=0;
        marginBottom:=0;
      end;
  end;

  SetLength(Pozorovatel, pozorovanie.pozPocet);
  for I:=0 to pozorovanie.pozPocet-1 do
  begin
    pozorovatel[I].Group:=TGroupBox.Create(sumarne);
    with pozorovatel[I].Group do
      begin
        top:=PageControl.Height-20;
        width:=545;
        parent:=sumarne;
        height:=174;
        pagecontrol.Height:=pagecontrol.Height+height+10;
        caption:='Observer '+inttostr(I+1);
      end;

    pozorovatel[I].LabelMeno:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelMeno do
      begin
        top:=24;
        Caption:='Name: '+ pozorovanie.pozorovatel[I+1].meno;
        parent:=pozorovatel[I].Group;
        left:=16;
      end;
    pozorovatel[I].LabelPriezvisko:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelPriezvisko do
      begin
        top:=40;
        Caption:='Surname: '+pozorovanie.pozorovatel[I+1].priezvisko;
        parent:=pozorovatel[I].Group;
        left:=16;
      end;
    pozorovatel[I].LabelImoKod:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelImoKod do
      begin
        top:=56;
        Caption:='IMO code: '+pozorovanie.pozorovatel[I+1].Imokod;
        parent:=pozorovatel[I].Group;
        left:=16;
      end;
    pozorovatel[I].LabelSporZHR:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].Labelsporzhr do
      begin
        top:=152;
        Caption:='Sporadic ZHR: ';
        parent:=pozorovatel[I].Group;
        left:=16;
      end;
    pozorovatel[I].LabelIMOCislo:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelIMOCislo do
      begin
        top:=72;
        Caption:='IMO number: '+pozorovanie.pozorovatel[I+1].IMOcislo;
        parent:=pozorovatel[I].Group;
        left:=16;
      end;
    pozorovatel[I].LabelLimitka:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelLimitka do
      begin
        top:=24;
        Caption:='Average limit magnitude: ';
        parent:=pozorovatel[I].Group;
        left:=176;
      end;
    pozorovatel[I].LabelCloudy:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelCloudy do
      begin
        top:=40;
        Caption:='Average clouds: ';
        parent:=pozorovatel[I].Group;
        left:=176;
      end;
    pozorovatel[I].LabelPocPrestavok:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelPocPrestavok do
      begin
        top:=56;
        Caption:='Number of breaks: ';
        parent:=pozorovatel[I].Group;
        left:=176;
      end;
    pozorovatel[I].LabelBreaky:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelBreaky do
      begin
        top:=72;
        Caption:='Breaks: ';
        parent:=pozorovatel[I].Group;
        left:=176;
      end;
    pozorovatel[I].LabelTeff:=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelTeff do
      begin
        top:=24;
        Caption:='Effective observation time: ';
        parent:=pozorovatel[I].Group;
        left:=376;
      end;
    pozorovatel[I].LabelZhr :=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelZhr do
      begin
        top:=136;
        Caption:='Personal ZHR (met/h):';
        parent:=pozorovatel[I].Group;
        left:=16;
      end;
    pozorovatel[I].LabelRojove :=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelRojove do
      begin
        top:=95;
        Caption:='Number of shower meteors: ';
        parent:=pozorovatel[I].Group;
        left:=16;
      end;
    pozorovatel[I].LabelSporadicke :=TLabel.Create(pozorovatel[I].Group);
    with pozorovatel[I].LabelSporadicke do
      begin
        top:=111;
        Caption:='Number of sporadic meteors: ';
        parent:=pozorovatel[I].Group;
        left:=16;
      end;
  end;
  velkostSumarne:=pageControl.Height;

  if pref.ContVyskaRADiantu=true
    then
  for I:=1 to pozorovanie.RojPocet do
  begin
    Shower[I-1].Series:=TLineSeries.Create(Shower[I-1].Graf);
    Shower[I-1].Graf.AddSeries(Shower[I-1].Series);

    cas:=strtoint(pozorovanie.ZaciatokH)+strtoint(pozorovanie.ZaciatokM)/60;
    kon:=strtoint(pozorovanie.KoniecH)+strtoint(pozorovanie.KoniecM)/60;

    if cas>kon
      then
        kon:=kon+24;
    
    repeat

     Shower[I-1].Graf.Series[0].Add(VyskaRadiantu(cas,
                                                  pozorovanie.Datum,
                                                  sirkaHodnota,
                                                  dlzkaHodnota,
                                                  I),time(cas),clTeeColor);
      cas:=cas+0.25;
    until cas>=kon;
  end;

  for I:=0 to pozorovanie.pozPocet-1 do
  begin
    T:=0;
    H:=0;
    for J:=1 to pozorovanie.IntPocet do
      if nachadza(J,I+1)=true
        then
          begin
            zac:=strtoint(pozorovanie.intervaly[J].zacH)+
                 strtoint(pozorovanie.intervaly[J].ZacM)/60;
            kon:=strtoint(pozorovanie.intervaly[J].KonH)+
                 strtoint(pozorovanie.intervaly[J].KonM)/60;
            if zac>kon
              then
                kon:=kon+24;
            T:=T+(kon-zac);
            H:=H+lim(J,I+1)*(kon-zac);
          end;
    pozorovatel[I].LabelLimitka.Caption:=pozorovatel[I].LabelLimitka.caption+ format('%f',[H/T]) + ' mag';
  end;

  limitka:=0;
  T:=0;
  for I:=1 to pozorovanie.IntPocet do
  begin
    H:=0;
    for J:=1 to pozorovanie.intervaly[I].PozPocet do
    if nachadza(I, J)=true
      then
        H:=H+lim(I,J);

    H:=H/pozorovanie.intervaly[I].PozPocet;

    zac:=strtoint(pozorovanie.intervaly[I].zacH)+
         strtoint(pozorovanie.intervaly[I].ZacM)/60;
    kon:=strtoint(pozorovanie.intervaly[I].KonH)+
         strtoint(pozorovanie.intervaly[I].KonM)/60;
    if zac>kon
      then
        kon:=kon+24;

    limitka:=limitka+H*(kon-zac);
    T:=T+(kon-zac);
  end;
  LabelLimitna.Caption:=LabelLimitna.Caption+format('%f', [limitka/T]) + ' mag';

  if pref.ContLimitky=true then
  for I:=0 to pozorovanie.pozPocet-1 do
  begin
    LimitkySeries:=TFastLineSeries.Create(LimitkyGraf);
    LimitkySeries.LinePen.Width:=3;
    LimitkyGraf.AddSeries(LimitkySeries);
    LimitkyGraf.Series[I].Title:='Observer '+inttostr(I+1);

    for J:=1 to pozorovanie.IntPocet do
    begin
      cas:=strtoint(pozorovanie.intervaly[J].zacH)+strtoint(pozorovanie.intervaly[J].zacM)/60;
      kon:=strtoint(pozorovanie.intervaly[J].KonH)+strtoint(pozorovanie.intervaly[J].KonM)/60;
      if cas>kon
        then
          kon:=kon+24;
      repeat
        LimitkySeries.Add(AkaJeToLimitka(cas, J, I+1),time(cas),clTeeColor);
        cas:=cas+0.15;
      until cas>=kon;
    end;
  end;

  if pref.ContPrestavky=true then
  begin
    TeffSeries:=TPieSeries.Create(TeffGraf);
    TeffGraf.AddSeries(TeffSeries);
  end;

  H:=0;

  for I:=0 to pozorovanie.pozPocet-1 do
  begin
    T:=0;
    for J:=1 to pozorovanie.IntPocet do
      begin
        zac:=strtoint(pozorovanie.intervaly[J].zacH)+
             strtoint(pozorovanie.intervaly[J].ZacM)/60;
        kon:=strtoint(pozorovanie.intervaly[J].KonH)+
             strtoint(pozorovanie.intervaly[J].KonM)/60;
        if zac>kon
          then
            kon:=kon+24;

        T:=T+(kon-zac);

        for K:=1 to pozorovanie.intervaly[J].pozorovatelia[I+1].BrkPocet do
          begin
            zac:=strtoint(pozorovanie.intervaly[J].pozorovatelia[I+1].prestavky[K].zacH)+
                 strtoint(pozorovanie.intervaly[J].pozorovatelia[I+1].prestavky[K].zacM)/60;
            kon:=strtoint(pozorovanie.intervaly[J].pozorovatelia[I+1].prestavky[K].konH)+
                 strtoint(pozorovanie.intervaly[J].pozorovatelia[I+1].prestavky[K].konM)/60;
            if zac>kon
              then
                kon:=kon+24;
            T:=T-(kon-zac);
          end;
      end;
      H:=H+T;
  end;

  for I:=0 to pozorovanie.pozPocet-1 do
  begin
    T:=0;
    for J:=1 to pozorovanie.IntPocet do
      begin
        zac:=strtoint(pozorovanie.intervaly[J].zacH)+
             strtoint(pozorovanie.intervaly[J].ZacM)/60;
        kon:=strtoint(pozorovanie.intervaly[J].KonH)+
             strtoint(pozorovanie.intervaly[J].KonM)/60;
        if zac>kon
          then
            kon:=kon+24;

        T:=T+(kon-zac);

        for K:=1 to pozorovanie.intervaly[J].pozorovatelia[I+1].BrkPocet do
          begin
            zac:=strtoint(pozorovanie.intervaly[J].pozorovatelia[I+1].prestavky[K].zacH)+
                 strtoint(pozorovanie.intervaly[J].pozorovatelia[I+1].prestavky[K].zacM)/60;
            kon:=strtoint(pozorovanie.intervaly[J].pozorovatelia[I+1].prestavky[K].konH)+
                 strtoint(pozorovanie.intervaly[J].pozorovatelia[I+1].prestavky[K].konM)/60;
            if zac>kon
              then
                kon:=kon+24;
            T:=T-(kon-zac);
          end;
      end;

    if pref.ContPrestavky=true then
      TeffGraf.Series[0].Add(T,'Observer '+inttostr(I+1)+' '+format('%f',[T/H*100])+'%', clTeeColor);

    pozorovatel[I].LabelTeff.Caption:=pozorovatel[I].LabelTeff.Caption+time(T);
  end;
    LabelTeff.Caption:=LabelTeff.Caption+'Total: '+time(H);
    H:=H/pozorovanie.pozPocet;
    LabelTeff.Caption:=LabelTeff.Caption+' Average: '+time(H);

  if pref.ContPrestavky=true then
  begin
    PrestavkySeries:=TPieSeries.Create(PrestavkyGraf);
    PrestavkyGraf.AddSeries(PrestavkySeries);
    PrestavkyGraf.Series[0].Title:='Teff';
    PrestavkyGraf.Series[0].Add(H,'Teff', clTeeColor);
  for I:=1 to pozorovanie.pozPocet do
    begin
      T:=0;
      for J:=1 to pozorovanie.IntPocet do
      begin
      P:=0;
      for K:=1 to pozorovanie.intervaly[J].PozPocet do
        if strtoint(pozorovanie.Intervaly[J].pozorovatelia[K].cislo)=I
          then
            P:=K;
      if P<>0 then
      for K:=1 to pozorovanie.Intervaly[J].pozorovatelia[P].BrkPocet do
        begin
          zac:=strtoint(pozorovanie.Intervaly[J].pozorovatelia[P].prestavky[K].ZacH)+
               strtoint(pozorovanie.Intervaly[J].pozorovatelia[P].prestavky[K].ZacM)/60;
          kon:=strtoint(pozorovanie.Intervaly[J].pozorovatelia[P].prestavky[K].KonH)+
               strtoint(pozorovanie.Intervaly[J].pozorovatelia[P].prestavky[K].KonM)/60;
          if zac>kon
            then
              kon:=kon+24;

          T:=T+(kon-zac);
        end;
      end;
      pozorovatel[I-1].LabelBreaky.Caption:=pozorovatel[I-1].LabelBreaky.Caption+time(T);
      if T<>0
        then
          PrestavkyGraf.Series[0].add(T, 'Observer '+inttostr(I)+' '+format('%f',[T/H*100])+'%', clTeeColor);
    end;
  end;
  for I:=1 to pozorovanie.pozPocet do
  begin
    H:=0;
    for J:=1 to pozorovanie.IntPocet do
      begin
        P:=0;
        for K:=1 to pozorovanie.intervaly[J].PozPocet do
          if strtoint(pozorovanie.Intervaly[J].pozorovatelia[K].cislo)=I
            then
              P:=K;
        if p<>0 then
          H:=H+pozorovanie.intervaly[J].pozorovatelia[p].brkpocet;
      end;
    pozorovatel[I-1].LabelPocPrestavok.Caption:=pozorovatel[I-1].LabelPocPrestavok.Caption+inttostr(trunc(H));
  end;

  for I:=0 to pozorovanie.pozPocet-1 do
  begin
    T:=0;
    H:=0;
    for J:=1 to pozorovanie.IntPocet do
      if nachadza(J,I+1)=true
        then
          begin
            zac:=strtoint(pozorovanie.intervaly[J].zacH)+
                 strtoint(pozorovanie.intervaly[J].ZacM)/60;
            kon:=strtoint(pozorovanie.intervaly[J].KonH)+
                 strtoint(pozorovanie.intervaly[J].KonM)/60;
            if zac>kon
              then
                kon:=kon+24;
            T:=T+(kon-zac);
            H:=H+mraky(J,I+1)*(kon-zac);
          end;
    pozorovatel[I].LabelCloudy.Caption:=pozorovatel[I].LabelCloudy.caption+ format('%f',[H/T]) + ' %';
  end;

  cloud:=0;
  T:=0;
  for I:=1 to pozorovanie.IntPocet do
  begin
    H:=0;
    for J:=1 to pozorovanie.intervaly[I].PozPocet do
    if nachadza(I, J)=true
      then
        H:=H+mraky(I,J);

    H:=H/pozorovanie.intervaly[I].PozPocet;

    zac:=strtoint(pozorovanie.intervaly[I].zacH)+
         strtoint(pozorovanie.intervaly[I].ZacM)/60;
    kon:=strtoint(pozorovanie.intervaly[I].KonH)+
         strtoint(pozorovanie.intervaly[I].KonM)/60;
    if zac>kon
      then
        kon:=kon+24;

    cloud:=cloud+H*(kon-zac);
    T:=T+(kon-zac);
  end;
  LabelMraky.Caption:=LabelMraky.Caption+format('%f', [cloud/T]) + ' %';

  for I:=1 to pozorovanie.pozPocet do
  begin
    for J:=1 to pozorovanie.RojPocet do
      pozorovatel[I-1].LabelRojove.Caption:=pozorovatel[I-1].LabelRojove.Caption+' '+ pozorovanie.roje[J].ImoCod+': '+ inttostr(PozMeteory(pozorovanie.roje[J].Znak, I));
    pozorovatel[I-1].LabelSporadicke.Caption:=pozorovatel[I-1].LabelSporadicke.Caption+ inttostr(PozMeteory('-', I));
  end;

  if pref.ContPoctyMeteorov=true
  then
  begin
    PoctyMeteorovSeries:=TPieSeries.Create(PoctyMeteorovGraf);
    PoctyMeteorovGraf.AddSeries(PoctyMeteorovSeries);
    spolu:=0;
    for I:=1 to pozorovanie.pozPocet do
    begin
      for J:=1 to pozorovanie.RojPocet do
        spolu:=spolu+PozMeteory(pozorovanie.roje[J].Znak, I);
    end;

    for I:=1 to pozorovanie.pozPocet do
    begin
      P:=0;
      for J:=1 to pozorovanie.RojPocet do
        P:=P+PozMeteory(pozorovanie.roje[J].Znak, I);
      PoctyMeteorovGraf.Series[0].Add(P,'Observer '+
                                        inttostr(I)+' '+format('%f',[P/spolu*100])+'%',
                                        clTeeColor);
    end;

    PoctySMeteorovSeries:=TPieSeries.Create(PoctySMeteorovGraf);
    PoctySMeteorovGraf.AddSeries(PoctySMeteorovSeries);
    spolu:=0;
    for I:=1 to pozorovanie.pozPocet do
      spolu:=spolu+PozMeteory('-', I);

    for I:=1 to pozorovanie.pozPocet do
      PoctySMeteorovGraf.Series[0].Add(PozMeteory('-', I),'Observer '+
                                       inttostr(I)+' '+format('%f',[PozMeteory('-', I)/spolu*100])+'%',
                                       ClTeeColor);
  end;

  for I:=1 to pozorovanie.RojPocet do
    LabelRojove.Caption:=LabelRojove.Caption+' '+pozorovanie.roje[I].ImoCod+': '+inttostr(meteory(pozorovanie.roje[I].Znak));

  LabelSporadicke.Caption:=LabelSporadicke.Caption+inttostr(SporMeteory);

  Label2.Caption:=Label2.Caption+pozorovanie.zapisovatel.meno+' '+
                  pozorovanie.zapisovatel.priezvisko+' '+
                  pozorovanie.zapisovatel.Imokod;

  P:=pozorovanie.intervaly[1].PozPocet;
  for I:=1 to pozorovanie.IntPocet do
    if P<pozorovanie.intervaly[I].PozPocet
      then
        P:=pozorovanie.intervaly[I].PozPocet;

  Label11.Caption:=Label11.Caption+inttostr(p);

  Label9.Caption:=Label9.Caption+inttostr((pozorovanie.Tabulka.count div 10));

  Label10.Caption:=Label10.Caption+ inttostr(Zapisy)+' rows/min';

  I:=0;
  P:=0;
  if pref.ContFrekvenciaZHR=true
  then
  begin
  FrekvenciaSeries:=TBarSeries.Create(FrekvenciaGraf);
  FrekvenciaSeries.Marks.Visible:=false;
  FrekvenciaGraf.AddSeries(FrekvenciaSeries);
  repeat
    if I+10>=pozorovanie.Tabulka.Count
        then
          break;

    zac:=strtoint(pozorovanie.tabulka[I+1])+strtoint(pozorovanie.tabulka[I+2])/60;
    kon:=strtoint(pozorovanie.tabulka[I+1+10])+strtoint(pozorovanie.tabulka[I+2+10])/60;

    if (zac=kon) and
       (pozorovanie.Tabulka[I+4]=pozorovanie.Tabulka[I+4+10])
      then
        if pozorovanie.Tabulka[I+4]=''
          then
            begin
              P:=P+1;
              I:=I+10;
              continue;
            end
          else
            begin
              I:=I+10;
              continue;
            end;

    if (zac=kon) and
       (pozorovanie.Tabulka[I+4]<>pozorovanie.Tabulka[I+4+10])
      then
        begin
          P:=P+1;
          I:=I+10;
          continue;
        end;

    if (zac<>kon)
      then
        begin
          P:=P+1;
          I:=I+10;
          FrekvenciaGraf.Series[0].Add(P, time(zac), ClTeeColor);
          P:=0;
        end;

  until I>=pozorovanie.Tabulka.Count;

  zac:=strtoint(pozorovanie.tabulka[I+1])+strtoint(pozorovanie.tabulka[I+2])/60;
  P:=P+1;
  FrekvenciaGraf.Series[0].Add(P, time(zac), ClTeeColor);
  end;

  for I:=1 to pozorovanie.pozPocet do
  for K:=1 to pozorovanie.RojPocet do
  begin
    H:=0;
    T:=0;
  for J:=1 to pozorovanie.intpocet do
    if nachadza(J, I)=true
      then
        begin
          zac:=strtoint(pozorovanie.intervaly[J].zacH)+
               strtoint(pozorovanie.intervaly[J].ZacM)/60;
          kon:=strtoint(pozorovanie.intervaly[J].KonH)+
               strtoint(pozorovanie.intervaly[J].KonM)/60;
          if zac>kon
            then
              kon:=kon+24;
          T:=T+(kon-zac);
          H:=H+ZHR(J,I,K, sirkaHodnota, dlzkaHodnota, pozorovanie.datum)*(kon-zac);
        end;
    pozorovatel[I-1].LabelZhr.caption:=pozorovatel[I-1].LabelZhr.caption+' '+pozorovanie.roje[K].ImoCod+' '+inttostr(round(H/T));
  end;

  if pref.ContRastZHR=true
    then
  for I:=1 to pozorovanie.RojPocet do
  begin
    zhrhod:=0;
    zhrchyba:=0;
    ZHRSeries:=TLineSeries.Create(ZHRGraf);
    ZHRSeries.Title:=pozorovanie.roje[I].meno;
    ZHRGraf.AddSeries(ZhrSeries);

    T:=0;
    zhrhod:=0;
    zhrchyba:=0;
    for J:=1 to pozorovanie.IntPocet do
    begin
     H:=0;
     chyba:=0;
      for K:=1 to pozorovanie.intervaly[J].PozPocet do
        H:=H+ZHR(J,strtoint(pozorovanie.intervaly[J].pozorovatelia[K].cislo),I, sirkaHodnota, dlzkaHodnota, pozorovanie.datum);
      H:=H/pozorovanie.intervaly[J].PozPocet;

      for K:=1 to pozorovanie.intervaly[J].PozPocet do
        chyba:=chyba+sqr(H-ZHR(J,strtoint(pozorovanie.intervaly[J].pozorovatelia[K].cislo),I, sirkaHodnota, dlzkaHodnota, pozorovanie.datum));

      if pozorovanie.intervaly[J].PozPocet>1
        then
          chyba:=chyba/(pozorovanie.intervaly[J].PozPocet*(pozorovanie.intervaly[J].PozPocet-1));

      chyba:=sqrt(chyba);

      ZHRGraf.Series[I-1].Add(round(H),'Int '+inttostr(J)+' '+pozorovanie.intervaly[J].ZacH+':'+pozorovanie.intervaly[J].ZacM, ClTeeColor);
   
    end;

  end;

  for I:=1 to pozorovanie.RojPocet do
  begin
    T:=0;
    zhrhod:=0;
    zhrchyba:=0;
    for J:=1 to pozorovanie.IntPocet do
    begin
      H:=0;
      chyba:=0;
      for K:=1 to pozorovanie.intervaly[J].PozPocet do
        H:=H+ZHR(J,strtoint(pozorovanie.intervaly[J].pozorovatelia[K].cislo),I, sirkaHodnota, dlzkaHodnota, pozorovanie.datum);
      H:=H/pozorovanie.intervaly[J].PozPocet;

      for K:=1 to pozorovanie.intervaly[J].PozPocet do
        chyba:=chyba+sqr(H-ZHR(J,strtoint(pozorovanie.intervaly[J].pozorovatelia[K].cislo),I, sirkaHodnota, dlzkaHodnota, pozorovanie.datum));

      if pozorovanie.intervaly[J].PozPocet>1
        then
          chyba:=chyba/(pozorovanie.intervaly[J].PozPocet*(pozorovanie.intervaly[J].PozPocet-1));

      chyba:=sqrt(chyba);

      zac:=strtoint(pozorovanie.intervaly[J].zacH)+strtoint(pozorovanie.intervaly[J].zacM)/60;
      kon:=strtoint(pozorovanie.intervaly[J].KonH)+strtoint(pozorovanie.intervaly[J].KonM)/60;
      if zac>kon
        then
          kon:=kon+24;

      T:=T+(kon-zac);
      zhrhod:=zhrHod+H*(Kon-zac);
      zhrchyba:=zhrchyba+chyba*(kon-zac);
    end;
  LabelZhr.Caption:=LabelZhr.Caption+pozorovanie.roje[I].ImoCod+' '+inttostr(round(ZHRhod/T))+' +-'+inttostr(round(ZHRchyba/T));
  end;




  for I:=1 to pozorovanie.pozPocet do
  begin
    H:=0;
    T:=0;
  for J:=1 to pozorovanie.intpocet do
    if nachadza(J, I)=true
      then
        begin
          zac:=strtoint(pozorovanie.intervaly[J].zacH)+
               strtoint(pozorovanie.intervaly[J].ZacM)/60;
          kon:=strtoint(pozorovanie.intervaly[J].KonH)+
               strtoint(pozorovanie.intervaly[J].KonM)/60;
          if zac>kon
            then
              kon:=kon+24;
          T:=T+(kon-zac);
          H:=H+SporZHR(J,I, sirkaHodnota, dlzkaHodnota, pozorovanie.datum)*(kon-zac);
        end;
    pozorovatel[I-1].LabelSporZHR.caption:=pozorovatel[I-1].LabelSporZhr.caption+' '+inttostr(round(H/T));
  end;


  T:=0;
  zhrHod:=0;
  ZhrChyba:=0;
  for J:=1 to pozorovanie.IntPocet do
    begin
     H:=0;
     chyba:=0;
     for K:=1 to pozorovanie.intervaly[J].PozPocet do
       H:=H+SporZHR(J,strtoint(pozorovanie.intervaly[J].pozorovatelia[K].cislo), sirkaHodnota, dlzkaHodnota, pozorovanie.datum);
      H:=H/pozorovanie.intervaly[J].PozPocet;

      for K:=1 to pozorovanie.intervaly[J].PozPocet do
        chyba:=chyba+sqr(H-SporZHR(J,strtoint(pozorovanie.intervaly[J].pozorovatelia[K].cislo), sirkaHodnota, dlzkaHodnota, pozorovanie.datum));
      if pozorovanie.intervaly[J].PozPocet>1
        then
          chyba:=chyba/(pozorovanie.intervaly[J].PozPocet*(pozorovanie.intervaly[J].PozPocet-1));
      chyba:=sqrt(chyba);

      zac:=strtoint(pozorovanie.intervaly[J].zacH)+strtoint(pozorovanie.intervaly[J].zacM)/60;
      kon:=strtoint(pozorovanie.intervaly[J].KonH)+strtoint(pozorovanie.intervaly[J].KonM)/60;
      if zac>kon
        then
          kon:=kon+24;

      T:=T+(kon-zac);
      zhrhod:=zhrHod+H*(Kon-zac);
      zhrchyba:=zhrchyba+chyba*(kon-zac);
    end;
  LabelSporZhr.Caption:=LabelSporZhr.Caption+' '+inttostr(round(ZHRhod/T))+' +-'+inttostr(round(ZHRchyba/T));

  for I:=1 to pozorovanie.RojPocet do
    begin
      PeriodsGrid.Columns.Add(TNxTextColumn,pozorovanie.roje[I].ImoCod);
      PeriodsGrid.Columns[5+I].Width:=39;
      if PeriodsGrid.Width<500
        then
          PeriodsGrid.Width:=PeriodsGrid.Width+39;
    end;

  PeriodsGrid.Columns.Add(TNxTextColumn,'SPO');
  PeriodsGrid.Columns[6+pozorovanie.RojPocet].Width:=39;
  if PeriodsGrid.Width<500
    then
      PeriodsGrid.Width:=PeriodsGrid.Width+39;

end;

procedure TOknoStatistiky.IMOShow(Sender: TObject);
begin
  PozorovatelCreate(IMOTabs.TabIndex+1);
end;

procedure TOknoStatistiky.IMOTabsChange(Sender: TObject);
begin
  PozorovatelCreate(IMOTabs.TabIndex+1);
end;

procedure TOknoStatistiky.SumarneShow(Sender: TObject);
begin
  PageControl.Height:=VelkostSumarne;
end;

end.
