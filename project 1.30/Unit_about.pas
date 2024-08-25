unit Unit_about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAbout = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About: TAbout;
  AboutOpened: boolean;
implementation

{$R *.dfm}

procedure TAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
  AboutOpened:=false;
end;

procedure TAbout.Button1Click(Sender: TObject);
begin
  about.Close;
end;

end.
