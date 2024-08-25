unit Unit_Intervaly;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NxColumns, NxColumnClasses, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, Globalne_Premenne, Menus;
type
  TEditing = record
    stav: Boolean;
    Row: Integer;
    pos1: Integer;
    pos2: Integer;
    pos3: Integer;
    pos4: Integer;
    pos5: Integer;
end;
type
  TOknoIntervalu = class(TForm)
    Intervaly: TNextGrid;
    NxTreeColumn1: TNxTreeColumn;
    BtAddInt: TButton;
    BtAddObs: TButton;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn4: TNxTextColumn;
    GroupBox1: TGroupBox;
    IntZacH: TEdit;
    IntZacM: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    IntKonH: TEdit;
    Label4: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    IntPoz: TEdit;
    IntStred: TComboBox;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    BtAddBrk: TButton;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    CldZacH: TEdit;
    CldZacM: TEdit;
    CldKonM: TEdit;
    CldKonH: TEdit;
    BtAddCld: TButton;
    CldPer: TEdit;
    Label14: TLabel;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    Label18: TLabel;
    LimCasH: TEdit;
    LimCasM: TEdit;
    BtAddLim: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BrkKonH: TEdit;
    BrkKonM: TEdit;
    BrkZacM: TEdit;
    BrkZacH: TEdit;
    IntKonM: TEdit;
    PMenuIntervaly: TPopupMenu;
    Zmazadaj1: TMenuItem;
    BtEditInt: TButton;
    BtEditObs: TButton;
    BtEditBrk: TButton;
    BtEditCld: TButton;
    BtEditLim: TButton;
    LimLim: TEdit;
    LimTri: TComboBox;
    LimHv: TComboBox;
    Button1: TButton;
    Button2: TButton;
    EdRec: TEdit;
    EdDec: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAddIntClick(Sender: TObject);
    procedure BtAddObsClick(Sender: TObject);
    procedure BtAddBrkClick(Sender: TObject);
    procedure BtAddCldClick(Sender: TObject);
    procedure BtAddLimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Zmazadaj1Click(Sender: TObject);
    procedure IntervalyCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure BtEditIntClick(Sender: TObject);
    procedure BtEditObsClick(Sender: TObject);
    procedure BtEditBrkClick(Sender: TObject);
    procedure BtEditCldClick(Sender: TObject);
    procedure BtEditLimClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IntZacHKeyPress(Sender: TObject; var Key: Char);
    procedure IntZacMKeyPress(Sender: TObject; var Key: Char);
    procedure IntKonHKeyPress(Sender: TObject; var Key: Char);
    procedure IntKonMKeyPress(Sender: TObject; var Key: Char);
    procedure IntPozKeyPress(Sender: TObject; var Key: Char);
    procedure BrkZacHKeyPress(Sender: TObject; var Key: Char);
    procedure BrkZacMKeyPress(Sender: TObject; var Key: Char);
    procedure BrkKonHKeyPress(Sender: TObject; var Key: Char);
    procedure BrkKonMKeyPress(Sender: TObject; var Key: Char);
    procedure CldZacHKeyPress(Sender: TObject; var Key: Char);
    procedure CldZacMKeyPress(Sender: TObject; var Key: Char);
    procedure CldKonHKeyPress(Sender: TObject; var Key: Char);
    procedure CldKonMKeyPress(Sender: TObject; var Key: Char);
    procedure CldPerKeyPress(Sender: TObject; var Key: Char);
    procedure LimCasHKeyPress(Sender: TObject; var Key: Char);
    procedure LimCasMKeyPress(Sender: TObject; var Key: Char);
    procedure LimLimKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EdRecKeyPress(Sender: TObject; var Key: Char);
    procedure EdDecKeyPress(Sender: TObject; var Key: Char);
    procedure IntStredChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OknoIntervalu: TOknoIntervalu;
  OknoIntervaluOpened: Boolean;
  OknoTrojuholnikaOpened: Boolean;
  Editing: TEditing;
  commaCount: integer;
  
implementation

{$R *.dfm}

function StredRec(stred: string):integer;
begin
if stred='And' then result:=15;
if stred='Ant' then result:=150;
if stred='Aps' then result:=225;
if stred='Aqr' then result:=330;
if stred='Aql' then result:=293;
if stred='Ara' then result:=255;
if stred='Ari' then result:=33;
if stred='Aur' then result:=83;
if stred='Boo' then result:=218;
if stred='Cae' then result:=71;
if stred='Cam' then result:=68;
if stred='Cnc' then result:=131;
if stred='CVn' then result:=191;
if stred='CMa' then result:=173;
if stred='CMi' then result:=240;
if stred='Cap' then result:=315;
if stred='Car' then result:=135;
if stred='Cas' then result:=15;
if stred='Cen' then result:=203;
if stred='Cep' then result:=330;
if stred='Cet' then result:=30;
if stred='Cha' then result:=158;
if stred='Cir' then result:=225;
if stred='Col' then result:=90;
if stred='Com' then result:=195;
if stred='CrA' then result:=285;
if stred='CrB' then result:=233;
if stred='Crv' then result:=188;
if stred='Crt' then result:=173;
if stred='Cru' then result:=188;
if stred='Cyg' then result:=308;
if stred='Del' then result:=309;
if stred='Dor' then result:=75;
if stred='Dra' then result:=240;
if stred='Equ' then result:=320;
if stred='Eri' then result:=60;
if stred='For' then result:=45;
if stred='Gem' then result:=105;
if stred='Gru' then result:=345;
if stred='Her' then result:=255;
if stred='Hor' then result:=53;
if stred='Hya' then result:=150;
if stred='Hyi' then result:=38;
if stred='Ind' then result:=330;
if stred='Lac' then result:=338;
if stred='Leo' then result:=165;
if stred='LMi' then result:=158;
if stred='Lep' then result:=83;
if stred='Lib' then result:=225;
if stred='Lup' then result:=225;
if stred='Lyn' then result:=120;
if stred='Lyr' then result:=282;
if stred='Men' then result:=83;
if stred='Mic' then result:=315;
if stred='Mon' then result:=90;
if stred='Mus' then result:=188;
if stred='Nor' then result:=225;
if stred='Oct' then result:=315;
if stred='Oph' then result:=255;
if stred='Ori' then result:=75;
if stred='Pav' then result:=285;
if stred='Peg' then result:=345;
if stred='Per' then result:=53;
if stred='Phe' then result:=1;
if stred='Pic' then result:=1;
if stred='Psc' then result:=15;
if stred='PsA' then result:=335;
if stred='Pup' then result:=113;
if stred='Pyx' then result:=45;
if stred='Ret' then result:=45;
if stred='Sge' then result:=294;
if stred='Sgr' then result:=285;
if stred='Sco' then result:=255;
if stred='Scl' then result:=1;
if stred='Sct' then result:=279;
if stred='Ser' then result:=270;
if stred='Sex' then result:=153;
if stred='Tau' then result:=60;
if stred='Tel' then result:=285;
if stred='Tri' then result:=30;
if stred='TrA' then result:=240;
if stred='Tuc' then result:=1;
if stred='UMa' then result:=160;
if stred='UMi' then result:=225;
if stred='Vel' then result:=147;
if stred='Vir' then result:=195;
if stred='Vol' then result:=120;
if stred='Vul' then result:=300;
end;

function StredDec(stred: string):integer;
begin
if stred='And' then result:=40;
if stred='Ant' then result:=-35;
if stred='Aps' then result:=-77;
if stred='Aqr' then result:=-15;
if stred='Aql' then result:=5;
if stred='Ara' then result:=-54;
if stred='Ari' then result:=20;
if stred='Aur' then result:=40;
if stred='Boo' then result:=30;
if stred='Cae' then result:=-40;
if stred='Cam' then result:=70;
if stred='Cnc' then result:=20;
if stred='CVn' then result:=40;
if stred='CMa' then result:=-20;
if stred='CMi' then result:=5;
if stred='Cap' then result:=-20;
if stred='Car' then result:=-60;
if stred='Cas' then result:=60;
if stred='Cen' then result:=-50;
if stred='Cep' then result:=70;
if stred='Cet' then result:=-11;
if stred='Cha' then result:=-80;
if stred='Cir' then result:=-65;
if stred='Col' then result:=-35;
if stred='Com' then result:=22;
if stred='CrA' then result:=-40;
if stred='CrB' then result:=30;
if stred='Crv' then result:=-20;
if stred='Crt' then result:=-15;
if stred='Cru' then result:=60;
if stred='Cyg' then result:=42;
if stred='Del' then result:=14;
if stred='Dor' then result:=-60;
if stred='Dra' then result:=65;
if stred='Equ' then result:=7;
if stred='Eri' then result:=30;
if stred='For' then result:=-30;
if stred='Gem' then result:=20;
if stred='Gru' then result:=-45;
if stred='Her' then result:=30;
if stred='Hor' then result:=-60;
if stred='Hya' then result:=-15;
if stred='Hyi' then result:=-70;
if stred='Ind' then result:=-50;
if stred='Lac' then result:=45;
if stred='Leo' then result:=15;
if stred='LMi' then result:=35;
if stred='Lep' then result:=-20;
if stred='Lib' then result:=-15;
if stred='Lup' then result:=-43;
if stred='Lyn' then result:=45;
if stred='Lyr' then result:=40;
if stred='Men' then result:=77;
if stred='Mic' then result:=-36;
if stred='Mon' then result:=1;
if stred='Mus' then result:=-70;
if stred='Nor' then result:=-50;
if stred='Oct' then result:=-90;
if stred='Oph' then result:=1;
if stred='Ori' then result:=5;
if stred='Pav' then result:=-65;
if stred='Peg' then result:=15;
if stred='Per' then result:=50;
if stred='Phe' then result:=-50;
if stred='Pic' then result:=-30;
if stred='Psc' then result:=15;
if stred='PsA' then result:=30;
if stred='Pup' then result:=-30;
if stred='Pyx' then result:=-30;
if stred='Ret' then result:=-60;
if stred='Sge' then result:=18;
if stred='Sgr' then result:=-25;
if stred='Sco' then result:=-40;
if stred='Scl' then result:=-30;
if stred='Sct' then result:=-10;
if stred='Ser' then result:=10;
if stred='Sex' then result:=-2;
if stred='Tau' then result:=15;
if stred='Tel' then result:=-52;
if stred='Tri' then result:=32;
if stred='TrA' then result:=-65;
if stred='Tuc' then result:=-65;
if stred='UMa' then result:=55;
if stred='UMi' then result:=70;
if stred='Vel' then result:=-47;
if stred='Vir' then result:=1;
if stred='Vol' then result:=70;
if stred='Vul' then result:=25;
end;

procedure TOknoIntervalu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{ Odstrani formular z pamate}
  Action:=CaFree;
  OknoIntervaluOpened:=false;
end;

procedure TOknoIntervalu.BtAddIntClick(Sender: TObject);
begin
  if ((IntKonH.text='') or (IntKonM.text='') or (IntZacH.text='') or (IntKonH.text=''))
    then
      ShowMessage('All boxes must be filled')
    else
      begin
        {ak je menej nez 10 poloziek}
        if pozorovanie.Intpocet<10
        then
          begin
            saved:=false;
            pozorovanie.tested:=false;
            {prida riadok, oznaci posledny riadok a zapise hodnotu do bunky}
            if IntZacH.Text='24'
              then
                IntZacH.Text:='0';
            if IntKonH.Text='24'
              then
                IntKonH.Text:='0';
            if IntZacM.Text='60'
              then
                begin
                  IntZacM.Text:='0';
                  IntZacH.Text:=inttostr(strtoint(IntZacH.Text)+1);
                end;
            if IntKonM.Text='60'
              then
                begin
                  IntKonM.Text:='0';
                  IntKonH.Text:=inttostr(strtoint(IntKonH.Text)+1);
                end;


            intervaly.AddRow(1);
            intervaly.SelectLastRow();
            intervaly.Cells[0,intervaly.selectedrow]:=IntZacH.text + ':' + IntZacM.text + '-' + IntKonH.text + ':' + IntKonM.text;
            {pridanie do premennych}
            inc(pozorovanie.IntPocet);
            pozorovanie.intervaly[pozorovanie.IntPocet].ZacH:=IntZacH.Text;
            pozorovanie.intervaly[pozorovanie.IntPocet].ZacM:=IntZacM.Text;
            pozorovanie.intervaly[pozorovanie.IntPocet].KonH:=IntKonH.Text;
            pozorovanie.intervaly[pozorovanie.IntPocet].KonM:=IntKonM.Text;
          end
        else
          begin
            Showmessage('Too many entries');
          end;
        {Vymazanie editov}
        IntZacH.Text:='';
        IntZacM.Text:='';
        IntKonH.Text:='';
        IntKonM.Text:='';
      end;
end;

procedure TOknoIntervalu.BtAddObsClick(Sender: TObject);
var
  I: integer;
  pos: integer;
begin
{ak je nakliknute na riadok intervalu}
if (intervaly.RowExist(intervaly.selectedRow)=true)  and
   (intervaly.GetLevel(intervaly.selectedRow)=0)
then
{ak su vyplnene vsetky edity}
  if ((IntPoz.text='') or (EdRec.text='') or (EdDec.text=''))
    then
      ShowMessage('V�etky polia musia by� vyplnen�')
    else
      begin
      {zisti sa ktory do ktoreho intervalu sa pridava}
        pos:=0;
        for I:=0 to intervaly.SelectedRow do
          if intervaly.GetLevel(I)=0 then inc(pos);
          {ak je pozorovatelov menej nez 12}
        if pozorovanie.intervaly[pos].PozPocet<12
          then
            begin
              saved:=false;
              pozorovanie.tested:=false;
              {prida sa riadok, prida sa do premennych aj do buniek}
              inc(pozorovanie.intervaly[pos].PozPocet);
              pozorovanie.intervaly[pos].pozorovatelia[pozorovanie.intervaly[pos].PozPocet].cislo:=IntPoz.Text;
              pozorovanie.intervaly[pos].pozorovatelia[pozorovanie.intervaly[pos].PozPocet].stred:=IntStred.Text;
              pozorovanie.intervaly[pos].pozorovatelia[pozorovanie.intervaly[pos].PozPocet].StredRec:=strtoint(EdRec.text);
              pozorovanie.intervaly[pos].pozorovatelia[pozorovanie.intervaly[pos].PozPocet].StredDec:=Strtoint(EdDec.text);
              intervaly.AddChildRow(intervaly.selectedRow);
              intervaly.Cells[0,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:=
              intPoz.Text+' - '+ IntStred.Text
              +' '+inttostr(pozorovanie.intervaly[pos].pozorovatelia[pozorovanie.intervaly[pos].PozPocet].StredRec)+'Rec '+
              inttostr(pozorovanie.intervaly[pos].pozorovatelia[pozorovanie.intervaly[pos].PozPocet].StredDec)+'Dec';
            end
          else
            Showmessage('Too many entries');
         {edity sa vymazu}
        IntPoz.Text:='';
        IntStred.ItemIndex:=-1;
        EdDec.Text:='';
        EdRec.Text:='';
      end;
end;

procedure TOknoIntervalu.BtAddBrkClick(Sender: TObject);
var
  IntPos: integer;
  PozPos: Integer;
  I: Integer;
  P: Integer;
begin
{ak je nakliknute na riadok pozorovatela}
if (intervaly.RowExist(intervaly.selectedRow)=true)  and
   (intervaly.GetLevel(intervaly.selectedRow)=1)
then
{ak su vestky edity vyplnene}
  if ((BrkKonH.text='') or (BrkKonM.text='') or (BrkZacH.text='') or (BrkZacM.text=''))
    then
      ShowMessage('All boxes must be filled')
    else
      begin
      {zistenie ktoreho intervalu}
        IntPos:=0;
        for I:=0 to intervaly.SelectedRow do
          if intervaly.GetLevel(I)=0 then inc(IntPos);
        {zistenie poradia pozorovatela}
        P:=0;
        for I:=1 to IntPos-1 do
          P:=P+intervaly.GetChildCount(P)+1;
        PozPos:=0;
        for I:=P+1 to intervaly.SelectedRow do
          if Intervaly.GetLevel(I)=1 then inc(PozPos);
        {prida sa riadok a do premenych}

        if pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].BrkPocet<10
          then
            begin
              saved:=false;
              pozorovanie.tested:=false;
      if BrkZacH.Text='24'
        then
          BrkZacH.Text:='0';
      if BrkKonH.Text='24'
        then
          BrkKonH.Text:='0';
      if BrkZacM.Text='60'
        then
          begin
            BrkZacM.Text:='0';
            BrkZacH.Text:=inttostr(strtoint(BrkZacH.Text)+1);
          end;
      if BrkKonM.Text='60'
        then
          begin
            BrkKonM.Text:='0';
            BrkKonH.Text:=inttostr(strtoint(BrkKonH.Text)+1);
          end;
              inc(pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].BrkPocet);
              intervaly.AddChildRow(intervaly.selectedRow);
              intervaly.Cells[0,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:='BRK';
              intervaly.Cells[1,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:=
              BrkZacH.text + ':' + BrkZacM.text + ' - ' + BrkKonH.text + ':' + BrkKonM.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].prestavky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].BrkPocet].ZacH:=BrkZacH.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].prestavky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].BrkPocet].ZacM:=BrkZacM.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].prestavky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].BrkPocet].KonH:=BrkKonH.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].prestavky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].BrkPocet].KonM:=BrkKonM.text;
            end
          else
            showmessage('Too many entries');
        {edity sa vymazu}
        BrkZacH.text:='';
        BrkZacM.text:='';
        BrkKonH.text:='';
        BrkKonM.text:='';
      end;
end;

procedure TOknoIntervalu.BtAddCldClick(Sender: TObject);
var
  IntPos: integer;
  PozPos: Integer;
  I: Integer;
  P: Integer;
begin
{ak je nakliknute na spravny riadok}
if (intervaly.RowExist(intervaly.selectedRow)=true)  and
   (intervaly.GetLevel(intervaly.selectedRow)=1)
then
{ak su vyplnene vsetky edity}
  if ((CldZacH.text='') or (CldZacM.text='') or (CldKonH.text='') or (CldKonM.text='') or (CldPer.text=''))
    then
      ShowMessage('All boxes must be filled')
    else
      begin
        {Zistenie poradia intervalu}
        IntPos:=0;
        for I:=0 to intervaly.SelectedRow do
          if intervaly.GetLevel(I)=0 then inc(IntPos);
        {zistenie poradia pozorovatela}
        P:=0;
        for I:=1 to IntPos-1 do
          P:=P+intervaly.GetChildCount(P)+1;
        PozPos:=0;
        for I:=P+1 to intervaly.SelectedRow do
          if Intervaly.GetLevel(I)=1 then inc(PozPos);
        {prida sa riadok a do premenych}
        if pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].CldPocet<10
          then
            begin
              saved:=false;
              pozorovanie.tested:=false;
      if CldZacH.Text='24'
        then
          CldZacH.Text:='0';
      if CldKonH.Text='24'
        then
          CldKonH.Text:='0';
      if CldZacM.Text='60'
        then
          begin
            CldZacM.Text:='0';
            CldZacH.Text:=inttostr(strtoint(CldZacH.Text)+1);
          end;
      if CldKonM.Text='60'
        then
          begin
            CldKonM.Text:='0';
            CldKonH.Text:=inttostr(strtoint(CldKonH.Text)+1);
          end;
              {zvacsi sa pocitadlo}
              inc(pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].CldPocet);
              {prida sa riadok, vyplni sa}
              intervaly.AddChildRow(intervaly.selectedRow);
              intervaly.Cells[0,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:='CLD';
              intervaly.Cells[1,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:='---------------------';
              intervaly.Cells[2,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:=
              CldZacH.text + ':' + CldZacM.text + ' - ' +  CldKonH.text + ':' +CldKonM.text + '   ' + CldPer.text + '%';
              {pridanie do premennych}
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].oblacnost[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].CldPocet].ZacH:=CldZacH.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].oblacnost[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].CldPocet].ZacM:=CldZacM.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].oblacnost[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].CldPocet].KonH:=CldKonH.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].oblacnost[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].CldPocet].KonM:=CldKonM.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].oblacnost[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].CldPocet].percenta:=CldPer.text;
            end;
  {zmazanie editov}
  CldZacH.text:='';
  CldZacM.text:='';
  CldKonH.text:='';
  CldKonM.text:='';
  CldPer.text:='';
end;
end;

procedure TOknoIntervalu.BtAddLimClick(Sender: TObject);
var
  IntPos: integer;
  PozPos: Integer;
  I: Integer;
  P: Integer;
  limits: File of Tlimits;
  limitka: Tlimits;
begin
{Ak je nakliknute na spravny riadok}
if (intervaly.RowExist(intervaly.selectedRow)=true)  and
   (intervaly.GetLevel(intervaly.selectedRow)=1)
then
{ak su vyplnene vsetky edity}
if pref.trojuholniky=false
  then
    if ((LimCasH.text='') or (LimCasM.text='') or (LimLim.Text='') or
        (LimLim.text=''))
      then
        ShowMessage('All boxes must be filled')
    else
      begin
        {Zistenie poradia intervalu}
        IntPos:=0;
        for I:=0 to intervaly.SelectedRow do
          if intervaly.GetLevel(I)=0 then inc(IntPos);
        {zistenie poradia pozorovatela}
        P:=0;
        for I:=1 to IntPos-1 do
          P:=P+intervaly.GetChildCount(P)+1;
        PozPos:=0;
        for I:=P+1 to intervaly.SelectedRow do
          if Intervaly.GetLevel(I)=1 then inc(PozPos);
        {prida sa riadok a do premenych}
        if pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet<10
          then
            begin
              saved:=false;
              pozorovanie.tested:=false;
      if LimCasH.Text='24'
        then
          LimCasH.Text:='0';
      if LimCasM.Text='60'
        then
          begin
            LimCasM.Text:='0';
            LimCasH.Text:=inttostr(strtoint(LimCasH.Text)+1);
          end;
              {pocitadlo udajov v zazname sa zvacsi o jedna}
              inc(pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet);
              {prida sa riadok, vyplni sa}
              intervaly.AddChildRow(intervaly.selectedRow);
              intervaly.Cells[0,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:='LIM';
              intervaly.Cells[1,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:='---------------------';
              intervaly.Cells[2,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:='---------------------------------';
              {pridanie do premennych}
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].Hod:=LimCasH.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].Min:=LimCasM.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].trojuholnik:=LimTri.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].hviezdy:=LimHv.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].limitka:=LimLim.text;
              intervaly.Cells[3,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:=
              LimCasH.text + ':' + LimCasM.text + ' L= '+pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].limitka;
            end;
  {zmazanie editov}
  LimCasH.text:='';
  LimCasM.text:='';
  LimTri.ItemIndex:=-1;
  LimHv.ItemIndex:=-1;
  LimLim.Text:='';
end;

if (intervaly.RowExist(intervaly.selectedRow)=true)  and
   (intervaly.GetLevel(intervaly.selectedRow)=1)
then
if pref.trojuholniky=true
  then
    if ((LimCasH.text='') or (LimCasM.text='') or (LimTri.text='') or (LimHv.text=''))
      then
        ShowMessage('All boxes must be filled')
    else
      begin
        {Zistenie poradia intervalu}
        IntPos:=0;
        for I:=0 to intervaly.SelectedRow do
          if intervaly.GetLevel(I)=0 then inc(IntPos);
        {zistenie poradia pozorovatela}
        P:=0;
        for I:=1 to IntPos-1 do
          P:=P+intervaly.GetChildCount(P)+1;
        PozPos:=0;
        for I:=P+1 to intervaly.SelectedRow do
          if Intervaly.GetLevel(I)=1 then inc(PozPos);
        {prida sa riadok a do premenych}
        if pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet<10
          then
            begin
              saved:=false;
              pozorovanie.tested:=false;
              {pocitadlo udajov v zazname sa zvacsi o jedna}
              inc(pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet);
              {prida sa riadok, vyplni sa}
              intervaly.AddChildRow(intervaly.selectedRow);
              intervaly.Cells[0,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:='LIM';
              intervaly.Cells[1,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:='---------------------';
              intervaly.Cells[2,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:='---------------------------------';
              {pridanie do premennych}
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].Hod:=LimCasH.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].Min:=LimCasM.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].trojuholnik:=LimTri.text;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].hviezdy:=LimHv.text;
              assignFile(limits, extractfilepath(application.ExeName) + 'limits.dat');
              reset(limits);
              seek(limits,strtoint(LimTri.text)-1);
              read(limits,limitka);
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].limitka:=limitka.mag[strtoint(LimHv.text)];
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].rec:=limitka.rec;
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].dec:=limitka.dec;
              intervaly.Cells[3,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:=
              LimCasH.text + ':' + LimCasM.text + '  #' + LimTri.text + '/'+ LimHv.text +' L= ' +  pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].limitky[
              pozorovanie.intervaly[IntPos].pozorovatelia[PozPos].LimPocet].limitka;
            end;
  {zmazanie editov}
  LimCasH.text:='';
  LimCasM.text:='';
  LimTri.ItemIndex:=-1;
  LimHv.ItemIndex:=-1;
end;
end;

procedure TOknoIntervalu.FormCreate(Sender: TObject);
var
  I,J,K: integer; {pocitadla}
  pos: integer;
begin
commaCount:=0;
{nic sa needituje}
Editing.stav:=false;
{nacitavanie tabulky}
if pref.trojuholniky=true
  then
    begin
      LimHv.Visible:=true;
      LimTri.Visible:=true;
      LimLim.Visible:=false;
    end
  else
    begin
      LimLim.Visible:=true;
      LimHv.Visible:=false;
      LimTri.Visible:=false;
      Label18.Caption:='Time               Lim. mag.'
    end;
    for I:=1 to pozorovanie.IntPocet do
    begin
      intervaly.AddRow(1);
      intervaly.SelectLastRow();
      intervaly.Cells[0,intervaly.selectedrow]:=
      pozorovanie.intervaly[I].ZacH + ':' +
      pozorovanie.intervaly[I].ZacM + '-' +
      pozorovanie.intervaly[I].KonH + ':' +
      pozorovanie.intervaly[I].KonM;
      pos:=intervaly.SelectedRow+1;
      for J:=1 to pozorovanie.intervaly[I].PozPocet do
        begin
          intervaly.AddChildRow(intervaly.SelectedRow);
          intervaly.Cells[0,intervaly.SelectedRow+intervaly.GetChildCount(intervaly.SelectedRow,true)]:=
          pozorovanie.intervaly[I].pozorovatelia[J].cislo +' - '+ pozorovanie.intervaly[I].pozorovatelia[J].stred+
          ' '+inttostr(pozorovanie.intervaly[I].pozorovatelia[J].StredRec)+'Rec '+
          inttostr(pozorovanie.intervaly[I].pozorovatelia[J].StredDec)+'Dec';
          for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].BrkPocet do
            begin
              intervaly.AddChildRow(pos);
              intervaly.Cells[0,pos+intervaly.GetChildCount(pos)]:='BRK';
              intervaly.Cells[1,pos+intervaly.GetChildCount(pos)]:=
              pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacH + ':' +
              pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].ZacM + ' - ' +
              pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonH + ':' +
              pozorovanie.intervaly[I].pozorovatelia[J].prestavky[K].KonM;
            end;
          for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].CldPocet do
            begin
              intervaly.AddChildRow(pos);
              intervaly.Cells[0,pos+intervaly.GetChildCount(pos)]:='CLD';
              intervaly.Cells[1,pos+intervaly.GetChildCount(pos)]:='---------------------';
              intervaly.Cells[2,pos+intervaly.GetChildCount(pos)]:=
              pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacH + ':' +
              pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].ZacM + ' - ' +
              pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonH + ':' +
              pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].KonM + '   ' +
              pozorovanie.intervaly[I].pozorovatelia[J].oblacnost[K].percenta + '%';
            end;
          for K:=1 to pozorovanie.intervaly[I].pozorovatelia[J].LimPocet do
            begin
              intervaly.AddChildRow(pos);
              intervaly.Cells[0,pos+intervaly.GetChildCount(pos)]:='LIM';
              intervaly.Cells[1,pos+intervaly.GetChildCount(pos)]:='---------------------';
              intervaly.Cells[2,pos+intervaly.GetChildCount(pos)]:='---------------------------------';
              intervaly.Cells[3,pos+intervaly.GetChildCount(pos)]:=
              intervaly.Cells[3,pos+intervaly.GetChildCount(pos)]+
              pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].Hod + ':' +
              pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].Min+' ';
              if pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].trojuholnik=''
                then
                  begin
                    intervaly.Cells[3,pos+intervaly.GetChildCount(pos)]:=
                    intervaly.Cells[3,pos+intervaly.GetChildCount(pos)]+'L='+
                    pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].limitka;
                  end
                else
                  begin
                    intervaly.Cells[3,pos+intervaly.GetChildCount(pos)]:=
                    intervaly.Cells[3,pos+intervaly.GetChildCount(pos)]+ '  #' +
                    pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].trojuholnik + '/'+
                    pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].hviezdy + ' L= ' +
                    pozorovanie.intervaly[I].pozorovatelia[J].limitky[K].limitka;
                  end;
          end;
          pos:=pos+intervaly.GetChildCount(pos)+1;
        end;
    end;
    for I:=0 to intervaly.RowCount-1 do
      Intervaly.Expanded[I]:=false;
end;

procedure TOknoIntervalu.Zmazadaj1Click(Sender: TObject);
var
  I,P:integer;
  pos1,pos2,pos3,pos4,pos5:integer; {poradie zaznamu ktory chceme vymazat a cislo levelu jemu prisluchajucemu}
begin
if intervaly.RowExist(intervaly.SelectedRow) then
  begin
    pos1:=0;
    pos2:=0;
    pos3:=0;
    pos4:=0;
    pos5:=0;
    P:=0;
    {zistenie ktory interval sa maze}
    for I:=0 to intervaly.SelectedRow do
      if intervaly.GetLevel(I)=0 then inc(pos1);
    {zistenie z ktoreho pozorovatela sa maze}
     for I:=1 to pos1-1 do
       P:=P+intervaly.GetChildCount(P)+1;
     for I:=P+1 to intervaly.SelectedRow do
       if Intervaly.GetLevel(I)=1 then inc(pos2);
     {zistenie ktorej prestavky/limitky/mrakov sa mazu}
     for I:=P to intervaly.SelectedRow do
       if intervaly.GetLevel(I)=1 then P:=I;
     for I:=P to intervaly.SelectedRow do
       if intervaly.Cells[0,I]='BRK'
        then inc(pos3);
     for I:=P to intervaly.SelectedRow do
      if intervaly.Cells[0,I]='CLD'
        then inc(pos4);
     for I:=P to intervaly.SelectedRow do
      if intervaly.Cells[0,I]='LIM'
        then inc(pos5);
     {samotne mazanie udaju, udaje nad tym ktore chceme zmazat sa
     presunu o jedno vyssie a pocitadlo udajov sa zmensi o jedno a
     riadok v tabulke sa vymaze}
     if editing.stav=true
       then
         begin
           intervaly.Cell[0,Editing.Row].Color:=clWhite;
           Editing.stav:=false;
           BtEditObs.Enabled:=false;
           BtEditInt.Enabled:=false;
           BtEditBrk.Enabled:=false;
           BtEditCld.Enabled:=false;
           BtEditLim.Enabled:=false;
         end;
     editing.stav:=false;
     case intervaly.GetLevel(intervaly.selectedRow) of
       0: begin
            for I:=0 to (pozorovanie.IntPocet-pos1-1) do
              pozorovanie.intervaly[I+pos1]:=pozorovanie.intervaly[I+pos1+1];
            FillChar(pozorovanie.intervaly[pozorovanie.IntPocet], sizeOf(TInterval), 0);
            dec(pozorovanie.IntPocet);
            intervaly.DeleteRow(intervaly.SelectedRow);
          end;
       1: begin
            for I:=0 to (pozorovanie.intervaly[pos1].PozPocet-pos2-1) do
              pozorovanie.intervaly[pos1].pozorovatelia[pos2+I]:=
              pozorovanie.intervaly[pos1].pozorovatelia[pos2+I+1];
            FillChar(pozorovanie.intervaly[pos1].pozorovatelia[pozorovanie.intervaly[pos1].PozPocet], sizeOf(TIntPozorovatel), 0);
            dec(pozorovanie.intervaly[pos1].PozPocet);
            intervaly.DeleteRow(intervaly.SelectedRow);
          end;
       2: begin
        {kontroluje sa slovo ktore je vlozene v bunke aby sa vedelo ktore pole sa edituje}
            if intervaly.Cells[0,intervaly.SelectedRow]='BRK' then
             begin
               for I:=0 to (pozorovanie.intervaly[pos1].pozorovatelia[pos2].BrkPocet-pos3-1) do
                 pozorovanie.intervaly[pos1].pozorovatelia[pos2].prestavky[pos3+I]:=pozorovanie.intervaly[pos1].pozorovatelia[pos2].prestavky[pos3+I+1];
               dec(pozorovanie.intervaly[pos1].pozorovatelia[pos2].BrkPocet);
               intervaly.DeleteRow(intervaly.SelectedRow);
               intervaly.SelectedRow:=P;
             end;
           if intervaly.Cells[0,intervaly.SelectedRow]='CLD' then
             begin
               for I:=0 to (pozorovanie.intervaly[pos1].pozorovatelia[pos2].CldPocet-pos4-1) do
                 pozorovanie.intervaly[pos1].pozorovatelia[pos2].oblacnost[pos4+I]:=pozorovanie.intervaly[pos1].pozorovatelia[pos2].oblacnost[pos4+I+1];
               dec(pozorovanie.intervaly[pos1].pozorovatelia[pos2].CldPocet);
               intervaly.DeleteRow(intervaly.SelectedRow);
               intervaly.SelectedRow:=P;
             end;
           if intervaly.Cells[0,intervaly.SelectedRow]='LIM' then
             begin
               for I:=0 to (pozorovanie.intervaly[pos1].pozorovatelia[pos2].LimPocet-pos5-1) do
                 pozorovanie.intervaly[pos1].pozorovatelia[pos2].limitky[pos5+I]:=pozorovanie.intervaly[pos1].pozorovatelia[pos2].limitky[pos5+I+1];
               dec(pozorovanie.intervaly[pos1].pozorovatelia[pos2].LimPocet);
               intervaly.DeleteRow(intervaly.SelectedRow);
               intervaly.SelectedRow:=P;
             end;
          end;
       end;
  end;
end;

procedure TOknoIntervalu.IntervalyCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
var
  I,P:integer;
begin
{ak sa prave nic needituje}
if Editing.stav=false then
begin
{prepne sa indikator ci sa nieco edituje}
  Editing.stav:=true;
{vlozi sa do premennej ktory riadok sa akurat edituje}
  Editing.Row:=ARow;
{vynuluju sa premenne}
  Editing.pos1:=0;
  Editing.pos2:=0;
  Editing.pos3:=0;
  Editing.pos4:=0;
  Editing.pos5:=0;
  P:=0;
{zisti sa na ktorych poziciach sa akurat edituje}
  for I:=0 to ARow do
    if intervaly.GetLevel(I)=0
      then inc(Editing.pos1);
  for I:=1 to Editing.pos1-1 do
    P:=P+intervaly.GetChildCount(P)+1;
  for I:=P+1 to ARow do
    if Intervaly.GetLevel(I)=1
      then inc(Editing.pos2);
  for I:=P to ARow do
    if intervaly.GetLevel(I)=1
      then P:=I;
  for I:=P to ARow do
    if intervaly.Cells[0,I]='BRK'
      then inc(Editing.pos3);
  for I:=P to ARow do
    if intervaly.Cells[0,I]='CLD'
      then inc(Editing.pos4);
  for I:=P to ARow do
    if intervaly.Cells[0,I]='LIM'
      then inc(Editing.pos5);
{a teraz sa vyberie ze z ktorymi editmi sa bude editovat}
  case intervaly.GetLevel(ARow) of
    0: begin
         intervaly.Cell[0,Arow].Color:=clSilver;
         BtEditInt.Enabled:=true;
         IntZacH.Text:=pozorovanie.intervaly[Editing.pos1].ZacH;
         IntZacM.text:=pozorovanie.intervaly[Editing.pos1].ZacM;
         IntKonH.Text:=pozorovanie.intervaly[Editing.pos1].KonH;
         IntKonM.Text:=pozorovanie.intervaly[Editing.pos1].KonM;
       end;
    1: begin
         intervaly.Cell[0,Arow].Color:=clSilver;
         BtEditObs.Enabled:=true;
         IntPoz.Text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].cislo;
         EdDec.Text:=inttostr(pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].StredDec);
         EdRec.Text:=inttostr(pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].StredRec);
       end;
    2: begin
         if intervaly.Cells[0,ARow]='BRK' then
           begin
             intervaly.Cell[1,Arow].Color:=clSilver;
             BtEditBrk.Enabled:=true;
             BrkZacH.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].prestavky[Editing.pos3].ZacH;
             BrkZacM.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].prestavky[Editing.pos3].ZacM;
             BrkKonH.Text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].prestavky[Editing.pos3].KonH;
             BrkKonM.Text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].prestavky[Editing.pos3].KonM;
           end;
         if intervaly.Cells[0,ARow]='CLD' then
           begin
             intervaly.Cell[2,Arow].Color:=clSilver;
             BtEditCld.Enabled:=true;
             CldZacH.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].ZacH;
             CldZacM.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].ZacM;
             CldKonH.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].KonH;
             CldKonM.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].KonM;
             CldPer.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].percenta;
           end;
         if intervaly.Cells[0,ARow]='LIM' then
           begin
             intervaly.Cell[3,Arow].Color:=clSilver;
             BtEditLim.Enabled:=true;
             LimCasH.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].Hod;
             LimCasM.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].Min;
             LimLim.text:=pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].limitka;
             if pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].hviezdy<>''
               then
                 LimHv.ItemIndex:=strtoint(pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].hviezdy)-1;
             if pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].trojuholnik<>''
               then
                 LimTri.ItemIndex:=strtoint(pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].trojuholnik)-1;
           end;
       end;
    end;
end;
end;

procedure TOknoIntervalu.BtEditIntClick(Sender: TObject);
begin
  if ((IntKonH.text='') or (IntKonM.text='') or (IntZacH.text='') or (IntKonH.text=''))
    then
      ShowMessage('All boxes must be filled')
    else
    begin
      Saved:=false;
      pozorovanie.tested:=false;
      if IntZacH.Text='24'
        then
          IntZacH.Text:='0';
      if IntKonH.Text='24'
        then
          IntKonH.Text:='0';
      if IntZacM.Text='60'
        then
          begin
            IntZacM.Text:='0';
            IntZacH.Text:=inttostr(strtoint(IntZacH.Text)+1);
          end;
      if IntKonM.Text='60'
        then
          begin
            IntKonM.Text:='0';
            IntKonH.Text:=inttostr(strtoint(IntKonH.Text)+1);
          end;
      pozorovanie.intervaly[Editing.pos1].ZacH:=IntZacH.Text;
      pozorovanie.intervaly[Editing.pos1].ZacM:=IntZacM.text;
      pozorovanie.intervaly[Editing.pos1].KonH:=IntKonH.Text;
      pozorovanie.intervaly[Editing.pos1].KonM:=IntKonM.Text;
      intervaly.Cell[0,Editing.Row].Color:=clWhite;
      intervaly.Cell[0,Editing.Row].AsString:=IntZacH.text + ':' + IntZacM.text + '-' + IntKonH.text + ':' + IntKonM.text;
      IntZacH.Text:='';
      IntZacM.Text:='';
      IntKonH.Text:='';
      IntKonM.Text:='';
      Editing.stav:=false;
      BtEditInt.Enabled:=false;
    end;
end;

procedure TOknoIntervalu.BtEditObsClick(Sender: TObject);
begin
  if ((IntPoz.text='') or (EdRec.text='') or (EdDec.text=''))
    then
      ShowMessage('All boxes must be filled')
    else
    begin
      Saved:=false;
      pozorovanie.tested:=false;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].cislo:=IntPoz.Text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].stred:=IntStred.Text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].StredRec:=strtoint(EdRec.Text);
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].StredDec:=strtoint(EdDec.Text);
      intervaly.Cell[0,Editing.Row].Color:=clWhite;
      intervaly.Cell[0,Editing.Row].AsString:=intPoz.Text+' - '+ IntStred.Text+ ' '+
      inttostr(pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].StredRec)+'Rec '+
      inttostr(pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].StredDec)+'Dec';
      IntPoz.Text:='';
      IntStred.ItemIndex:=-1;
      Editing.stav:=false;
      BtEditObs.Enabled:=false;
    end;
end;

procedure TOknoIntervalu.BtEditBrkClick(Sender: TObject);
begin
  if ((BrkKonH.text='') or (BrkKonM.text='') or (BrkZacH.text='') or (BrkZacM.text=''))
    then
      ShowMessage('All boxes must be filled')
    else
    begin
      Saved:=false;
      pozorovanie.tested:=false;
      if BrkZacH.Text='24'
        then
          BrkZacH.Text:='0';
      if BrkKonH.Text='24'
        then
          BrkKonH.Text:='0';
      if BrkZacM.Text='60'
        then
          begin
            BrkZacM.Text:='0';
            BrkZacH.Text:=inttostr(strtoint(BrkZacH.Text)+1);
          end;
      if BrkKonM.Text='60'
        then
          begin
            BrkKonM.Text:='0';
            BrkKonH.Text:=inttostr(strtoint(BrkKonH.Text)+1);
          end;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].prestavky[Editing.pos3].ZacH:=BrkZacH.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].prestavky[Editing.pos3].ZacM:=BrkZacM.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].prestavky[Editing.pos3].KonH:=BrkKonH.Text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].prestavky[Editing.pos3].KonM:=BrkKonM.Text;
      intervaly.Cell[1,Editing.Row].Color:=clWhite;
      intervaly.Cell[1,Editing.Row].AsString:=BrkZacH.text + ':' + BrkZacM.text + ' - ' + BrkKonH.text + ':' + BrkKonM.text;
      BrkZacH.text:='';
      BrkZacM.text:='';
      BrkKonH.text:='';
      BrkKonM.text:='';
      Editing.stav:=false;
      BtEditBrk.Enabled:=false;
    end;
end;

procedure TOknoIntervalu.BtEditCldClick(Sender: TObject);
begin
  if ((CldZacH.text='') or (CldZacM.text='') or (CldKonH.text='') or (CldKonM.text='') or (CldPer.text=''))
    then
      ShowMessage('All boxes must be filled')
    else
    begin
      Saved:=false;
      pozorovanie.tested:=false;
      if CldZacH.Text='24'
        then
          CldZacH.Text:='0';
      if CldKonH.Text='24'
        then
          CldKonH.Text:='0';
      if CldZacM.Text='60'
        then
          begin
            CldZacM.Text:='0';
            CldZacH.Text:=inttostr(strtoint(CldZacH.Text)+1);
          end;
      if CldKonM.Text='60'
        then
          begin
            CldKonM.Text:='0';
            CldKonH.Text:=inttostr(strtoint(CldKonH.Text)+1);
          end;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].ZacH:=CldZacH.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].ZacM:=CldZacM.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].KonH:=CldKonH.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].KonM:=CldKonM.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].oblacnost[Editing.pos4].percenta:=CldPer.text;
      intervaly.Cell[2,Editing.Row].Color:=clWhite;
      intervaly.Cell[2,Editing.Row].AsString:=CldZacH.text + ':' + CldZacM.text + ' - ' +  CldKonH.text + ':' +CldKonM.text + '   ' + CldPer.text + '%';
      CldZacH.text:='';
      CldZacM.text:='';
      CldKonH.text:='';
      CldKonM.text:='';
      CldPer.text:='';
      Editing.stav:=false;
      BtEditCld.Enabled:=false;
    end;
end;

procedure TOknoIntervalu.BtEditLimClick(Sender: TObject);
var
  limits: File of Tlimits;
  limitka: Tlimits;
begin
if pref.trojuholniky=true
  then
  if ((LimCasH.text='') or (LimCasM.text='') or (LimTri.text='') or (LimHv.Text=''))
    then
      ShowMessage('All boxes must be filled')
    else
    begin
      Saved:=false;
      pozorovanie.tested:=false;
      if LimCasH.Text='24'
        then
          LimCasH.Text:='0';
      if LimCasM.Text='60'
        then
          begin
            LimCasM.Text:='0';
            LimCasH.Text:=inttostr(strtoint(LimCasH.Text)+1);
          end;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].Hod:=LimCasH.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].Min:=LimCasM.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].trojuholnik:=LimTri.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].hviezdy:=LimHv.text;
      assignFile(limits, extractfilepath(application.ExeName) + 'limits.dat');
      reset(limits);
      seek(limits,strtoint(LimTri.text)-1);
      read(limits,limitka);
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].limitka:=limitka.mag[strtoint(LimHv.text)];
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].rec:=limitka.rec;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].dec:=limitka.dec;
      intervaly.Cell[3,Editing.Row].AsString:=LimCasH.text + ':' + LimCasM.text + '  #' +
      LimTri.text + '/'+ LimHv.text +' L= '+
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].limitka;
      intervaly.Cell[3,Editing.Row].Color:=clWhite;
      LimCasH.text:='';
      LimCasM.text:='';
      LimTri.ItemIndex:=-1;
      LimHv.ItemIndex:=-1;
      LimLim.text:='';
      Editing.stav:=false;
      BtEditLim.Enabled:=false;
    end;

if pref.trojuholniky=false
  then
  if ((LimCasH.text='') or (LimCasM.text='') or (LimLim.text=''))
    then
      ShowMessage('All boxes must be filled')
    else
    begin
      Saved:=false;
      pozorovanie.tested:=false;
      if LimCasH.Text='24'
        then
          LimCasH.Text:='0';
      if LimCasM.Text='60'
        then
          begin
            LimCasM.Text:='0';
            LimCasH.Text:=inttostr(strtoint(LimCasH.Text)+1);
          end;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].Hod:=LimCasH.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].Min:=LimCasM.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].limitka:=LimLim.text;
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].trojuholnik:='';
      pozorovanie.intervaly[Editing.pos1].pozorovatelia[Editing.pos2].limitky[Editing.pos5].hviezdy:='';
      intervaly.Cell[3,Editing.Row].AsString:=LimCasH.text + ':' + LimCasM.text + ' L= '+LimLim.text;
      intervaly.Cell[3,Editing.Row].Color:=clWhite;
      LimCasH.text:='';
      LimCasM.text:='';
      LimTri.text:='';
      LimHv.text:='';
      LimLim.text:='';
      Editing.stav:=false;
      BtEditLim.Enabled:=false;
    end;
    
end;

procedure TOknoIntervalu.FormActivate(Sender: TObject);
begin

if pref.trojuholniky=true
  then
    begin
      LimHv.Visible:=true;
      LimTri.Visible:=true;
      LimLim.Visible:=false;
      Label18.Caption:='Time      Triangle     Stars';
    end
  else
    begin
      LimLim.Visible:=true;
      LimHv.Visible:=false;
      LimTri.Visible:=false;
      Label18.Caption:='Time               Lim. mag.';
    end;
end;

procedure TOknoIntervalu.IntZacHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.IntZacMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.IntKonHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.IntKonMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.IntPozKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['1'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.BrkZacHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.BrkZacMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.BrkKonHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.BrkKonMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.CldZacHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.CldZacMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.CldKonHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.CldKonMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.CldPerKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.LimCasHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.LimCasMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.LimLimKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.Button1Click(Sender: TObject);
var
  I:integer;
begin
  for I:=0 to intervaly.RowCount-1 do
    Intervaly.Expanded[I]:=true;
end;

procedure TOknoIntervalu.Button2Click(Sender: TObject);
var
  I:integer;
begin
  for I:=0 to intervaly.RowCount-1 do
    Intervaly.Expanded[I]:=false;
end;

procedure TOknoIntervalu.EdRecKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TOknoIntervalu.EdDecKeyPress(Sender: TObject; var Key: Char);
var
  I:integer;
  Minus:boolean;
begin
  minus:=false;
  for I:=1 to Length(EdDec.Text) do
    if EdDec.Text[I]='-'
      then
        minus:=true;
  if minus=true
    then
      if not (Key in ['0'..'9',#8])
        then
          key := #0
    else
      if not (Key in ['0'..'9','-',#8])
        then
          key := #0;
end;

procedure TOknoIntervalu.IntStredChange(Sender: TObject);
begin
  EdDec.Text:=inttostr(StredDec(IntStred.Text));
  EdRec.Text:=inttostr(stredRec(IntStred.Text));
end;

end.

