unit Unit_Hlavicka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, NxColumnClasses, NxColumns,
  NxScrollControl, NxCustomGrid, Globalne_premenne,
  NxVirtualColumn, Menus,NxGrid, NxCustomGridControl, NxEdit, DateUtils;

Type  Thlavicka = record
end;
type
  TOknoHlavicky = class(TForm)
    PMenuSites: TPopupMenu;
    Erase: TMenuItem;
    PmenuPozorovatelia: TPopupMenu;
    Zmazadaj1: TMenuItem;
    Priradizapisovatea1: TMenuItem;
    PMenuTabulkaPozorovatelov: TPopupMenu;
    ZmazUdaj: TMenuItem;
    Tabs: TPageControl;
    TabSheet1: TTabSheet;
    Label11: TLabel;
    DatumACas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EZaciatokH: TEdit;
    EZaciatokM: TEdit;
    EKoniecH: TEdit;
    EKoniecM: TEdit;
    Miesta: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    EditVyska: TEdit;
    EditMiesto: TEdit;
    EditStat: TEdit;
    EditIMOKod: TEdit;
    EDlzkaH: TEdit;
    EDlzkaM: TEdit;
    ESirkaM: TEdit;
    ESirkaH: TEdit;
    EDlzkaS1: TEdit;
    ESirkaS1: TEdit;
    BtZmazat1: TButton;
    ZoznamMiest: TListBox;
    BtAdd1: TButton;
    TabSheet3: TTabSheet;
    Label22: TLabel;
    ZoznamPozorovatelov: TListBox;
    BtPridaj: TButton;
    BtZmazat: TButton;
    ZapisovatelBox: TGroupBox;
    Label24: TLabel;
    EMenoZapisovatela: TEdit;
    EIMOkodZapisovatela: TEdit;
    EPriezviskoZapisovatela: TEdit;
    PozorovateliaBox: TGroupBox;
    Pozorovatelia: TNextGrid;
    NxIncrementColumn2: TNxIncrementColumn;
    NxTextColumn7: TNxTextColumn;
    NxTextColumn9: TNxTextColumn;
    NxTextColumn8: TNxTextColumn;
    TabSheet2: TTabSheet;
    Roje: TNextGrid;
    NxTextColumn2: TNxTextColumn;
    Label13: TLabel;
    Label12: TLabel;
    NxTextColumn1: TNxTextColumn;
    PMenuRoje: TPopupMenu;
    Zmazudaj1: TMenuItem;
    BtAddShw: TButton;
    GroupBox1: TGroupBox;
    EZnak: TEdit;
    BoxRoj: TComboBox;
    Label23: TLabel;
    Label25: TLabel;
    NxTextColumn3: TNxTextColumn;
    Zmavetko1: TMenuItem;
    Zmazvsetko1: TMenuItem;
    NxTextColumn4: TNxTextColumn;
    EditDatum: TDateTimePicker;
    EDlzkaP: TComboBox;
    ESirkaP: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtZmazat1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtAdd1Click(Sender: TObject);
    procedure ZoznamMiestDblClick(Sender: TObject);
    procedure EraseClick(Sender: TObject);
    procedure EditDatumChange(Sender: TObject);
    procedure EZaciatokHChange(Sender: TObject);
    procedure EZaciatokMChange(Sender: TObject);
    procedure EKoniecHChange(Sender: TObject);
    procedure EKoniecMChange(Sender: TObject);
    procedure EDlzkaHChange(Sender: TObject);
    procedure EDlzkaMChange(Sender: TObject);
    procedure EDlzkaS1Change(Sender: TObject);
    procedure ESirkaHChange(Sender: TObject);
    procedure ESirkaMChange(Sender: TObject);
    procedure ESirkaS1Change(Sender: TObject);
    procedure ESirkaPChange(Sender: TObject);
    procedure EditMiestoChange(Sender: TObject);
    procedure EditIMOKodChange(Sender: TObject);
    procedure EditStatChange(Sender: TObject);
    procedure EditVyskaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtPridajClick(Sender: TObject);
    procedure Priradizapisovatea1Click(Sender: TObject);
    procedure Zmazadaj1Click(Sender: TObject);
    procedure BtZmazatClick(Sender: TObject);
    procedure ZoznamPozorovatelovDblClick(Sender: TObject);
    procedure EIMOkodZapisovatelaChange(Sender: TObject);
    procedure EMenoZapisovatelaChange(Sender: TObject);
    procedure EPriezviskoZapisovatelaChange(Sender: TObject);
    procedure ZmazUdajClick(Sender: TObject);
    procedure PozorovateliaAfterRowMove(Sender: TObject; FromPos,
      ToPos: Integer);
    procedure Zmazudaj1Click(Sender: TObject);
    procedure BtAddShwClick(Sender: TObject);
    procedure Zmavetko1Click(Sender: TObject);
    procedure Zmazvsetko1Click(Sender: TObject);
    procedure PozorovateliaEditAccept(Sender: TObject; ACol, ARow: Integer;
      Value: WideString; var Accept: Boolean);
    procedure RojeEditAccept(Sender: TObject; ACol, ARow: Integer;
      Value: WideString; var Accept: Boolean);
    procedure EZaciatokHKeyPress(Sender: TObject; var Key: Char);
    procedure EZaciatokMKeyPress(Sender: TObject; var Key: Char);
    procedure EKoniecHKeyPress(Sender: TObject; var Key: Char);
    procedure EKoniecMKeyPress(Sender: TObject; var Key: Char);
    procedure EDlzkaHKeyPress(Sender: TObject; var Key: Char);
    procedure EDlzkaMKeyPress(Sender: TObject; var Key: Char);
    procedure EDlzkaS1KeyPress(Sender: TObject; var Key: Char);
    procedure ESirkaHKeyPress(Sender: TObject; var Key: Char);
    procedure ESirkaMKeyPress(Sender: TObject; var Key: Char);
    procedure ESirkaS1KeyPress(Sender: TObject; var Key: Char);
    procedure EditVyskaKeyPress(Sender: TObject; var Key: Char);
    procedure EditIMOKodKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure EIMOkodZapisovatelaKeyPress(Sender: TObject; var Key: Char);
    procedure EMenoZapisovatelaKeyPress(Sender: TObject; var Key: Char);
    procedure EPriezviskoZapisovatelaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EditMiestoKeyPress(Sender: TObject; var Key: Char);
    procedure EditStatKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OknoHlavicky: TOknoHlavicky;
  HlavickaOpened: Boolean;
  AddSiteFormOpened: Boolean;
  NewSite: Boolean;
  NewObserver: Boolean;
  AddObserverFormOpened: Boolean;
implementation

uses Unit_AddSiteForm, Unit_AddObserverForm;

{$R *.dfm}

procedure TOknoHlavicky.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{ Odstrani formular z pamate}
 Action:=CaFree;
 HlavickaOpened:=false;
 AddSiteFormOpened:=False;
end;

procedure TOknoHlavicky.BtZmazat1Click(Sender: TObject);
begin
{ Zmazanie vsetkych udajov}
if MessageDlg('Erase all data?',
            mtConfirmation, [mbYes, mbNo], 0)=MrYes then
 begin
  EZaciatokH.text:='';
  EZaciatokM.text:='';
  EKoniecH.text:='';
  EKoniecM.text:='';
  EDlzkaH.text:='';
  EDlzkaM.text:='';
  EDlzkaS1.text:='';
  EDlzkaP.text:='';
  ESirkaH.text:='';
  ESirkaM.text:='';
  ESirkaS1.text:='';
  ESirkaP.text:='';
  Editvyska.text:='';
  EditMiesto.text:='';
  EditStat.text:='';
  EditIMOkod.text:='';
  EditDatum.Date:=0;
  { aj premenne sa musia vymazat}
  pozorovanie.Datum:='';
  pozorovanie.ZaciatokH:='';
  pozorovanie.ZaciatokM:='';
  pozorovanie.KoniecH:='';
  pozorovanie.KoniecM:='';
  pozorovanie.miesto.DlzkaH:='';
  pozorovanie.miesto.DlzkaM:='';
  pozorovanie.miesto.DlzkaS:='';
  pozorovanie.miesto.DlzkaP:='';
  pozorovanie.miesto.SirkaH:='';
  pozorovanie.miesto.SirkaM:='';
  pozorovanie.miesto.SirkaS:='';
  pozorovanie.miesto.SirkaP:='';
  pozorovanie.miesto.vyska:='';
  pozorovanie.miesto.Meno:='';
  pozorovanie.miesto.Stat:='';
  pozorovanie.miesto.IMOkod:='';
  end;
end;


procedure TOknoHlavicky.FormCreate(Sender: TObject);
var
  I:integer;
  oudaj: Tpozorovatel;
  sudaj: Tmiesto;
  shudaj: Troj;
  sites: file of Tmiesto;
  observers: file of Tpozorovatel;
  showers: file of Troj;
begin
  { Zo zaznamov sa nahraju udaje do editov }
  { hlavicka}
  if pozorovanie.Datum=''
    then
      EditDatum.Date:=0
    else
      EditDatum.Date:=strtodate(pozorovanie.Datum);
  EZaciatokH.Text:=pozorovanie.ZaciatokH;
  EZaciatokM.Text:=pozorovanie.ZaciatokM;
  EKoniecH.Text:=pozorovanie.KoniecH;
  EKoniecM.Text:=pozorovanie.KoniecM;
  EDlzkaH.Text:=pozorovanie.miesto.DlzkaH;
  EDlzkaM.Text:=pozorovanie.miesto.DlzkaM;
  EDlzkaS1.Text:=pozorovanie.miesto.DlzkaS;
  If pozorovanie.miesto.DlzkaP=''
    then
      pozorovanie.miesto.DlzkaP:='E';

  If pozorovanie.miesto.DlzkaP='W'
    then
      EDlzkaP.ItemIndex:=1
    else
      EDlzkaP.ItemIndex:=0;
  ESirkaH.Text:=pozorovanie.miesto.SirkaH;
  ESirkaM.Text:=pozorovanie.miesto.SirkaM;
  ESirkaS1.Text:=pozorovanie.miesto.SirkaS;

  If pozorovanie.miesto.SirkaP=''
    then
      pozorovanie.miesto.SirkaP:='N';

  If pozorovanie.miesto.SirkaP='S'
    then
      ESirkaP.ItemIndex:=1
    else
      ESirkaP.ItemIndex:=0;

  EditVyska.Text:=pozorovanie.miesto.vyska;
  EditMiesto.Text:=pozorovanie.miesto.Meno;
  EditStat.text:=pozorovanie.miesto.Stat;
  EditImoKod.Text:=pozorovanie.miesto.IMOkod;
  { pozorovatelia }
  EIMOKodZapisovatela.Text:=pozorovanie.zapisovatel.Imokod;
  EMenoZapisovatela.Text:=pozorovanie.zapisovatel.meno;
  EPriezviskoZapisovatela.Text:=pozorovanie.zapisovatel.priezvisko;
 { cyklus nahrava do tabulky}
  for I:=1 to pozorovanie.pozPocet do
    begin
      pozorovatelia.AddRow(1);
      pozorovatelia.Cells[1,I-1]:=pozorovanie.pozorovatel[I].IMOcislo;
      pozorovatelia.Cells[2,I-1]:=pozorovanie.pozorovatel[I].Imokod;
      pozorovatelia.Cells[3,I-1]:=pozorovanie.pozorovatel[I].meno;
      pozorovatelia.Cells[4,I-1]:=pozorovanie.pozorovatel[I].priezvisko;
    end;
 { nahranie udajov z databazi do listboxu}
  assignFile(sites, extractfilepath(application.ExeName) + 'sites.dat');
  reset(sites);
  I:=0;
  while not eof(sites) do
    begin
      read(sites, sudaj);
      ZoznamMiest.Items[I]:=sudaj.Meno;
      inc(I);
    end;
  { to sa musi prehodit aby sa hned po pridani noveho udaja do databazi
  objavil v listboxe}
  NewSite:=false;
  { databaza observerov}
  assignFile(observers, extractfilepath(application.ExeName) + 'observers.dat');
  reset(observers);
  I:=0;
  while not eof(observers) do
    begin
      read(observers, oudaj);
      ZoznamPozorovatelov.Items[I]:=oudaj.priezvisko;
      inc(I);
    end;
   NewObserver:=false;
   {databaza rojov}
   assignFile(showers, extractfilepath(application.ExeName) + 'showers.dat');
   reset(showers);
   while not eof(showers) do
    begin
      read(showers, shudaj);
      BoxRoj.Items.Add(shudaj.meno);
    end;
   for I:=1 to pozorovanie.RojPocet do
     begin
       roje.AddRow(1);
       roje.cells[1,I-1]:=pozorovanie.roje[I].znak;
       roje.cells[0,I-1]:=pozorovanie.roje[I].meno;
       roje.Cells[2,I-1]:=
       pozorovanie.roje[I].rec + '�   ' +
       pozorovanie.roje[I].dec + '�   ' +
       pozorovanie.roje[I].vel + 'km/s      ' +
       pozorovanie.roje[I].zhr + '         ' +
       pozorovanie.roje[I].ImoCod;
     end;
     Saved:=true;
end;

procedure TOknoHlavicky.BtAdd1Click(Sender: TObject);
begin
{ ak neje formular addsiteform otvoreny tak ho otvory a prehodi premennu na
opened}
If AddSiteFormOpened = false then
  begin
    AddsiteForm:=TAddSiteForm.Create(application);
    AddSiteFormOpened:=True;
  end;

end;

procedure TOknoHlavicky.ZoznamMiestDblClick(Sender: TObject);
var
  sites: File of Tmiesto;
  udaj: Tmiesto;
begin
  {ak je nakliknute na nejaky zaznam v databaze }
  if ZoznamMiest.ItemIndex >=0 then
    begin
      assignfile(sites, extractfilepath(application.ExeName) + 'sites.dat');
      reset(sites);
      { vytiahnu sa udaje z databazy}
      seek(sites,ZoznamMiest.ItemIndex);
      read(sites, udaj);
      { nahraju sa do editov}
      EditMiesto.text:=udaj.meno;
      EditImoKod.Text:=udaj.IMOkod;
      EditStat.text:=udaj.Stat;
      EditVyska.Text:=udaj.Vyska;
      EDlzkaH.text:=udaj.DlzkaH;
      EDlzkaM.text:=udaj.DlzkaM;
      EDlzkaS1.text:=udaj.DlzkaS;

      if udaj.DlzkaP='E'
        then
          EDlzkaP.ItemIndex:=0
        else
          EDlzkaP.ItemIndex:=1;
      if udaj.DlzkaP='E'
        then
          Pozorovanie.miesto.DlzkaP:='E'
        else
          Pozorovanie.miesto.DlzkaP:='W';

      ESirkaH.text:=udaj.SirkaH;
      ESirkaM.text:=udaj.SirkaM;
      ESirkaS1.text:=udaj.SirkaS;
      If udaj.SirkaP='N'
        then
          ESirkaP.ItemIndex:=0
        else
          ESirkaP.ItemIndex:=1;

      If udaj.SirkaP='N'
        then
          Pozorovanie.miesto.SirkaP:='N'
        else
          Pozorovanie.miesto.SirkaP:='S';
    end;
end;

procedure TOknoHlavicky.EraseClick(Sender: TObject);
var
  sites: File of Tmiesto;
  udaj: Tmiesto;
begin
{ ak je nakliknute na zaznam}
if ZoznamMiest.ItemIndex>=0 then
  begin
    { udaj sa presunie na koniec a koniec sa odtrhne cize udaj sa vymaze}
    assignFile(sites, extractfilepath(application.ExeName) + 'sites.dat');
    reset(sites);
    seek(sites, FileSize(Sites)-1);
    read(sites, udaj);
    seek(sites, ZoznamMiest.ItemIndex);
    write(sites, udaj);
    seek(sites, FileSize(Sites)-1);
    truncate(sites);
    ZoznamMiest.DeleteSelected;
  end;
end;

{ zaciatok pridavania udajov z editov do premennych}
procedure TOknoHlavicky.EditDatumChange(Sender: TObject);
begin
  pozorovanie.Datum:=datetostr(EditDatum.date);
  Saved:=false;
  pozorovanie.tested:=false;
end;

procedure TOknoHlavicky.EZaciatokHChange(Sender: TObject);
begin
pozorovanie.ZaciatokH:=EZaciatokH.Text;
  Saved:=false;
  pozorovanie.tested:=false;
end;

procedure TOknoHlavicky.EZaciatokMChange(Sender: TObject);
begin
pozorovanie.ZaciatokM:=EZaciatokM.text;
  Saved:=false;
  pozorovanie.tested:=false;
end;

procedure TOknoHlavicky.EKoniecHChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.KoniecH:=EkoniecH.Text;
end;

procedure TOknoHlavicky.EKoniecMChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.KoniecM:=EkoniecM.Text;
end;

procedure TOknoHlavicky.EDlzkaHChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.DlzkaH:=EDlzkaH.text;
end;

procedure TOknoHlavicky.EDlzkaMChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.DlzkaM:=EDlzkaM.text;
end;

procedure TOknoHlavicky.EDlzkaS1Change(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.DlzkaS:=EDlzkaS1.text;
end;

procedure TOknoHlavicky.ESirkaHChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.SirkaH:=ESirkaH.text;
end;

procedure TOknoHlavicky.ESirkaMChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.SirkaM:=ESirkaM.text;
end;

procedure TOknoHlavicky.ESirkaS1Change(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.SirkaS:=ESirkaS1.text;
end;

procedure TOknoHlavicky.ESirkaPChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.SirkaP:=ESirkaP.Text;
end;

procedure TOknoHlavicky.EditMiestoChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.meno:=EditMiesto.Text;
end;

procedure TOknoHlavicky.EditIMOKodChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.IMOkod:=EditImoKod.Text;
end;

procedure TOknoHlavicky.EditStatChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.Stat:=EditStat.Text;
end;

procedure TOknoHlavicky.EditVyskaChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.Vyska:=EditVyska.Text;
end;
{ koniec pridavania udajov z editov do premennych}

procedure TOknoHlavicky.FormActivate(Sender: TObject);
var
  I:integer;
  Sudaj: Tmiesto;
  Oudaj: Tpozorovatel;
  Sites: File of TMiesto;
  observers: File of Tpozorovatel;
begin
{ procedura sluzi na to aby po pridani udaju do databazy sa udaj hned
  objavil v listboxe}
  {new site premena ktora sluzi na to ci existuje nejaky novy udaj inac by aktualizovalo
   furt po aktivacii formulara OknoHlavicky}
if NewSite=true then
  begin
  assignfile(sites, extractfilepath(application.ExeName) + 'sites.dat');
  reset(sites);
  I:=0;
  while not eof(sites) do
    begin
      read(sites, sudaj);
      ZoznamMiest.Items[I]:=sudaj.Meno;
      inc(I);
  end;
  { prehodi premennu pretoze uz je prdany novy zaznam do listboxu}
  NewSite:=false;
  closefile(sites);
  end;
  { databaza observerov}
  if Newobserver=true then
  begin
  assignfile(observers, extractfilepath(application.ExeName) + 'observers.dat');
  reset(observers);
  I:=0;
  while not eof(observers) do
    begin
      read(observers, oudaj);
      ZoznamPozorovatelov.Items[I]:=oudaj.priezvisko;
      inc(I);
  end;
  { prehodi premennu pretoze uz je prdany novy zaznam do listboxu}
  Newobserver:=false;
  closefile(observers);
  end;
end;

procedure TOknoHlavicky.BtPridajClick(Sender: TObject);
begin
{ak neje formular addsiteform otvoreny tak ho otvory a prehodi premennu na opened}
If AddObserverFormOpened = false then
  begin
    AddObserverForm:=TAddObserverForm.Create(Application);
    AddObserverFormOpened:=True;
  end;
end;

procedure TOknoHlavicky.Priradizapisovatea1Click(Sender: TObject);
var
  observers: File of Tpozorovatel;
  udaj: Tpozorovatel;
begin
  {ak je nakliknute na nejaky zaznam v databaze }
  if ZoznamPozorovatelov.ItemIndex >=0 then
    begin
      assignfile(observers, extractfilepath(application.ExeName) + 'observers.dat');
      reset(observers);
      { vytiahnu sa udaje z databazy}
      seek(observers,ZoznamPozorovatelov.ItemIndex);
      read(observers, udaj);
      { nahraju sa do editov}
      EIMOKodZapisovatela.text:=udaj.Imokod;
      EMenoZapisovatela.text:=udaj.meno;
      EPriezviskoZapisovatela.Text:=udaj.priezvisko;
      Saved:=false;
      closefile(observers);
      pozorovanie.tested:=false;
    end;

end;

procedure TOknoHlavicky.Zmazadaj1Click(Sender: TObject);
var
  observers: file of Tpozorovatel;
  udaj: Tpozorovatel;
begin
  { ak je nakliknute na zaznam}
if ZoznamPozorovatelov.ItemIndex>=0
  then
if MessageDlg('Erase?',
            mtConfirmation, [mbYes, mbNo], 0)=MrYes then
  begin
    { udaj sa presunie na koniec a koniec sa odtrhne cize udaj sa vymaze}
    assignFile(observers, extractfilepath(application.ExeName) + 'observers.dat');
    reset(observers);
    seek(observers, FileSize(observers)-1);
    read(observers, udaj);
    seek(observers, ZoznamPozorovatelov.ItemIndex);
    write(observers, udaj);
    seek(observers, FileSize(observers)-1);
    truncate(observers);
    ZoznamPozorovatelov.DeleteSelected;
  end;
end;

procedure TOknoHlavicky.BtZmazatClick(Sender: TObject);
var I:integer;
begin
  if MessageDlg ('Erase all data?', mtConfirmation,
                [mbYes, mbCancel], 0)=mrYes then
  begin
   for I:=0 to pozorovatelia.rowcount do
     begin
     pozorovanie.pozorovatel[I].Imokod:='';
     pozorovanie.pozorovatel[I].meno:='';
     pozorovanie.pozorovatel[I].priezvisko:='';
     end;
     pozorovatelia.ClearRows;
     EIMOKodZapisovatela.text:='';
     EMenoZapisovatela.text:='';
     Epriezviskozapisovatela.text:='';
   end;
end;

procedure TOknoHlavicky.ZoznamPozorovatelovDblClick(Sender: TObject);
var
  observers: File of Tpozorovatel;
  udaj: Tpozorovatel;
begin
  {ak je nakliknute na nejaky zaznam v databaze }
  if (ZoznamPozorovatelov.ItemIndex >=0) and (pozorovanie.PozPocet<12) then
    begin
      assignfile(observers, extractfilepath(application.ExeName) + 'observers.dat');
      reset(observers);
      { vytiahnu sa udaje z databazy}
      seek(observers,ZoznamPozorovatelov.ItemIndex);
      read(observers, udaj);
      { nahraju sa do editov}
      inc(pozorovanie.PozPocet);
      pozorovatelia.AddRow(1);
      pozorovatelia.Cells[2,pozorovanie.PozPocet-1]:=udaj.Imokod;
      pozorovatelia.Cells[1,pozorovanie.pozPocet-1]:=udaj.IMOcislo;
      pozorovatelia.Cells[3,pozorovanie.PozPocet-1]:=udaj.meno;
      pozorovatelia.Cells[4,pozorovanie.PozPocet-1]:=udaj.priezvisko;
      pozorovanie.pozorovatel[pozorovanie.PozPocet].Imokod:=pozorovatelia.cells[2,pozorovatelia.rowcount-1];
      pozorovanie.pozorovatel[pozorovanie.PozPocet].ImoCislo:=pozorovatelia.cells[1,pozorovatelia.rowcount-1];
      pozorovanie.pozorovatel[pozorovanie.PozPocet].meno:=pozorovatelia.cells[3,pozorovatelia.rowcount-1];
      pozorovanie.pozorovatel[pozorovanie.PozPocet].priezvisko:=pozorovatelia.cells[4,pozorovatelia.rowcount-1];
      Saved:=false;
      pozorovanie.tested:=false;
    end;
end;
{ zaciatok nahravania z editov do premennych}
procedure TOknoHlavicky.EIMOkodZapisovatelaChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.zapisovatel.Imokod:=EIMOKodZapisovatela.Text;
end;

procedure TOknoHlavicky.EMenoZapisovatelaChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.zapisovatel.meno:=EMenoZapisovatela.text;
end;

procedure TOknoHlavicky.EPriezviskoZapisovatelaChange(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.zapisovatel.priezvisko:=EPriezviskoZapisovatela.text;
end;
{ koniec}

procedure TOknoHlavicky.ZmazUdajClick(Sender: TObject);
var
  I:integer;
begin
{ vsetky udaje nad oznacenym riadkom sa poposuvaju o jedno nizzsie a posledny sa vymaze}
if pozorovatelia.SelectedRow>=0 then
  begin
    for I:=1 to (11-pozorovatelia.selectedRow) do
      begin
        pozorovanie.pozorovatel[I+pozorovatelia.selectedRow]:=pozorovanie.pozorovatel[I+pozorovatelia.selectedRow+1];
      end;
    pozorovanie.pozorovatel[pozorovanie.PozPocet].Imokod:='';
    pozorovanie.pozorovatel[pozorovanie.PozPocet].meno:='';
    pozorovanie.pozorovatel[pozorovanie.PozPocet].priezvisko:='';
    pozorovanie.pozorovatel[pozorovanie.pozPocet].IMOcislo:='';
    pozorovatelia.DeleteRow(pozorovatelia.selectedrow);
    dec(pozorovanie.PozPocet);
  end;
end;

procedure TOknoHlavicky.PozorovateliaAfterRowMove(Sender: TObject; FromPos,
  ToPos: Integer);
var
  udaj:Tpozorovatel;
begin
 udaj:=pozorovanie.pozorovatel[ToPos+1];
 pozorovanie.pozorovatel[ToPos+1]:=pozorovanie.pozorovatel[FromPos+1];
 pozorovanie.pozorovatel[FromPos+1]:=udaj;
end;

procedure TOknoHlavicky.Zmazudaj1Click(Sender: TObject);
var
  I:integer;
begin
  { vsetky udaje nad oznacenym riadkom sa poposuvaju o jedno nizzsie a posledny sa vymaze}
if roje.SelectedRow>=0 then
  begin
    for I:=1 to (9-roje.selectedRow) do
      begin
        pozorovanie.roje[I+roje.selectedRow]:=pozorovanie.roje[I+roje.selectedRow+1];
      end;
    roje.DeleteRow(roje.selectedrow);
    dec(pozorovanie.RojPocet);
  end;
end;

procedure TOknoHlavicky.BtAddShwClick(Sender: TObject);
var
  I:integer;
  udaj: Troj;
  showers: file of Troj;
begin
{ak su vyplnene vsetky polia}
  if (BoxRoj.text='') or (Eznak.text='')
    then
      showmessage('Box ID must be filled')
    else
      begin
      {ak je pocet rojov menej nez 10}
      if pozorovanie.RojPocet<10 then
        begin
          assignFile(showers,extractfilepath(application.ExeName) +  'showers.dat');
          reset(showers);
          I:=0;
          {v databaze sa najde dany roj}
          while not eof(showers) do
            begin
              seek(showers, I);
              read(showers, udaj);
              if udaj.meno=BoxRoj.Text then
                begin
                  Saved:=false;
                  pozorovanie.tested:=false;
                  inc(pozorovanie.RojPocet);
                  roje.AddRow(1);
                  {prida sa riadok, zvacsi sa pocitadlo poctu rojov a pridaju
                  sa udaje do tabulky}
                  roje.Cells[1,roje.RowCount-1]:=Eznak.Text;
                  roje.Cells[0,roje.RowCount-1]:=BoxRoj.Text;
                  pozorovanie.roje[pozorovanie.RojPocet].meno:=udaj.meno;
                  pozorovanie.roje[pozorovanie.RojPocet].zac:=udaj.zac;
                  pozorovanie.roje[pozorovanie.RojPocet].kon:=udaj.kon;
                  pozorovanie.roje[pozorovanie.RojPocet].max:=udaj.max;
                  pozorovanie.roje[pozorovanie.RojPocet].rec:=udaj.rec;
                  pozorovanie.roje[pozorovanie.RojPocet].dec:=udaj.dec;
                  pozorovanie.roje[pozorovanie.RojPocet].da:=udaj.da;
                  pozorovanie.roje[pozorovanie.RojPocet].dd:=udaj.dd;
                  pozorovanie.roje[pozorovanie.RojPocet].vel:=udaj.vel;
                  pozorovanie.roje[pozorovanie.RojPocet].f:=udaj.f;
                  pozorovanie.roje[pozorovanie.RojPocet].zhr:=udaj.zhr;
                  pozorovanie.roje[pozorovanie.RojPocet].ImoCod:=udaj.ImoCod;
                  pozorovanie.roje[pozorovanie.RojPocet].znak:=roje.Cells[1,roje.RowCount-1];

                  roje.Cells[2,roje.RowCount-1]:= pozorovanie.roje[pozorovanie.RojPocet].rec + '�   ' +
                                                  pozorovanie.roje[pozorovanie.RojPocet].dec + '�   ' +
                                                  udaj.vel + 'km/s      ' +
                                                  udaj.zhr + '         ' +
                                                  udaj.ImoCod;
                end;
              inc(I);
            end;
            closefile(showers);
          end
        else
          showmessage('Too many entries');
      Eznak.text:='';
      BoxRoj.ItemIndex:=-1;
      end;
end;

procedure TOknoHlavicky.Zmavetko1Click(Sender: TObject);
begin
{zmaze celu tabulku rojov}
if MessageDlg  ('Erase all data?',mtConfirmation,[mbYes, mbNo], 0)=mrYes
then
  begin
    pozorovanie.RojPocet:=0;
    roje.ClearRows;
  end;
end;

procedure TOknoHlavicky.Zmazvsetko1Click(Sender: TObject);
begin
if MessageDlg  ('Erase all data?',mtConfirmation,[mbYes, mbNo], 0)=mrYes
then
  begin
  {zmaze celu tabulku pozorovatelov}
    pozorovanie.PozPocet:=0;
    pozorovatelia.ClearRows;
  end;
end;

procedure TOknoHlavicky.PozorovateliaEditAccept(Sender: TObject; ACol,
  ARow: Integer; Value: WideString; var Accept: Boolean);
begin
{editacia tabulky pozorovatelov}
  case ACol of
  1: pozorovanie.pozorovatel[ARow+1].IMOcislo:=value;
  2: pozorovanie.pozorovatel[ARow+1].Imokod:=Value;
  3: pozorovanie.pozorovatel[ARow+1].meno:=Value;
  4: pozorovanie.pozorovatel[ARow+1].priezvisko:=Value;
  end;
  Saved:=false;
  pozorovanie.tested:=false;
end;

procedure TOknoHlavicky.RojeEditAccept(Sender: TObject; ACol,
  ARow: Integer; Value: WideString; var Accept: Boolean);
begin
  {editovanie suborov po dvojkliku}
  pozorovanie.roje[ARow+1].znak:=value;
  saved:=false;
  pozorovanie.tested:=false;
end;

procedure TOknoHlavicky.EZaciatokHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.EZaciatokMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.EKoniecHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.EKoniecMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.EDlzkaHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.EDlzkaMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.EDlzkaS1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.ESirkaHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.ESirkaMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.ESirkaS1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.EditVyskaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.EditIMOKodKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoHlavicky.ComboBox1Change(Sender: TObject);
begin
  Saved:=false;
  pozorovanie.tested:=false;
  pozorovanie.miesto.DlzkaP:=EDlzkaP.text;
end;

procedure TOknoHlavicky.EIMOkodZapisovatelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

procedure TOknoHlavicky.EMenoZapisovatelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

procedure TOknoHlavicky.EPriezviskoZapisovatelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

procedure TOknoHlavicky.EditMiestoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

procedure TOknoHlavicky.EditStatKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

end.

