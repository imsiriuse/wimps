program WndMain;

uses
  Forms,
  Unit_Main in 'Unit_Main.pas' {Main},
  Unit_Tabulka in 'Unit_Tabulka.pas' {OknoProtokolu},
  Unit_Hlavicka in 'Unit_Hlavicka.pas' {OknoHlavicky},
  Unit_Nastavenia in 'Unit_Nastavenia.pas' {WndNastavenia},
  Unit_Statistika in 'Unit_Statistika.pas' {OknoStatistiky},
  Unit_DataTest in 'Unit_DataTest.pas' {DataTest},
  Globalne_premenne in 'Globalne_premenne.pas',
  Unit_AddSiteForm in 'Unit_AddSiteForm.pas' {AddSiteForm},
  Unit_AddObserverForm in 'Unit_AddObserverForm.pas' {AddObserverForm},
  Unit_Intervaly in 'Unit_Intervaly.pas' {OknoIntervalu},
  Unit_Help in 'Unit_Help.pas' {Help},
  Unit_about in 'Unit_about.pas' {About};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'WIPMS';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
