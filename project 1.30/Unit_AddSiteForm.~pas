unit Unit_AddSiteForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Globalne_Premenne, StdCtrls, Unit_Hlavicka;

type
  TAddSiteForm = class(TForm)
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditVyska: TEdit;
    EditMiesto: TEdit;
    EditStat: TEdit;
    EditIMOKod: TEdit;
    Label5: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    ButtonAdd: TButton;
    ESirkaM: TEdit;
    ESirkaH: TEdit;
    EDlzkaM: TEdit;
    EDlzkaH: TEdit;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    EDlzkaS1: TEdit;
    ESirkaS1: TEdit;
    Btcancel: TButton;
    ESirkaP: TComboBox;
    EDlzkaP: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonAddClick(Sender: TObject);
    procedure BtcancelClick(Sender: TObject);
    procedure EditIMOKodKeyPress(Sender: TObject; var Key: Char);
    procedure EditVyskaKeyPress(Sender: TObject; var Key: Char);
    procedure EDlzkaHKeyPress(Sender: TObject; var Key: Char);
    procedure EDlzkaMKeyPress(Sender: TObject; var Key: Char);
    procedure EDlzkaS1KeyPress(Sender: TObject; var Key: Char);
    procedure ESirkaMKeyPress(Sender: TObject; var Key: Char);
    procedure ESirkaS1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ESirkaHKeyPress(Sender: TObject; var Key: Char);
    procedure EditMiestoKeyPress(Sender: TObject; var Key: Char);
    procedure EditStatKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddSiteForm: TAddSiteForm;

implementation

{$R *.dfm}

procedure TAddSiteForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=CaFree;
 AddSiteFormOpened:=false;
end;

procedure TAddSiteForm.ButtonAddClick(Sender: TObject);
var
  sites: file of Tmiesto;
  Udaj: TMiesto;
begin
  If EditMiesto.text=''
  then
    begin
    { ak nie je vyplneny udaj meno miesta}
      Showmessage('At least one box is requied');
    end
  else
    begin
      {ak je vyplneny udaj meno miesta}
      assignFile(sites, extractfilepath(application.ExeName) +  'sites.dat');
      reset(sites);
      {nahraju sa udaje z editov a ulozia do databazy }
      seek(sites, filesize(sites));
      udaj.DlzkaH:=EDlzkaH.text;
      udaj.DlzkaM:=EDlzkaM.text;
      udaj.DlzkaS:=EDlzkaS1.text;
      udaj.DlzkaP:=EDlzkaP.text;
      udaj.SirkaH:=ESirkaH.Text;
      udaj.SirkaM:=ESirkaM.Text;
      udaj.SirkaS:=ESirkaS1.Text;
      udaj.SirkaP:=ESirkaP.Text;
      udaj.Vyska:=EditVyska.Text;
      udaj.Meno:=EditMiesto.Text;
      udaj.Stat:=EditStat.Text;
      udaj.IMOkod:=EditImoKod.Text;
      write(sites, udaj);
      {premenna ukazuje ze existuje novy udaj ktory treba pridat do listboxu}
      newsite:=true;
      closefile(sites);
      Close;
    end;
end;

procedure TAddSiteForm.BtcancelClick(Sender: TObject);
begin
  close;
end;

procedure TAddSiteForm.EditIMOKodKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TAddSiteForm.EditVyskaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TAddSiteForm.EDlzkaHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TAddSiteForm.EDlzkaMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TAddSiteForm.EDlzkaS1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TAddSiteForm.ESirkaMKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TAddSiteForm.ESirkaS1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TAddSiteForm.FormCreate(Sender: TObject);
begin
  EDlzkaP.ItemIndex:=0;
  ESirkaP.ItemIndex:=0;
end;

procedure TAddSiteForm.ESirkaHKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])
    then
      key := #0;
end;

procedure TAddSiteForm.EditMiestoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

procedure TAddSiteForm.EditStatKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9'])
    then
      key := #0;
end;

end.

