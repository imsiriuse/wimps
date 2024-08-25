unit Unit_Tabulka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,Globalne_Premenne, NxColumns,
  NxColumnClasses, NxScrollControl, NxCustomGridControl, NxCustomGrid,
  NxGrid, Menus;
type
  TOknoProtokolu = class(TForm)
    PopupMenu: TPopupMenu;
    DeleteRow: TMenuItem;
    Grid: TNextGrid;
    NxIncrementColumn1: TNxIncrementColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    NxTextColumn4: TNxTextColumn;
    NxTextColumn5: TNxTextColumn;
    NxTextColumn6: TNxTextColumn;
    NxTextColumn7: TNxTextColumn;
    NxTextColumn8: TNxTextColumn;
    NxTextColumn9: TNxTextColumn;
    NxTextColumn10: TNxTextColumn;
    ZmazVseko: TMenuItem;
    Pridat1: TMenuItem;
    Pridat2: TMenuItem;
    Pridat3: TMenuItem;
    Pridat4: TMenuItem;
    Pridat5: TMenuItem;
    Pridat6: TMenuItem;
    Pridat7: TMenuItem;
    Pridat8: TMenuItem;
    Pridat9: TMenuItem;
    Pridat10: TMenuItem;
    Pridat11: TMenuItem;
    Pridat12: TMenuItem;
    Zmazarovnakhodnoty1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeleteRowClick(Sender: TObject);
    procedure GridEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure GridInputAdded(Sender: TObject);
    procedure GridAfterRowMove(Sender: TObject; FromPos, ToPos: Integer);
    procedure ZmazVsekoClick(Sender: TObject);
    procedure GridEditAccept(Sender: TObject; ACol, ARow: Integer;
      Value: WideString; var Accept: Boolean);
    procedure Pridat1Click(Sender: TObject);
    procedure Pridat2Click(Sender: TObject);
    procedure Pridat3Click(Sender: TObject);
    procedure Pridat4Click(Sender: TObject);
    procedure Pridat5Click(Sender: TObject);
    procedure Pridat6Click(Sender: TObject);
    procedure Pridat7Click(Sender: TObject);
    procedure Pridat8Click(Sender: TObject);
    procedure Pridat9Click(Sender: TObject);
    procedure Pridat10Click(Sender: TObject);
    procedure Pridat11Click(Sender: TObject);
    procedure Pridat12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Zmazarovnakhodnoty1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OknoProtokolu: TOknoProtokolu;
  TabulkaOpened: Boolean;     { Prepinac ci je tabulka uz otvorena}
implementation

{$R *.dfm}

procedure TOknoProtokolu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { Uvolni formular z pamate }
  Action := caFree;
  {Premeni prepinac otverenej tabulky na neotvorena}
  TabulkaOpened:=false;

end;

procedure TOknoProtokolu.DeleteRowClick(Sender: TObject);
var
  I:integer;
begin
{ak ma tabulka riadky tak vymaze oznaceny}
if Grid.SelectedRow>=0 then
 begin
   for I:=1 to 10 do
     pozorovanie.tabulka.delete(10*Grid.SelectedRow);
   Grid.DeleteRow(Grid.SelectedRow);
 end;
end;

procedure TOknoProtokolu.GridEdit(Sender: TObject; ACol, ARow: Integer;
  Value: WideString);
begin
  {po editacii prehodi controller na neulozeny}
  Saved:=false;
  pozorovanie.Tested:=false;
end;

procedure TOknoProtokolu.GridInputAdded(Sender: TObject);
var
  I:Integer;
begin
{ak je riadok uplne prazdny}
if (grid.Cells[1,grid.RowCount-1]='') and
   (grid.Cells[2,grid.RowCount-1]='') and
   (grid.Cells[3,grid.RowCount-1]='') and
   (grid.Cells[4,grid.RowCount-1]='') and
   (grid.Cells[5,grid.RowCount-1]='') and
   (grid.Cells[6,grid.RowCount-1]='') and
   (grid.Cells[7,grid.RowCount-1]='') and
   (grid.Cells[8,grid.RowCount-1]='') and
   (grid.Cells[9,grid.RowCount-1]='')
   then
{hned po pridani sa zmaze}
     Grid.DeleteRow(Grid.RowCount-1)
   else
   {ak riadok neje prazdny}
   {priradenie hodnoty z tabulky do Tpozorovanie}
     For I:=0 to 9 do
       pozorovanie.tabulka.Add(grid.cells[I,grid.rowcount-1]);
  {aby automaticky zoznam scrolloval}
  Grid.SelectLastRow;
  {po zadani riadku hodi editacne okienko na prvu polozku}
  Grid.InputColumn(NxTextColumn2);
end;

procedure TOknoProtokolu.GridAfterRowMove(Sender: TObject; FromPos,
  ToPos: Integer);
var
  I:Integer;
begin
for I:=0 to 9 do
begin
pozorovanie.Tabulka.Exchange(10*FromPos+I,10*ToPos+I);
end;
end;

procedure TOknoProtokolu.ZmazVsekoClick(Sender: TObject);
begin
if MessageDlg  ('Erase all data?',
                mtConfirmation,
                [mbYes, mbCancel], 0)=mrYes
                then
                  begin
                    pozorovanie.Tabulka.Clear;
                    grid.ClearRows;
                    grid.InputColumn(NxTextColumn2);
                  end;
end;

procedure TOknoProtokolu.GridEditAccept(Sender: TObject; ACol,
  ARow: Integer; Value: WideString; var Accept: Boolean);
begin
  {Priradi sa editovana bunka}
  pozorovanie.Tabulka[10*Arow+ACol]:=value;
end;

procedure TOknoProtokolu.Pridat1Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'1');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat2Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'2');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat3Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'3');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat4Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'4');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat5Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'5');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat6Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'6');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat7Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'7');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat8Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'8');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat9Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'9');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat10Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'10');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat11Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'11');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.Pridat12Click(Sender: TObject);
begin
Grid.InputColumn(NxTextColumn2,(TimeToStr(Time)[1]+TimeToStr(Time)[2]));
Grid.InputColumn(NxTextColumn3,(TimeToStr(Time)[4]+TimeToStr(Time)[5]));
Grid.InputColumn(NxTextColumn4,'12');
Grid.InputColumn(NxTextColumn5);
end;

procedure TOknoProtokolu.FormCreate(Sender: TObject);
var
  I,J:integer;
begin
  if pref.redfilter=true
  then
    begin
      grid.Color:=clBlack;
      grid.SelectionColor:=clRed;
      NxIncrementColumn1.Color:=clBlack;
      NxIncrementColumn1.Font.Color:=clMaroon;
      NxTextColumn10.Color:=clBlack;
      NxTextColumn10.Font.Color:=clMaroon;
      NxTextColumn2.Color:=clBlack;
      NxTextColumn2.Font.Color:=clMaroon;
      NxTextColumn3.Color:=clBlack;
      NxTextColumn3.Font.Color:=clMaroon;
      NxTextColumn4.Color:=clBlack;
      NxTextColumn4.Font.Color:=clMaroon;
      NxTextColumn5.Color:=clBlack;
      NxTextColumn5.Font.Color:=clMaroon;
      NxTextColumn6.Color:=clBlack;
      NxTextColumn6.Font.Color:=clMaroon;
      NxTextColumn7.Color:=clBlack;
      NxTextColumn7.Font.Color:=clMaroon;
      NxTextColumn8.Color:=clBlack;
      NxTextColumn8.Font.Color:=clMaroon;
      NxTextColumn9.Color:=clBlack;
      NxTextColumn9.Font.Color:=clMaroon;
    end
  else
    begin
      grid.Color:=clWindow;
      grid.SelectionColor:=clSilver;
      NxIncrementColumn1.Color:=clWindow;
      NxIncrementColumn1.Font.Color:=clWindowText;
      NxTextColumn10.Color:=clWindow;
      NxTextColumn10.Font.Color:=clWindowText;
      NxTextColumn2.Color:=clWindow;
      NxTextColumn2.Font.Color:=clWindowText;
      NxTextColumn3.Color:=clWindow;
      NxTextColumn3.Font.Color:=clWindowText;
      NxTextColumn4.Color:=clWindow;
      NxTextColumn4.Font.Color:=clWindowText;
      NxTextColumn5.Color:=clWindow;
      NxTextColumn5.Font.Color:=clWindowText;
      NxTextColumn6.Color:=clWindow;
      NxTextColumn6.Font.Color:=clWindowText;
      NxTextColumn7.Color:=clWindow;
      NxTextColumn7.Font.Color:=clWindowText;
      NxTextColumn8.Color:=clWindow;
      NxTextColumn8.Font.Color:=clWindowText;
      NxTextColumn9.Color:=clWindow;
      NxTextColumn9.Font.Color:=clWindowText;
    end;

  {cyklus nacita udaje do tabulky z pozorovanie.meteory}
  {ak obsahuje nejake udaje}
  if pozorovanie.tabulka.count<>0 then
  begin
  grid.RowCount:=pozorovanie.Tabulka.count div 10;
  for I:=0 to (pozorovanie.tabulka.count div 10)-1 do
    begin
      for J:=1 to 9 do
        grid.cells[J,I]:=pozorovanie.tabulka[10*I+J];
    end;
  end;
  {automaticke scrollovanie}
  Grid.SelectLastRow;
  {hodi editacne okienko na prvu polozku}
  Grid.InputColumn(NxTextColumn2);
end;

procedure TOknoProtokolu.Zmazarovnakhodnoty1Click(Sender: TObject);
var
  J,I:integer;
begin
  J:=pozorovanie.Tabulka.count-1;
  while J>10 do
    begin
      J:=J-7;
      if pozorovanie.Tabulka[J]=pozorovanie.Tabulka[J-10]
        then
          pozorovanie.Tabulka[J]:='';
      J:=J-1;
      if pozorovanie.Tabulka[J]=pozorovanie.Tabulka[J-10]
        then
          pozorovanie.Tabulka[J]:='';
      J:=J-2;
    end;

  if pozorovanie.tabulka.count<>0 then
    begin
      grid.RowCount:=pozorovanie.Tabulka.count div 10;
      for I:=0 to (pozorovanie.tabulka.count div 10)-1 do
      for J:=1 to 9 do
        grid.cells[J,I]:=pozorovanie.tabulka[10*I+J];
    end;
  Grid.SelectLastRow;
  Grid.InputColumn(NxTextColumn2);

end;

end.