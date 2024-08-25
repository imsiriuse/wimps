unit Unit_Help;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  THelp = class(TForm)
    Memo1: TMemo;
    Help: TPageControl;
    Pomoc: TTabSheet;
    TabSheet2: TTabSheet;
    Memo2: TMemo;
    TabSheet1: TTabSheet;
    Memo3: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Help: THelp;
  HelpOpened:boolean;
implementation

{$R *.dfm}

procedure THelp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
  HelpOpened:=false;
end;

end.
