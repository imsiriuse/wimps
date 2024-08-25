unit Globalne_premenne;
interface
uses
  Windows,Dialogs,SysUtils,Messages,Classes,Forms;
type
  TLimits = record
  rec: integer;
  dec: integer;
  mag: array[1..99] of string[4];
end;
type
  TPref = record
    trojuholniky: boolean;
    redfilter: boolean;
    horizont: integer;
    kvalita: string[1];
    rojovost: string[1];
    stopa: string[1];
    ContFrekvenciaZHR: boolean;
    ContLimitky: boolean;
    ContPoctyMeteorov: boolean;
    ContRastZhr: boolean;
    ContVyskaRADiantu: boolean;
    ContPrestavky: boolean;
end;
type
  TRoj = record
    meno: String[20];
    zac: string[5];
    kon: string[5];
    max: string[4];
    rec: string[3];
    dec: string[3];
    da: string[3];
    dd: string[3];
    vel: string[2];
    f: string[3];
    zhr: string[3];
    ImoCod: string[3];
    Znak: string[1];
end;
type
  TLimitka = record
    Hod: String[2];
    Min: String[2];
    trojuholnik: String[2];
    hviezdy: String[3];
    limitka: string[3];
    rec: integer;
    dec: integer;
end;
type
  TOblaky = record
    ZacH: String[2];
    ZacM: String[2];
    KonH: String[2];
    KonM: String[2];
    percenta: String[3];
end;
type
  TPrestavka = record
    ZacH: String[2];
    ZacM: String[2];
    KonH: String[2];
    KonM: String[2];
end;
type
  TIntPozorovatel = record
    StredRec: integer;
    StredDec: integer;
    cislo: String[2];
    stred: String[3];
    prestavky:array[1..10] of TPrestavka;
    oblacnost:array[1..10] of TOblaky;
    limitky:array[1..10] of TLimitka;
    BrkPocet: Integer;
    CldPocet: Integer;
    LimPocet: Integer;
end;
type
  TInterval = record
    ZacH: String[2];
    ZacM: String[2];
    KonH: String[2];
    KonM: String[2];
    pozorovatelia:array[1..12] of TIntPozorovatel;
    PozPocet: Integer;
end;
type
  Tpozorovatel = record
    Imokod: String[5];
    meno: String[12];
    priezvisko: String[15];
    IMOcislo: String[5];
end;
type
  Tmiesto = record
    DlzkaP: String[1];
    DlzkaH: String[3];
    DlzkaM: String[2];
    DlzkaS: String[2];
    SirkaP: String[1];
    SirkaM: String[2];
    SirkaH: String[2];
    SirkaS: String[2];
    Vyska: String[4];
    Meno: String[20];
    Stat: String[20];
    IMOkod: String[5];
end;
type
  Tpozorovanie = record
    {Typ suboru 1 normalny, 2 IMO, 3 je statistika}
    TypSuboru:string[1];
    {Prepinac ci bol objekt testovany}
    Tested:   boolean;
    {Tabulka zaznamov meteorov}
    Tabulka: TStringList;
    {Hlavicka}
    Datum: String[12];
    ZaciatokH: string[2];
    ZaciatokM: String[2];
    KoniecH: String[2];
    KoniecM: string[2];
    miesto: Tmiesto;
    { Pozorovatelia }
    zapisovatel: Tpozorovatel;
    pozPocet:integer;
    pozorovatel:array[1..12] of Tpozorovatel;
    { Intervaly}
    intervaly:array[1..10] of Tinterval;
    IntPocet: integer;
    {roje}
    RojPocet: integer;
    roje: array[1..10] of TRoj;
end;

var
 Saved      : Boolean;
 Pozorovanie: TPozorovanie;
 Pref       : TPref;
implementation

end.
