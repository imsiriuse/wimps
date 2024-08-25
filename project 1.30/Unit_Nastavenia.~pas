unit Unit_Nastavenia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Globalne_Premenne, Spin;

type
  TWndNastavenia = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    RBtTrojuholniky: TRadioButton;
    RBtLimitka: TRadioButton;
    Button2: TButton;
    Horiz: TSpinEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox6: TGroupBox;
    RBtSporadicky: TRadioButton;
    Label1: TLabel;
    CBoxRoje: TComboBox;
    GroupBox7: TGroupBox;
    SoStopou: TRadioButton;
    BezStopy: TRadioButton;
    GroupBox8: TGroupBox;
    kvalita: TSpinEdit;
    GroupBox9: TGroupBox;
    ContVyskaRadiantu: TCheckBox;
    ContRastZHR: TCheckBox;
    ContLimitky: TCheckBox;
    ContFrekvenciaZHR: TCheckBox;
    ContPoctyMeteorov: TCheckBox;
    Button3: TButton;
    ContPrestavky: TCheckBox;
    GroupBox4: TGroupBox;
    RedFilter: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CBoxRojeChange(Sender: TObject);
    procedure RBtSporadickyClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WndNastavenia: TWndNastavenia;
  NastaveniaOpened: Boolean;
implementation

{$R *.dfm}

procedure TWndNastavenia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
  NastaveniaOpened:=false;
end;

procedure TWndNastavenia.Button1Click(Sender: TObject);
var
  preferences: File of Tpref;
begin

  if RedFilter.Checked=true
    then
      pref.redfilter:=true
    else
      pref.redfilter:=false;

  if SoStopou.Checked=true
    then
      pref.stopa:='+'
    else
      pref.stopa:='-';

  if RBtTrojuholniky.Checked
    then
      pref.trojuholniky:=true;

  if RBtLimitka.Checked
    then
      pref.trojuholniky:=false;

  if RBtSporadicky.Checked
    then
      pref.rojovost:='-'
    else
      pref.rojovost:=CboxRoje.Text;

  if ContPoctyMeteorov.Checked=true
    then
      pref.ContPoctyMeteorov:=true
    else
      pref.ContPoctyMeteorov:=false;

   if ContPrestavky.Checked=true
    then
      pref.ContPrestavky:=true
    else
      pref.ContPrestavky:=false;

  if ContVyskaRADiantu.Checked=true
    then
      pref.ContVyskaRADiantu:=true
    else
      pref.ContVyskaRADiantu:=false;

  if ContRastZhr.Checked=true
    then
      pref.ContRastZhr:=true
    else
      pref.ContRastZhr:=false;

  if ContLimitky.Checked=true
    then
      pref.ContLimitky:=true
    else
      pref.ContLimitky:=false;

  if ContFrekvenciaZHR.Checked=true
    then
      pref.ContFrekvenciaZHR:=true
    else
      pref.ContFrekvenciaZHR:=false;

  pref.kvalita:=kvalita.Text;
  pref.horizont:=strtoint(horiz.Text);

  assignFile(preferences,extractfilepath(application.ExeName) +  'preferences.dat');
  reset(preferences);
  write(preferences, Pref);
  closefile(preferences);
  close;
end;

procedure TWndNastavenia.FormCreate(Sender: TObject);
var
  I:integer;
begin

  if pref.redfilter=true
    then
      redfilter.Checked:=true
    else
      redFilter.Checked:=false;

  If pref.stopa='+'
    then
      SoStopou.Checked:=true
    else
      BezStopy.Checked:=true;

  if pref.trojuholniky=false
    then
      RBtLimitka.Checked:=true
    else
      RBtTrojuholniky.Checked:=true;

  if pref.ContPoctyMeteorov=true
    then
      ContPoctyMeteorov.Checked:=true
    else
      ContPoctyMeteorov.Checked:=false;

   if pref.ContPrestavky=true
    then
      ContPrestavky.Checked:=true
    else
      ContPrestavky.Checked:=false;

  if pref.ContVyskaRADiantu=true
    then
      ContVyskaRADiantu.Checked:=true
    else
      ContVyskaRADiantu.Checked:=false;
  if pref.ContRastZhr=true
    then
      ContRastZhr.Checked:=true
    else
      ContRastZhr.Checked:=false;
  if pref.ContLimitky=true
    then
      ContLimitky.Checked:=true
    else
      ContLimitky.Checked:=false;
  if pref.ContFrekvenciaZHR=true
    then
      ContFrekvenciaZHR.Checked:=true
    else
      ContFrekvenciaZHR.Checked:=false;

  horiz.Text:=IntToStr(pref.horizont);

  kvalita.Text:=pref.kvalita;

  if pref.rojovost='-'
    then
      rbtSporadicky.Checked:=true;

  for I:=1 to pozorovanie.RojPocet do
    CBoxRoje.Items.Add(pozorovanie.roje[I].Znak);

  if pref.rojovost<>'-'
    then
      for I:=0 to cboxroje.Items.Count-1 do
        begin
          if pref.rojovost=cboxroje.Items[I]
            then
              cboxroje.ItemIndex:=I;
        end;
end;

procedure TWndNastavenia.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TWndNastavenia.CBoxRojeChange(Sender: TObject);
begin
  RBtSporadicky.Checked:=false;
end;

procedure TWndNastavenia.RBtSporadickyClick(Sender: TObject);
begin
  CBoxRoje.ItemIndex:=-1;
end;

procedure TWndNastavenia.Button3Click(Sender: TObject);
begin
  ContFrekvenciaZHR.Checked:=true;
  ContLimitky.Checked:=true;
  ContPoctyMeteorov.Checked:=true;
  ContRastZhr.Checked:=true;
  ContVyskaRADiantu.Checked:=true;
  ContPrestavky.Checked:=true;
end;

end.
