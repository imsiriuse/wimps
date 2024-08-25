unit Unit_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls,Unit_about, Unit_Tabulka,Unit_help, Unit_Hlavicka, Unit_Nastavenia,
  Unit_Statistika, Unit_DataTest, Globalne_Premenne, NxStdCtrls,Unit_Intervaly,
  ComCtrls, ToolWin, ImgList, DateUtils;


type
  TMain = class(TForm)
    MainMenu: TMainMenu;
    Subor: TMenuItem;
    Otvor: TMenuItem;
    Ulozit: TMenuItem;
    UlozitAko: TMenuItem;
    N1: TMenuItem;
    Import: TMenuItem;
    IMO: TMenuItem;
    N2: TMenuItem;
    Koniec: TMenuItem;
    Udaje: TMenuItem;
    Hlavicka: TMenuItem;
    OtvorMeteory: TMenuItem;
    Nastroje: TMenuItem;
    Test: TMenuItem;
    Statistika: TMenuItem;
    Nastavenia: TMenuItem;
    Pomoc: TMenuItem;
    Obsah: TMenuItem;
    Copyright: TMenuItem;
    Novy: TMenuItem;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    Intervaly: TMenuItem;
    ToolBar1: TToolBar;
    TBtNew: TToolButton;
    ToolButton2: TToolButton;
    TBtOpen: TToolButton;
    TBtSave: TToolButton;
    ToolButton5: TToolButton;
    TBtSaveAs: TToolButton;
    TBtHlavicka: TToolButton;
    TBtIntervaly: TToolButton;
    TBtMeteory: TToolButton;
    TBtTest: TToolButton;
    TBtPreferences: TToolButton;
    ToolButton13: TToolButton;
    ImageList1: TImageList;
    TBtStatistika: TToolButton;
    ToolButton1: TToolButton;
    MetOpenDialog: TOpenDialog;
    Tlac: TMenuItem;
    HTML1: TMenuItem;
    XT1: TMenuItem;
    TXTSaveDialog: TSaveDialog;
    HTMLSaveDialog: TSaveDialog;
    HTMLInput: TMenuItem;
    TXTInput: TMenuItem;
    HTMLOutput: TMenuItem;
    TXTOutput: TMenuItem;
    IMOprotocol1: TMenuItem;
    IMOprotocol2: TMenuItem;
    procedure NovyClick(Sender: TObject);
    procedure OtvorClick(Sender: TObject);
    procedure UlozitAkoClick(Sender: TObject);
    procedure UlozitClick(Sender: TObject);
    procedure OtvorMeteoryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KoniecClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HlavickaClick(Sender: TObject);
    procedure NastaveniaClick(Sender: TObject);
    procedure StatistikaClick(Sender: TObject);
    procedure TestClick(Sender: TObject);
    procedure IntervalyClick(Sender: TObject);
    procedure TBtNewClick(Sender: TObject);
    procedure TBtOpenClick(Sender: TObject);
    procedure TBtSaveClick(Sender: TObject);
    procedure TBtSaveAsClick(Sender: TObject);
    procedure TBtHlavickaClick(Sender: TObject);
    procedure TBtIntervalyClick(Sender: TObject);
    procedure TBtMeteoryClick(Sender: TObject);
    procedure TBtTestClick(Sender: TObject);
    procedure TBtPreferencesClick(Sender: TObject);
    procedure TBtStatistikaClick(Sender: TObject);
    procedure IMOClick(Sender: TObject);
    procedure HTMLInputClick(Sender: TObject);
    procedure TXTInputClick(Sender: TObject);
    procedure TXTOutputClick(Sender: TObject);
    procedure HTMLOutputClick(Sender: TObject);
    procedure IMOprotocol2Click(Sender: TObject);
    procedure IMOprotocol1Click(Sender: TObject);
    procedure ObsahClick(Sender: TObject);
    procedure CopyrightClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
  end;
Const
 Version = '1.30';
 MenoProgramu='WIMPS';
var
  Main:       TMain;
  FilePath:   String;
  FileOnDisk: Boolean;
implementation
{$R *.dfm}
{$R 'WindowsXP.RES'}
{$R 'FileIcon.RES'}

procedure TMain.NovyClick(Sender: TObject);
begin
{ak je ulozeny}
if Saved=true then
  begin
    FillChar(Pozorovanie, sizeOf(TPozorovanie), 0);
    Pozorovanie.TypSuboru:='1';
    Main.Caption:='No name' + ' - ' + MenoProgramu + ' ' + Version;
    Saved:=true;
    FileOnDisk:=false;
    pozorovanie.Tabulka:=TStringList.Create;
end
{ak nieje ulozeny}
else
  Case
  MessageDlg('File was changed, save?',
    mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
  mrYes:
    begin
      UlozitClick(Main);
      NovyClick(Main);
    end;
  mrNo:
    Begin
      Saved:=true;
      NovyClick(Main);
    end;
  end;
end;

procedure TMain.OtvorClick(Sender: TObject);
var
  Subor: TFileStream;
  I,J,K:integer;
begin
{ak je ulozeny}
if Saved=true then
begin
{Otvori sa novy subor}
  if OpenDialog.Execute then
  begin
    {priradi sa cesta k suboru}
    FilePath:=OpenDialog.FileName;
    Subor:= TFileStream.Create(FilePath, fmOpenRead);
  try
    {vynuluje premennu pozorovanie}
    FillChar(Pozorovanie, sizeOf(TPozorovanie), 0);
    pozorovanie.Tabulka:=TStringList.Create;
    {Precita zaznamy v subore}
    subor.Read(pozorovanie.typsuboru, 2);
    subor.read(pozorovanie.tested, 1);
    subor.Read(pozorovanie.datum,13);
    subor.Read(pozorovanie.ZaciatokH, 3);
    subor.Read(pozorovanie.ZaciatokM, 3);
    subor.Read(pozorovanie.KoniecH, 3);
    subor.Read(pozorovanie.KoniecM, 3);
    subor.Read(pozorovanie.miesto.DlzkaP ,2 );
    subor.Read(pozorovanie.miesto.DlzkaH ,4 );
    subor.Read(pozorovanie.miesto.DlzkaM ,3 );
    subor.Read(pozorovanie.miesto.DlzkaS ,3 );
    subor.Read(pozorovanie.miesto.SirkaP ,2 );
    subor.Read(pozorovanie.miesto.SirkaM ,3 );
    subor.Read(pozorovanie.miesto.SirkaH ,3 );
    subor.Read(pozorovanie.miesto.SirkaS ,3 );
    subor.Read(pozorovanie.miesto.Vyska ,5 );
    subor.Read(pozorovanie.miesto.Meno ,21 );
    subor.Read(pozorovanie.miesto.Stat ,21 );
    subor.Read(pozorovanie.miesto.IMOkod ,6 );
    subor.Read(pozorovanie.zapisovatel.ImoKod, 6);
    subor.Read(pozorovanie.zapisovatel.meno, 13);
    subor.Read(pozorovanie.zapisovatel.priezvisko, 16);
    subor.Read(pozorovanie.pozpocet, 4 );
    for I:=1 to pozorovanie.pozPocet do
      begin
        subor.Read(pozorovanie.pozorovatel[I].IMOCislo, 6);
        subor.read(pozorovanie.pozorovatel[I].ImoKod, 6 );
        subor.read(pozorovanie.pozorovatel[I].meno, 13 );
        subor.read(pozorovanie.pozorovatel[I].priezvisko, 16 );
      end;
    subor.Read(pozorovanie.rojpocet, 4 );
    for I:=1 to pozorovanie.rojPocet do
      begin
        subor.read(pozorovanie.roje[I].meno, 21);
        subor.read(pozorovanie.roje[I].zac, 6);
        subor.read(pozorovanie.roje[I].kon, 6);
        subor.read(pozorovanie.roje[I].max, 5);
        subor.read(pozorovanie.roje[I].rec, 4);
        subor.read(pozorovanie.roje[I].dec, 4);
        subor.read(pozorovanie.roje[I].da, 4);
        subor.read(pozorovanie.roje[I].dd, 4);
        subor.read(pozorovanie.roje[I].vel, 3);
        subor.read(pozorovanie.roje[I].f, 4);
        subor.read(pozorovanie.roje[I].zhr, 4);
        subor.read(pozorovanie.roje[I].ImoCod, 4);
        subor.read(pozorovanie.roje[I].znak, 2);
      end;
        subor.Read(pozorovanie.IntPocet, 4 );
    for I:=1 to pozorovanie.IntPocet do
      begin
        subor.Read(pozorovanie.intervaly[I].ZacH, 3);
        subor.Read(pozorovanie.intervaly[I].ZacM, 3);
        subor.Read(pozorovanie.intervaly[I].KonH, 3);
        subor.Read(pozorovanie.intervaly[I].KonM, 3);
        subor.Read(pozorovanie.intervaly[I].PozPocet, 4);
        for J:=1 to pozorovanie.intervaly[I].PozPocet do
          begin
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].StredRec, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].StredDec, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].cislo, 3);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].stred, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].CldPocet, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].LimPocet, 4);
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet do
              begin
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].zacH, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM, 3);
              end;
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
              begin
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].zacH, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonH, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].percenta, 4);
              end;
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
              begin
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hod, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].min, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].trojuholnik, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hviezdy, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].limitka, 4);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].dec, 4);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].rec, 4);
              end;
          end;
      end;
    pozorovanie.tabulka.LoadFromStream(subor);
    {N�zov na okne}
    Main.Caption:=ExtractFileName(FilePath) + ' - ' + MenoProgramu + ' ' + version;
    FileOnDisk:=true;
    {Nastavy hodnotu na ulozene}
    Saved:=true;
    {Zatvori subor}
    subor.Free;
    {Vinimkovy blok}
  except
    on E:EInOutError do
    begin
      case E.ErrorCode of
        2: ShowMessage('File not found');
        4: ShowMessage('Too many opened files');
        5: ShowMessage('Acess diened');
      100: ShowMessage('Empty file');
      else
        ShowMessage('File error' + E.Message);
      end;
    Subor.Free;
    end;
  end;
  end;
end
else
{ak nieje ulozeny}
  Case
  MessageDlg('File was changed, save?',
    mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
  mrYes:
    Begin
      UlozitClick(Main);
      OtvorClick(Main);
    end;
  mrNo:
    Begin
      Saved:=true;
      OtvorClick(Main);
      end;
  end;
end;

procedure TMain.UlozitAkoClick(Sender: TObject);
Var
  Subor: TFileStream;
  I,J,K: integer;
begin
{Zisti cestu k suboru}
if SaveDialog.Execute then
  begin
    {Priradi cestu k suboru}
    FilePath:=SaveDialog.FileName;
    Subor:=TFileStream.Create(FilePath, fmCreate);
  try
    {Ulozit}
    subor.Write(pozorovanie.typsuboru, 2);
    subor.Write(pozorovanie.tested, 1);
    subor.Write(pozorovanie.datum, 13);
    subor.Write(pozorovanie.ZaciatokH, 3);
    subor.Write(pozorovanie.ZaciatokM, 3);
    subor.Write(pozorovanie.KoniecH, 3);
    subor.Write(pozorovanie.KoniecM, 3);
    subor.Write(pozorovanie.miesto.DlzkaP ,2 );
    subor.Write(pozorovanie.miesto.DlzkaH ,4 );
    subor.Write(pozorovanie.miesto.DlzkaM ,3 );
    subor.Write(pozorovanie.miesto.DlzkaS ,3 );
    subor.Write(pozorovanie.miesto.SirkaP ,2 );
    subor.Write(pozorovanie.miesto.SirkaM ,3 );
    subor.Write(pozorovanie.miesto.SirkaH ,3 );
    subor.Write(pozorovanie.miesto.SirkaS ,3 );
    subor.Write(pozorovanie.miesto.Vyska ,5 );
    subor.Write(pozorovanie.miesto.Meno ,21 );
    subor.Write(pozorovanie.miesto.Stat ,21 );
    subor.Write(pozorovanie.miesto.IMOkod ,6 );
    subor.Write(pozorovanie.zapisovatel.ImoKod, 6);
    subor.Write(pozorovanie.zapisovatel.meno, 13);
    subor.Write(pozorovanie.zapisovatel.priezvisko, 16);
    subor.Write(pozorovanie.pozpocet, 4 );
    for I:=1 to pozorovanie.pozPocet do
      begin
        subor.Write(pozorovanie.pozorovatel[I].IMOCislo, 6);
        subor.Write(pozorovanie.pozorovatel[I].ImoKod, 6 );
        subor.Write(pozorovanie.pozorovatel[I].meno, 13 );
        subor.Write(pozorovanie.pozorovatel[I].priezvisko, 16 );
      end;
    subor.Write(pozorovanie.rojpocet, 4 );
    for I:=1 to pozorovanie.rojPocet do
      begin
        subor.Write(pozorovanie.roje[I].meno, 21);
        subor.Write(pozorovanie.roje[I].zac, 6);
        subor.Write(pozorovanie.roje[I].kon, 6);
        subor.Write(pozorovanie.roje[I].max, 5);
        subor.Write(pozorovanie.roje[I].rec, 4);
        subor.Write(pozorovanie.roje[I].dec, 4);
        subor.Write(pozorovanie.roje[I].da, 4);
        subor.Write(pozorovanie.roje[I].dd, 4);
        subor.Write(pozorovanie.roje[I].vel, 3);
        subor.Write(pozorovanie.roje[I].f, 4);
        subor.Write(pozorovanie.roje[I].zhr, 4);
        subor.Write(pozorovanie.roje[I].ImoCod, 4);
        subor.Write(pozorovanie.roje[I].znak, 2);
      end;
    subor.Write(pozorovanie.IntPocet, 4 );
    for I:=1 to pozorovanie.IntPocet do
      begin
        subor.Write(pozorovanie.intervaly[I].ZacH, 3);
        subor.Write(pozorovanie.intervaly[I].ZacM, 3);
        subor.Write(pozorovanie.intervaly[I].KonH, 3);
        subor.Write(pozorovanie.intervaly[I].KonM, 3);
        subor.Write(pozorovanie.intervaly[I].PozPocet, 4);
        for J:=1 to pozorovanie.intervaly[I].PozPocet do
          begin
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].StredRec, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].StredDec, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].cislo, 3);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].stred, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].CldPocet, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].LimPocet, 4);
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet do
              begin
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].zacH, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM, 3);
              end;
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
              begin
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].zacH, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonH, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].percenta, 4);
              end;
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
              begin
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hod, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].min, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].trojuholnik, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hviezdy, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].limitka, 4);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].dec, 4);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].rec, 4);
              end;
          end;
      end;
    pozorovanie.tabulka.SaveToStream(subor);
    {nazov hore na programe}
    Main.Caption:=ExtractFileName(FilePath) + ' - ' + MenoProgramu + ' ' + version;
    {Nastavy hodnotu na ulozene}
    Saved:=true;
    FileOnDisk:=True;
  Finally
    {zatvori subor}
    Subor.Free;
    end;
  end;
end;

procedure TMain.UlozitClick(Sender: TObject);
Var
  Subor: TFileStream;
  I,J,K:integer;
begin
if FileOnDisk=true
  then
begin
  try
    {Priradi cestu k suboru, ktora je uz urcena predtym}
    Subor:=TFileStream.Create(FilePath, FmCreate);
    {Ulozi subor}
    subor.Write(pozorovanie.typsuboru, 2);
    subor.Write(pozorovanie.tested, 1);
    subor.Write(pozorovanie.datum, 13);
    subor.Write(pozorovanie.ZaciatokH, 3);
    subor.Write(pozorovanie.ZaciatokM, 3);
    subor.Write(pozorovanie.KoniecH, 3);
    subor.Write(pozorovanie.KoniecM, 3);
    subor.Write(pozorovanie.miesto.DlzkaP ,2 );
    subor.Write(pozorovanie.miesto.DlzkaH ,4 );
    subor.Write(pozorovanie.miesto.DlzkaM ,3 );
    subor.Write(pozorovanie.miesto.DlzkaS ,3 );
    subor.Write(pozorovanie.miesto.SirkaP ,2 );
    subor.Write(pozorovanie.miesto.SirkaM ,3 );
    subor.Write(pozorovanie.miesto.SirkaH ,3 );
    subor.Write(pozorovanie.miesto.SirkaS ,3 );
    subor.Write(pozorovanie.miesto.Vyska ,5 );
    subor.Write(pozorovanie.miesto.Meno ,21 );
    subor.Write(pozorovanie.miesto.Stat ,21 );
    subor.Write(pozorovanie.miesto.IMOkod ,6 );
    subor.Write(pozorovanie.zapisovatel.ImoKod, 6);
    subor.Write(pozorovanie.zapisovatel.meno, 13);
    subor.Write(pozorovanie.zapisovatel.priezvisko, 16);
    subor.Write(pozorovanie.pozpocet, 4 );
    for I:=1 to pozorovanie.pozPocet do
      begin
        subor.Write(pozorovanie.pozorovatel[I].IMOCislo, 6);
        subor.Write(pozorovanie.pozorovatel[I].ImoKod, 6 );
        subor.Write(pozorovanie.pozorovatel[I].meno, 13 );
        subor.Write(pozorovanie.pozorovatel[I].priezvisko, 16 );
      end;
    subor.Write(pozorovanie.rojpocet, 4 );
    for I:=1 to pozorovanie.rojPocet do
      begin
        subor.Write(pozorovanie.roje[I].meno, 21);
        subor.Write(pozorovanie.roje[I].zac, 6);
        subor.Write(pozorovanie.roje[I].kon, 6);
        subor.Write(pozorovanie.roje[I].max, 5);
        subor.Write(pozorovanie.roje[I].rec, 4);
        subor.Write(pozorovanie.roje[I].dec, 4);
        subor.Write(pozorovanie.roje[I].da, 4);
        subor.Write(pozorovanie.roje[I].dd, 4);
        subor.Write(pozorovanie.roje[I].vel, 3);
        subor.Write(pozorovanie.roje[I].f, 4);
        subor.Write(pozorovanie.roje[I].zhr, 4);
        subor.Write(pozorovanie.roje[I].ImoCod, 4);
        subor.Write(pozorovanie.roje[I].znak, 2);
      end;
    subor.Write(pozorovanie.IntPocet, 4 );
    for I:=1 to pozorovanie.IntPocet do
      begin
        subor.Write(pozorovanie.intervaly[I].ZacH, 3);
        subor.Write(pozorovanie.intervaly[I].ZacM, 3);
        subor.Write(pozorovanie.intervaly[I].KonH, 3);
        subor.Write(pozorovanie.intervaly[I].KonM, 3);
        subor.Write(pozorovanie.intervaly[I].PozPocet, 4);
        for J:=1 to pozorovanie.intervaly[I].PozPocet do
          begin
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].StredRec, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].StredDec, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].cislo, 3);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].stred, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].CldPocet, 4);
            subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].LimPocet, 4);
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet do
              begin
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].zacH, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM, 3);
              end;
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
              begin
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].zacH, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonH, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].percenta, 4);
              end;
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
              begin
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hod, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].min, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].trojuholnik, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hviezdy, 3);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].limitka, 4);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].dec, 4);
                subor.Write(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].rec, 4);
              end;
          end;
      end;
    pozorovanie.tabulka.SaveToStream(subor);
    {Nastavy hodnotu na ulozene}
    Saved:=true
  Finally
    {zatvori subor}
    Subor.Free;
  end;
end
  else
    UlozitAkoClick(Main);
end;

procedure TMain.OtvorMeteoryClick(Sender: TObject);
begin           
  If TabulkaOpened = false
  then
    begin
      OknoProtokolu:=TOknoProtokolu.Create(Application);
      TabulkaOpened:=true;
    end
      else
        OknoProtokolu.BringToFront;

end;

procedure TMain.FormCreate(Sender: TObject);
var
  Subor: TFileStream;
  I,J,K:integer;
  sites: file of TMiesto;
  Site: TMiesto;
  observers: file of Tpozorovatel;
  showers: file of Troj;
  shower: TRoj;
  preferences: file of TPref;
  limitky: File of TLimits;
  Limit: TLimits;
begin
  Main.Caption:=Main.Caption + ' - ' + MenoProgramu + ' ' + version;
  {vytvori zoznam meteorov}
  pozorovanie.Tabulka:=TStringList.Create;
  pref.rojovost:='-';
  FileOnDisk:=False;
  {kontrola potrebnych databaz, ak sa nenachadzaju, vytvoria sa}
  if not FileExists(extractfilepath(application.ExeName) + 'sites.dat') then
    begin
      assignFile(sites,extractfilepath(application.ExeName) +  'sites.dat');
      rewrite(sites);

site.ImoKod:='23505';
site.meno:='Sibenicky Vrch';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='37';
site.dlzkaS:='12';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='51';
site.sirkaS:='36';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23507';
site.meno:='Vlasim';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='52';
site.dlzkaS:='48';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='42';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23508';
site.meno:='Upice';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='00';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='30';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23510';
site.meno:='Jizerka';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='25';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='50';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23601';
site.meno:='Rokycany';
site.stat:='Czech Republic';
site.dlzkaH:='013';
site.DlzkaM:='35';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='44';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23602';
site.meno:='Znojmo';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='03';
site.dlzkaS:='28';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='50';
site.sirkaS:='04';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23603';
site.meno:='Pistin';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='34';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='04';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23604';
site.meno:='Kladno';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='06';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='09';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23605';
site.meno:='Chouzava';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='13';
site.dlzkaS:='28';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='50';
site.sirkaS:='07';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23606';
site.meno:='Valasska Polanka';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='59';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='14';
site.sirkaS:='30';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23607';
site.meno:='Losina-Skalky';
site.stat:='Czech Republic';
site.dlzkaH:='013';
site.DlzkaM:='28';
site.dlzkaS:='12';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='39';
site.sirkaS:='36';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23608';
site.meno:='Hradec Kralove';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='50';
site.dlzkaS:='21';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='10';
site.sirkaS:='38';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23609';
site.meno:='Ondrejov';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='47';
site.dlzkaS:='01';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='54';
site.sirkaS:='38';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23610';
site.meno:='Plzen-Hurka';
site.stat:='Czech Republic';
site.dlzkaH:='013';
site.DlzkaM:='21';
site.dlzkaS:='37';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='42';
site.sirkaS:='20';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23611';
site.meno:='Lelekovice';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='39';
site.dlzkaS:='18';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='21';
site.sirkaS:='15';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23612';
site.meno:='Vsetin';
site.stat:='Czech Republic';
site.dlzkaH:='018';
site.DlzkaM:='01';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='21';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23613';
site.meno:='Ceske Budejovice';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='27';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='58';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23614';
site.meno:='Rychtarov';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='12';
site.dlzkaS:='42';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='54';
site.sirkaS:='35';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23615';
site.meno:='Praha-Vavrouska';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='26';
site.dlzkaS:='06';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='07';
site.sirkaS:='36';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23616';
site.meno:='Alber';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='10';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='02';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23617';
site.meno:='Podmokly';
site.stat:='Czech Republic';
site.dlzkaH:='013';
site.DlzkaM:='10';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='52';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23618';
site.meno:='Valasske Mezrici';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='58';
site.dlzkaS:='34';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='27';
site.sirkaS:='48';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23619';
site.meno:='Morina';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='11';
site.dlzkaS:='18';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='57';
site.sirkaS:='17';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23620';
site.meno:='Praha-Opatov';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='30';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='10';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23621';
site.meno:='Kamenec';
site.stat:='Czech Republic';
site.dlzkaH:='014';
site.DlzkaM:='40';
site.dlzkaS:='04';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='35';
site.sirkaS:='08';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23622';
site.meno:='Hranicne Petrovice';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='24';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='44';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23623';
site.meno:='Roztoky U Krivoklatu';
site.stat:='Czech Republic';
site.dlzkaH:='013';
site.DlzkaM:='53';
site.dlzkaS:='04';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='00';
site.sirkaS:='19';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23624';
site.meno:='Milire U Rozvadova';
site.stat:='Czech Republic';
site.dlzkaH:='012';
site.DlzkaM:='37';
site.dlzkaS:='26';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='39';
site.sirkaS:='53';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23625';
site.meno:='Kladruby';
site.stat:='Czech Republic';
site.dlzkaH:='012';
site.DlzkaM:='59';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='44';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23626';
site.meno:='Ostrava-Polanka';
site.stat:='Czech Republic';
site.dlzkaH:='018';
site.DlzkaM:='09';
site.dlzkaS:='21';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='47';
site.sirkaS:='21';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23627';
site.meno:='Cerncin';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='13';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='14';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23628';
site.meno:='Podhradi';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='40';
site.dlzkaS:='50';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='53';
site.sirkaS:='50';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23629';
site.meno:='Kozlany';
site.stat:='Czech Republic';
site.dlzkaH:='013';
site.DlzkaM:='32';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='59';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23630';
site.meno:='Stritez Nad Becvou';
site.stat:='Czech Republic';
site.dlzkaH:='018';
site.DlzkaM:='04';
site.dlzkaS:='06';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='26';
site.sirkaS:='07';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23631';
site.meno:='Stary Hroznatov';
site.stat:='Czech Republic';
site.dlzkaH:='012';
site.DlzkaM:='23';
site.dlzkaS:='39';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='01';
site.sirkaS:='33';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23633';
site.meno:='Hostinece';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='50';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='10';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23634';
site.meno:='Hluboky Dul';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='17';
site.dlzkaS:='45';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='04';
site.sirkaS:='26';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23635';
site.meno:='Ludgerovice';
site.stat:='Czech Republic';
site.dlzkaH:='018';
site.DlzkaM:='15';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='53';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23636';
site.meno:='Holesov';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='39';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='15';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23637';
site.meno:='Hostice';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='13';
site.dlzkaS:='44';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='12';
site.sirkaS:='25';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23638';
site.meno:='Kromeriz';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='23';
site.dlzkaS:='46';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='18';
site.sirkaS:='14';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23639';
site.meno:='Zdanice';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='02';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='04';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23640';
site.meno:='Karvina-Raj';
site.stat:='Czech Republic';
site.dlzkaH:='018';
site.DlzkaM:='29';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='50';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23641';
site.meno:='Brno';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='31';
site.dlzkaS:='01';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='13';
site.sirkaS:='44';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23642';
site.meno:='Rohovladova Bela';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='36';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='07';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23643';
site.meno:='Dobra Nad Sazavou';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='24';
site.dlzkaS:='45';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='40';
site.sirkaS:='16';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23644';
site.meno:='Nove Dvory';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='31';
site.dlzkaS:='57';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='38';
site.sirkaS:='39';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23645';
site.meno:='Pasohlavky';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='34';
site.dlzkaS:='56';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='54';
site.sirkaS:='07';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23646';
site.meno:='Hartinkov';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='50';
site.dlzkaS:='25';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='42';
site.sirkaS:='59';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23647';
site.meno:='Strkov';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='50';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='50';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23648';
site.meno:='Jesenik';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='12';
site.dlzkaS:='02';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='13';
site.sirkaS:='52';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23649';
site.meno:='Lipnik Nad Becvou';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='36';
site.dlzkaS:='32';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='32';
site.sirkaS:='07';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23650';
site.meno:='Churanov';
site.stat:='Czech Republic';
site.dlzkaH:='013';
site.DlzkaM:='36';
site.dlzkaS:='55';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='04';
site.sirkaS:='05';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23659';
site.meno:='Plumlov';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='01';
site.dlzkaS:='30';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='28';
site.sirkaS:='08';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23660';
site.meno:='Dubnany';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='06';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='55';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);

site.ImoKod:='23669';
site.meno:='Ostrozka Nova Ves';
site.stat:='Czech Republic';
site.dlzkaH:='017';
site.DlzkaM:='26';
site.dlzkaS:='11';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='59';
site.sirkaS:='47';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23670';
site.meno:='Lohenice';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='17';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='35';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23680';
site.meno:='Dolni Bousov';
site.stat:='Czech Republic';
site.dlzkaH:='015';
site.DlzkaM:='08';
site.dlzkaS:='30';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='25';
site.sirkaS:='59';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23689';
site.meno:='Elbe';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='44';
site.dlzkaS:='33';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='02';
site.sirkaS:='52';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23690';
site.meno:='Ostra';
site.stat:='Czech Republic';
site.dlzkaH:='018';
site.DlzkaM:='23';
site.dlzkaS:='54';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='33';
site.sirkaS:='35';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23699';
site.meno:='Serlich';
site.stat:='Czech Republic';
site.dlzkaH:='016';
site.DlzkaM:='23';
site.dlzkaS:='35';
site.dlzkaP:='E';
site.sirkaH:='50';
site.sirkaM:='19';
site.sirkaS:='18';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23702';
site.meno:='Modrany';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='26';
site.dlzkaS:='08';
site.dlzkaP:='E';
site.sirkaH:='47';
site.sirkaM:='49';
site.sirkaS:='31';
site.sirkaP:='N';
site.vyska:='0105';
write(sites, site);
 
site.ImoKod:='23703';
site.meno:='Sobotiste';
site.stat:='Slovakia';
site.dlzkaH:='017';
site.DlzkaM:='24';
site.dlzkaS:='35';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='43';
site.sirkaS:='59';
site.sirkaP:='N';
site.vyska:='0240';
write(sites, site);
 
site.ImoKod:='23704';
site.meno:='Dubakovo';
site.stat:='Slovakia';
site.dlzkaH:='019';
site.DlzkaM:='44';
site.dlzkaS:='30';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='32';
site.sirkaS:='30';
site.sirkaP:='N';
site.vyska:='0992';
write(sites, site);
 
site.ImoKod:='23705';
site.meno:='Ontopa Pri Komarne';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='00';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='00';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0100';
write(sites, site);
 
site.ImoKod:='23706';
site.meno:='Ap Kolonica';
site.stat:='Slovakia';
site.dlzkaH:='022';
site.DlzkaM:='16';
site.dlzkaS:='38';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='56';
site.sirkaS:='07';
site.sirkaP:='N';
site.vyska:='0460';
write(sites, site);
 
site.ImoKod:='23707';
site.meno:='Uhliska';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='44';
site.dlzkaS:='50';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='23';
site.sirkaS:='50';
site.sirkaP:='N';
site.vyska:='0700';
write(sites, site);
 
site.ImoKod:='23708';
site.meno:='Kopanky';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='13';
site.dlzkaS:='40';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='04';
site.sirkaS:='32';
site.sirkaP:='N';
site.vyska:='0397';
write(sites, site);
 
site.ImoKod:='23709';
site.meno:='Hurbanovo';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='11';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='47';
site.sirkaM:='53';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0100';
write(sites, site);
 
site.ImoKod:='23710';
site.meno:='Kojsovska Hola';
site.stat:='Slovakia';
site.dlzkaH:='020';
site.DlzkaM:='59';
site.dlzkaS:='39';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='47';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23711';
site.meno:='Trencin';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='03';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='53';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23712';
site.meno:='Partizanske';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='20';
site.dlzkaS:='25';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='37';
site.sirkaS:='42';
site.sirkaP:='N';
site.vyska:='0200';
write(sites, site);
 
site.ImoKod:='23713';
site.meno:='Cadca Milosova';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='43';
site.dlzkaS:='41';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='28';
site.sirkaS:='38';
site.sirkaP:='N';
site.vyska:='0500';
write(sites, site);
 
site.ImoKod:='23714';
site.meno:='Nove Mesto Nad Vahom';
site.stat:='Slovakia';
site.dlzkaH:='017';
site.DlzkaM:='50';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='45';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23715';
site.meno:='Kysucke Nove Mesto';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='46';
site.dlzkaS:='01';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='18';
site.sirkaS:='29';
site.sirkaP:='N';
site.vyska:='0450';
write(sites, site);
 
site.ImoKod:='23716';
site.meno:='Sastin-Straze';
site.stat:='Slovakia';
site.dlzkaH:='017';
site.DlzkaM:='08';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='38';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0180';
write(sites, site);
 
site.ImoKod:='23717';
site.meno:='Prievidza';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='37';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='40';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0280';
write(sites, site);
 
site.ImoKod:='23718';
site.meno:='Pohronska Polhora';
site.stat:='Slovakia';
site.dlzkaH:='019';
site.DlzkaM:='49';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='46';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0900';
write(sites, site);
 
site.ImoKod:='23719';
site.meno:='Podbiel';
site.stat:='Slovakia';
site.dlzkaH:='019';
site.DlzkaM:='28';
site.dlzkaS:='08';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='18';
site.sirkaS:='15';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23720';
site.meno:='Svetlice';
site.stat:='Slovakia';
site.dlzkaH:='022';
site.DlzkaM:='00';
site.dlzkaS:='18';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='10';
site.sirkaS:='40';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23721';
site.meno:='Detva';
site.stat:='Slovakia';
site.dlzkaH:='019';
site.DlzkaM:='25';
site.dlzkaS:='25';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='33';
site.sirkaS:='37';
site.sirkaP:='N';
site.vyska:='0410';
write(sites, site);
 
site.ImoKod:='23722';
site.meno:='Horna Marikova';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='17';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='17';
site.sirkaS:='30';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23723';
site.meno:='Roztoky';
site.stat:='Slovakia';
site.dlzkaH:='021';
site.DlzkaM:='30';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='22';
site.sirkaS:='48';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);

site.ImoKod:='23724';
site.meno:='Ziar Nad Hronom';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='51';
site.dlzkaS:='44';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='25';
site.sirkaS:='07';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23725';
site.meno:='Dolna Breznica';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='30';
site.dlzkaS:='40';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='04';
site.sirkaS:='32';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23726';
site.meno:='Hostina';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='20';
site.dlzkaS:='29';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='10';
site.sirkaS:='33';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23727';
site.meno:='Trebisov';
site.stat:='Slovakia';
site.dlzkaH:='021';
site.DlzkaM:='45';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='40';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23728';
site.meno:='Iza';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='14';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='47';
site.sirkaM:='45';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23730';
site.meno:='Kremenovo';
site.stat:='Slovakia';
site.dlzkaH:='019';
site.DlzkaM:='41';
site.dlzkaS:='30';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='36';
site.sirkaS:='55';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23731';
site.meno:='Kovacov';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='49';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='47';
site.sirkaM:='50';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23732';
site.meno:='Slovensky Grob';
site.stat:='Slovakia';
site.dlzkaH:='017';
site.DlzkaM:='15';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='15';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23733';
site.meno:='Sokol';
site.stat:='Slovakia';
site.dlzkaH:='021';
site.DlzkaM:='12';
site.dlzkaS:='47';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='48';
site.sirkaS:='28';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23734';
site.meno:='Poniky';
site.stat:='Slovakia';
site.dlzkaH:='019';
site.DlzkaM:='17';
site.dlzkaS:='47';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='52';
site.sirkaS:='39';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23735';
site.meno:='Kvp, Kosice';
site.stat:='Slovakia';
site.dlzkaH:='021';
site.DlzkaM:='12';
site.dlzkaS:='14';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='43';
site.sirkaS:='22';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23736';
site.meno:='Vrchtepla';
site.stat:='Slovakia';
site.dlzkaH:='018';
site.DlzkaM:='33';
site.dlzkaS:='41';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='07';
site.sirkaS:='51';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23737';
site.meno:='Velky Saris';
site.stat:='Slovakia';
site.dlzkaH:='021';
site.DlzkaM:='10';
site.dlzkaS:='25';
site.dlzkaP:='E';
site.sirkaH:='49';
site.sirkaM:='03';
site.sirkaS:='10';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23740';
site.meno:='Bellova Ves';
site.stat:='Slovakia';
site.dlzkaH:='017';
site.DlzkaM:='31';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='06';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23750';
site.meno:='Vysoka Nad Uhom';
site.stat:='Slovakia';
site.dlzkaH:='022';
site.DlzkaM:='06';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='57';
site.sirkaS:='59';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23760';
site.meno:='Riman';
site.stat:='Slovakia';
site.dlzkaH:='019';
site.DlzkaM:='16';
site.dlzkaS:='00';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='17';
site.sirkaS:='00';
site.sirkaP:='N';
site.vyska:='0000';
write(sites, site);
 
site.ImoKod:='23770';
site.meno:='Hlohovec';
site.stat:='Slovakia';
site.dlzkaH:='017';
site.DlzkaM:='47';
site.dlzkaS:='54';
site.dlzkaP:='E';
site.sirkaH:='48';
site.sirkaM:='25';
site.sirkaS:='11';
site.SirkaP:='N';
site.Vyska:='0000';
write(sites,site);

closefile(sites);
end;

  if not FileExists(extractfilepath(application.ExeName) + 'showers.dat') then
    begin
      assignFile(showers,extractfilepath(application.ExeName) +  'showers.dat');
      rewrite(showers);

        shower.meno  :='Antihelion source';
  shower.zac   :='11260';
  shower.kon   :='09241';
  shower.max   :='0417';
  shower.rec   :='216';
  shower.dec   :='-14';
  shower.da    :='0';
  shower.dd    :='0';
  shower.vel   :='25';
  shower.f     :='3.0';
  shower.zhr   :='003';
  shower.ImoCod:='ANT';
  write(showers,shower);

  shower.meno  :='Quadrantids';
  shower.zac   :='01010';
  shower.kon   :='01050';
  shower.max   :='0103';
  shower.rec   :='230';
  shower.dec   :='+49';
  shower.da    :='+08';
  shower.dd    :='-02';
  shower.vel   :='41';
  shower.f     :='2.1';
  shower.zhr   :='120';
  shower.ImoCod:='QUA';
  write(showers,shower);

  shower.meno  :='a-Centaurids';
  shower.zac   :='01280';
  shower.kon   :='02210';
  shower.max   :='0207';
  shower.rec   :='211';
  shower.dec   :='-59';
  shower.da    :='+08';
  shower.dd    :='-04';
  shower.vel   :='56';
  shower.f     :='2.0';
  shower.zhr   :='005';
  shower.ImoCod:='ACE';
  write(showers,shower);

  shower.meno  :='d-Leonids';
  shower.zac   :='02150';
  shower.kon   :='03100';
  shower.max   :='0225';
  shower.rec   :='168';
  shower.dec   :='+16';
  shower.da    :='+09';
  shower.dd    :='-03';
  shower.vel   :='23';
  shower.f     :='3.0';
  shower.zhr   :='002';
  shower.ImoCod:='DLE';
  write(showers,shower);

  shower.meno  :='g-Normids';
  shower.zac   :='02250';
  shower.kon   :='03220';
  shower.max   :='0313';
  shower.rec   :='239';
  shower.dec   :='-50';
  shower.da    :='+10';
  shower.dd    :='-01';
  shower.vel   :='56';
  shower.f     :='2.4';
  shower.zhr   :='004';
  shower.ImoCod:='GNO';
  write(showers,shower);

  shower.meno  :='Lyrids';
  shower.zac   :='04160';
  shower.kon   :='04250';
  shower.max   :='0422';
  shower.rec   :='271';
  shower.dec   :='+34';
  shower.da    :='+13';
  shower.dd    :='+09';
  shower.vel   :='49';
  shower.f     :='2.1';
  shower.zhr   :='018';
  shower.ImoCod:='LYR';
  write(showers,shower);

  shower.meno  :='p-Puppids';
  shower.zac   :='04150';
  shower.kon   :='04280';
  shower.max   :='0423';
  shower.rec   :='110';
  shower.dec   :='-45';
  shower.da    :='+03';
  shower.dd    :='-01';
  shower.vel   :='18';
  shower.f     :='2.0';
  shower.zhr   :='var';
  shower.ImoCod:='PPU';
  write(showers,shower);

  shower.meno  :='e-Aquarids';
  shower.zac   :='04190';
  shower.kon   :='05280';
  shower.max   :='0506';
  shower.rec   :='338';
  shower.dec   :='-01';
  shower.da    :='+09';
  shower.dd    :='+04';
  shower.vel   :='66';
  shower.f     :='2.4';
  shower.zhr   :='085';
  shower.ImoCod:='ETA';
  write(showers,shower);

  shower.meno  :='e-Lyrids';
  shower.zac   :='05030';
  shower.kon   :='05120';
  shower.max   :='0509';
  shower.rec   :='287';
  shower.dec   :='+44';
  shower.da    :='+10';
  shower.dd    :='+01';
  shower.vel   :='44';
  shower.f     :='3.0';
  shower.zhr   :='003';
  shower.ImoCod:='ELY';
  write(showers,shower);

  shower.meno  :='June Bootids';
  shower.zac   :='06220';
  shower.kon   :='07020';
  shower.max   :='0627';
  shower.rec   :='224';
  shower.dec   :='+48';
  shower.da    :='+04';
  shower.dd    :='-02';
  shower.vel   :='18';
  shower.f     :='2.2';
  shower.zhr   :='var';
  shower.ImoCod:='JBO';
  write(showers,shower);

  shower.meno  :='Piscis Ads';
  shower.zac   :='07150';
  shower.kon   :='08100';
  shower.max   :='0728';
  shower.rec   :='341';
  shower.dec   :='-30';
  shower.da    :='+10';
  shower.dd    :='+02';
  shower.vel   :='35';
  shower.f     :='3.2';
  shower.zhr   :='005';
  shower.ImoCod:='PAU';
  write(showers,shower);

  shower.meno  :='d-Aquarids S';
  shower.zac   :='07120';
  shower.kon   :='08190';
  shower.max   :='0728';
  shower.rec   :='339';
  shower.dec   :='-16';
  shower.da    :='+08';
  shower.dd    :='+02';
  shower.vel   :='41';
  shower.f     :='3.2';
  shower.zhr   :='020';
  shower.ImoCod:='SDA';
  write(showers,shower);

  shower.meno  :='a-Capricornids';
  shower.zac   :='07030';
  shower.kon   :='08150';
  shower.max   :='0730';
  shower.rec   :='307';
  shower.dec   :='-10';
  shower.da    :='+09';
  shower.dd    :='+03';
  shower.vel   :='23';
  shower.f     :='2.5';
  shower.zhr   :='004';
  shower.ImoCod:='CAP';
  write(showers,shower);

  shower.meno  :='Perseids';
  shower.zac   :='07170';
  shower.kon   :='08240';
  shower.max   :='0812';
  shower.rec   :='048';
  shower.dec   :='+58';
  shower.da    :='+17';
  shower.dd    :='+02';
  shower.vel   :='59';
  shower.f     :='2.6';
  shower.zhr   :='100';
  shower.ImoCod:='PER';
  write(showers,shower);

  shower.meno  :='k-Cygnids';
  shower.zac   :='08030';
  shower.kon   :='08250';
  shower.max   :='0817';
  shower.rec   :='286';
  shower.dec   :='+59';
  shower.da    :='+06';
  shower.dd    :='+01';
  shower.vel   :='25';
  shower.f     :='3.0';
  shower.zhr   :='003';
  shower.ImoCod:='KCG';
  write(showers,shower);

  shower.meno  :='a-Aurigids';
  shower.zac   :='08250';
  shower.kon   :='09080';
  shower.max   :='0801';
  shower.rec   :='084';
  shower.dec   :='+42';
  shower.da    :='+11';
  shower.dd    :='+00';
  shower.vel   :='66';
  shower.f     :='2.6';
  shower.zhr   :='007';
  shower.ImoCod:='AUR';
  write(showers,shower);

  shower.meno  :='Sept. Perseids';
  shower.zac   :='09050';
  shower.kon   :='09170';
  shower.max   :='0909';
  shower.rec   :='060';
  shower.dec   :='+47';
  shower.da    :='+10';
  shower.dd    :='+02';
  shower.vel   :='64';
  shower.f     :='2.9';
  shower.zhr   :='005';
  shower.ImoCod:='SPE';
  write(showers,shower);

  shower.meno  :='d-Aurigids';
  shower.zac   :='09180';
  shower.kon   :='10100';
  shower.max   :='0929';
  shower.rec   :='082';
  shower.dec   :='+49';
  shower.da    :='+10';
  shower.dd    :='+00';
  shower.vel   :='64';
  shower.f     :='2.9';
  shower.zhr   :='003';
  shower.ImoCod:='DAU';
  write(showers,shower);

  shower.meno  :='Draconids';
  shower.zac   :='10040';
  shower.kon   :='10140';
  shower.max   :='1008';
  shower.rec   :='262';
  shower.dec   :='+54';
  shower.da    :='+00';
  shower.dd    :='+00';
  shower.vel   :='20';
  shower.f     :='2.6';
  shower.zhr   :='var';
  shower.ImoCod:='GIA';
  write(showers,shower);

  shower.meno  :='e-Geminids';
  shower.zac   :='10140';
  shower.kon   :='10270';
  shower.max   :='1018';
  shower.rec   :='102';
  shower.dec   :='+27';
  shower.da    :='+08';
  shower.dd    :='+00';
  shower.vel   :='70';
  shower.f     :='3.0';
  shower.zhr   :='002';
  shower.ImoCod:='EGE';
  write(showers,shower);

  shower.meno  :='Orionids';
  shower.zac   :='10020';
  shower.kon   :='11070';
  shower.max   :='1021';
  shower.rec   :='095';
  shower.dec   :='+16';
  shower.da    :='+08';
  shower.dd    :='+01';
  shower.vel   :='66';
  shower.f     :='2.5';
  shower.zhr   :='030';
  shower.ImoCod:='ORI';
  write(showers,shower);

  shower.meno  :='Leo Minorids';
  shower.zac   :='10190';
  shower.kon   :='10270';
  shower.max   :='1023';
  shower.rec   :='161';
  shower.dec   :='+38';
  shower.da    :='+10';
  shower.dd    :='+04';
  shower.vel   :='62';
  shower.f     :='3.0';
  shower.zhr   :='002';
  shower.ImoCod:='LMI';
  write(showers,shower);

  shower.meno  :='South. Taurids';
  shower.zac   :='09250';
  shower.kon   :='11250';
  shower.max   :='1105';
  shower.rec   :='052';
  shower.dec   :='+15';
  shower.da    :='+08';
  shower.dd    :='+02';
  shower.vel   :='27';
  shower.f     :='2.3';
  shower.zhr   :='005';
  shower.ImoCod:='STA';
  write(showers,shower);

  shower.meno  :='North. Taurids';
  shower.zac   :='09250';
  shower.kon   :='12250';
  shower.max   :='1112';
  shower.rec   :='058';
  shower.dec   :='+22';
  shower.da    :='+08';
  shower.dd    :='+02';
  shower.vel   :='29';
  shower.f     :='2.3';
  shower.zhr   :='005';
  shower.ImoCod:='NTA';
  write(showers,shower);

  shower.meno  :='Leonids';
  shower.zac   :='11100';
  shower.kon   :='11230';
  shower.max   :='1117';
  shower.rec   :='152';
  shower.dec   :='+22';
  shower.da    :='+07';
  shower.dd    :='-04';
  shower.vel   :='71';
  shower.f     :='2.5';
  shower.zhr   :='100';
  shower.ImoCod:='LEO';
  write(showers,shower);

  shower.meno  :='a-Monocerotids';
  shower.zac   :='11150';
  shower.kon   :='11250';
  shower.max   :='1121';
  shower.rec   :='117';
  shower.dec   :='+01';
  shower.da    :='+11';
  shower.dd    :='-01';
  shower.vel   :='65';
  shower.f     :='2.4';
  shower.zhr   :='var';
  shower.ImoCod:='AMO';
  write(showers,shower);

  shower.meno  :='Dec. Phoenicids';
  shower.zac   :='11280';
  shower.kon   :='12090';
  shower.max   :='1206';
  shower.rec   :='118';
  shower.dec   :='-53';
  shower.da    :='+08';
  shower.dd    :='-01';
  shower.vel   :='18';
  shower.f     :='2.8';
  shower.zhr   :='var';
  shower.ImoCod:='PHO';
  write(showers,shower);

  shower.meno  :='Puppid/Velids';
  shower.zac   :='12010';
  shower.kon   :='12090';
  shower.max   :='1207';
  shower.rec   :='123';
  shower.dec   :='-45';
  shower.da    :='+06';
  shower.dd    :='+00';
  shower.vel   :='40';
  shower.f     :='2.9';
  shower.zhr   :='var';
  shower.ImoCod:='PUP';
  write(showers,shower);

  shower.meno  :='Monocerotids';
  shower.zac   :='11270';
  shower.kon   :='12170';
  shower.max   :='1209';
  shower.rec   :='100';
  shower.dec   :='+08';
  shower.da    :='+12';
  shower.dd    :='+00';
  shower.vel   :='42';
  shower.f     :='3.0';
  shower.zhr   :='002';
  shower.ImoCod:='MON';
  write(showers,shower);

  shower.meno  :='s-Hydrids';
  shower.zac   :='12030';
  shower.kon   :='12150';
  shower.max   :='1212';
  shower.rec   :='127';
  shower.dec   :='+02';
  shower.da    :='+08';
  shower.dd    :='-02';
  shower.vel   :='58';
  shower.f     :='3.0';
  shower.zhr   :='003';
  shower.ImoCod:='HYD';
  write(showers,shower);

  shower.meno  :='Geminids';
  shower.zac   :='12070';
  shower.kon   :='12170';
  shower.max   :='1214';
  shower.rec   :='112';
  shower.dec   :='+33';
  shower.da    :='+10';
  shower.dd    :='-01';
  shower.vel   :='35';
  shower.f     :='2.6';
  shower.zhr   :='125';
  shower.ImoCod:='GEM';
  write(showers,shower);

  shower.meno  :='Ursids';
  shower.zac   :='12170';
  shower.kon   :='12260';
  shower.max   :='1222';
  shower.rec   :='217';
  shower.dec   :='+76';
  shower.da    :='+00';
  shower.dd    :='+00';
  shower.vel   :='33';
  shower.f     :='3.0';
  shower.zhr   :='010';
  shower.ImoCod:='URS';
  write(showers,shower);

  shower.meno  :='Coma Berenicids';
  shower.zac   :='12120';
  shower.kon   :='01231';
  shower.max   :='1230';
  shower.rec   :='170';
  shower.dec   :='+26';
  shower.da    :='+09';
  shower.dd    :='-02';
  shower.vel   :='65';
  shower.f     :='3.0';
  shower.zhr   :='005';
  shower.ImoCod:='CBE';
  write(showers,shower);

  closefile(showers);
    end;
   if not FileExists(extractfilepath(application.ExeName) + 'observers.dat') then
    begin
      assignFile(observers,extractfilepath(application.ExeName) +  'observers.dat');
      rewrite(observers);
    end;
   if not FileExists(extractfilepath(application.ExeName) + 'limits.dat') then
    begin
      assignFile(limitky,extractfilepath(application.ExeName) +  'limits.dat');
      rewrite(Limitky);

    limit.rec:=270;
    limit.dec:=70;
    limit.mag[1]:='308';
    limit.mag[2]:='318';
    limit.mag[3]:='357';
    limit.mag[4]:='374';
    limit.mag[5]:='423';
    limit.mag[6]:='478';
    limit.mag[7]:='483';
    limit.mag[8]:='500';
    limit.mag[9]:='508';
    limit.mag[10]:='525';
    limit.mag[11]:='596';
    limit.mag[12]:='606';
    limit.mag[13]:='628';
    limit.mag[14]:='642';
    limit.mag[15]:='650';
    limit.mag[16]:='660';
    limit.mag[17]:='663';
    limit.mag[18]:='665';
    limit.mag[19]:='666';
    limit.mag[20]:='668';
    limit.mag[21]:='668';
    limit.mag[22]:='670';
    limit.mag[23]:='679';
    limit.mag[24]:='686';
    limit.mag[25]:='686';
    limit.mag[26]:='686';
    limit.mag[27]:='686';
    limit.mag[28]:='687';
    limit.mag[29]:='689';
    limit.mag[30]:='692';
    limit.mag[31]:='692';
    limit.mag[32]:='693';
    limit.mag[33]:='694';
    limit.mag[34]:='702';
    limit.mag[35]:='703';
    limit.mag[36]:='704';
    limit.mag[37]:='709';
    limit.mag[38]:='710';
    limit.mag[39]:='710';
    limit.mag[40]:='715';
    limit.mag[41]:='724';
    limit.mag[42]:='730';
    limit.mag[43]:='731';
    limit.mag[44]:='732';
    limit.mag[45]:='733';
    limit.mag[46]:='735';
    limit.mag[47]:='735';
    limit.mag[48]:='736';
    limit.mag[49]:='739';
    limit.mag[50]:='743';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {2}
    limit.rec:=52;
    limit.dec:=40;
    limit.mag[1]:='211';
    limit.mag[2]:='288';
    limit.mag[3]:='302';
    limit.mag[4]:='378';
    limit.mag[5]:='495';
    limit.mag[6]:='515';
    limit.mag[7]:='555';
    limit.mag[8]:='560';
    limit.mag[9]:='579';
    limit.mag[10]:='580';
    limit.mag[11]:='598';
    limit.mag[12]:='601';
    limit.mag[13]:='607';
    limit.mag[14]:='640';
    limit.mag[15]:='641';
    limit.mag[16]:='645';
    limit.mag[17]:='650';
    limit.mag[18]:='651';
    limit.mag[19]:='654';
    limit.mag[20]:='660';
    limit.mag[21]:='661';
    limit.mag[22]:='666';
    limit.mag[23]:='672';
    limit.mag[24]:='673';
    limit.mag[25]:='675';
    limit.mag[26]:='678';
    limit.mag[27]:='685';
    limit.mag[28]:='689';
    limit.mag[29]:='690';
    limit.mag[30]:='702';
    limit.mag[31]:='703';
    limit.mag[32]:='703';
    limit.mag[33]:='705';
    limit.mag[34]:='715';
    limit.mag[35]:='715';
    limit.mag[36]:='716';
    limit.mag[37]:='718';
    limit.mag[38]:='722';
    limit.mag[39]:='723';
    limit.mag[40]:='724';
    limit.mag[41]:='724';
    limit.mag[42]:='725';
    limit.mag[43]:='726';
    limit.mag[44]:='727';
    limit.mag[45]:='728';
    limit.mag[46]:='730';
    limit.mag[47]:='731';
    limit.mag[48]:='731';
    limit.mag[49]:='733';
    limit.mag[50]:='733';
    limit.mag[51]:='735';
    limit.mag[52]:='735';
    limit.mag[53]:='736';
    limit.mag[54]:='742';
    limit.mag[55]:='745';
    limit.mag[56]:='748';
    limit.mag[57]:='749';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {3}
    limit.rec:=150;
    limit.dec:=50;
    limit.mag[1]:='235';
    limit.mag[2]:='318';
    limit.mag[3]:='365';
    limit.mag[4]:='378';
    limit.mag[5]:='448';
    limit.mag[6]:='456';
    limit.mag[7]:='483';
    limit.mag[8]:='513';
    limit.mag[9]:='516';
    limit.mag[10]:='549';
    limit.mag[11]:='566';
    limit.mag[12]:='572';
    limit.mag[13]:='579';
    limit.mag[14]:='597';
    limit.mag[15]:='619';
    limit.mag[16]:='630';
    limit.mag[17]:='635';
    limit.mag[18]:='641';
    limit.mag[19]:='649';
    limit.mag[20]:='649';
    limit.mag[21]:='654';
    limit.mag[22]:='659';
    limit.mag[23]:='672';
    limit.mag[24]:='677';
    limit.mag[25]:='683';
    limit.mag[26]:='685';
    limit.mag[27]:='699';
    limit.mag[28]:='701';
    limit.mag[29]:='706';
    limit.mag[30]:='712';
    limit.mag[31]:='712';
    limit.mag[32]:='719';
    limit.mag[33]:='720';
    limit.mag[34]:='723';
    limit.mag[35]:='724';
    limit.mag[36]:='730';
    limit.mag[37]:='733';
    limit.mag[38]:='740';
    limit.mag[39]:='741';
    limit.mag[40]:='744';
    limit.mag[41]:='745';
    limit.mag[42]:='747';
    limit.mag[43]:='748';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {4}
    limit.rec:=105;
    limit.dec:=30;
    limit.mag[1]:='122';
    limit.mag[2]:='202';
    limit.mag[3]:='301';
    limit.mag[4]:='379';
    limit.mag[5]:='501';
    limit.mag[6]:='507';
    limit.mag[7]:='534';
    limit.mag[8]:='575';
    limit.mag[9]:='576';
    limit.mag[10]:='578';
    limit.mag[11]:='620';
    limit.mag[12]:='637';
    limit.mag[13]:='647';
    limit.mag[14]:='654';
    limit.mag[15]:='667';
    limit.mag[16]:='676';
    limit.mag[17]:='680';
    limit.mag[18]:='699';
    limit.mag[19]:='700';
    limit.mag[20]:='702';
    limit.mag[21]:='710';
    limit.mag[22]:='712';
    limit.mag[23]:='717';
    limit.mag[24]:='722';
    limit.mag[25]:='743';
    limit.mag[26]:='745';
    limit.mag[27]:='746';
    limit.mag[28]:='746';
    limit.mag[29]:='747';
    limit.mag[30]:='750';
    limit.mag[31]:='750';
    limit.mag[32]:='750';
    limit.mag[33]:='750';
    limit.mag[34]:='750';
    limit.mag[35]:='750';
    limit.mag[36]:='750';
    limit.mag[37]:='750';
    limit.mag[38]:='750';
    limit.mag[39]:='750';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

  {5}
    limit.rec:=293;
    limit.dec:=10;
    limit.mag[1]:='271';
    limit.mag[2]:='299';
    limit.mag[3]:='337';
    limit.mag[4]:='445';
    limit.mag[5]:='516';
    limit.mag[6]:='530';
    limit.mag[7]:='553';
    limit.mag[8]:='598';
    limit.mag[9]:='602';
    limit.mag[10]:='631';
    limit.mag[11]:='636';
    limit.mag[12]:='671';
    limit.mag[13]:='672';
    limit.mag[14]:='677';
    limit.mag[15]:='680';
    limit.mag[16]:='690';
    limit.mag[17]:='691';
    limit.mag[18]:='696';
    limit.mag[19]:='700';
    limit.mag[20]:='705';
    limit.mag[21]:='706';
    limit.mag[22]:='707';
    limit.mag[23]:='709';
    limit.mag[24]:='710';
    limit.mag[25]:='711';
    limit.mag[26]:='727';
    limit.mag[27]:='728';
    limit.mag[28]:='738';
    limit.mag[29]:='739';
    limit.mag[30]:='740';
    limit.mag[31]:='741';
    limit.mag[32]:='744';
    limit.mag[33]:='745';
    limit.mag[34]:='747';
    limit.mag[35]:='750';
    limit.mag[36]:='750';
    limit.mag[37]:='750';
    limit.mag[38]:='750';
    limit.mag[39]:='750';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {6}
    limit.rec:=359;
    limit.dec:=20;
    limit.mag[1]:='206';
    limit.mag[2]:='249';
    limit.mag[3]:='284';
    limit.mag[4]:='466';
    limit.mag[5]:='508';
    limit.mag[6]:='549';
    limit.mag[7]:='556';
    limit.mag[8]:='580';
    limit.mag[9]:='613';
    limit.mag[10]:='614';
    limit.mag[11]:='617';
    limit.mag[12]:='625';
    limit.mag[13]:='625';
    limit.mag[14]:='626';
    limit.mag[15]:='629';
    limit.mag[16]:='644';
    limit.mag[17]:='647';
    limit.mag[18]:='650';
    limit.mag[19]:='650';
    limit.mag[20]:='657';
    limit.mag[21]:='659';
    limit.mag[22]:='659';
    limit.mag[23]:='660';
    limit.mag[24]:='660';
    limit.mag[25]:='667';
    limit.mag[26]:='668';
    limit.mag[27]:='668';
    limit.mag[28]:='669';
    limit.mag[29]:='672';
    limit.mag[30]:='673';
    limit.mag[31]:='674';
    limit.mag[32]:='682';
    limit.mag[33]:='687';
    limit.mag[34]:='689';
    limit.mag[35]:='689';
    limit.mag[36]:='707';
    limit.mag[37]:='707';
    limit.mag[38]:='710';
    limit.mag[39]:='711';
    limit.mag[40]:='712';
    limit.mag[41]:='712';
    limit.mag[42]:='714';
    limit.mag[43]:='715';
    limit.mag[44]:='719';
    limit.mag[45]:='724';
    limit.mag[46]:='727';
    limit.mag[47]:='733';
    limit.mag[48]:='737';
    limit.mag[49]:='743';
    limit.mag[50]:='744';
    limit.mag[51]:='745';
    limit.mag[52]:='745';
    limit.mag[53]:='745';
    limit.mag[54]:='749';
    limit.mag[55]:='749';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {7}
    limit.rec:=330;
    limit.dec:=65;
    limit.mag[1]:='247';
    limit.mag[2]:='323';
    limit.mag[3]:='407';
    limit.mag[4]:='423';
    limit.mag[5]:='479';
    limit.mag[6]:='512';
    limit.mag[7]:='517';
    limit.mag[8]:='526';
    limit.mag[9]:='529';
    limit.mag[10]:='536';
    limit.mag[11]:='542';
    limit.mag[12]:='573';
    limit.mag[13]:='595';
    limit.mag[14]:='596';
    limit.mag[15]:='600';
    limit.mag[16]:='614';
    limit.mag[17]:='619';
    limit.mag[18]:='623';
    limit.mag[19]:='644';
    limit.mag[20]:='647';
    limit.mag[21]:='648';
    limit.mag[22]:='663';
    limit.mag[23]:='669';
    limit.mag[24]:='670';
    limit.mag[25]:='671';
    limit.mag[26]:='672';
    limit.mag[27]:='684';
    limit.mag[28]:='688';
    limit.mag[29]:='692';
    limit.mag[30]:='693';
    limit.mag[31]:='694';
    limit.mag[32]:='697';
    limit.mag[33]:='701';
    limit.mag[34]:='704';
    limit.mag[35]:='706';
    limit.mag[36]:='708';
    limit.mag[37]:='716';
    limit.mag[38]:='718';
    limit.mag[39]:='723';
    limit.mag[40]:='724';
    limit.mag[41]:='725';
    limit.mag[42]:='725';
    limit.mag[43]:='727';
    limit.mag[44]:='729';
    limit.mag[45]:='730';
    limit.mag[46]:='732';
    limit.mag[47]:='735';
    limit.mag[48]:='739';
    limit.mag[49]:='743';
    limit.mag[50]:='744';
    limit.mag[51]:='746';
    limit.mag[52]:='749';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {8}
    limit.rec:=75;
    limit.dec:=20;
    limit.mag[1]:='099';
    limit.mag[2]:='168';
    limit.mag[3]:='300';
    limit.mag[4]:='462';
    limit.mag[5]:='488';
    limit.mag[6]:='495';
    limit.mag[7]:='509';
    limit.mag[8]:='529';
    limit.mag[9]:='543';
    limit.mag[10]:='551';
    limit.mag[11]:='573';
    limit.mag[12]:='584';
    limit.mag[13]:='610';
    limit.mag[14]:='619';
    limit.mag[15]:='627';
    limit.mag[16]:='629';
    limit.mag[17]:='636';
    limit.mag[18]:='650';
    limit.mag[19]:='655';
    limit.mag[20]:='671';
    limit.mag[21]:='676';
    limit.mag[22]:='677';
    limit.mag[23]:='687';
    limit.mag[24]:='688';
    limit.mag[25]:='695';
    limit.mag[26]:='715';
    limit.mag[27]:='717';
    limit.mag[28]:='719';
    limit.mag[29]:='721';
    limit.mag[30]:='730';
    limit.mag[31]:='734';
    limit.mag[32]:='750';
    limit.mag[33]:='750';
    limit.mag[34]:='750';
    limit.mag[35]:='750';
    limit.mag[36]:='750';
    limit.mag[37]:='750';
    limit.mag[38]:='750';
    limit.mag[39]:='750';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {9}
    limit.rec:=165;
    limit.dec:=15;
    limit.mag[1]:='141';
    limit.mag[2]:='213';
    limit.mag[3]:='223';
    limit.mag[4]:='256';
    limit.mag[5]:='333';
    limit.mag[6]:='441';
    limit.mag[7]:='478';
    limit.mag[8]:='542';
    limit.mag[9]:='544';
    limit.mag[10]:='548';
    limit.mag[11]:='550';
    limit.mag[12]:='558';
    limit.mag[13]:='573';
    limit.mag[14]:='592';
    limit.mag[15]:='614';
    limit.mag[16]:='617';
    limit.mag[17]:='627';
    limit.mag[18]:='627';
    limit.mag[19]:='631';
    limit.mag[20]:='640';
    limit.mag[21]:='643';
    limit.mag[22]:='652';
    limit.mag[23]:='661';
    limit.mag[24]:='664';
    limit.mag[25]:='678';
    limit.mag[26]:='681';
    limit.mag[27]:='684';
    limit.mag[28]:='685';
    limit.mag[29]:='695';
    limit.mag[30]:='700';
    limit.mag[31]:='702';
    limit.mag[32]:='706';
    limit.mag[33]:='707';
    limit.mag[34]:='710';
    limit.mag[35]:='712';
    limit.mag[36]:='712';
    limit.mag[37]:='712';
    limit.mag[38]:='713';
    limit.mag[39]:='713';
    limit.mag[40]:='722';
    limit.mag[41]:='726';
    limit.mag[42]:='730';
    limit.mag[43]:='730';
    limit.mag[44]:='731';
    limit.mag[45]:='733';
    limit.mag[46]:='734';
    limit.mag[47]:='736';
    limit.mag[48]:='743';
    limit.mag[49]:='743';
    limit.mag[50]:='743';
    limit.mag[51]:='745';
    limit.mag[52]:='748';
    limit.mag[53]:='749';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {10}
    limit.rec:=195;
    limit.dec:=1;
    limit.mag[1]:='106';
    limit.mag[2]:='274';
    limit.mag[3]:='338';
    limit.mag[4]:='439';
    limit.mag[5]:='577';
    limit.mag[6]:='580';
    limit.mag[7]:='586';
    limit.mag[8]:='592';
    limit.mag[9]:='597';
    limit.mag[10]:='599';
    limit.mag[11]:='612';
    limit.mag[12]:='641';
    limit.mag[13]:='644';
    limit.mag[14]:='663';
    limit.mag[15]:='664';
    limit.mag[16]:='665';
    limit.mag[17]:='669';
    limit.mag[18]:='683';
    limit.mag[19]:='690';
    limit.mag[20]:='704';
    limit.mag[21]:='706';
    limit.mag[22]:='708';
    limit.mag[23]:='716';
    limit.mag[24]:='719';
    limit.mag[25]:='720';
    limit.mag[26]:='724';
    limit.mag[27]:='725';
    limit.mag[28]:='725';
    limit.mag[29]:='732';
    limit.mag[30]:='733';
    limit.mag[31]:='734';
    limit.mag[32]:='738';
    limit.mag[33]:='742';
    limit.mag[34]:='750';
    limit.mag[35]:='750';
    limit.mag[36]:='750';
    limit.mag[37]:='750';
    limit.mag[38]:='750';
    limit.mag[39]:='750';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {11}
    limit.rec:=225;
    limit.dec:=30;
    limit.mag[1]:='016';
    limit.mag[2]:='222';
    limit.mag[3]:='236';
    limit.mag[4]:='304';
    limit.mag[5]:='357';
    limit.mag[6]:='447';
    limit.mag[7]:='451';
    limit.mag[8]:='479';
    limit.mag[9]:='481';
    limit.mag[10]:='493';
    limit.mag[11]:='528';
    limit.mag[12]:='551';
    limit.mag[13]:='567';
    limit.mag[14]:='579';
    limit.mag[15]:='581';
    limit.mag[16]:='588';
    limit.mag[17]:='590';
    limit.mag[18]:='600';
    limit.mag[19]:='601';
    limit.mag[20]:='604';
    limit.mag[21]:='606';
    limit.mag[22]:='613';
    limit.mag[23]:='613';
    limit.mag[24]:='622';
    limit.mag[25]:='627';
    limit.mag[26]:='632';
    limit.mag[27]:='638';
    limit.mag[28]:='638';
    limit.mag[29]:='640';
    limit.mag[30]:='640';
    limit.mag[31]:='656';
    limit.mag[32]:='668';
    limit.mag[33]:='670';
    limit.mag[34]:='671';
    limit.mag[35]:='676';
    limit.mag[36]:='677';
    limit.mag[37]:='679';
    limit.mag[38]:='683';
    limit.mag[39]:='684';
    limit.mag[40]:='687';
    limit.mag[41]:='689';
    limit.mag[42]:='694';
    limit.mag[43]:='695';
    limit.mag[44]:='696';
    limit.mag[45]:='796';
    limit.mag[46]:='701';
    limit.mag[47]:='703';
    limit.mag[48]:='704';
    limit.mag[49]:='712';
    limit.mag[50]:='714';
    limit.mag[51]:='715';
    limit.mag[52]:='717';
    limit.mag[53]:='721';
    limit.mag[54]:='722';
    limit.mag[55]:='722';
    limit.mag[56]:='725';
    limit.mag[57]:='725';
    limit.mag[58]:='725';
    limit.mag[59]:='725';
    limit.mag[60]:='725';
    limit.mag[61]:='725';
    limit.mag[62]:='725';
    limit.mag[63]:='730';
    limit.mag[64]:='730';
    limit.mag[65]:='730';
    limit.mag[66]:='738';
    limit.mag[67]:='743';
    limit.mag[68]:='743';
    limit.mag[69]:='743';
    limit.mag[70]:='745';
    limit.mag[71]:='745';
    limit.mag[72]:='745';
    limit.mag[73]:='749';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {12}
    limit.rec:=233;
    limit.dec:=1;
    limit.mag[1]:='261';
    limit.mag[2]:='263';
    limit.mag[3]:='273';
    limit.mag[4]:='355';
    limit.mag[5]:='510';
    limit.mag[6]:='523';
    limit.mag[7]:='539';
    limit.mag[8]:='539';
    limit.mag[9]:='551';
    limit.mag[10]:='553';
    limit.mag[11]:='557';
    limit.mag[12]:='587';
    limit.mag[13]:='625';
    limit.mag[14]:='634';
    limit.mag[15]:='651';
    limit.mag[16]:='652';
    limit.mag[17]:='654';
    limit.mag[18]:='671';
    limit.mag[19]:='685';
    limit.mag[20]:='687';
    limit.mag[21]:='688';
    limit.mag[22]:='695';
    limit.mag[23]:='696';
    limit.mag[24]:='697';
    limit.mag[25]:='704';
    limit.mag[26]:='713';
    limit.mag[27]:='716';
    limit.mag[28]:='716';
    limit.mag[29]:='719';
    limit.mag[30]:='721';
    limit.mag[31]:='723';
    limit.mag[32]:='725';
    limit.mag[33]:='726';
    limit.mag[34]:='727';
    limit.mag[35]:='727';
    limit.mag[36]:='728';
    limit.mag[37]:='732';
    limit.mag[38]:='734';
    limit.mag[39]:='735';
    limit.mag[40]:='736';
    limit.mag[41]:='741';
    limit.mag[42]:='742';
    limit.mag[43]:='743';
    limit.mag[44]:='744';
    limit.mag[45]:='747';
    limit.mag[46]:='748';
    limit.mag[47]:='748';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {13}
    limit.rec:=270;
    limit.dec:=35;
    limit.mag[1]:='352';
    limit.mag[2]:='384';
    limit.mag[3]:='432';
    limit.mag[4]:='434';
    limit.mag[5]:='441';
    limit.mag[6]:='498';
    limit.mag[7]:='542';
    limit.mag[8]:='549';
    limit.mag[9]:='556';
    limit.mag[10]:='572';
    limit.mag[11]:='599';
    limit.mag[12]:='601';
    limit.mag[13]:='603';
    limit.mag[14]:='605';
    limit.mag[15]:='610';
    limit.mag[16]:='617';
    limit.mag[17]:='647';
    limit.mag[18]:='659';
    limit.mag[19]:='662';
    limit.mag[20]:='667';
    limit.mag[21]:='670';
    limit.mag[22]:='689';
    limit.mag[23]:='693';
    limit.mag[24]:='700';
    limit.mag[25]:='701';
    limit.mag[26]:='702';
    limit.mag[27]:='702';
    limit.mag[28]:='703';
    limit.mag[29]:='704';
    limit.mag[30]:='706';
    limit.mag[31]:='708';
    limit.mag[32]:='719';
    limit.mag[33]:='723';
    limit.mag[34]:='727';
    limit.mag[35]:='729';
    limit.mag[36]:='731';
    limit.mag[37]:='733';
    limit.mag[38]:='734';
    limit.mag[39]:='737';
    limit.mag[40]:='737';
    limit.mag[41]:='738';
    limit.mag[42]:='741';
    limit.mag[43]:='743';
    limit.mag[44]:='744';
    limit.mag[45]:='745';
    limit.mag[46]:='745';
    limit.mag[47]:='746';
    limit.mag[48]:='746';
    limit.mag[49]:='749';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {14}
    limit.rec:=300;
    limit.dec:=40;
    limit.mag[1]:='223';
    limit.mag[2]:='249';
    limit.mag[3]:='390';
    limit.mag[4]:='465';
    limit.mag[5]:='473';
    limit.mag[6]:='479';
    limit.mag[7]:='494';
    limit.mag[8]:='506';
    limit.mag[9]:='539';
    limit.mag[10]:='558';
    limit.mag[11]:='564';
    limit.mag[12]:='587';
    limit.mag[13]:='591';
    limit.mag[14]:='604';
    limit.mag[15]:='625';
    limit.mag[16]:='629';
    limit.mag[17]:='631';
    limit.mag[18]:='634';
    limit.mag[19]:='638';
    limit.mag[20]:='547';
    limit.mag[21]:='648';
    limit.mag[22]:='660';
    limit.mag[23]:='673';
    limit.mag[24]:='674';
    limit.mag[25]:='682';
    limit.mag[26]:='687';
    limit.mag[27]:='690';
    limit.mag[28]:='696';
    limit.mag[29]:='700';
    limit.mag[30]:='702';
    limit.mag[31]:='702';
    limit.mag[32]:='708';
    limit.mag[33]:='709';
    limit.mag[34]:='710';
    limit.mag[35]:='712';
    limit.mag[36]:='713';
    limit.mag[37]:='723';
    limit.mag[38]:='727';
    limit.mag[39]:='729';
    limit.mag[40]:='730';
    limit.mag[41]:='732';
    limit.mag[42]:='733';
    limit.mag[43]:='734';
    limit.mag[44]:='742';
    limit.mag[45]:='742';
    limit.mag[46]:='743';
    limit.mag[47]:='744';
    limit.mag[48]:='744';
    limit.mag[49]:='744';
    limit.mag[50]:='747';
    limit.mag[51]:='747';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {15}
    limit.rec:=255;
    limit.dec:=45;
    limit.mag[1]:='280';
    limit.mag[2]:='314';
    limit.mag[3]:='390';
    limit.mag[4]:='382';
    limit.mag[5]:='507';
    limit.mag[6]:='550';
    limit.mag[7]:='567';
    limit.mag[8]:='582';
    limit.mag[9]:='592';
    limit.mag[10]:='598';
    limit.mag[11]:='606';
    limit.mag[12]:='611';
    limit.mag[13]:='616';
    limit.mag[14]:='617';
    limit.mag[15]:='629';
    limit.mag[16]:='634';
    limit.mag[17]:='636';
    limit.mag[18]:='636';
    limit.mag[19]:='645';
    limit.mag[20]:='646';
    limit.mag[21]:='658';
    limit.mag[22]:='666';
    limit.mag[23]:='666';
    limit.mag[24]:='674';
    limit.mag[25]:='678';
    limit.mag[26]:='682';
    limit.mag[27]:='685';
    limit.mag[28]:='687';
    limit.mag[29]:='687';
    limit.mag[30]:='700';
    limit.mag[31]:='702';
    limit.mag[32]:='704';
    limit.mag[33]:='712';
    limit.mag[34]:='717';
    limit.mag[35]:='723';
    limit.mag[36]:='724';
    limit.mag[37]:='735';
    limit.mag[38]:='737';
    limit.mag[39]:='738';
    limit.mag[40]:='739';
    limit.mag[41]:='747';
    limit.mag[42]:='748';
    limit.mag[43]:='749';
    limit.mag[44]:='749';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {16}
    limit.rec:=195;
    limit.dec:=50;
    limit.mag[1]:='176';
    limit.mag[2]:='186';
    limit.mag[3]:='289';
    limit.mag[4]:='467';
    limit.mag[5]:='515';
    limit.mag[6]:='564';
    limit.mag[7]:='579';
    limit.mag[8]:='585';
    limit.mag[9]:='588';
    limit.mag[10]:='611';
    limit.mag[11]:='642';
    limit.mag[12]:='648';
    limit.mag[13]:='655';
    limit.mag[14]:='670';
    limit.mag[15]:='679';
    limit.mag[16]:='680';
    limit.mag[17]:='681';
    limit.mag[18]:='684';
    limit.mag[19]:='696';
    limit.mag[20]:='698';
    limit.mag[21]:='698';
    limit.mag[22]:='705';
    limit.mag[23]:='706';
    limit.mag[24]:='723';
    limit.mag[25]:='726';
    limit.mag[26]:='728';
    limit.mag[27]:='733';
    limit.mag[28]:='738';
    limit.mag[29]:='747';
    limit.mag[30]:='748';
    limit.mag[31]:='750';
    limit.mag[32]:='750';
    limit.mag[33]:='750';
    limit.mag[34]:='750';
    limit.mag[35]:='750';
    limit.mag[36]:='750';
    limit.mag[37]:='750';
    limit.mag[38]:='750';
    limit.mag[39]:='750';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

  {17}
    limit.rec:=95;
    limit.dec:=50;
    limit.mag[1]:='008';
    limit.mag[2]:='190';
    limit.mag[3]:='265';
    limit.mag[4]:='303';
    limit.mag[5]:='373';
    limit.mag[6]:='397';
    limit.mag[7]:='433';
    limit.mag[8]:='452';
    limit.mag[9]:='521';
    limit.mag[10]:='546';
    limit.mag[11]:='564';
    limit.mag[12]:='591';
    limit.mag[13]:='599';
    limit.mag[14]:='609';
    limit.mag[15]:='611';
    limit.mag[16]:='623';
    limit.mag[17]:='630';
    limit.mag[18]:='630';
    limit.mag[19]:='641';
    limit.mag[20]:='644';
    limit.mag[21]:='647';
    limit.mag[22]:='648';
    limit.mag[23]:='651';
    limit.mag[24]:='654';
    limit.mag[25]:='656';
    limit.mag[26]:='657';
    limit.mag[27]:='658';
    limit.mag[28]:='658';
    limit.mag[29]:='659';
    limit.mag[30]:='660';
    limit.mag[31]:='663';
    limit.mag[32]:='666';
    limit.mag[33]:='669';
    limit.mag[34]:='675';
    limit.mag[35]:='677';
    limit.mag[36]:='680';
    limit.mag[37]:='681';
    limit.mag[38]:='682';
    limit.mag[39]:='684';
    limit.mag[40]:='686';
    limit.mag[41]:='686';
    limit.mag[42]:='689';
    limit.mag[43]:='693';
    limit.mag[44]:='695';
    limit.mag[45]:='695';
    limit.mag[46]:='698';
    limit.mag[47]:='698';
    limit.mag[48]:='701';
    limit.mag[49]:='716';
    limit.mag[50]:='719';
    limit.mag[51]:='720';
    limit.mag[52]:='721';
    limit.mag[53]:='724';
    limit.mag[54]:='724';
    limit.mag[55]:='724';
    limit.mag[56]:='724';
    limit.mag[57]:='724';
    limit.mag[58]:='724';
    limit.mag[59]:='724';
    limit.mag[60]:='727';
    limit.mag[61]:='731';
    limit.mag[62]:='731';
    limit.mag[63]:='731';
    limit.mag[64]:='731';
    limit.mag[65]:='731';
    limit.mag[66]:='731';
    limit.mag[67]:='737';
    limit.mag[68]:='740';
    limit.mag[69]:='740';
    limit.mag[70]:='740';
    limit.mag[71]:='740';
    limit.mag[72]:='746';
    limit.mag[73]:='746';
    limit.mag[74]:='746';
    limit.mag[75]:='746';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {18}
    limit.rec:=25;
    limit.dec:=40;
    limit.mag[1]:='217';
    limit.mag[2]:='387';
    limit.mag[3]:='410';
    limit.mag[4]:='426';
    limit.mag[5]:='483';
    limit.mag[6]:='487';
    limit.mag[7]:='496';
    limit.mag[8]:='501';
    limit.mag[9]:='504';
    limit.mag[10]:='564';
    limit.mag[11]:='567';
    limit.mag[12]:='594';
    limit.mag[13]:='598';
    limit.mag[14]:='613';
    limit.mag[15]:='613';
    limit.mag[16]:='639';
    limit.mag[17]:='642';
    limit.mag[18]:='652';
    limit.mag[19]:='655';
    limit.mag[20]:='658';
    limit.mag[21]:='660';
    limit.mag[22]:='664';
    limit.mag[23]:='665';
    limit.mag[24]:='668';
    limit.mag[25]:='668';
    limit.mag[26]:='677';
    limit.mag[27]:='677';
    limit.mag[28]:='684';
    limit.mag[29]:='690';
    limit.mag[30]:='695';
    limit.mag[31]:='707';
    limit.mag[32]:='714';
    limit.mag[33]:='719';
    limit.mag[34]:='721';
    limit.mag[35]:='723';
    limit.mag[36]:='723';
    limit.mag[37]:='725';
    limit.mag[38]:='726';
    limit.mag[39]:='726';
    limit.mag[40]:='727';
    limit.mag[41]:='727';
    limit.mag[42]:='730';
    limit.mag[43]:='733';
    limit.mag[44]:='743';
    limit.mag[45]:='744';
    limit.mag[46]:='746';
    limit.mag[47]:='747';
    limit.mag[48]:='748';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {19}
    limit.rec:=210;
    limit.dec:=70;
    limit.mag[1]:='206';
    limit.mag[2]:='365';
    limit.mag[3]:='389';
    limit.mag[4]:='519';
    limit.mag[5]:='550';
    limit.mag[6]:='581';
    limit.mag[7]:='620';
    limit.mag[8]:='633';
    limit.mag[9]:='640';
    limit.mag[10]:='653';
    limit.mag[11]:='670';
    limit.mag[12]:='700';
    limit.mag[13]:='717';
    limit.mag[14]:='722';
    limit.mag[15]:='725';
    limit.mag[16]:='730';
    limit.mag[17]:='733';
    limit.mag[18]:='741';
    limit.mag[19]:='745';
    limit.mag[20]:='749';
    limit.mag[21]:='750';
    limit.mag[22]:='750';
    limit.mag[23]:='750';
    limit.mag[24]:='750';
    limit.mag[25]:='750';
    limit.mag[26]:='750';
    limit.mag[27]:='750';
    limit.mag[28]:='750';
    limit.mag[29]:='750';
    limit.mag[30]:='750';
    limit.mag[31]:='750';
    limit.mag[32]:='750';
    limit.mag[33]:='750';
    limit.mag[34]:='750';
    limit.mag[35]:='750';
    limit.mag[36]:='750';
    limit.mag[37]:='750';
    limit.mag[38]:='750';
    limit.mag[39]:='750';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);
  {20}
    limit.rec:=97;
    limit.dec:=70;
    limit.mag[1]:='403';
    limit.mag[2]:='431';
    limit.mag[3]:='462';
    limit.mag[4]:='477';
    limit.mag[5]:='514';
    limit.mag[6]:='544';
    limit.mag[7]:='547';
    limit.mag[8]:='562';
    limit.mag[9]:='563';
    limit.mag[10]:='600';
    limit.mag[11]:='604';
    limit.mag[12]:='617';
    limit.mag[13]:='617';
    limit.mag[14]:='620';
    limit.mag[15]:='621';
    limit.mag[16]:='624';
    limit.mag[17]:='625';
    limit.mag[18]:='635';
    limit.mag[19]:='636';
    limit.mag[20]:='638';
    limit.mag[21]:='643';
    limit.mag[22]:='649';
    limit.mag[23]:='661';
    limit.mag[24]:='662';
    limit.mag[25]:='663';
    limit.mag[26]:='664';
    limit.mag[27]:='664';
    limit.mag[28]:='666';
    limit.mag[29]:='669';
    limit.mag[30]:='671';
    limit.mag[31]:='674';
    limit.mag[32]:='681';
    limit.mag[33]:='682';
    limit.mag[34]:='685';
    limit.mag[35]:='686';
    limit.mag[36]:='688';
    limit.mag[37]:='689';
    limit.mag[38]:='689';
    limit.mag[39]:='692';
    limit.mag[40]:='695';
    limit.mag[41]:='697';
    limit.mag[42]:='698';
    limit.mag[43]:='699';
    limit.mag[44]:='701';
    limit.mag[45]:='703';
    limit.mag[46]:='705';
    limit.mag[47]:='708';
    limit.mag[48]:='712';
    limit.mag[49]:='712';
    limit.mag[50]:='714';
    limit.mag[51]:='717';
    limit.mag[52]:='727';
    limit.mag[53]:='728';
    limit.mag[54]:='730';
    limit.mag[55]:='730';
    limit.mag[56]:='732';
    limit.mag[57]:='737';
    limit.mag[58]:='737';
    limit.mag[59]:='740';
    limit.mag[60]:='740';
    limit.mag[61]:='743';
    limit.mag[62]:='743';
    limit.mag[63]:='743';
    limit.mag[64]:='745';
    limit.mag[65]:='747';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    {21}
    limit.rec:=345;
    limit.dec:=-25;
    limit.mag[1]:='123';
    limit.mag[2]:='327';
    limit.mag[3]:='368';
    limit.mag[4]:='396';
    limit.mag[5]:='448';
    limit.mag[6]:='472';
    limit.mag[7]:='554';
    limit.mag[8]:='566';
    limit.mag[9]:='598';
    limit.mag[10]:='628';
    limit.mag[11]:='630';
    limit.mag[12]:='635';
    limit.mag[13]:='679';
    limit.mag[14]:='682';
    limit.mag[15]:='697';
    limit.mag[16]:='705';
    limit.mag[17]:='725';
    limit.mag[18]:='742';
    limit.mag[19]:='745';
    limit.mag[20]:='748';
    limit.mag[21]:='748';
    limit.mag[22]:='750';
    limit.mag[23]:='750';
    limit.mag[24]:='750';
    limit.mag[25]:='750';
    limit.mag[26]:='750';
    limit.mag[27]:='750';
    limit.mag[28]:='750';
    limit.mag[29]:='750';
    limit.mag[30]:='750';
    limit.mag[31]:='750';
    limit.mag[32]:='750';
    limit.mag[33]:='750';
    limit.mag[34]:='750';
    limit.mag[35]:='750';
    limit.mag[36]:='750';
    limit.mag[37]:='750';
    limit.mag[38]:='750';
    limit.mag[39]:='750';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    {22}
    limit.rec:=83;
    limit.dec:=-15;
    limit.mag[1]:='028';
    limit.mag[2]:='284';
    limit.mag[3]:='329';
    limit.mag[4]:='387';
    limit.mag[5]:='428';
    limit.mag[6]:='443';
    limit.mag[7]:='447';
    limit.mag[8]:='478';
    limit.mag[9]:='546';
    limit.mag[10]:='549';
    limit.mag[11]:='568';
    limit.mag[12]:='568';
    limit.mag[13]:='569';
    limit.mag[14]:='772';
    limit.mag[15]:='582';
    limit.mag[16]:='596';
    limit.mag[17]:='596';
    limit.mag[18]:='605';
    limit.mag[19]:='615';
    limit.mag[20]:='623';
    limit.mag[21]:='627';
    limit.mag[22]:='635';
    limit.mag[23]:='640';
    limit.mag[24]:='642';
    limit.mag[25]:='646';
    limit.mag[26]:='647';
    limit.mag[27]:='654';
    limit.mag[28]:='668';
    limit.mag[29]:='671';
    limit.mag[30]:='673';
    limit.mag[31]:='675';
    limit.mag[32]:='676';
    limit.mag[33]:='696';
    limit.mag[34]:='702';
    limit.mag[35]:='704';
    limit.mag[36]:='712';
    limit.mag[37]:='714';
    limit.mag[38]:='714';
    limit.mag[39]:='721';
    limit.mag[40]:='721';
    limit.mag[41]:='722';
    limit.mag[42]:='728';
    limit.mag[43]:='732';
    limit.mag[44]:='732';
    limit.mag[45]:='733';
    limit.mag[46]:='734';
    limit.mag[47]:='734';
    limit.mag[48]:='737';
    limit.mag[49]:='738';
    limit.mag[50]:='738';
    limit.mag[51]:='741';
    limit.mag[52]:='742';
    limit.mag[53]:='743';
    limit.mag[54]:='743';
    limit.mag[55]:='745';
    limit.mag[56]:='745';
    limit.mag[57]:='747';
    limit.mag[58]:='748';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    {23}
    limit.rec:=188;
    limit.dec:=-20;
    limit.mag[1]:='259';
    limit.mag[2]:='266';
    limit.mag[3]:='297';
    limit.mag[4]:='301';
    limit.mag[5]:='521';
    limit.mag[6]:='581';
    limit.mag[7]:='595';
    limit.mag[8]:='640';
    limit.mag[9]:='662';
    limit.mag[10]:='684';
    limit.mag[11]:='706';
    limit.mag[12]:='725';
    limit.mag[13]:='730';
    limit.mag[14]:='741';
    limit.mag[15]:='744';
    limit.mag[16]:='744';
    limit.mag[17]:='746';
    limit.mag[18]:='750';
    limit.mag[19]:='750';
    limit.mag[20]:='750';
    limit.mag[21]:='750';
    limit.mag[22]:='750';
    limit.mag[23]:='750';
    limit.mag[24]:='750';
    limit.mag[25]:='750';
    limit.mag[26]:='750';
    limit.mag[27]:='750';
    limit.mag[28]:='750';
    limit.mag[29]:='750';
    limit.mag[30]:='750';
    limit.mag[31]:='750';
    limit.mag[32]:='750';
    limit.mag[33]:='750';
    limit.mag[34]:='750';
    limit.mag[35]:='750';
    limit.mag[36]:='750';
    limit.mag[37]:='750';
    limit.mag[38]:='750';
    limit.mag[39]:='750';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    {24}
    limit.rec:=225;
    limit.dec:=-20;
    limit.mag[1]:='261';
    limit.mag[2]:='275';
    limit.mag[3]:='328';
    limit.mag[4]:='392';
    limit.mag[5]:='456';
    limit.mag[6]:='519';
    limit.mag[7]:='564';
    limit.mag[8]:='572';
    limit.mag[9]:='608';
    limit.mag[10]:='614';
    limit.mag[11]:='615';
    limit.mag[12]:='617';
    limit.mag[13]:='619';
    limit.mag[14]:='641';
    limit.mag[15]:='646';
    limit.mag[16]:='650';
    limit.mag[17]:='663';
    limit.mag[18]:='664';
    limit.mag[19]:='667';
    limit.mag[20]:='675';
    limit.mag[21]:='676';
    limit.mag[22]:='676';
    limit.mag[23]:='680';
    limit.mag[24]:='687';
    limit.mag[25]:='694';
    limit.mag[26]:='707';
    limit.mag[27]:='714';
    limit.mag[28]:='716';
    limit.mag[29]:='719';
    limit.mag[30]:='720';
    limit.mag[31]:='722';
    limit.mag[32]:='724';
    limit.mag[33]:='725';
    limit.mag[34]:='729';
    limit.mag[35]:='729';
    limit.mag[36]:='732';
    limit.mag[37]:='735';
    limit.mag[38]:='737';
    limit.mag[39]:='738';
    limit.mag[40]:='741';
    limit.mag[41]:='746';
    limit.mag[42]:='749';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    {25}
    limit.rec:=248;
    limit.dec:=-30;
    limit.mag[1]:='107';
    limit.mag[2]:='229';
    limit.mag[3]:='396';
    limit.mag[4]:='526';
    limit.mag[5]:='549';
    limit.mag[6]:='550';
    limit.mag[7]:='580';
    limit.mag[8]:='592';
    limit.mag[9]:='600';
    limit.mag[10]:='609';
    limit.mag[11]:='615';
    limit.mag[12]:='632';
    limit.mag[13]:='641';
    limit.mag[14]:='647';
    limit.mag[15]:='656';
    limit.mag[16]:='656';
    limit.mag[17]:='662';
    limit.mag[18]:='685';
    limit.mag[19]:='690';
    limit.mag[20]:='697';
    limit.mag[21]:='698';
    limit.mag[22]:='701';
    limit.mag[23]:='707';
    limit.mag[24]:='713';
    limit.mag[25]:='714';
    limit.mag[26]:='715';
    limit.mag[27]:='726';
    limit.mag[28]:='740';
    limit.mag[29]:='746';
    limit.mag[30]:='750';
    limit.mag[31]:='750';
    limit.mag[32]:='750';
    limit.mag[33]:='750';
    limit.mag[34]:='750';
    limit.mag[35]:='750';
    limit.mag[36]:='750';
    limit.mag[37]:='750';
    limit.mag[38]:='750';
    limit.mag[39]:='750';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    {26}
    limit.rec:=223;
    limit.dec:=-65;
    limit.mag[1]:='000';
    limit.mag[2]:='191';
    limit.mag[3]:='284';
    limit.mag[4]:='288';
    limit.mag[5]:='376';
    limit.mag[6]:='385';
    limit.mag[7]:='411';
    limit.mag[8]:='485';
    limit.mag[9]:='508';
    limit.mag[10]:='510';
    limit.mag[11]:='511';
    limit.mag[12]:='517';
    limit.mag[13]:='518';
    limit.mag[14]:='529';
    limit.mag[15]:='550';
    limit.mag[16]:='572';
    limit.mag[17]:='575';
    limit.mag[18]:='577';
    limit.mag[19]:='598';
    limit.mag[20]:='598';
    limit.mag[21]:='595';
    limit.mag[22]:='295';
    limit.mag[23]:='602';
    limit.mag[24]:='607';
    limit.mag[25]:='612';
    limit.mag[26]:='614';
    limit.mag[27]:='616';
    limit.mag[28]:='617';
    limit.mag[29]:='620';
    limit.mag[30]:='620';
    limit.mag[31]:='621';
    limit.mag[32]:='622';
    limit.mag[33]:='625';
    limit.mag[34]:='625';
    limit.mag[35]:='630';
    limit.mag[36]:='631';
    limit.mag[37]:='633';
    limit.mag[38]:='639';
    limit.mag[39]:='639';
    limit.mag[40]:='642';
    limit.mag[41]:='648';
    limit.mag[42]:='648';
    limit.mag[43]:='650';
    limit.mag[44]:='650';
    limit.mag[45]:='650';
    limit.mag[46]:='650';
    limit.mag[47]:='657';
    limit.mag[48]:='657';
    limit.mag[49]:='661';
    limit.mag[50]:='670';
    limit.mag[51]:='670';
    limit.mag[52]:='670';
    limit.mag[53]:='675';
    limit.mag[54]:='681';
    limit.mag[55]:='681';
    limit.mag[56]:='681';
    limit.mag[57]:='681';
    limit.mag[58]:='685';
    limit.mag[59]:='685';
    limit.mag[60]:='685';
    limit.mag[61]:='685';
    limit.mag[62]:='685';
    limit.mag[63]:='685';
    limit.mag[64]:='690';
    limit.mag[65]:='690';
    limit.mag[66]:='695';
    limit.mag[67]:='695';
    limit.mag[68]:='695';
    limit.mag[69]:='695';
    limit.mag[70]:='700';
    limit.mag[71]:='700';
    limit.mag[72]:='700';
    limit.mag[73]:='700';
    limit.mag[74]:='700';
    limit.mag[75]:='705';
    limit.mag[76]:='710';
    limit.mag[77]:='710';
    limit.mag[78]:='710';
    limit.mag[79]:='710';
    limit.mag[80]:='710';
    limit.mag[81]:='714';
    limit.mag[82]:='714';
    limit.mag[83]:='720';
    limit.mag[84]:='720';
    limit.mag[85]:='720';
    limit.mag[86]:='724';
    limit.mag[87]:='724';
    limit.mag[88]:='724';
    limit.mag[89]:='724';
    limit.mag[90]:='729';
    limit.mag[91]:='729';
    limit.mag[92]:='734';
    limit.mag[93]:='734';
    limit.mag[94]:='734';
    limit.mag[95]:='734';
    limit.mag[96]:='734';
    limit.mag[97]:='740';
    limit.mag[98]:='740';
    limit.mag[99]:='740';
    write(limitky, limit);

    {27}
    limit.rec:=178;
    limit.dec:=-60;
    limit.mag[1]:='064';
    limit.mag[2]:='131';
    limit.mag[3]:='158';
    limit.mag[4]:='165';
    limit.mag[5]:='431';
    limit.mag[6]:='456';
    limit.mag[7]:='459';
    limit.mag[8]:='461';
    limit.mag[9]:='469';
    limit.mag[10]:='492';
    limit.mag[11]:='550';
    limit.mag[12]:='575';
    limit.mag[13]:='582';
    limit.mag[14]:='604';
    limit.mag[15]:='620';
    limit.mag[16]:='620';
    limit.mag[17]:='623';
    limit.mag[18]:='642';
    limit.mag[19]:='661';
    limit.mag[20]:='661';
    limit.mag[21]:='666';
    limit.mag[22]:='669';
    limit.mag[23]:='673';
    limit.mag[24]:='674';
    limit.mag[25]:='675';
    limit.mag[26]:='692';
    limit.mag[27]:='693';
    limit.mag[28]:='696';
    limit.mag[29]:='698';
    limit.mag[30]:='707';
    limit.mag[31]:='711';
    limit.mag[32]:='713';
    limit.mag[33]:='719';
    limit.mag[34]:='719';
    limit.mag[35]:='721';
    limit.mag[36]:='724';
    limit.mag[37]:='726';
    limit.mag[38]:='727';
    limit.mag[39]:='729';
    limit.mag[40]:='731';
    limit.mag[41]:='737';
    limit.mag[42]:='738';
    limit.mag[43]:='740';
    limit.mag[44]:='745';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    {28}
    limit.rec:=135;
    limit.dec:=-65;
    limit.mag[1]:='167';
    limit.mag[2]:='195';
    limit.mag[3]:='225';
    limit.mag[4]:='384';
    limit.mag[5]:='396';
    limit.mag[6]:='400';
    limit.mag[7]:='433';
    limit.mag[8]:='546';
    limit.mag[9]:='554';
    limit.mag[10]:='578';
    limit.mag[11]:='579';
    limit.mag[12]:='636';
    limit.mag[13]:='636';
    limit.mag[14]:='649';
    limit.mag[15]:='654';
    limit.mag[16]:='663';
    limit.mag[17]:='672';
    limit.mag[18]:='685';
    limit.mag[19]:='690';
    limit.mag[20]:='693';
    limit.mag[21]:='699';
    limit.mag[22]:='704';
    limit.mag[23]:='703';
    limit.mag[24]:='714';
    limit.mag[25]:='715';
    limit.mag[26]:='716';
    limit.mag[27]:='718';
    limit.mag[28]:='719';
    limit.mag[29]:='725';
    limit.mag[30]:='729';
    limit.mag[31]:='731';
    limit.mag[32]:='732';
    limit.mag[33]:='738';
    limit.mag[34]:='738';
    limit.mag[35]:='738';
    limit.mag[36]:='738';
    limit.mag[37]:='744';
    limit.mag[38]:='745';
    limit.mag[39]:='746';
    limit.mag[40]:='750';
    limit.mag[41]:='750';
    limit.mag[42]:='750';
    limit.mag[43]:='750';
    limit.mag[44]:='750';
    limit.mag[45]:='750';
    limit.mag[46]:='750';
    limit.mag[47]:='750';
    limit.mag[48]:='750';
    limit.mag[49]:='750';
    limit.mag[50]:='750';
    limit.mag[51]:='750';
    limit.mag[52]:='750';
    limit.mag[53]:='750';
    limit.mag[54]:='750';
    limit.mag[55]:='750';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    {29}
    limit.rec:=38;
    limit.dec:=-70;
    limit.mag[1]:='282';
    limit.mag[2]:='286';
    limit.mag[3]:='326';
    limit.mag[4]:='408';
    limit.mag[5]:='469';
    limit.mag[6]:='474';
    limit.mag[7]:='551';
    limit.mag[8]:='557';
    limit.mag[9]:='567';
    limit.mag[10]:='599';
    limit.mag[11]:='609';
    limit.mag[12]:='636';
    limit.mag[13]:='643';
    limit.mag[14]:='657';
    limit.mag[15]:='659';
    limit.mag[16]:='665';
    limit.mag[17]:='666';
    limit.mag[18]:='669';
    limit.mag[19]:='669';
    limit.mag[20]:='671';
    limit.mag[21]:='677';
    limit.mag[22]:='681';
    limit.mag[23]:='684';
    limit.mag[24]:='685';
    limit.mag[25]:='686';
    limit.mag[26]:='688';
    limit.mag[27]:='689';
    limit.mag[28]:='689';
    limit.mag[29]:='691';
    limit.mag[30]:='694';
    limit.mag[31]:='701';
    limit.mag[32]:='709';
    limit.mag[33]:='709';
    limit.mag[34]:='710';
    limit.mag[35]:='713';
    limit.mag[36]:='719';
    limit.mag[37]:='722';
    limit.mag[38]:='723';
    limit.mag[39]:='723';
    limit.mag[40]:='724';
    limit.mag[41]:='726';
    limit.mag[42]:='727';
    limit.mag[43]:='729';
    limit.mag[44]:='730';
    limit.mag[45]:='730';
    limit.mag[46]:='732';
    limit.mag[47]:='732';
    limit.mag[48]:='737';
    limit.mag[49]:='737';
    limit.mag[50]:='737';
    limit.mag[51]:='738';
    limit.mag[52]:='739';
    limit.mag[53]:='741';
    limit.mag[54]:='746';
    limit.mag[55]:='747';
    limit.mag[56]:='750';
    limit.mag[57]:='750';
    limit.mag[58]:='750';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    {30}
    limit.rec:=323;
    limit.dec:=-65;
    limit.mag[1]:='192';
    limit.mag[2]:='286';
    limit.mag[3]:='342';
    limit.mag[4]:='365';
    limit.mag[5]:='395';
    limit.mag[6]:='423';
    limit.mag[7]:='476';
    limit.mag[8]:='486';
    limit.mag[9]:='512';
    limit.mag[10]:='515';
    limit.mag[11]:='518';
    limit.mag[12]:='561';
    limit.mag[13]:='562';
    limit.mag[14]:='576';
    limit.mag[15]:='592';
    limit.mag[16]:='609';
    limit.mag[17]:='622';
    limit.mag[18]:='622';
    limit.mag[19]:='628';
    limit.mag[20]:='633';
    limit.mag[21]:='635';
    limit.mag[22]:='636';
    limit.mag[23]:='640';
    limit.mag[24]:='650';
    limit.mag[25]:='659';
    limit.mag[26]:='670';
    limit.mag[27]:='670';
    limit.mag[28]:='673';
    limit.mag[29]:='677';
    limit.mag[30]:='683';
    limit.mag[31]:='684';
    limit.mag[32]:='686';
    limit.mag[33]:='687';
    limit.mag[34]:='691';
    limit.mag[35]:='692';
    limit.mag[36]:='692';
    limit.mag[37]:='697';
    limit.mag[38]:='700';
    limit.mag[39]:='703';
    limit.mag[40]:='709';
    limit.mag[41]:='710';
    limit.mag[42]:='710';
    limit.mag[43]:='713';
    limit.mag[44]:='715';
    limit.mag[45]:='718';
    limit.mag[46]:='720';
    limit.mag[47]:='721';
    limit.mag[48]:='723';
    limit.mag[49]:='724';
    limit.mag[50]:='724';
    limit.mag[51]:='727';
    limit.mag[52]:='735';
    limit.mag[53]:='736';
    limit.mag[54]:='741';
    limit.mag[55]:='744';
    limit.mag[56]:='744';
    limit.mag[57]:='747';
    limit.mag[58]:='748';
    limit.mag[59]:='750';
    limit.mag[60]:='750';
    limit.mag[61]:='750';
    limit.mag[62]:='750';
    limit.mag[63]:='750';
    limit.mag[64]:='750';
    limit.mag[65]:='750';
    limit.mag[66]:='750';
    limit.mag[67]:='750';
    limit.mag[68]:='750';
    limit.mag[69]:='750';
    limit.mag[70]:='750';
    limit.mag[71]:='750';
    limit.mag[72]:='750';
    limit.mag[73]:='750';
    limit.mag[74]:='750';
    limit.mag[75]:='750';
    limit.mag[76]:='750';
    limit.mag[77]:='750';
    limit.mag[78]:='750';
    limit.mag[79]:='750';
    limit.mag[80]:='750';
    limit.mag[81]:='750';
    limit.mag[82]:='750';
    limit.mag[83]:='750';
    limit.mag[84]:='750';
    limit.mag[85]:='750';
    limit.mag[86]:='750';
    limit.mag[87]:='750';
    limit.mag[88]:='750';
    limit.mag[89]:='750';
    limit.mag[90]:='750';
    limit.mag[91]:='750';
    limit.mag[92]:='750';
    limit.mag[93]:='750';
    limit.mag[94]:='750';
    limit.mag[95]:='750';
    limit.mag[96]:='750';
    limit.mag[97]:='750';
    limit.mag[98]:='750';
    limit.mag[99]:='750';
    write(limitky, limit);

    closefile(limitky);
    end;
  {kontrola ci bola aplikacia spustena s parametrom}
  if ParamStr(1)='' then
    Saved:=true
  else
  begin
  {kontrola ci je otvoreny spravny subor}
   if extractFileExt(ParamStr(1))<>'.prt'
     then
       showmessage(extractFileName(ParamStr(1))+' is not valid file of this application')
     else
       begin
         {nacitavanie dat po nakliknuti na prt subor}
         FilePath:=ParamStr(1);
         Subor:= TFileStream.Create(FilePath, fmOpenRead);
        subor.Read(pozorovanie.typsuboru, 2);
    subor.read(pozorovanie.tested, 1);
    subor.Read(pozorovanie.datum,13);
    subor.Read(pozorovanie.ZaciatokH, 3);
    subor.Read(pozorovanie.ZaciatokM, 3);
    subor.Read(pozorovanie.KoniecH, 3);
    subor.Read(pozorovanie.KoniecM, 3);
    subor.Read(pozorovanie.miesto.DlzkaP ,2 );
    subor.Read(pozorovanie.miesto.DlzkaH ,4 );
    subor.Read(pozorovanie.miesto.DlzkaM ,3 );
    subor.Read(pozorovanie.miesto.DlzkaS ,3 );
    subor.Read(pozorovanie.miesto.SirkaP ,2 );
    subor.Read(pozorovanie.miesto.SirkaM ,3 );
    subor.Read(pozorovanie.miesto.SirkaH ,3 );
    subor.Read(pozorovanie.miesto.SirkaS ,3 );
    subor.Read(pozorovanie.miesto.Vyska ,5 );
    subor.Read(pozorovanie.miesto.Meno ,21 );
    subor.Read(pozorovanie.miesto.Stat ,21 );
    subor.Read(pozorovanie.miesto.IMOkod ,6 );
    subor.Read(pozorovanie.zapisovatel.ImoKod, 6);
    subor.Read(pozorovanie.zapisovatel.meno, 13);
    subor.Read(pozorovanie.zapisovatel.priezvisko, 16);
    subor.Read(pozorovanie.pozpocet, 4 );
    for I:=1 to pozorovanie.pozPocet do
      begin
        subor.Read(pozorovanie.pozorovatel[I].IMOCislo, 6);
        subor.read(pozorovanie.pozorovatel[I].ImoKod, 6 );
        subor.read(pozorovanie.pozorovatel[I].meno, 13 );
        subor.read(pozorovanie.pozorovatel[I].priezvisko, 16 );
      end;
    subor.Read(pozorovanie.rojpocet, 4 );
    for I:=1 to pozorovanie.rojPocet do
      begin
        subor.read(pozorovanie.roje[I].meno, 21);
        subor.read(pozorovanie.roje[I].zac, 6);
        subor.read(pozorovanie.roje[I].kon, 6);
        subor.read(pozorovanie.roje[I].max, 5);
        subor.read(pozorovanie.roje[I].rec, 4);
        subor.read(pozorovanie.roje[I].dec, 4);
        subor.read(pozorovanie.roje[I].da, 4);
        subor.read(pozorovanie.roje[I].dd, 4);
        subor.read(pozorovanie.roje[I].vel, 3);
        subor.read(pozorovanie.roje[I].f, 4);
        subor.read(pozorovanie.roje[I].zhr, 4);
        subor.read(pozorovanie.roje[I].ImoCod, 4);
        subor.read(pozorovanie.roje[I].znak, 2);
      end;
        subor.Read(pozorovanie.IntPocet, 4 );
    for I:=1 to pozorovanie.IntPocet do
      begin
        subor.Read(pozorovanie.intervaly[I].ZacH, 3);
        subor.Read(pozorovanie.intervaly[I].ZacM, 3);
        subor.Read(pozorovanie.intervaly[I].KonH, 3);
        subor.Read(pozorovanie.intervaly[I].KonM, 3);
        subor.Read(pozorovanie.intervaly[I].PozPocet, 4);
        for J:=1 to pozorovanie.intervaly[I].PozPocet do
          begin
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].StredRec, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].StredDec, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].cislo, 3);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].stred, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].CldPocet, 4);
            subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].LimPocet, 4);
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet do
              begin
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].zacH, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM, 3);
              end;
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
              begin
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].zacH, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonH, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].percenta, 4);
              end;
            for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
              begin
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hod, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].min, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].trojuholnik, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hviezdy, 3);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].limitka, 4);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].dec, 4);
                subor.Read(pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].rec, 4);
              end;
          end;
      end;
    pozorovanie.tabulka.LoadFromStream(subor);
    {N�zov na okne}
    Main.Caption:=ExtractFileName(FilePath) + ' - ' + MenoProgramu + ' ' + version;

    FileOnDisk:=True;
    {Nastavy hodnotu na ulozene}
    Saved:=true;
    subor.Free;
       end;
  end;
if not FileExists(extractfilepath(application.ExeName) + 'preferences.dat')
  then
    begin
      assignFile(preferences,extractfilepath(application.ExeName) +  'preferences.dat');
      rewrite(preferences);
      pref.trojuholniky:=true;
      pref.horizont:=0;
      pref.kvalita:='1';
      pref.rojovost:='-';
      pref.stopa:='-';
      write(preferences,pref);
      closefile(preferences);
    end
  else
    begin
      assignFile(preferences,extractfilepath(application.ExeName) +  'preferences.dat');
      reset(preferences);
      read(preferences,pref);
      closefile(preferences);
    end;

end;

procedure TMain.KoniecClick(Sender: TObject);
begin
{ak bol subor ulozeny}
if Saved=false then
begin
  Case
    MessageDlg  ('File was changed, save?',
                mtConfirmation,
                [mbYes, mbNo, mbCancel], 0)of
    mrYes: begin UlozitClick(Main); application.terminate; end;
    mrNo:  Application.Terminate;
    mrCancel: Application.Run;
  end;
end
{ak nie hned skonci}
else
application.terminate;
end;


procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
KoniecClick(Main);
end;

procedure TMain.HlavickaClick(Sender: TObject);
begin
  If HlavickaOpened = false
    then
      begin
        OknoHlavicky:=TOknoHlavicky.Create(Application);
        HlavickaOpened:=true;
      end
    else
      OknoHlavicky.BringToFront;
end;

procedure TMain.NastaveniaClick(Sender: TObject);
begin
  If NastaveniaOpened = false
    then
      begin
        WndNastavenia:=TWndNastavenia.Create(Application);
        NastaveniaOpened:=true;
      end
    else
      WndNastavenia.BringToFront;
end;

procedure TMain.StatistikaClick(Sender: TObject);
begin
if pozorovanie.tested=true
  then
    begin
      If StatistikaOpened = false then
        begin
          OknoStatistiky:=TOknoStatistiky.Create(Application);
          StatistikaOpened:=true;
        end
    else
      OknoStatistiky.BringToFront;
    end
  else
    showmessage('File wasn'+char(39)+'t tested');
end;

procedure TMain.TestClick(Sender: TObject);
begin
  If DataTestOpened = false
  then
    begin
      DataTest:=TDataTest.Create(Application);
      DataTestOpened:=true;
    end
      else
        DataTest.BringToFront;
end;

procedure TMain.IntervalyClick(Sender: TObject);
begin
 If OknoIntervaluOpened = false
  then
    begin
      OknoIntervalu:=TOknoIntervalu.Create(Application);
      OknoIntervaluOpened:=true;
    end
      else
        OknoIntervalu.BringToFront;
end;

procedure TMain.TBtNewClick(Sender: TObject);
begin
  NovyClick(Application);
end;

procedure TMain.TBtOpenClick(Sender: TObject);
begin
  OtvorClick(Application);
end;

procedure TMain.TBtSaveClick(Sender: TObject);
begin
  UlozitClick(Application);
end;

procedure TMain.TBtSaveAsClick(Sender: TObject);
begin
  UlozitAkoClick(Application);
end;

procedure TMain.TBtHlavickaClick(Sender: TObject);
begin
  HlavickaClick(Application);
end;

procedure TMain.TBtIntervalyClick(Sender: TObject);
begin
  IntervalyClick(Application);
end;

procedure TMain.TBtMeteoryClick(Sender: TObject);
begin
  OtvorMeteoryClick(Application);
end;

procedure TMain.TBtTestClick(Sender: TObject);
begin
  TestClick(Application)
end;

procedure TMain.TBtPreferencesClick(Sender: TObject);
begin
  NastaveniaClick(Application);
end;

procedure TMain.TBtStatistikaClick(Sender: TObject);
begin
  StatistikaClick(application);
end;

procedure TMain.IMOClick(Sender: TObject);

function AkyJeToInterval(cas: real): integer;
var
  I: integer;
  kon,zac,H: real;
begin
  result:=0;
  for I:=1 to pozorovanie.IntPocet do
    begin
      H:=Cas;
      zac:=strtoint(pozorovanie.intervaly[I].zacH)+strtoint(pozorovanie.intervaly[I].zacM)/60;
      kon:=strtoint(pozorovanie.intervaly[I].konH)+strtoint(pozorovanie.intervaly[I].konM)/60;
      if Kon<Zac
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

var
  I,J,K,L:integer;
  subor: TextFile;
  str,H: string;
  udaj: Troj;
  showers: file of Troj;
  cont1, cont2: string;
  zac, kon: real;
begin
{ak je ulozeny}
if Saved=true then
begin
{Otvori sa novy subor}
  if MetOpenDialog.Execute then
    begin
      AssignFile(subor, MetOpenDialog.FileName);
      Reset(Subor);
      try
        {vynuluje premennu pozorovanie}
        FillChar(Pozorovanie, sizeOf(TPozorovanie), 0);
        pozorovanie.Tabulka:=TStringList.Create;
  {Precita zaznamy v subore BEGIN}
  readln(subor,str);
  readln(subor,str);
  readln(subor,str);
  pozorovanie.Datum:=str[9]+str[10]+'. '+str[6]+str[7]+'. '+str[1]+str[2]+str[3]+str[4];
  readln(subor,str);
  pozorovanie.ZaciatokH:=str[1]+str[2];
  pozorovanie.ZaciatokM:=str[4]+str[5];
  readln(subor,str);
  pozorovanie.KoniecH:=str[1]+str[2];
  pozorovanie.KoniecM:=str[4]+str[5];
  readln(subor,str);
  pozorovanie.miesto.DlzkaP:=str[14];
  for I:=1 to 3 do
    begin
      if str[I]<>' '
        then
          pozorovanie.miesto.DlzkaH:=pozorovanie.miesto.DlzkaH+str[I];
    end;
  for I:=5 to 6 do
    begin
      if str[I]<>' '
        then
          pozorovanie.miesto.DlzkaM:=pozorovanie.miesto.DlzkaM+str[I];
    end;

  for I:=8 to 9 do
    begin
      if str[I]<>' '
        then
          pozorovanie.miesto.DlzkaS:=pozorovanie.miesto.DlzkaS+str[I];
    end;

  readln(subor,str);
  pozorovanie.miesto.SirkaP:=str[14];
  for I:=1 to 3 do
    begin
      if str[I]<>' '
        then
          pozorovanie.miesto.SirkaH:=pozorovanie.miesto.SirkaH+str[I];
    end;
  for I:=5 to 6 do
    begin
      if str[I]<>' '
        then
          pozorovanie.miesto.SirkaM:=pozorovanie.miesto.SirkaM+str[I];
    end;

  for I:=8 to 9 do
    begin
      if str[I]<>' '
        then
          pozorovanie.miesto.SirkaS:=pozorovanie.miesto.SirkaS+str[I];
    end;

  readln(subor,str);

  for I:=1 to 4 do
    if str[I]<>' '
      then
        pozorovanie.miesto.Vyska:=pozorovanie.miesto.Vyska+str[I];

  readln(subor,str);
  for J:=1 to 20 do
    if str[J]<>' '
      then
        break;
  for I:=J to 20 do
    pozorovanie.miesto.Meno:=pozorovanie.miesto.Meno+str[I];

  readln(subor,str);
  for J:=1 to 20 do
    if str[J]<>' '
      then
        break;
  for I:=J to 20 do
    pozorovanie.miesto.Stat:=pozorovanie.miesto.Stat+str[I];

  for I:=25 to 29 do
    if str[I]<>' '
      then
        pozorovanie.miesto.IMOkod:=pozorovanie.miesto.IMOkod+str[I];
  readln(subor,str);
  readln(subor,str);
  readln(subor,str);
  I:=0;
  while str<>'OBSERVERS :' do
    begin
      inc(I);
      for J:=1 to 3 do
        pozorovanie.roje[I].ImoCod:=pozorovanie.roje[I].ImoCod+str[J];
      assignFile(showers,extractfilepath(application.ExeName) +  'showers.dat');
      reset(showers);
      K:=0;
      while not eof(showers) do
        begin
          seek(showers, K);
          read(showers, udaj);
          if udaj.ImoCod=pozorovanie.roje[I].ImoCod
            then
              begin
                inc(pozorovanie.RojPocet);
                pozorovanie.roje[pozorovanie.RojPocet].Znak:=str[7];
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
                break;
              end;
          inc(K);
        end;
      closefile(showers);
      readln(subor,str);
    end;
  I:=0;
  readln(subor,str);
  while str<>'PERIODS :' do
    begin
      inc(I);
      inc(pozorovanie.pozPocet);
      for K:=3 to 20 do
        if str[K]<>' '
          then
            break;

      for J:=K to 20 do
        pozorovanie.pozorovatel[I].priezvisko:=pozorovanie.pozorovatel[I].priezvisko+str[J];

      for K:=21 to 35 do
        if str[K]<>' '
          then
            break;

      for J:=K to 35 do
        pozorovanie.pozorovatel[I].meno:=pozorovanie.pozorovatel[I].meno+str[J];

      for J:=39 to 43 do
        pozorovanie.pozorovatel[I].Imokod:=pozorovanie.pozorovatel[I].Imokod+str[J];

      readln(subor,str);
    end;

  readln(subor,str);
  inc(pozorovanie.IntPocet);
  for J:=6 to 7 do
    pozorovanie.intervaly[1].ZacH:=pozorovanie.intervaly[1].ZacH+str[J];
  for J:=11 to 12 do
    pozorovanie.intervaly[1].ZacM:=pozorovanie.intervaly[1].ZacM+str[J];
  for J:=16 to 17 do
    pozorovanie.intervaly[1].KonH:=pozorovanie.intervaly[1].KonH+str[J];
  for J:=21 to 22 do
    pozorovanie.intervaly[1].KonM:=pozorovanie.intervaly[1].KonM+str[J];

  for J:=6 to 22 do
    cont1:=cont1+str[J];
  readln(subor,str);
  I:=1;
  while str<>'BREAKS :' do
    begin
      for J:=6 to 22 do
        cont2:=cont2+str[J];
      if cont1<>cont2
        then
          begin
            inc(I);
            inc(pozorovanie.IntPocet);
            for J:=6 to 7 do
              pozorovanie.intervaly[I].ZacH:=pozorovanie.intervaly[I].ZacH+str[J];
            for J:=11 to 12 do
              pozorovanie.intervaly[I].ZacM:=pozorovanie.intervaly[I].ZacM+str[J];
            for J:=16 to 17 do
              pozorovanie.intervaly[I].KonH:=pozorovanie.intervaly[I].KonH+str[J];
            for J:=21 to 22 do
              pozorovanie.intervaly[I].KonM:=pozorovanie.intervaly[I].KonM+str[J];
          end;
      cont1:=cont2;
      cont2:='';
      readln(subor,str);
    end;

  reset(subor);
  readln(subor,str);
  while str<>'PERIODS :' do
    readln(subor,str);
  I:=0;
  readln(subor,str);
  while str<>'BREAKS :' do
    begin
      for I:=1 to pozorovanie.IntPocet do
      begin
      cont1:=pozorovanie.intervaly[I].ZacH+pozorovanie.intervaly[I].ZacM+
             pozorovanie.intervaly[I].KonH+pozorovanie.intervaly[I].KonM;
      cont2:=str[6]+str[7]+str[11]+str[12]+str[16]+str[17]+str[21]+str[22];

      if cont1=cont2
        then
          begin
            inc(pozorovanie.intervaly[I].PozPocet);
            for J:=1 to 2 do
              if str[J]<>' '
                then
                  pozorovanie.intervaly[I].pozorovatelia[pozorovanie.intervaly[I].PozPocet].cislo:=
                  pozorovanie.intervaly[I].pozorovatelia[pozorovanie.intervaly[I].PozPocet].cislo+str[J];
            H:='';
            for J:=26 to 28 do
              if str[J]<>' '
                then
                  H:=H+str[J];
            pozorovanie.intervaly[I].pozorovatelia[pozorovanie.intervaly[I].PozPocet].StredRec:=strtoint(H);
            H:='';
            for J:=32 to 34 do
              if str[J]<>' '
                then
                  H:=H+str[J];
            pozorovanie.intervaly[I].pozorovatelia[pozorovanie.intervaly[I].PozPocet].StredDec:=strtoint(H);
          end;
      end;
      readln(subor,str);
    end;
  readln(subor,str);
  while str<>'LIMITS :' do
    begin
      I:=AkyJeToInterval(strtoint(str[10]+str[11])+strtoint(str[15]+str[16])/60);
      H:='';
      for K:=1 to 2 do
        if str[K]<>' '
          then
            H:=H+str[K];
      if I<>0
        then
      for K:=1 to pozorovanie.intervaly[I].PozPocet do
      if H=pozorovanie.intervaly[I].pozorovatelia[K].cislo
        then
          with pozorovanie.intervaly[I].pozorovatelia[K] do
          begin
            inc(brkpocet);
            H:='';
            for L:=10 to 11 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            prestavky[brkpocet].ZacH:=H;
            H:='';
            for L:=15 to 16 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            prestavky[brkpocet].ZacM:=H;
            H:='';
            for L:=24 to 25 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            prestavky[brkpocet].KonH:=H;
            H:='';
            for L:=29 to 30 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            prestavky[brkpocet].KonM:=H;
          end;
      readln(subor,str);
    end;
  readln(subor,str);
  while str<>'CLOUDS :' do
    begin
      I:=AkyJeToInterval(strtoint(str[10]+str[11])+strtoint(str[15]+str[16])/60);
      H:='';
      for K:=1 to 2 do
        if str[K]<>' '
          then
            H:=H+str[K];
      for K:=1 to pozorovanie.intervaly[I].PozPocet do
      if H=pozorovanie.intervaly[I].pozorovatelia[K].cislo
        then
          with pozorovanie.intervaly[I].pozorovatelia[K] do
          begin
            inc(limPocet);
            H:='';
            for L:=10 to 11 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            limitky[limpocet].Hod:=H;
            H:='';
            for L:=15 to 16 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            limitky[limpocet].Min:=H;
            H:='';
            for L:=24 to 25 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            limitky[limpocet].trojuholnik:=H;
            H:='';
            for L:=29 to 30 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            limitky[limpocet].hviezdy:=H;
            H:='';
            for L:=34 to 36 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            limitky[limpocet].limitka:=H[1]+H[2]+H[3];
          end;
      readln(subor,str);
    end;
  readln(subor,str);
  while str<>'METEORS :' do
   begin
     I:=AkyJeToInterval(strtoint(str[10]+str[11])+strtoint(str[15]+str[16])/60);
      H:='';
      for K:=1 to 2 do
        if str[K]<>' '
          then
            H:=H+str[K];
      for K:=1 to pozorovanie.intervaly[I].PozPocet do
      if H=pozorovanie.intervaly[I].pozorovatelia[K].cislo
        then
          with pozorovanie.intervaly[I].pozorovatelia[K] do
          begin
            inc(cldpocet);
            H:='';
            for L:=10 to 11 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            oblacnost[cldpocet].ZacH:=H;
            H:='';
            for L:=15 to 16 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            oblacnost[cldpocet].ZacM:=H;
            H:='';
            for L:=24 to 25 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            oblacnost[cldpocet].KonH:=H;
            H:='';
            for L:=29 to 30 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            oblacnost[cldpocet].KonM:=H;
            H:='';
            for L:=36 to 37 do
              if str[L]<>' '
                then
                  H:=H+str[L];
            oblacnost[cldpocet].percenta:=H;
          end;
     readln(subor,str);
   end;
  while not eof(subor) do
    begin
      readln(subor,str);
      H:='';
      for L:=1 to 4 do
        if str[L]<>' '
          then
            H:=H+str[L];
      pozorovanie.Tabulka.Add(H);

      H:='';
      for L:=8 to 9 do
        if str[L]<>' '
          then
            H:=H+str[L];
      pozorovanie.Tabulka.Add(H);

      H:='';
      for L:=13 to 14 do
        if str[L]<>' '
          then
            H:=H+str[L];
      pozorovanie.Tabulka.Add(H);

      H:='';
      for L:=23 to 24 do
        if str[L]<>' '
          then
            H:=H+str[L];
      pozorovanie.Tabulka.Add(H);

      if str[28]<>' '
          then
            pozorovanie.Tabulka.Add(str[28])
          else
            pozorovanie.Tabulka.Add('');
      if pozorovanie.Tabulka[pozorovanie.tabulka.count-1]=' '
        then
          pozorovanie.Tabulka[pozorovanie.tabulka.count-1]:='';

      if str[32]<>' '
          then
            pozorovanie.Tabulka.Add(str[32])
          else
            pozorovanie.Tabulka.Add('');

      if pozorovanie.Tabulka[pozorovanie.tabulka.count-1]=' '
        then
          pozorovanie.Tabulka[pozorovanie.tabulka.count-1]:='';

      H:='';
      for L:=36 to 38 do
        if str[L]<>' '
          then
            H:=H+str[L];
      pozorovanie.Tabulka.Add(H);
      if str[42]<>' '
          then
            pozorovanie.Tabulka.Add(str[42])
          else
            pozorovanie.Tabulka.Add('');

      if pozorovanie.Tabulka[pozorovanie.tabulka.count-1]=' '
        then
          pozorovanie.Tabulka[pozorovanie.tabulka.count-1]:='';

      H:='';
      for L:=46 to 47 do
        if str[L]<>' '
          then
            H:=H+str[L];
      pozorovanie.Tabulka.Add(H);

      if str[58]<>' '
          then
            pozorovanie.Tabulka.Add(str[58])
          else
            pozorovanie.Tabulka.Add('');
            
      if pozorovanie.Tabulka[pozorovanie.tabulka.count-1]=' '
        then
          pozorovanie.Tabulka[pozorovanie.tabulka.count-1]:='';
    end;
    {Precita zaznamy v subore END}
     saved:=false;
    {Vinimkovy blok}
  except
    on E:EInOutError do
    begin
      case E.ErrorCode of
        2: ShowMessage('File not found');
        4: ShowMessage('Too many opened files');
        5: ShowMessage('Acess diened');
      100: ShowMessage('Empty file');
      else
        ShowMessage('File error' + E.Message);
      end;
    CloseFile(subor);
    end;
  end;
  end;
end
else
{ak nieje ulozeny}
  Case
  MessageDlg('S�bor bol zmenen�, chcete ho ulo�i�?',
    mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
  mrYes: Begin UlozitClick(Main); IMOClick(Main); end;
  mrNo: Begin Saved:=true; IMOClick(Main); end;
  end;

end;

procedure TMain.HTMLInputClick(Sender: TObject);
var
  sub: TextFile;
  I,J: integer;
begin
if HTMLSaveDialog.Execute=true
  then
begin
  assignFile(sub, HTMLSaveDialog.FileName);
  rewrite(sub);

  writeln(sub, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">');
  writeln(sub, '<html>');
  writeln(sub, '<head>');
  writeln(sub, '<meta http-equiv="content-type" content="text/html; charset=windows-1250">');
  writeln(sub, '<meta name="generator" content="IMSO editor, Michal Stefancik 2007-2010">');
  writeln(sub, '<title>Input file</title>');
  writeln(sub, '</head>');
  writeln(sub, '<body style="font-family: Arial">');
  writeln(sub, '<h1>');
  writeln(sub, 'Input data');
  writeln(sub, '</h1');

  writeln(sub, '<div>');
  write(sub, 'Date: ');
  writeln(sub, pozorovanie.datum);

  write(sub, 'Begin: ');
  write(sub, pozorovanie.zaciatokH+':'+pozorovanie.zaciatokM+ '       ');
  write(sub, 'End: ');
  writeln(sub, pozorovanie.koniecH+':'+pozorovanie.koniecM+'<br>');
  write(sub, 'Place: ');
  writeln(sub, pozorovanie.miesto.meno+'<br>');

  write(sub, 'Longitude: ');
  write(sub, pozorovanie.miesto.dlzkaH+'H ');
  write(sub, pozorovanie.miesto.dlzkaM+'M ');
  write(sub, pozorovanie.miesto.dlzkaS+'S ');
  writeln(sub, pozorovanie.miesto.dlzkaP+'<br>');

  write(sub, 'Latitude: ');
  write(sub, pozorovanie.miesto.sirkaH+'H ');
  write(sub, pozorovanie.miesto.sirkaM+'M ');
  write(sub, pozorovanie.miesto.sirkaS+'S ');
  write(sub, pozorovanie.miesto.sirkaP+'<br>');
  write(sub, 'Country: ');
  write(sub, pozorovanie.miesto.stat+'<br>');
  write(sub, 'Altitude: ');
  writeln(sub, pozorovanie.miesto.vyska+'<br>');
  write(sub, 'IMO code: ');
  writeln(sub, pozorovanie.miesto.imoKod );
  writeln(sub, '</div>');

  writeln(sub, '<br>');
  writeln(sub, '<br>');
  writeln(sub, '<h2>');
  writeln(sub, 'Showers');
  writeln(sub, '</h2');
  writeln(sub, '<table  border="1" cellpadding="1">');
  for I:=1 to pozorovanie.rojpocet do
    begin
      writeln(sub, '<th>');
      writeln(sub, 'Code');
      writeln(sub, '</th>');

      writeln(sub, '<th>');
      writeln(sub, 'Rec');
      writeln(sub, '</th>');

      writeln(sub, '<th>');
      writeln(sub, 'Dec');
      writeln(sub, '</th>');

      writeln(sub, '<th>');
      writeln(sub, 'Da');
      writeln(sub, '</th>');

      writeln(sub, '<th>');
      writeln(sub, 'Dd');
      writeln(sub, '</th>');

      writeln(sub, '<th>');
      writeln(sub, 'f');
      writeln(sub, '</th>');

      writeln(sub, '<th>');
      writeln(sub, 'Name');
      writeln(sub, '</th>');

      writeln(sub, '<tr>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.roje[I].imocod+'   ');
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.roje[I].rec+'   ' );
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.roje[I].dec+'   ' );
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.roje[I].da+'   ');
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.roje[I].dd+'   ');
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.roje[I].f+'  ');
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.roje[I].meno);
      writeln(sub, '</td>');
      writeln(sub, '</tr>');
    end;

  writeln(sub, '</table>');
  writeln(sub, '<br>');

  writeln(sub, '<h2>');
  writeln(sub, 'Observers');
  writeln(sub, '</h2');
  writeln(sub, '<table border="1" cellpadding="1">');

  writeln(sub, '<th>');
  writeln(sub, ' IMO Code');
  writeln(sub, '</th>');

  writeln(sub, '<th>');
  writeln(sub, 'IMO Number');
  writeln(sub, '</th>');

  writeln(sub, '<th>');
  writeln(sub, 'Name');
  writeln(sub, '</th>');

  for I:=1 to pozorovanie.pozPocet do
    begin
      writeln(sub, '<tr>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.pozorovatel[I].ImoCislo+'   ');
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.pozorovatel[I].ImoKod+'   ');
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.pozorovatel[I].meno);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      write(sub, pozorovanie.pozorovatel[I].priezvisko+'   ');
      writeln(sub, '</td>');
      writeln(sub, '</tr>');
    end;

  writeln(sub, '</table>');

  writeln(sub, '<h2>');
  writeln(sub, 'Intervals');
  writeln(sub, '</h2');

  writeln(sub, '<table  border="1" cellpadding="1">');

  writeln(sub, '<th>');
  writeln(sub, 'Interval');
  writeln(sub, '</th>');

  writeln(sub, '<th>');
  writeln(sub, 'Breaks');
  writeln(sub, '</th>');

  writeln(sub, '<th>');
  writeln(sub, 'Clouds');
  writeln(sub, '</th>');

  writeln(sub, '<th>');
  writeln(sub, 'Limit magnitude');
  writeln(sub, '</th>');

  writeln(sub, '<br>');
  OknoIntervalu:=TOknoIntervalu.Create(application);

  for I:=0 to oknoIntervalu.Intervaly.RowCount-1 do
    begin
      writeln(sub, '<tr>');
      for J:=0 to 3 do
        begin
          writeln(sub, '<td>');
          writeln(sub, oknoIntervalu.Intervaly.cells[J,I]);
          writeln(sub, '</td>');
        end;
      writeln(sub, '</tr>');
    end;
  writeln(sub, '</table>');

  OknoIntervalu.Close;

  writeln(sub, '<br>');

  writeln(sub, '<h2>');
  writeln(sub, 'Meteors');
  writeln(sub, '</h2');

  writeln(sub, '<table border="1" cellpadding="1">');
  for J:=0 to (pozorovanie.tabulka.count div 10)-1 do
    begin
      I:=J*10;
      writeln(sub, '<tr>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I]);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I+1]);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I+2]);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I+3]);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I+4]);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I+5]);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I+6]);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I+7]);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I+8]);
      writeln(sub, '</td>');
      writeln(sub, '<td>');
      writeln(sub, pozorovanie.Tabulka[I+9]);
      writeln(sub, '</td>');
      writeln(sub, '</tr>');
    end;

  writeln(sub, '</table>');

  writeln(sub, '<h6>');
  writeln(sub, 'Generated by '+menoprogramu+' software, Michal �tefan��k 2007-2011');
  writeln(sub, '</h6>');
  writeln(sub, '</body>');
  writeln(sub, '</html>');
  closefile(sub);
end;

end;

procedure TMain.TXTInputClick(Sender: TObject);
var
  sub: TextFile;
  I,J,K,z: integer;
begin
if TXTsaveDialog.Execute=true
  then
begin
  assignFile(sub, TXTSaveDialog.FileName);
  rewrite(sub);

  write(sub, 'Date: ');
  writeln(sub, pozorovanie.datum);

  write(sub, 'Begin: ');
  writeln(sub, pozorovanie.zaciatokH+':'+pozorovanie.zaciatokM);
  write(sub, 'End: ');
  writeln(sub, pozorovanie.koniecH+':'+pozorovanie.koniecM);
  write(sub, 'Place: ');
  writeln(sub, pozorovanie.miesto.meno);

  write(sub, 'Longitude: ');
  write(sub, pozorovanie.miesto.dlzkaH+'H ');
  write(sub, pozorovanie.miesto.dlzkaM+'M ');
  write(sub, pozorovanie.miesto.dlzkaS+'S ');
  writeln(sub, pozorovanie.miesto.dlzkaP);

  write(sub, 'Latitude: ');
  write(sub, pozorovanie.miesto.sirkaH+'H ');
  write(sub, pozorovanie.miesto.sirkaM+'M ');
  write(sub, pozorovanie.miesto.sirkaS+'S ');
  writeln(sub, pozorovanie.miesto.sirkaP);
  write(sub, 'Country: ');
  writeln(sub, pozorovanie.miesto.stat);
  write(sub, 'Altitude: ');
  writeln(sub, pozorovanie.miesto.vyska);
  write(sub, 'IMO code: ');
  writeln(sub, pozorovanie.miesto.imoKod );
  writeln(sub, '');
  writeln(sub, 'Showers');
  writeln(sub, 'Code  Rec   Dec   Da    Dd    f    name');
  for I:=1 to pozorovanie.RojPocet do
    begin
      write(sub, pozorovanie.roje[I].imocod+'   ');
      write(sub, pozorovanie.roje[I].rec+'   ' );
      write(sub, pozorovanie.roje[I].dec+'   ' );
      write(sub, pozorovanie.roje[I].da+'   ');
      write(sub, pozorovanie.roje[I].dd+'   ');
      write(sub, pozorovanie.roje[I].f+'  ');
      write(sub, pozorovanie.roje[I].meno);
      writeln(sub, '');
    end;

  writeln(sub, '');
  writeln(sub, 'Observers');

  for I:=1 to pozorovanie.pozPocet do
    begin
      write(sub, pozorovanie.pozorovatel[I].ImoCislo+'   ');
      write(sub, pozorovanie.pozorovatel[I].ImoKod+'   ');
      write(sub, pozorovanie.pozorovatel[I].meno);
      for z:=1 to 12-length(pozorovanie.pozorovatel[I].meno) do
        write(sub, ' ');
      write(sub, pozorovanie.pozorovatel[I].priezvisko+'   ');
      writeln(sub, '');
    end;

  writeln(sub, '');
  writeln(sub, 'Intervals');

  for I:=1 to pozorovanie.IntPocet do
  for J:=1 to pozorovanie.intervaly[I].PozPocet do
    begin
      writeln(sub, '');
      writeln(sub, 'Period         n.     Rec   dec');
      write(sub, pozorovanie.intervaly[I].zacH+':');
      write(sub, pozorovanie.intervaly[I].zacM+'-');
      write(sub, pozorovanie.intervaly[I].konH+':');
      write(sub, pozorovanie.intervaly[I].konM+'    ');
      write(sub, pozorovanie.intervaly[I].pozorovatelia[J].cislo+'   ');
      write(sub, pozorovanie.intervaly[I].pozorovatelia[J].stred+'   ');
      write(sub, inttostr(pozorovanie.intervaly[I].pozorovatelia[J].StredRec)+'   ');
      write(sub, inttostr(pozorovanie.intervaly[I].pozorovatelia[J].StredDec));
      writeln(sub, '');
      writeln(sub, '');
      writeln(sub, '       Limit magnitudes');
      for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
        begin
          write(sub, '       ');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hod+':');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].min+'   ');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].limitka);
          writeln(sub, '');
        end;

      writeln(sub, '');
      writeln(sub, '       Breaks');
      for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].brkPocet do
        begin
          write(sub, '       ');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].zacH+':');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].zacM+'-');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].konH+':');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM);
          writeln(sub, '');
        end;

       writeln(sub, '');
       writeln(sub, '       Clouds');
       for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].cldPocet do
        begin
          write(sub, '       ');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].zacH+':');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].zacM+'-');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].konH+':');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM+'   ');
          write(sub, pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].percenta);
          writeln(sub, '');
        end;
    end;

  writeln(sub,'');
  writeln(sub, 'Meteors');
  for J:=0 to (pozorovanie.tabulka.count div 10)-1 do
    begin
      I:=J*10;
      write(sub, pozorovanie.tabulka[I]+'  ');
      for z:=1 to 3-length(pozorovanie.tabulka[I]) do
        write(sub, ' ');
      write(sub, pozorovanie.tabulka[I+1]+'  ');
      for z:=1 to 2-length(pozorovanie.tabulka[I+1]) do
        write(sub, ' ');
      write(sub, pozorovanie.tabulka[I+2]+'  ');
      for z:=1 to 2-length(pozorovanie.tabulka[I+2]) do
        write(sub, ' ');
      write(sub, pozorovanie.tabulka[I+3]+'  ');
      for z:=1 to 2-length(pozorovanie.tabulka[I+3]) do
        write(sub, ' ');
      write(sub, pozorovanie.tabulka[I+4]+'  ');
      for z:=1 to 2-length(pozorovanie.tabulka[I+4]) do
        write(sub, ' ');
      write(sub, pozorovanie.tabulka[I+5]+'  ');
      for z:=1 to 2-length(pozorovanie.tabulka[I+5]) do
        write(sub, ' ');
      write(sub, pozorovanie.tabulka[I+6]+'  ');
      for z:=1 to 4-length(pozorovanie.tabulka[I+6]) do
        write(sub, ' ');
      write(sub, pozorovanie.tabulka[I+7]+'  ');
      for z:=1 to 2-length(pozorovanie.tabulka[I+7]) do
        write(sub, ' ');
      write(sub, pozorovanie.tabulka[I+8]+'  ');
      for z:=1 to 2-length(pozorovanie.tabulka[I+8]) do
        write(sub, ' ');
      write(sub, pozorovanie.tabulka[I+9]+'  ');

      writeln(sub, '');
    end;

  closefile(sub);
end;
end;

procedure TMain.TXTOutputClick(Sender: TObject);
var
  sub: TextFile;
  I: integer;
begin
if TXTsaveDialog.Execute=true
  then
if pozorovanie.Tested=true
  then
begin
  OknoStatistiky:=TOknoStatistiky.Create(Application);
  assignFile(sub, TXTSaveDialog.FileName);
  rewrite(sub);
  write(sub, 'Date: ');
  writeln(sub, pozorovanie.datum);

  write(sub, 'Begin: ');
  writeln(sub, pozorovanie.zaciatokH+':'+pozorovanie.zaciatokM);
  write(sub, 'End: ');
  writeln(sub, pozorovanie.koniecH+':'+pozorovanie.koniecM);
  write(sub, 'Place: ');
  writeln(sub, pozorovanie.miesto.meno);

  write(sub, 'Longitude: ');
  write(sub, pozorovanie.miesto.dlzkaH+'H ');
  write(sub, pozorovanie.miesto.dlzkaM+'M ');
  write(sub, pozorovanie.miesto.dlzkaS+'S ');
  writeln(sub, pozorovanie.miesto.dlzkaP);

  write(sub, 'Latitude: ');
  write(sub, pozorovanie.miesto.sirkaH+'H ');
  write(sub, pozorovanie.miesto.sirkaM+'M ');
  write(sub, pozorovanie.miesto.sirkaS+'S ');
  writeln(sub, pozorovanie.miesto.sirkaP);

  write(sub, 'Altitude: ');
  writeln(sub, pozorovanie.miesto.vyska);
  write(sub, 'IMO code: ');
  writeln(sub, pozorovanie.miesto.imoKod );
  writeln(sub, '');

  writeln(sub, 'Summary report');
  writeln(sub, Oknostatistiky.LabelZHR.caption);
  writeln(sub, Oknostatistiky.LabelSporZHR.caption);
  writeln(sub, Oknostatistiky.LabelTeff.caption);
  writeln(sub, Oknostatistiky.LabelRojove.caption);
  writeln(sub, Oknostatistiky.LabelSporadicke.caption);
  writeln(sub, Oknostatistiky.LabelLimitna.caption);
  writeln(sub, Oknostatistiky.LabelMraky.caption);
  writeln(sub, '');
  writeln(sub, 'Recorder statistics');
  writeln(sub, Oknostatistiky.Label2.caption);
  writeln(sub, Oknostatistiky.Label9.caption);
  writeln(sub, Oknostatistiky.Label10.caption);
  writeln(sub, Oknostatistiky.Label11.caption);

  writeln(sub, '');

  writeln(sub, 'Showers');
  writeln(sub, 'Code  Rec   Dec   Da    Dd    f    name');
  for I:=1 to pozorovanie.RojPocet do
    begin
      write(sub, pozorovanie.roje[I].imocod+'   ');
      write(sub, pozorovanie.roje[I].rec+'   ' );
      write(sub, pozorovanie.roje[I].dec+'   ' );
      write(sub, pozorovanie.roje[I].da+'   ');
      write(sub, pozorovanie.roje[I].dd+'   ');
      write(sub, pozorovanie.roje[I].f+'  ');
      write(sub, pozorovanie.roje[I].meno);
      writeln(sub, '');
    end;

  writeln(sub, '');

  writeln(sub, 'Observers statistics');
  for I:=1 to pozorovanie.pozPocet do
    begin
      OknoStatistiky.PozorovatelCreate(OknoStatistiky.IMOTabs.TabIndex+1);

      writeln(sub, '');
      writeln(sub, 'Observer '+inttostr(I));
      writeln(sub, pozorovatel[I-1].LabelMeno.caption);
      writeln(sub, pozorovatel[I-1].LabelPriezvisko.caption);
      writeln(sub, pozorovatel[I-1].LabelIMOKod.caption);
      writeln(sub, pozorovatel[I-1].LabelIMOCislo.caption);
      writeln(sub, pozorovatel[I-1].LabelRojove.caption);
      writeln(sub, pozorovatel[I-1].LabelSporadicke.caption);
      writeln(sub, pozorovatel[I-1].LabelZHR.caption);
      writeln(sub, pozorovatel[I-1].LabelSporZHR.caption);
      writeln(sub, pozorovatel[I-1].LabelTeff.caption);
      writeln(sub, pozorovatel[I-1].LabelLimitka.caption);
      writeln(sub, pozorovatel[I-1].LabelCloudy.caption);
      writeln(sub, pozorovatel[I-1].LabelPocPrestavok.caption);
      writeln(sub, pozorovatel[I-1].LabelBreaky.caption);
    end;

  closefile(sub);
  OknoStatistiky.Close;
end
else
  showmessage('File wasn'+char(39)+'t tested');

end;
procedure TMain.HTMLOutputClick(Sender: TObject);
var
  sub: TextFile;
  I,J: integer;
begin

if HTMLSaveDialog.Execute=true
  then
if pozorovanie.Tested=true
  then
begin
  assignFile(sub, HTMLSaveDialog.FileName);
  rewrite(sub);

  writeln(sub, '<html>');
  writeln(sub, '<head>');
  writeln(sub, '<meta http-equiv="content-type" content="text/html; charset=windows-1250">');
  writeln(sub, '<meta name="generator" content="WIMPS editor, Michal Stefancik 2007-2010">');
  writeln(sub, '<title>Output file</title>');
  writeln(sub, '<style>');
  writeln(sub, 'div {border:solid 1px; padding:10px; margin-right: 30%}');
  writeln(sub, '</style>');
  writeln(sub, '</head>');
  writeln(sub, '<body style="font-family: Arial">');

  writeln(sub, '<h1>');
  writeln(sub, 'Summary report');
  writeln(sub, '</h1>');

  writeln(sub, '<h3>');
  writeln(sub, 'Header');
  writeln(sub, '</h3>');
  writeln(sub, '<div>');

  write(sub, 'Date: ');
  writeln(sub, pozorovanie.datum);

  write(sub, 'Begin: ');
  write(sub, pozorovanie.zaciatokH+':'+pozorovanie.zaciatokM+' ');
  write(sub, 'End: ');
  writeln(sub, pozorovanie.koniecH+':'+pozorovanie.koniecM+'<br>');

  writeln(sub, '<h4>');
  writeln(sub, 'Place');
  writeln(sub, '</h4>');

  writeln(sub, pozorovanie.miesto.meno+'<br>');
  write(sub, 'Country: ');
  write(sub, pozorovanie.miesto.stat+'<br>');
  write(sub, 'Longitude: ');
  write(sub, pozorovanie.miesto.dlzkaH+'H ');
  write(sub, pozorovanie.miesto.dlzkaM+'M ');
  write(sub, pozorovanie.miesto.dlzkaS+'S ');
  writeln(sub, pozorovanie.miesto.dlzkaP+'<br>');

  write(sub, 'Latitude: ');
  write(sub, pozorovanie.miesto.sirkaH+'H ');
  write(sub, pozorovanie.miesto.sirkaM+'M ');
  write(sub, pozorovanie.miesto.sirkaS+'S ');
  write(sub, pozorovanie.miesto.sirkaP+'<br>');

  write(sub, 'Altitude: ');
  writeln(sub, pozorovanie.miesto.vyska+'<br>');
  write(sub, 'IMO code: ');
  writeln(sub, pozorovanie.miesto.imoKod );
  writeln(sub, '</div>');

  writeln(sub, '<h3>');
  writeln(sub, 'Results');
  writeln(sub, '</h3>');
  OknoStatistiky:=TOknoStatistiky.Create(application);
  writeln(sub, '<div>');

  writeln(sub, Oknostatistiky.LabelZHR.caption+'<br>');
  writeln(sub, Oknostatistiky.LabelSporZHR.caption+'<br>');
  writeln(sub, Oknostatistiky.LabelTeff.caption+'<br>');
  writeln(sub, Oknostatistiky.LabelRojove.caption+'<br>');
  writeln(sub, Oknostatistiky.LabelSporadicke.caption+'<br>');
  writeln(sub, Oknostatistiky.LabelLimitna.caption+'<br>');
  writeln(sub, Oknostatistiky.LabelMraky.caption+'<br>');
  writeln(sub, '</div>');

  writeln(sub, '<h3>');
  writeln(sub, 'Recorder statistics');
  writeln(sub, '</h3>');

  writeln(sub, '<div >');
  writeln(sub, Oknostatistiky.Label2.caption+'<br>');
  writeln(sub, Oknostatistiky.Label9.caption+'<br>');
  writeln(sub, Oknostatistiky.Label10.caption+'<br>');
  writeln(sub, Oknostatistiky.Label11.caption+'<br>');
  writeln(sub, '</div>');

  if pref.ContVyskaRADiantu=true
  then
  begin
  writeln(sub, '<h3>');
  writeln(sub, 'Shower info');
  writeln(sub, '</h3>');
  writeln(sub, '<div>');
  for I:=1 to pozorovanie.RojPocet do
    begin
    shower[I-1].Graf.SaveToBitmapFile(ExtractFilePath(HTMLSaveDialog.FileName)+'GrafShower'+inttostr(I)+'.bmp');
    write(sub, '<img src="GrafShower'+inttostr(I));
    writeln(sub, '.bmp" align="right">');
      for J:=0 to 10 do
        writeln(sub, shower[I-1].info.items[J] +'<br>');
    end;
  writeln(sub, '</div>');
  end;

  if pref.ContRastZhr=true
  then
  begin
  writeln(sub, '<h3>');
  writeln(sub, 'ZHR graph');
  writeln(sub, '</h3>');

  writeln(sub, '<div>');
  ZHRGraf.SaveToBitmapFile(ExtractFilePath(HTMLSaveDialog.FileName)+'ZHRGraf.bmp');
  writeln(sub, '<img src="ZHRGraf.bmp">');
  writeln(sub, '</div>');
  end;

  if pref.ContLimitky =true
  then
  begin
  writeln(sub, '<h3>');
  writeln(sub, 'Limit magnitudes graph');
  writeln(sub, '</h3>');

  writeln(sub, '<div>');
  LimitkyGraf.SaveToBitmapFile(ExtractFilePath(HTMLSaveDialog.FileName)+'LimitsGraf.bmp');
  writeln(sub, '<img src="LimitsGraf.bmp">');
  writeln(sub, '</div>');
  end;

  if pref.ContFrekvenciaZHR =true
  then
  begin
  writeln(sub, '<h3>');
  writeln(sub, 'Minute frequency of meteors');
  writeln(sub, '</h3>');

  writeln(sub, '<div>');
  FrekvenciaGraf.SaveToBitmapFile(ExtractFilePath(HTMLSaveDialog.FileName)+'FreqGraf.bmp');
  writeln(sub, '<img src="FreqGraf.bmp">');
  writeln(sub, '</div>');
  end;

  if pref.ContPoctyMeteorov=true
  then
  begin
  writeln(sub, '<h3>');
  writeln(sub, 'Meteors diagrams');
  writeln(sub, '</h3>');

  writeln(sub, '<div>');
   writeln(sub, '<h4>');
  writeln(sub, 'Shower');
  writeln(sub, '</h4>');
  PoctyMeteorovGraf.SaveToBitmapFile(ExtractFilePath(HTMLSaveDialog.FileName)+'MetGraf.bmp');
  writeln(sub, '<img src="MetGraf.bmp">');
   writeln(sub, '<h4>');
  writeln(sub, 'Sporadic');
  writeln(sub, '</h4>');
  PoctySMeteorovGraf.SaveToBitmapFile(ExtractFilePath(HTMLSaveDialog.FileName)+'MetSGraf.bmp');
  writeln(sub, '<img src="MetSGraf.bmp">');

  writeln(sub, '</div>');
  end;

  if pref.ContPrestavky=true
  then
  begin
  writeln(sub, '<h3>');
  writeln(sub, 'Effective time diagrams');
  writeln(sub, '</h3>');

  writeln(sub, '<div>');
   writeln(sub, '<h4>');
  writeln(sub, 'Breaks diagram');
  writeln(sub, '</h4>');
  PrestavkyGraf.SaveToBitmapFile(ExtractFilePath(HTMLSaveDialog.FileName)+'BrkGraf.bmp');
  writeln(sub, '<img src="BrkGraf.bmp">');
   writeln(sub, '<h4>');
  writeln(sub, 'Teff diagram');
  writeln(sub, '</h4>');
  TeffGraf.SaveToBitmapFile(ExtractFilePath(HTMLSaveDialog.FileName)+'TeffGraf.bmp');
  writeln(sub, '<img src="TeffGraf.bmp">');
  writeln(sub, '</div>');

  end;

  for I:=1 to pozorovanie.pozPocet do
    begin
    writeln(sub, '<h3>');
    writeln(sub, 'Observer '+inttostr(I));
    writeln(sub, '</h3>');
    writeln(sub, '<div>');
      writeln(sub, pozorovatel[I-1].LabelMeno.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelPriezvisko.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelIMOKod.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelIMOCislo.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelRojove.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelSporadicke.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelZHR.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelSporZHR.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelTeff.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelLimitka.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelCloudy.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelPocPrestavok.caption+'<br>');
      writeln(sub, pozorovatel[I-1].LabelBreaky.caption+'<br>');
    writeln(sub, '</div>');
    end;

  writeln(sub, '</body>');
  writeln(sub, '</html>');

  OknoStatistiky.Close;
  closeFile(sub);
end
else
  showmessage('File wasn'+char(39)+'t tested');
end;

procedure TMain.IMOprotocol2Click(Sender: TObject);
var
  sub: TextFile;
  I,J,K,z: integer;
begin
if TXTsaveDialog.Execute=true
  then
if pozorovanie.Tested=true
  then
begin
OknoStatistiky:=TOknoStatistiky.Create(Application);
assignFile(sub, TXTSaveDialog.FileName);
rewrite(sub);
writeln(sub, 'IMO PROTOCOL');
writeln(sub, '');
writeln(sub, '');
for I:=1 to pozorovanie.pozPocet do
begin
  OknoStatistiky.PozorovatelCreate(I);
  writeln(sub, 'Observer '+inttostr(I));
  writeln(sub, '');
  write(sub, pozorovanie.pozorovatel[I].imocislo+' ');
  write(sub, pozorovanie.pozorovatel[I].meno+' ');
  write(sub, pozorovanie.pozorovatel[I].priezvisko+' ');
  writeln(sub, pozorovanie.pozorovatel[I].imokod+' ');
  writeln(sub, '');

  write(sub, 'Date: ');
  writeln(sub, pozorovanie.datum);

  write(sub, 'Begin: ');
  writeln(sub, pozorovanie.zaciatokH+':'+pozorovanie.zaciatokM);
  write(sub, 'End: ');
  writeln(sub, pozorovanie.koniecH+':'+pozorovanie.koniecM);
  write(sub, 'Place: ');
  writeln(sub, pozorovanie.miesto.meno);

  write(sub, 'Longitude: ');
  write(sub, pozorovanie.miesto.dlzkaH+'H ');
  write(sub, pozorovanie.miesto.dlzkaM+'M ');
  write(sub, pozorovanie.miesto.dlzkaS+'S ');
  writeln(sub, pozorovanie.miesto.dlzkaP);

  write(sub, 'Latitude: ');
  write(sub, pozorovanie.miesto.sirkaH+'H ');
  write(sub, pozorovanie.miesto.sirkaM+'M ');
  write(sub, pozorovanie.miesto.sirkaS+'S ');
  writeln(sub, pozorovanie.miesto.sirkaP);

  write(sub, 'Altitude: ');
  writeln(sub, pozorovanie.miesto.vyska);
  write(sub, 'IMO code: ');
  writeln(sub, pozorovanie.miesto.imoKod );
  writeln(sub, '');

  writeln(sub, 'Showers');
  writeln(sub, 'Code  Rec   Dec   Da    Dd    f    name');
  for J:=1 to pozorovanie.RojPocet do
    begin
      write(sub, pozorovanie.roje[J].imocod+'   ');
      write(sub, pozorovanie.roje[J].rec+'   ' );
      write(sub, pozorovanie.roje[J].dec+'   ' );
      write(sub, pozorovanie.roje[J].da+'   ');
      write(sub, pozorovanie.roje[J].dd+'   ');
      write(sub, pozorovanie.roje[J].f+'  ');
      write(sub, pozorovanie.roje[J].meno);
      writeln(sub, '');
    end;
  writeln(sub, '');

  write(sub, 'Periods      Rec    Dec   Teff  F     Lim   ');
      for J:=1 to pozorovanie.RojPocet do
        write(sub, pozorovanie.roje[J].ImoCod+'   ');
      writeln(sub, 'SPO');

      for J:=0 to oknostatistiky.PeriodsGrid.RowCount-1 do
        begin
          for K:=0 to 6+pozorovanie.RojPocet do
            begin
              write(sub, oknostatistiky.PeriodsGrid.cells[K,J]+'  ');
              for z:=1 to 4-length(oknostatistiky.PeriodsGrid.cells[K,J]) do
                write(sub, ' ');
            end;
        writeln(sub, '');
      end;

      writeln(sub, '');
      writeln(sub, '=========================================================================================================');
      writeln(sub, 'Shw   Periods      -6    -5    -4    -3    -2    -1     0    +1    +2    +3    +4    +5    +6    +7   Tot');
      writeln(sub, '=========================================================================================================');
      for J:=0 to oknostatistiky.MagnitudeDistributionsGrid.RowCount-1 do
        begin
          for K:=0 to 16 do
            begin
              write(sub, oknostatistiky.MagnitudeDistributionsGrid.cells[K,J]+'  ');
              for z:=1 to 4-length(oknostatistiky.MagnitudeDistributionsGrid.cells[K,J]) do
                write(sub, ' ');
            end;
        writeln(sub, '');
      end;
       writeln(sub, '---------------------------------------------------------------------------------------------------------');
    end;
    write(sub, '');
    write(sub, '');
    closefile(sub);
    OknoStatistiky.Close;
end
  else
    showmessage('File wasn'+char(39)+'t tested');
end;

procedure TMain.IMOprotocol1Click(Sender: TObject);
var
  sub: TextFile;
  I,J,K: integer;
begin
if HTMLsaveDialog.Execute=true
  then
if pozorovanie.Tested=true
  then
begin
  OknoStatistiky:=TOknoStatistiky.Create(Application);
  assignFile(sub, HTMLSaveDialog.FileName);
  rewrite(sub);
  writeln(sub, '<html>');
  writeln(sub, '<head>');
  writeln(sub, '<meta http-equiv="content-type" content="text/html; charset=windows-1250">');
  writeln(sub, '<meta name="generator" content="WIMPS editor, Michal Stefancik 2007-2010">');
  writeln(sub, '<title>IMO visual observation report form</title>');
  writeln(sub, '</head>');
  writeln(sub, '<body style="font-family: Arial">');

  writeln(sub, '<h1>');
  writeln(sub, 'IMO visual observation report form');
  writeln(sub, '</h1>');

for I:=1 to pozorovanie.pozPocet do
begin
  OknoStatistiky.PozorovatelCreate(I);
  writeln(sub, '<div class="main-content" id="content-left">');

  writeln(sub, '<h2>');
  writeln(sub, 'Observer '+inttostr(I));
  writeln(sub, '</h2>');

  writeln(sub, '<div class="node">');
  writeln(sub, '<div class="content">');
  writeln(sub, '<style type="text/css">');
  writeln(sub, 'td {text-align:center; vertical-align:top; padding: 0.3em; margin: 0em;}');
  writeln(sub, '.PeriodInput {margin: 0.15em;padding: 0.1em;text-align:center;background-color:#EFEEF7;	border: 1px solid #FFFFFF;border-bottom: 1px solid #0000CD;	color:#0000CD;}');
  writeln(sub, '.InputReadonly {text-align:center;background-color:#FFF;border: 0 solid;border-bottom: 1px solid;border-color:#000;	color:#000;}');
  writeln(sub, '.BottomBorder {	border-bottom-width:1px;border-bottom-style:solid;border-color:#000;}	');
  writeln(sub, '.LeftBorder {border-left-width:1px;border-left-style:solid;border-color:#000;}');
  writeln(sub, '</style>');
  writeln(sub, '<div style="margin-left: 1em;">');
  writeln(sub, '<div style="margin-top: 1em;">');
  writeln(sub, '<h3>Observer details</h3>');
  writeln(sub, 'First name(s):');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.pozorovatel[I].meno);
  writeln(sub, '"style="width: 10.2em; text-align: left;" class="PeriodInput">.');
  writeln(sub, 'Family name(s):');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.pozorovatel[I].priezvisko);
  writeln(sub, '" style="width: 13.2em; text-align: left;" class="PeriodInput">.');
  writeln(sub, '<br>');
  writeln(sub, 'Country:');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.stat);
  writeln(sub, '" style="width: 19.5em; text-align: left;" class="PeriodInput">.');
  writeln(sub, 'IMO Code:');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.pozorovatel[I].imocislo);
  writeln(sub, '" style="width: 12.3em; text-align: left;" class="PeriodInput">.');
  writeln(sub, '</div>');
  writeln(sub, '<div style="margin-top: 2em;">');
  writeln(sub, '<h3>Observing location</h3>');
  writeln(sub, 'Longitude:');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.dlzkaH);
  writeln(sub, '"style="width: 1.8em;" class="PeriodInput">�');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.dlzkaM);
  writeln(sub, '"style="width: 1.8em;" class="PeriodInput">"');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.dlzkaS);
  writeln(sub, '"style="width: 1.8em;" class="PeriodInput">');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.dlzkaP);
  writeln(sub, '"style="width: 1.8em;" class="PeriodInput">');
  writeln(sub, '. Latitude:');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.SirkaH);
  writeln(sub, '"style="width: 1.8em;" class="PeriodInput">�');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.SirkaM);
  writeln(sub, '"style="width: 1.8em;" class="PeriodInput">"');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.SirkaS);
  writeln(sub, '"style="width: 1.8em;" class="PeriodInput">');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.SirkaP);
  writeln(sub, '"style="width: 1.8em;" class="PeriodInput">');
  writeln(sub, '. Height:');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.vyska);
  writeln(sub, '" style="width: 3em;" class="PeriodInput">m.');
  writeln(sub, '<br>');
  writeln(sub, 'Name:');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.meno);
  writeln(sub, '" style="width: 14.9em; text-align: left;" class="PeriodInput">.');
  writeln(sub, 'Country:');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.stat);
  writeln(sub, '"style="width: 11.4em; text-align: left;" class="PeriodInput">.');
  writeln(sub, 'IMO Code:');
  write  (sub, '<input value="');
  write  (sub, pozorovanie.miesto.imokod);
  writeln(sub, '" style="width: 4em;" class="PeriodInput">.');
  writeln(sub, '</div>');
  writeln(sub, '<div style="margin-top: 2em;">');
  writeln(sub, '<h3>Date</h3>');
  writeln(sub, 'Night (Local Time):');
  write  (sub, '<input value="');
  write  (sub, inttostr(dayOf(strtodate(pozorovanie.Datum))));
  writeln(sub, '" style="width: 2.7em;" class="PeriodInput"> ');
  writeln(sub, '/');
  write  (sub, '<input value="');
  write  (sub, inttostr(dayOf(strtodate(pozorovanie.Datum))+1));
  writeln(sub, '" style="width: 2.7em;" class="PeriodInput"> ');
  writeln(sub, '(dd<sub>1</sub>/dd<sub>2</sub>),');
  write  (sub, '<input value="');
  write  (sub, inttostr(MonthOf(strtodate(pozorovanie.Datum))));
  writeln(sub, '" style="width: 2.7em;" class="PeriodInput">');
  writeln(sub, '(mm<sub>1</sub>),');
  write  (sub, '<input value="');
  write  (sub, inttostr(YearOf(strtodate(pozorovanie.Datum))));
  writeln(sub, '" style="width: 4.3em;" class="PeriodInput">');
  writeln(sub, '(yyyy<sub>1</sub>).');
  writeln(sub, ' </div>');
  writeln(sub, '<div style="margin-top: 2em;">');
  writeln(sub, 'Observation begin (Universal Time):');
  writeln(sub, '<input value="');
  writeln(sub, pozorovanie.zaciatokH+pozorovanie.zaciatokM);
  writeln(sub, '" style="width: 3.3em;"class="PeriodInput">');
  writeln(sub, '(hhmm),');
  write  (sub, '<input value="');
  write  (sub, inttostr(dayOf(strtodate(pozorovanie.Datum))));
  writeln(sub, '" style="width: 2.7em;" class="PeriodInput"> ');
  writeln(sub, '(dd),');
  write  (sub, '<input value="');
  write  (sub, inttostr(MonthOf(strtodate(pozorovanie.Datum))));
  writeln(sub, '" style="width: 2.7em;" class="PeriodInput">');
  writeln(sub, '(mm),');
  write  (sub, '<input value="');
  write  (sub, inttostr(YearOf(strtodate(pozorovanie.Datum))));
  writeln(sub, '" style="width: 4.3em;" class="PeriodInput">');
  writeln(sub, '(yyyy).');
  writeln(sub, '<br>');
  writeln(sub, 'Observation end (Universal Time):');
  write  (sub, '<input value="');
  writeln(sub, pozorovanie.koniecH+pozorovanie.koniecM);
  writeln(sub, '"style="width: 3.3em;"class="PeriodInput">');
  writeln(sub, '(hhmm),');
  J:=0;
  if (strtoint(pozorovanie.zaciatokH)+strtoint(pozorovanie.zaciatokM)/60)>
     (strtoint(pozorovanie.koniecH)+strtoint(pozorovanie.koniecM)/60)
    then
      J:=1;
  write  (sub, '<input value="');
  write  (sub, inttostr(dayOf(strtodate(pozorovanie.Datum))+J));
  writeln(sub, '" style="width: 2.7em;" class="PeriodInput"> ');
  writeln(sub, '(dd),');
  write  (sub, '<input value="');
  write  (sub, inttostr(MonthOf(strtodate(pozorovanie.Datum))));
  writeln(sub, '" style="width: 2.7em;" class="PeriodInput">');
  writeln(sub, '(mm),');
  write  (sub, '<input value="');
  write  (sub, inttostr(YearOf(strtodate(pozorovanie.Datum))));
  writeln(sub, '" style="width: 4.3em;" class="PeriodInput">');
  writeln(sub, '(yyyy).');
  writeln(sub, '</div>');
  writeln(sub, '<div style="margin-top: 2em;">');
  writeln(sub, '<h3>Showers</h3>');
  writeln(sub, '<table style="float: left; margin-right: 0.6em; border: 1px solid rgb(0, 0, 0);" cellpadding="5" cellspacing="0">');
  writeln(sub, '<thead>');
  writeln(sub, '<tr>');
  writeln(sub, '<td class="BottomBorder">Shower</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">R.A.</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">Dec.</td>');
  writeln(sub, '</tr>');
  writeln(sub, '</thead>');
  writeln(sub, '<tbody>');
  for J:=0 to pozorovanie.RojPocet-1 do
    begin
      writeln(sub, '<tr>');
      writeln(sub, '<td>');
      write  (sub, '<input value="');
      write  (sub, oknostatistiky.ShowerGrid.cells[0,J]);
      writeln(sub, '"style="width: 3em;" class="PeriodInput">');
      writeln(sub, '</td>');
      writeln(sub, '<td class="LeftBorder">');
      write  (sub, '<input value="');
      write  (sub, oknostatistiky.ShowerGrid.cells[1,J]);
      writeln(sub, '" style="width:2em;" class="PeriodInput" type="text">�');
      writeln(sub, '</td>');
      writeln(sub, '<td class="LeftBorder">');
      write  (sub, '<input value="');
      write  (sub, oknostatistiky.ShowerGrid.cells[2,J]);
      writeln(sub, '" style="width:2em;" class="PeriodInput" type="text">�');
      writeln(sub, '</td>');
      writeln(sub, '</td>');
      writeln(sub, '</tr>');
    end;
  writeln(sub, '</tbody>');
  writeln(sub, '</table>');
  writeln(sub, '</div>');
  writeln(sub, '<br style="clear: left;">');
  writeln(sub, '<h3>Periods</h3>');
  writeln(sub, '<table style="padding: 0em; margin: 0em; border: 1px solid rgb(0, 0, 0);" cellspacing="0">');
  writeln(sub, '<thead>');
  writeln(sub, '<tr>');
  writeln(sub, '<td colspan="3">Period (UT)</td>');
  writeln(sub, '<td colspan="2" class="LeftBorder BottomBorder">Field (�)</td>');
  writeln(sub, '<td class="LeftBorder">Teff</td>');
  writeln(sub, '<td rowspan="2" class="BottomBorder LeftBorder">F</td>');
  writeln(sub, '<td rowspan="2" class="BottomBorder LeftBorder">Lm</td>');
  for J:=1 to pozorovanie.rojpocet do
    begin
      writeln(sub, '<td colspan="2" class="BottomBorder LeftBorder">');
      write  (sub, '<input value="');
      write  (sub, pozorovanie.roje[J].imocod);
      writeln(sub, '" style="width: 3em;" readonly="readonly" class="InputReadonly">');
      writeln(sub, '</td>');
    end;
  writeln(sub, '<td colspan="2" class="BottomBorder LeftBorder">');
  writeln(sub, '<input value="SPO" style="width: 3em;"readonly="readonly" class="InputReadonly">');
  writeln(sub, '</td>');
  writeln(sub, '</tr>');
  writeln(sub, '<tr>');
  writeln(sub, '<td colspan="3" class="BottomBorder"><sup>hhmm</sup> - <sup>hhmm</sup></td>');
  writeln(sub, '<td class="BottomBorder LeftBorder">RA</td>');
  writeln(sub, '<td class="BottomBorder LeftBorder">Dec</td>');
  writeln(sub, '<td class="BottomBorder LeftBorder"><sup>h</sup></td>');
  for J:=0 to pozorovanie.RojPocet do
    begin
      writeln(sub, '<td class="BottomBorder LeftBorder">M</td>');
      writeln(sub, '<td class="BottomBorder LeftBorder">N</td>');
    end;
  writeln(sub, '</tr>');
  writeln(sub, '</thead>');
  writeln(sub, '<tbody>');
  for J:=0 to oknostatistiky.PeriodsGrid.RowCount-1 do
    begin
      writeln(sub, '<tr>');

      writeln(sub, '<td>');

      writeln(sub, '<input value="');
      writeln(sub, oknostatistiky.periodsGrid.cells[0,J]);

      writeln(sub, '"style="width: 5.7em;" class="PeriodInput"type="text">');
      writeln(sub, '</td>');
      writeln(sub, '<td style="padding-left: 0pt; padding-right: 0pt;"></td>');
      writeln(sub, '<td>');
      writeln(sub, '</td>');


      writeln(sub, '<td class="LeftBorder">');
      writeln(sub, '<input value="');
      writeln(sub, oknostatistiky.periodsGrid.cells[1,J]);
      writeln(sub, '"style="width: 2em;" class="PeriodInput"type="text">');
      writeln(sub, '</td>');

      writeln(sub, '<td class="LeftBorder">');
      writeln(sub, '<input value="');
      writeln(sub, oknostatistiky.periodsGrid.cells[2,J]);
      writeln(sub, '"style="width: 2em;" class="PeriodInput"type="text">');
      writeln(sub, '</td>');

      writeln(sub, '<td class="LeftBorder">');
      writeln(sub, '<input value="');
      writeln(sub, oknostatistiky.periodsGrid.cells[3,J]);
      writeln(sub, '"style="width: 3em;" class="PeriodInput"type="text">');
      writeln(sub, '</td>');

      writeln(sub, '<td class="LeftBorder">');
      writeln(sub, '<input value="');
      writeln(sub, oknostatistiky.periodsGrid.cells[4,J]);
      writeln(sub, '"style="width: 2.5em;" class="PeriodInput"type="text">');
      writeln(sub, '</td>');

      writeln(sub, '<td class="LeftBorder">');
      writeln(sub, '<input value="');
      writeln(sub, oknostatistiky.periodsGrid.cells[5,J]);
      writeln(sub, '"style="width: 5em;" class="PeriodInput"type="text">');
      writeln(sub, '</td>');

      for K:=0 to pozorovanie.rojpocet do
        begin
          writeln(sub, '<td class="LeftBorder">');
          writeln(sub, '<input value="');
          writeln(sub, 'C');
          writeln(sub, '"style="width: 1em;" class="PeriodInput"type="text">');
          writeln(sub, '</td>');

          writeln(sub, '<td class="LeftBorder">');
          writeln(sub, '<input value="');
          writeln(sub, oknostatistiky.periodsGrid.cells[6+K,J]);
          writeln(sub, '"style="width: 2.5em;" class="PeriodInput"type="text">');
          writeln(sub, '</td>');
        end;
      writeln(sub, '</tr>');
    end;
    
  writeln(sub, '</tbody>');
  writeln(sub, '</table>');
  writeln(sub, '<h3>Magnitude distributions</h3>');
  writeln(sub, '<table style="padding: 0em; margin: 0em; border: 1px solid rgb(0, 0, 0);" cellspacing="0">');
  writeln(sub, '<thead>');
  writeln(sub, '<tr>');
  writeln(sub, '<td class="BottomBorder">Shower</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">Interval</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">-6</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">-5</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">-4</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">-3</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">-2</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">-1</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">0</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">+1</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">+2</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">+3</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">+4</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">+5</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">+6</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">+7</td>');
  writeln(sub, '<td class="LeftBorder BottomBorder">Tot</td>');
  writeln(sub, '</tr>');
  writeln(sub, '</thead>');
  writeln(sub, '<tbody>');
  for J:=0 to oknostatistiky.MagnitudeDistributionsGrid.RowCount-1 do
  begin
    writeln(sub, '<tr>');
    writeln(sub, '<td>');
    writeln(sub, '<input value="');
    writeln(sub, oknoStatistiky.magnitudedistributionsgrid.cells[0,J]);
    writeln(sub, '" style="width: 3em;" class="PeriodInput">');
    writeln(sub, '</td>');

    writeln(sub, '<td class="LeftBorder">');
    writeln(sub, '<input value="');
    writeln(sub, oknoStatistiky.magnitudedistributionsgrid.cells[1,J]);
    writeln(sub, '" style="width: 5.7em;" class="PeriodInput">');
    writeln(sub, '</td>');

    for K:=1 to 15 do
      begin
        writeln(sub, '<td class="LeftBorder">');
        writeln(sub, '<input value="');
        writeln(sub, oknoStatistiky.magnitudedistributionsgrid.cells[K+1,J]);
        writeln(sub, '" style="width: 2.5em;" class="PeriodInput">');
        writeln(sub, '</td>');
      end;

    writeln(sub, '</tr>');
  end;
  writeln(sub, '</tbody>');
  writeln(sub, '</table>');
  writeln(sub, '</div>');
  writeln(sub, '</div>');
  writeln(sub, '</div>');
  writeln(sub, '<div id="footer">');
  writeln(sub, '<h5> Created by '+menoprogramu+' software, Michal �tefan��k 2007-2011</h5>');
  writeln(sub, '</div>');
end;
  writeln(sub, '</body> </html>');

  OknoStatistiky.Close;
  closeFile(sub);
end
  else
    showmessage('File wasn'+char(39)+'t tested');
end;

procedure TMain.ObsahClick(Sender: TObject);
begin
    If HelpOpened = false
    then
      begin
        Help:=THelp.Create(Application);
        HelpOpened:=true;
      end
    else
      Help.BringToFront;
end;

procedure TMain.CopyrightClick(Sender: TObject);
begin
  If aboutOpened = false
    then
      begin
        about:=Tabout.Create(Application);
        aboutOpened:=true;
      end
    else
      about.BringToFront;
end;

end.
