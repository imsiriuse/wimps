unit Unit_AddObserverForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit_Hlavicka, StdCtrls, Globalne_Premenne;

type
  TAddObserverForm = class(TForm)
    Label24: TLabel;
    EMenoPozorovatela: TEdit;
    EIMOkodPozorovatela: TEdit;
    EPriezviskoPozorovatela: TEdit;
    BtAdd: TButton;
    BtZrusit: TButton;
    EIMOCislopozorovatela: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtZrusitClick(Sender: TObject);
    procedure BtAddClick(Sender: TObject);
    procedure EIMOCislopozorovatelaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EIMOkodPozorovatelaKeyPress(Sender: TObject; var Key: Char);
    procedure EMenoPozorovatelaKeyPress(Sender: TObject; var Key: Char);
    procedure EPriezviskoPozorovatelaKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddObserverForm: TAddObserverForm;

implementation

{$R *.dfm}

procedure TAddObserverForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=CaFree;
 AddObserverFormOpened:=false;
end;

procedure TAddObserverForm.BtZrusitClick(Sender: TObject);
begin
{vypne form}
close;
end;

procedure TAddObserverForm.BtAddClick(Sender: TObject);
var
  observers: File Of Tpozorovatel;
  udaj: Tpozorovatel;
  I:integer;
  cont: boolean;
begin
{ak su vsetky tri edity vyplnene}
  if ((EMenoPozorovatela.text='') or
      (EPriezviskoPozorovatela.text='')) or
      (EImoKodPozorovatela.text='')
    then
     showmessage('You have to fill all boxes')
    else
     begin
     {prida sa pozorovatel do databazy}
      assignFile(observers, extractfilepath(application.ExeName) +  'observers.dat');
      reset(observers);
      cont:=true;
      {kontrola ci taky pozorovatel uz existuje}
      for I:=1 to FileSize(observers) do
        begin
          seek(observers, I-1);
          read(observers, udaj);
          if udaj.ImoKod=EIMOkodPozorovatela.text
            then cont:=false;
        end;
        {ak neexistuje}
      if cont=false
        then
          begin
            showmessage('This IMO code is already in database');
            EIMOKodPozorovatela.text:='';
          end
        else
          begin
            {pripoji sa na koniec databazy novy pozorovatel}
            seek(observers, filesize(observers));
            udaj.Imokod:=EIMOKodPozorovatela.Text;
            udaj.meno:=EMenoPozorovatela.Text;
            udaj.priezvisko:=EPriezviskoPozorovatela.Text;
            udaj.IMOcislo:=EImocislopozorovatela.text;
            write(observers, udaj);
            {premenna ktora urcuje ci existuje novy pozorovatel
            koli tomu aby pri aktivacii noveho formu pridalo pozorovatela do
            listu}
            newobserver:=true;
            closefile(observers);
            Close;
          end;
    end;
end;


procedure TAddObserverForm.EIMOCislopozorovatelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TAddObserverForm.EIMOkodPozorovatelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

procedure TAddObserverForm.EMenoPozorovatelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

procedure TAddObserverForm.EPriezviskoPozorovatelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

end.




