object Help: THelp
  Left = 303
  Top = 157
  BorderStyle = bsDialog
  Caption = 'Help'
  ClientHeight = 441
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Help: TPageControl
    Left = 0
    Top = 0
    Width = 409
    Height = 441
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object Pomoc: TTabSheet
      Caption = 'Pomoc'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 401
        Height = 413
        Align = alClient
        Color = clCream
        Lines.Strings = (
          'HELP'
          'Main Window '
          ''
          'File New - Otvor'#237' nov'#253' s'#250'bor, pri'#269'om sa ten star'#253' zma'#382'e '
          'Open - Otvor'#237' s'#250'bor z disku '
          'Save - Ulo'#382#237' s'#250'bor '
          'Save as - Ulo'#382#237' s'#250'bor s mo'#382'nos'#357'ou '
          'Import, Export - Pozri Import, Export '
          'Exit - Vypne program '
          ''
          'Import'
          
            'Program WIMPS podporuje s'#250'bory z programu IMOPROT. S'#250'bor mus'#237' by' +
            #357' '
          'n'#225'le'#382'ite '
          
            'upraven'#253' a v IMOPROT s'#250'bore nesm'#250' by'#357' vlo'#382'en'#233' pr'#225'zdne riadky. Mu' +
            's'#237' by'#357' '
          'zachovan'#225' '#353'trukt'#250'ra '
          'p'#244'vodn'#233'ho s'#250'boru. '
          ''
          'D'#225'tum a '#269'as'
          
            'D'#225'tum a '#269'as mus'#237' by'#357' nastaven'#253' v miestnych jazykov'#253'ch nastavenia' +
            'ch v tvare'
          
            'dd.mm.rrrr hh:mm . Inak s'#250'bor *.prt nepre'#269#237'ta a pri kl'#225'vesovej s' +
            'kratke shift+F# '
          'zle '
          'dopln'#237' '#269'as.'
          ''
          'Header '
          'V sekcii Header vyp'#314#328'a u'#382#237'vate'#318' z'#225'kladn'#233' '#250'daje o pozorovan'#237'. '
          
            'D'#225'tum je prednastaven'#253' na 30.12.1899 ale po spusten'#237' kalend'#225'ra j' +
            'e mo'#382'nost'#357' '
          
            'dosta'#357' sa automaticky na d'#225'tum syst'#233'mov'#233'ho '#269'asu. '#218'daje sa m'#244#382'u v' +
            'pisova'#357' '
          'rovno do li'#353'ty. '
          
            'Za'#269'iatok a koniec cel'#233'ho pozorovania. '#268'as sa zad'#225'va v UT. Progra' +
            'm obsahuje '
          
            'datab'#225'zu miest v '#268'eskej a Slovenskej republike. Je mo'#382'nos'#357' dopln' +
            'i'#357' vlastn'#233' '
          'miesto kliknut'#237'm na '
          
            'tla'#269#237'tko add place a vyplnen'#237'm formul'#225'ra. Vyp'#314#328'aj'#250' sa s'#250'radnice,' +
            ' meno '
          
            'pozorovacieho miesta, pridelen'#253' IMO k'#243'd (ak IMO k'#243'd neexistuje p' +
            'ole zost'#225'va '
          'pr'#225'zdne), '#353't'#225't a v'#253#353'ku nad '
          
            'obzorom. Z datab'#225'zy sa daj'#250' maza'#357' polo'#382'ky kliknut'#237'm prav'#237'm tla'#269#237 +
            'tkom a '
          'zvolen'#237'm '
          
            'mo'#382'nosti erase entry. Tla'#269'idlo Erase All sl'#250#382'i na zmazanie v'#353'etk' +
            #253'ch polo'#382'iek. '
          ''
          'Observers '
          
            'Program obsahuje datab'#225'zu pozorovate'#318'ov, ktor'#250' si vytv'#225'ra s'#225'm u'#382 +
            #237'vate'#318'. '
          'Prida'#357' '
          
            'osobu do datab'#225'zy m'#244#382'ete kliknut'#237'm na tla'#269'idlo Add Observer. IMO' +
            ' '#269#237'slo nieje '
          'povinn'#253' '#250'daj.  '
          
            'V programe sa uchov'#225'vaj'#250' inform'#225'cie aj o zapisovate'#318'och. Zadanie' +
            ' mena '
          
            'zapisovate'#318'a je mo'#382'n'#233' kliknut'#237'm prav'#233'ho tla'#269'idla na datab'#225'zu a v' +
            'ybran'#237'm '
          'mo'#382'nosti add recorder. '
          
            'Pozorovoate'#318'a do tabu'#318'ky prid'#225'te dvojklikom na z'#225'znam v datab'#225'ze' +
            '. '
          
            'Pozorovatelia sa daj'#250' prid'#225'va'#357' len prostredn'#237'ctvom datab'#225'zy. Tla' +
            #269'idlo erase all '
          'sl'#250#382'i na zmazanie v'#353'etk'#253'ch '
          #250'dajov. '
          'Program podporuje iba 12 pozorovate'#318'ov.'
          ''
          'Showers '
          
            #218'daje o roje sa automaticky dopl'#328'uj'#250' z datab'#225'zy. Pole ID je znak' +
            ' pod ktor'#253'm '
          
            'budete rozozn'#225'va'#357' roj v tabu'#318'ke. Roje sa vyberaj'#250' a prid'#225'vaj'#250' po' +
            'mocou tla'#269'idla '
          'add shower. Po '
          
            'kliknut'#237' prav'#253'm tla'#269'idlom na tabu'#318'ku rojov je mo'#382'n'#233' zmaza'#357' '#250'daj ' +
            'alebo zmaza'#357' '
          'v'#353'etky '#250'daje. '
          ''
          'Intervals'
          
            'V sekcii intervaly sa zapisuj'#250' pozorovacie intervaly. Intervaly ' +
            'by nemali by'#357' dlh'#353'ie '
          
            'ako hodina. Intervaly sa potom vyn'#225#353'aj'#250' do grafu za cel'#233' pozorov' +
            'anie (noc). '
          'Cel'#253' '
          'syst'#233'm '
          
            'prid'#225'vania intervalov vyzer'#225' ve'#318'mi zlo'#382'ito, ale po jeho pochopen' +
            #237' je ve'#318'mi '
          
            'preh'#318'adn'#253' a r'#253'chly. Je zalo'#382'en'#253' na stromovej '#353'trukt'#250're. V prvej ' +
            'kolonke new '
          'interval sa vypln'#237' '
          
            'za'#269'iatok a koniec intervalu, a interval prid'#225'te kliknut'#237'm na add' +
            '. Po vyplnen'#237' '
          'druhej '
          
            'kolonky add observer do dan'#233'ho intervalu prid'#225'vate pozorovate'#318'ov' +
            ', ktor'#237' v tom '
          #269'ase '
          
            'pozorovali. Vyp'#314#328'a sa '#269#237'slo pozorovate'#318'a (1-12) a stred jeho zor' +
            'n'#233'ho po'#318'a. '
          'M'#244#382'ete '
          
            'jeho s'#250'radnice (rektascenziu a deklin'#225'ciu) dop'#314#328'a'#357' priamo, alebo' +
            ' vybra'#357' z '
          'datab'#225'zy s'#250'hvezd'#237
          
            '(Ozna'#269'en'#233' s'#250' skratkami). Ku ka'#382'd'#233'mu pozorovate'#318'ovi sa osobitne p' +
            'rid'#225'vaj'#250' '
          
            'eventy, prest'#225'vka, obla'#269'nos'#357' a limitn'#225' magnit'#250'da, pri'#269'om limitn'#225 +
            ' magnit'#250'da je '
          'povinn'#225' pre ka'#382'd'#233'ho '
          
            'pozorovate'#318'a aspo'#328' raz v ka'#382'dom intervale. Ka'#382'd'#253' pozorovate'#318' m'#244#382 +
            'e ma'#357' v '
          
            'jednom intervale maxim'#225'lne 10 eventov. Pri prid'#225'van'#237' eventu mus'#237 +
            ' by'#357' kliknut'#233' '
          'na '
          'pozorovate'#318'a, ku '
          
            'ktor'#233'mu chcete prida'#357' dan'#250' udalos'#357'. V kolonke add break vyp'#314#328'ate' +
            ' za'#263'iatok a '
          
            'koniec prest'#225'vky (napr. ke'#271' pozorovate'#318' zapsal). V kolonke add c' +
            'louds '
          'vyp'#314#328'ate '
          'za'#269'iatok a koniec '
          
            'ke'#271' obla'#269'nos'#357' zakryla oblohu a plochu zakrytej oblohy v percent'#225 +
            'ch. Pri limitnej '
          
            'magnit'#250'de zad'#225'vate '#269'as kedy boli podmienky meran'#233' a z datab'#225'zy m' +
            #244#378'ete '
          'vybra'#357' '
          #269#237'slo '
          
            'trojuholn'#237'ka a po'#269'et hviezd. '#218'daje sa ma'#382#250' kliknut'#237'm prav'#253'm tla'#269 +
            'idlom na '#250'daj a '
          
            'vybran'#237'm mo'#382'nosti erase. Edit'#225'cia '#250'dajov sa vykon'#225'va dvojklikom ' +
            'na udaj, '#250'daj '
          'je '
          'potom '
          
            'zv'#253'raznen'#253' a data z neho sa doplnia do okienka, kde sa n'#225'le'#382'ite ' +
            'upravia a '
          'znovu '
          
            'ulo'#382'ia do tabu'#318'ky tla'#269'idlom Edit. Sekcia intervaly obsahuje tla'#269 +
            'idl'#225' expand a '
          'collapse. Tla'#269'idlo '
          
            'expand roztvor'#237' cel'#250' stromov'#250' '#353'trukt'#250'ru, a collapse uzavrie cel'#250 +
            ' stromov'#250' '
          #353'trukt'#250'ru na z'#225'kladn'#233' jednotky. '
          'Meteory '
          
            'Tabu'#318'ka '#250'dajov o jednotliv'#253'ch meteoroch m'#225' input riadok, do ktor' +
            #233'ho sa '
          
            'zad'#225'vaj'#250' '#250'daje. Doprava v '#250'dajoch sa pos'#250'va kl'#225'vesou TAB, do'#318'ava' +
            ' '
          'kl'#225'vesovou skratkou TAB+Shift. '#218'daj '
          
            #269#237'slo meteoru (N.) sa ned'#225' dop'#314#328'a'#357' je automaticky. Pri prvom met' +
            'eore mus'#237' by'#357' '
          
            'vyplnen'#253' '#269'as. Ak nie je, tak potom sa automaticky dopln'#237' za'#269'iato' +
            'k prv'#233'ho '
          'intervalu. Pokia'#318' nie je '
          
            'vyplnen'#253' '#250'daj o '#269'ase, dop'#314#328'a sa predch'#225'dzaj'#250'ci vyplnen'#253'. Pokia'#318' ' +
            'je vyplnen'#253' '
          
            #250'daj o hodin'#225'ch ale nie je o min'#250'tach, tak sa implicitne dop'#314#328'a ' +
            'za min'#250'ty 00. '
          
            #218'daje, ktor'#233' nem'#244#382'e program automaticky doplni'#357' s'#250' pozorovate'#318' (' +
            'Obs), '
          
            'magnit'#250'da meteoru (mag). Doplnite'#318'n'#233' '#250'daje s'#250' rojov'#225' pr'#237'slu'#353'os'#357' ' +
            '(Shw), stopa '
          '(tra) '
          
            'a kvalita (qua). To, '#382'e s'#250' doplnite'#318'n'#233' znamen'#225', '#382'e pri teste d'#225't' +
            ' '
          
            'sa automaticky dopl'#328'uje nastaven'#233' d'#225'ta. To, '#269'o sa dopl'#328'uje, sa d' +
            #225' nastavi'#357' v '
          
            'nastaveniach. '#218'daj v'#253#353'ka nad obzorom nie je povinn'#253' '#250'daj. Ozna'#269'e' +
            'nie '
          'spolo'#269'n'#253'ch meteorov sa zapisuje '
          
            'rovnak'#253'm znakom. Nie je dole'#382'it'#233' ak'#253' je to znak. Znaky sa musia ' +
            'strieda'#357'. Ke'#271' '
          'meteor videl len jeden pozorovate'#318' pole sa nech'#225'va pr'#225'zdne. '
          ''
          
            'Existuj'#250' kl'#225'vesov'#233' skratky, ktor'#233' umo'#382#328'uj'#250' zapisovanie meteorov ' +
            'v re'#225'lnom '
          #269'ase '
          
            'po'#269'as pozorovania. Je to skratka SHIFT +F# kde # je '#269#237'slo pozoro' +
            'vate'#318'a, '
          'ktor'#233'ho chcete doplni'#357'. Okam'#382'ite sa zapisuje syst'#233'mov'#253' '#269'as.'
          ''
          'Test d'#225't '
          
            'V sekcii test d'#225't sa testuj'#250' vstupn'#233' d'#225'ta, '#269'i sa jedn'#225' o syntakt' +
            'ick'#233' chyby alebo '
          'o '
          
            'logick'#233' chyby. Zlep'#353'uje to presnos'#357' '#353'tatistiky a vylu'#269'uje r'#244'zne ' +
            'chyby pri '
          
            'v'#253'po'#269'toch. Prv'#253' st'#314'pec obsahuje poradov'#233' '#269#237'slo chyby. V druhom s' +
            't'#314'pci p'#237#353'e '
          #269#237'slo '
          
            'chyby v chybovn'#237'ku. Tret'#237' st'#314'pec postition obsahuje miesto, kde ' +
            'sa t'#225' chyba '
          
            'nach'#225'dza. Pokia'#318' sa nach'#225'dza v sekcii meteory, za slovom meteor ' +
            'sa '
          'nach'#225'dza '
          
            #269#237'slo riadku, v ktorom je chyba. Kontrolova'#357' sa mus'#237' viac kr'#225't p' +
            'o sebe, preto'#382'e '
          'chybov'#233' hl'#225'senia sa vypisuj'#250' sekven'#269'ne.'
          ''
          'Chybov'#233' hl'#225'senia'
          '1  - Missing value'
          
            #9'Objavuje sa pokia'#318' nie je vyplnen'#253' povinn'#253' '#250'daj. Niektor'#233' '#250'daje' +
            ' s'#250' '
          'nevyhnun'#233' pre '#271'al'#353'ie v'#253'po'#269'ty.'
          ''
          '2  - Invalid character'
          ' '#9'Objavuje sa pokia'#318' znakov'#253' '#250'daj je zadan'#253' na mieste, kde je '
          'povolen'#253' '
          'len '#269#237'seln'#253' '#250'daj alebo naopak. '
          ''
          '3  - Wrong value'
          
            #9'Objavuje sa pokia'#318' zadan'#225' hodnota nie je re'#225'lna. Z'#225'porn'#225', va'#269#353'i' +
            'a '
          'alebo men'#353'ia ako norm'#225'lna.'
          ''
          '4  - No data'
          
            #9'Objavuje sa ak nie je v tabu'#318'ke zadan'#253' dostato'#269'n'#253' po'#269'et '#250'dajov,' +
            ' '
          'alebo '
          'nie s'#250' zadan'#233' '#382'iadne.'
          ''
          '5  - Duplicate value'
          
            #9'Objavuje sa pokia'#318' sa v tabu'#318'ke nach'#225'dza tak'#253' ist'#253' '#250'daj dvakr'#225't' +
            ' '
          'alebo '
          
            'viackr'#225't. Chyba sa objavuje len pri nektor'#253'ch tabu'#318'k'#225'ch. Napr'#237'kl' +
            'ad dvaja '
          'rovnak'#237' '
          'pozorovatelia sa v tabu'#318'ke nesm'#250' nach'#225'dza'#357'.'
          ''
          '6  - Shower out of activity'
          
            #9'Objavuje sa ak je d'#225'tum pozorovania mimo rojovej aktivity zadan' +
            'ej v '
          'datab'#225'zach.'
          ''
          '7  - Same times'
          #9' Objavuje sa ak je zadan'#253' interval s rovnak'#253'm '#269'asom za'#269'iatku a '
          'konca.'
          ''
          '8  - Interval out of observation'
          
            #9' Objavuje sa ak sa zadan'#253' interval nenach'#225'dza v '#269'ase pozorvania' +
            '.'
          ''
          '9  - Event out of interval'
          
            #9' Objavuje sa ak sa dan'#225' udalos'#357' (prest'#225'vka, limitn'#225' magnit'#250'da a' +
            'lebo '
          'obla'#269'nos'#357') nenach'#225'dza v '#269'ase intervalu.'
          ''
          '10 - Overlayed intervals'
          
            #9' Objavuje sa pokia'#318' sa za'#269'iatok alebo koniec intervalu nach'#225'dza' +
            ' v '
          'druhom intervale. T.j., '#382'e sa intervaly prekr'#253'vaj'#250'.'
          ''
          '11 - Observing array below horizont'
          
            #9'Objavuje sa pokia'#318' stred pozorovacieho po'#318'a klesne po'#269'as interv' +
            'alu '
          'pod hodnotu horizontu zadan'#250' v nastaveniach.'
          ''
          '12 - Radiant below horizont'
          
            #9' Objavuje sa ak stred radiantu po'#269'as intervalu klesne pod hodno' +
            'tu '
          'horizontu zadan'#250' v nastaveniach.'
          ''
          '13* - Limit square below the horizont'
          
            #9' Objavuje sa ak sa limitn'#253' trojuholn'#237'k v '#269'ase zad'#225'vania  nach'#225'd' +
            'za '
          'ni'#382#353'ie ako je hodnota horizontu zadan'#225' v nastaveniach.'
          ''
          '14 - Missing observer'
          
            #9' Objavuje sa ak v tabu'#318'ke meteorov je zadan'#233' '#269#237'slo pozorovate'#318'a' +
            ', '
          'ktor'#233' sa nenach'#225'dza v tabu'#318'ke pozorovate'#318'ov.'
          ''
          '15 - Meteor out of interval'
          #9'Objavuje sa ak v tabu'#318'ke meteorov je zadan'#253' '#269'as meteoru, ktor'#253' '
          'nepatr'#237' '#382'iadnemu zo zadan'#253'ch intervalov.'
          ''
          '16 - Observer out of interval'
          #9'Objavuje sa ak v tabu'#318'ke meteorov je zadan'#253' pozorovate'#318', ktor'#253' '
          'pozoroval meteor ale nenach'#225'dzal sa v danom intervale.'
          ''
          '17 - Incorrect time sequence'
          
            #9'Objavuje sa ak v tabu'#318'ke meteorov s'#250' zadan'#233' '#269'asy preletu meteor' +
            'ov, '
          'ktor'#233' nejd'#250' po sebe.'
          ''
          '18 - Joined meteor in a different times'
          
            #9'Objavuje sa ak v tabu'#318'ke meteorov s'#250' ozna'#269'en'#233' spolo'#269'n'#233' meteory ' +
            'v '
          'rozdielnych '#269'asoch.'
          ''
          '19 - Joined meteor to same observer'
          #9'Objavuje sa ak v tabu'#318'ke meteorov s'#250' ozna'#269'en'#233' spolo'#269'n'#233' meteory '
          'tomu ist'#233'mu pozorovate'#318'ovi.'
          ''
          '20 - Absent shower'
          
            #9'Objavuje sa ak v tabu'#318'ke meteorov je zadan'#233' ozna'#269'enie roja, kto' +
            'r'#233' '
          'sa '
          'nenach'#225'dza v tabu'#318'ke rojov.'
          ''
          '21 - Incorrect unround form'
          
            #9'Objavuje sa ak v tabu'#318'ke meteorov je zadan'#225' nespr'#225'vne zaokr'#250'hle' +
            'n'#225' '
          
            'hodnota v'#253#353'ky nad obzorom alebo magnit'#250'dy. Magnit'#250'da sa zaokr'#250'h'#318 +
            'uje na 0.5 '
          'a '
          'v'#253#353'ka nad obzorom na 10.'
          ''
          '22*'
          ''
          '23 - Meteor below horizont'
          #9'Objavuje sa ak v tabu'#318'ke meteorov je zadan'#225' v'#253#353'ka nad obozorm '
          'ni'#382#353#353'ia ako je zadan'#225' hodnota horizontu v nastaveniach.'
          ''
          '24 - Meteor below the limit magnitude'
          
            #9'Objavuje sa ak v tabu'#318'ke meteorov je zadan'#225' jasnos'#357' meterou ni'#382 +
            #353'ia '
          'ako danej limitnej magnit'#250'dy.'
          ''
          '25 - No meteor in interval'
          
            #9'Objavuje sa ak v tabu'#318'ke intervalov nenach'#225'dza interval do ktor' +
            #233'ho '
          'by '
          'patril aspo'#328' jeden meteor.'
          ''
          '26 - Only one joined meteor'
          #9'Objavuje sa ak v tabu'#318'ke meteorov sa nach'#225'dza meteor, ktor'#253' je '
          
            'ozna'#269'en'#253' ako spolo'#269'n'#253', ale nem'#225' in'#253' spolo'#269'n'#253' meteor. T.j. m'#225' ozn' +
            'a'#269'enie '
          
            'spolo'#269'neho meteoru a po '#328'om nasleduje u'#382' ozna'#263'enie in'#233'ho spolo'#269'n' +
            #233'ho '
          'meteoru.'
          ''
          '27* - No meteor from shower'
          #9'Objavuje sa ak nebol zadan'#253' ani jeden meteor s ozna'#269'en'#237'm '
          'zadan'#233'ho '
          'roja.'
          ''
          '28 - Event during a break'
          #9'Objavuje sa ak nejak'#225' udalos'#357' (meteor, mraky alebo limitn'#225' '
          'magnit'#250'da) '
          'bola zadan'#225' po'#269'as prest'#225'vky.'
          ''
          '29 - unused observer'
          
            #9'Objavuje sa ak v tabu'#318'ke pozorovate'#318'ov je pozorovate'#318', ktor'#253' ne' +
            'm'#225' '
          'zadan'#253' ani jeden meteor.'
          ''
          'Summary report'
          
            'T'#225'to sekcia programu sa del'#237' na viac '#269'ast'#237'. Tieto '#269'asti sa daj'#250' ' +
            'upravova'#357', '
          'm'#244#382'ete '
          
            'si vybra'#357', ktor'#250' '#269'as'#357' chete zobrazi'#357' v sum'#225'rnej '#353'tatistike. Mo'#382'n' +
            'os'#357' meni'#357' vzh'#318'ad '
          #353'tatistiky sa d'#225' zvoli'#357' v nastaveniach. '
          ''
          
            'Prv'#225' '#269'as'#357' sa naz'#253'va hlavi'#269'ka. S'#250' to inform'#225'cie o pozorovan'#237', kto' +
            'r'#233' ste zad'#225'vali '
          'na za'#269'iatku pozorovania.'
          ''
          
            'Report obsahuje sum'#225'rnu '#353'tatistiku celej skupiny. Obsahuje ZHR v' +
            #353'ek'#253'ch '
          
            'pozorovan'#253'ch rojov vr'#225'tane sporadick'#253'ch meteorov, sumu pozorovac' +
            #237'ch '#269'asov '
          'a '
          
            'aritmetick'#253' priemer '#269'asov jednotliv'#253'ch pozorovate'#318'ov. Obsahuje t' +
            'aktie'#382' po'#269'et '
          
            'rojov'#253'ch a sporadick'#253'ch meteorov. Pokia'#318' aspo'#328' jeden pozorovate'#318 +
            ' ozna'#269'il, '#382'e '
          
            'meteor je rojov'#253', tak ho algoritmus po'#269#237'ta dan'#253' meteor ako rojov' +
            #253'. Pokia'#318' jeden '
          
            #269'lovek ozna'#269'il meteor z roja A a druh'#253' '#269'lovek ho ozna'#269'il za roj ' +
            'B, potom sa '
          'meteor '
          
            'pripo'#269#237'ta aj do roja A aj do roja B. Pokia'#318' je vo v'#353'etk'#253'ch z'#225'zna' +
            'mch o jednom '
          
            'meteore sporadick'#233' ozna'#269'enie, potom sa meteor po'#269#237'ta ako sporadi' +
            'ck'#253' meteor. '
          
            'Pozor! S'#250#269'et v'#353'etk'#253'ch rojov'#253'ch a sporadick'#253'ch meteorov nemus'#237' by' +
            #357' rovnak'#253' '
          'ako s'#250#269'et v'#353'etk'#253'ch fyzick'#253'ch meteorov zap'#237'san'#253'ch v protokole.'
          
            'T'#225'to '#269'as'#357' '#353'tatistiky taktie'#382' obsahuje priemern'#250' limitn'#250' magnit'#250'd' +
            'u v'#353'etk'#253'ch '
          'pozorovate'#318'ov a priemern'#233' percento zakrytej oblohy.'
          ''
          
            'Dal'#353'ia '#269'as'#357' s'#250' '#250'daje o zapisovate'#318'ovi, jeho meno a priezvisko, I' +
            'MO skratka. '
          #270'alej '
          'maxim'#225'lna frekvencia z'#225'pisov a po'#269'et pozorovate'#318'ov.'
          ''
          
            'V '#271'al'#353'ej '#269'asti sa nach'#225'dzaj'#250' inform'#225'cie o rojoch spolu s grafom ' +
            'st'#250'pania, alebo '
          
            'klesania radiantu vo'#269'i obzoru. Obsahuje tie'#382' inform'#225'cie ako meno' +
            ' a IMO k'#243'd, '
          
            'd'#225'tumy za'#269'iatku, konca a maxima aktivity, rovn'#237'kov'#233' s'#250'radnice a ' +
            'denn'#253' posuv '
          
            'radiantu. Geocentrick'#250' r'#253'chlos'#357' meteorov a popula'#269'n'#253' index roja.' +
            ' Popula'#269'n'#253' '
          
            'index, geocentrick'#225' r'#253'chlos'#357', denn'#253' posuv a d'#225'tumy aktivity s'#250' t' +
            'abu'#318'kov'#233' '
          'hodnoty na'#269#237'tan'#233' z datab'#225'zy. '#218'daje sa '#269'erpaj'#250' z www.imo.net.'
          ''
          
            'Nasleduj'#250' grafy, pri ktor'#253'ch je mo'#382'nos'#357' zvoli'#357' si, '#269'i sa dan'#253' gr' +
            'af zobraz'#237' v '
          #353'tatistike.'
          
            'ZHR graf za jednu noc. Na graf sa vyn'#225#353'aj'#250' hodnoty ZHR za 1 inte' +
            'rval.'
          
            'Zmeny limitn'#253'ch magnit'#250'd, na graf sa vyn'#225#353'a hodnota limitnej mag' +
            'nit'#250'dy po'#269'as '
          'cel'#233'ho pozorovania.'
          
            'Min'#250'tov'#225' frekvencia meteorov ukazuje, ko'#318'ko fyzick'#253'ch meteorov s' +
            'a obiavilo '
          'po'#269'as 1 min'#250'ty.'
          
            'Kol'#225#269'ov'#233' grafy ukazuj'#250' rozdelenie, ktor'#253' z pozorovate'#318'ov ohl'#225'sil' +
            ' najviac '
          
            'meteorov. Jeden graf je pre s'#250#269'et meteorov zo v'#353'etk'#253'ch rojov a d' +
            'ruh'#253' plat'#237' pre '
          'sporadick'#233' meteory.'
          
            #270'al'#347'ie dva kol'#225#269'ov'#233' grafy sl'#250#382'ia na porovnanie s'#250#269'tu efekt'#237'vneho' +
            ' '
          'pozorovacieho '
          
            #269'asu s prest'#225'vkami jednotliv'#253'ch pozorovate'#318'ov. Druh'#253' porovn'#225'va e' +
            'fekt'#237'vne '
          'pozorovacie '#269'asy jednotliv'#253'ch pozorovate'#318'ov.'
          ''
          
            'V '#271'al'#353'ej sekcii sa nach'#225'dza spr'#225'va ka'#382'd'#233'ho pozorovate'#318'a zvl'#225#353#357', ' +
            'ktor'#225' '
          'obsahuje '
          
            'jeho meno, IMO skratku a '#269#237'slo, taktie'#382' v'#225#382'en'#253' priemer limitnej ' +
            'magnit'#250'dy za '
          'cel'#233' '
          
            'pozorovanie, priemern'#250' obla'#269'nos'#357', po'#269'et a celkov'#250' d'#314#382'ku prest'#225'vo' +
            'k, efekt'#237'vny '
          
            'pozorovac'#237' '#269'as dan'#233'ho pozorovate'#318'a. Po'#269'et rojov'#253'ch meteorov pre ' +
            'v'#353'etky roje '
          'a '
          
            'po'#269'et sporadick'#253'ch meteorov. Osobn'#233' ZHR dan'#233'ho pozorovate'#318'a pre ' +
            'v'#353'etky '
          'roje, aj sporadick'#253'ch meteorov.'
          ''
          'IMO form'
          
            'IMO formul'#225'r je prisp'#244'soben'#253' presne do tvaru ak'#253' '#382'iada IMO. Vyho' +
            'dnocuje sa '
          'pre '
          
            'ka'#382'd'#233'ho pozorovate'#318'a zvl'#225#353#357', pri'#269'om obsahuje inform'#225'cie o pozoro' +
            'vate'#318'ovi '
          
            '(meno, priezvisko, IMO '#269#237'slo), inform'#225'cie o pozorovacej lokalite' +
            ' (n'#225'zov, IMO '
          #269#237'slo, '
          
            #353't'#225't, s'#250'radnice), inform'#225'cie o za'#269'iatku a konci pozorovania. '#270'al' +
            'ej obsahuje '
          
            'tabu'#318'ky, ktor'#233' presne vy'#382'aduje IMO. Tabu'#318'ku o pozorovan'#253'ch rojoc' +
            'h aj s '
          'polohou '
          
            'radiantu. Tabu'#318'ku kde s'#250' inform'#225'cie o jednom intervale, stred zo' +
            'rn'#233'ho po'#318'a '
          
            'dan'#233'ho pozorovate'#318'a, efekt'#237'vny pozorovac'#237' '#269'as, koeficient na '#250'pr' +
            'avu '
          'obla'#269'nosti, '
          
            'v'#225#382'en'#253' priemer limitnej magnit'#250'dy, po'#269'et rojov'#253'ch meteorov v'#353'etk' +
            #253'ch rojov a '
          'taktie'#382' sporadick'#253'ch meteorov a za'#269'iatok a koniec intervalu.'
          ''
          
            #270'al'#353'ia tabu'#318'ka je magnit'#250'dov'#233' rozdelenie pozorovan'#253'ch meteorov v' +
            ' danom '
          
            'intervale. Pokia'#318' sa pozorovalo viac intervalov, do tabu'#318'ky sa z' +
            'apisuj'#250' pod '
          'seba. '
          
            'Magnit'#250'dov'#233' rozdelenie ukazuje, ko'#318'ko meteorov danej magnit'#250'dy b' +
            'olo '
          'viden'#253'ch. '
          
            'Pokia'#318' bola magnit'#250'da desatinn'#225' do st'#314'pca s '#263#237'slom magnit'#250'dy sa ' +
            'zap'#237#353'e iba '
          '0,5. '
          'V poslednom st'#314'pci tabu'#318'ky je suma v'#353'etkych meteorov.'
          ''
          'Export '
          
            'Mo'#382'nos'#357' exportova'#357' sa nach'#225'dza v hlavnom menu. Exportova'#357' sa d'#225' ' +
            'do dvoch '
          
            'form'#225'tov a to: HTML a TXT. V TXT s'#250'boroch sa nenach'#225'dzaj'#250' grafy ' +
            'ani '
          'obr'#225'zky. '
          
            'Exportova'#357' sa daj'#250' tri typy s'#250'borov. Input data s'#250' inform'#225'cie z ' +
            'hlavi'#269'ky, '
          'inform'#225'cie '
          
            'o intervaloch a rojoch a tabu'#318'ka meteorov. Sum'#225'rna spr'#225'va obsahu' +
            'je '
          
            #353'trukturovan'#233' '#250'daje z vyhodnotenia '#353'tatistiky celej skupiny. IMO' +
            ' protokol sa '
          
            'odosiela, bu'#271' v podobe HTML alebo TXT IMO organiz'#225'cii. Pre ka'#382'd'#233 +
            'ho '
          
            'pozorovate'#318'a sa vytv'#225'ra osobitn'#253' s'#250'bor. Obsahuje hlavi'#269'ku, tabu'#318 +
            'ku rojov a '
          'intervalov a magnit'#250'dov'#233' rozdelenie.'
          ''
          'Settings'
          
            'V nastaveniach sa d'#225' nastavi'#357' '#269'o m'#225' program automaticky dopl'#328'ova' +
            #357' do '
          'tabu'#318'ky '
          
            'o meteoroch. Vyber'#225' sa tam znak roja, ktor'#253' ma automaticky dopl'#328 +
            'ova'#357' do '
          
            'tabu'#318'ky meteorov, pokia'#318' nebol zadan'#253' '#250'daj. Taktie'#382' sa automatic' +
            'ky dopl'#328'uje '
          'pr'#237'tomnos'#357' stopy alebo kvalita. '
          
            #270'alej sa tu nastavuje v'#253#353'ka obzoru kv'#244'li testu d'#225't. V nastavenia' +
            'ch sa d'#225' '
          
            'dynamicky upravova'#357' vzh'#318'ad '#353'tatistiky ozna'#269'ovan'#237'm sekc'#237#237', ktor'#233' ' +
            'sa maj'#250' '
          'zobrazi'#357'. '
          
            'Nastavuje sa tu, '#269'i sa m'#225' limitn'#225' magnit'#250'da zad'#225'va'#357' v podobe tro' +
            'juholn'#237'kov, '
          'alebo rovno ako hodnota magnit'#250'dy. '
          
            'V nastaveniach sa zap'#237'na '#269'erven'#253' filter tabu'#318'ky o meteoroch, kto' +
            'r'#253' sa pou'#382#237'va '
          'pri '
          'zapisovan'#237' meteorov v re'#225'lnom '#269'ase.'
          
            'Po nastaven'#237' '#250'dajov sa musia '#250'daje ulo'#382'i'#357', preto'#382'e inak sa '#250'daje' +
            ' nenastavia.')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Help'
      ImageIndex = 1
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 401
        Height = 413
        Align = alClient
        Color = clCream
        Lines.Strings = (
          'HELP'
          'Main Window '
          ''
          
            'File New - Open new file, old file will be erased. While is the ' +
            'application '
          '                 opened, new file will be opened automaticaly.'
          'Open - Open file from hard drive'
          'Save - Save file to hard drive'
          'Save as - Save file with the options'
          'Import, Export - See Import, export'
          'Exit - Terminate application'
          ''
          'Import'
          
            'WIMPS application supports files from the old meteor application' +
            ' IMOPROT.'
          
            'File must be in a correct form and it must have WIMPS structure ' +
            'of data.'
          'In file must NOT be blank lines.'
          ''
          'Date and time'
          'Date and time must be set in windows local preferences in form'
          
            'dd.mm.yyyy hh:mm . Otherwise *.prt file will be not loaded and s' +
            'hortcut of'
          'shift+f# uncorrect fill up the time in meteor table.'
          ''
          'Header'
          
            'In section of header user fill up the basic date about observati' +
            'on.'
          
            'Date is preset for 30.12.1899 but in calendar applet is option i' +
            'nput the'
          
            'system date. Data may be inserted straight to fields or from int' +
            'eractive'
          
            'databases. Database can be edited througt right click on list an' +
            'd throught'
          
            'button add. You add the coordinates, IMO code (if exists), count' +
            'ry, altitude.'
          
            'Database contained observation places from Slovakia and the Czec' +
            'h republic.'
          
            'Start and end of observation must be added in UT. Button  '#39'erase' +
            ' all'#39' will erase'
          'all data from the header not from the database.'
          ''
          'Observers'
          
            'Application contained database of observers, which makes user hi' +
            'mself. You '
          'can'
          
            'add observer with '#39'add observer'#39' button. IMO number is not necce' +
            'sary entry.'
          
            'Application have a place for data about recorder. You can add re' +
            'corder with'
          
            'right click on database window and click '#39'add recorder'#39'. You can' +
            ' add observer'
          
            'with double click on database. Observers can be added to table o' +
            'nly throught'
          
            'database. You can erase all data from table with '#39'erase all'#39' but' +
            'ton. Application'
          'supports only 12 observers.'
          ''
          'Showers'
          
            'Showers info is automatically added from database. This database' +
            ' is not'
          
            'interactive. ID field is char which will indicate a shower in sh' +
            'owers table.'
          
            'Showers can by added whith '#39'add shower'#39' button. On right click o' +
            'n shower'
          'table you can erase entry or all data.'
          ''
          'Intervals'
          
            'In window of interval you can add a observing intervals. ZHR is ' +
            'taken up into'
          'the graph for each interval. (All night).'
          
            'Adding intervals system appears to be complicated, but it is ver' +
            'y quick and'
          
            'compendious. It is based on tree structure. With buttons '#39'Expand' +
            #39' and '#39'Collapse'#39
          'you can quickly browse the tree structure.'
          
            'In first fields you have to fill up the start and end of each in' +
            'terval'
          'by clicking '#39'add'#39'.'
          
            'In second field you add all observers who observed meteors in gi' +
            'ven interval.'
          
            'You fill a center of field of view and number of observer.(1-12)' +
            ' Dec and RA you'
          'can add straight or from database.'
          
            'For all observer events (limit magnitute, breaks, clouds) are se' +
            'parately added.'
          
            'Limit magnitude must be added at least once in each interval and' +
            ' it is neccesary '
          'entry. Every'
          
            'observer can have only 10 events in one interval. You have to se' +
            'lect observer'
          'if you want to add an event.'
          
            'In field '#39'add break'#39' you have to fill start and end of break (fo' +
            'r example if'
          'observer falls asleep).'
          
            'In '#39'clouds'#39' field you fill up beside of start and end amount of ' +
            'clouds on the sky in'
          'form of percents.'
          
            'In case of limit mangitude you fill the time when you estimate t' +
            'he conditions.'
          
            'From the database you can select limit magnitude square and numb' +
            'er of stars.'
          
            'But also you can add only limit magnitude. You can swap insertin' +
            'g of limit'
          'magnitude in settings.'
          
            'Editing entries in tree structure you can do with double click o' +
            'n table, the'
          
            'entry will be coloured gray and you change values in table on ri' +
            'ght and click'
          'button '#39'edit'#39'.'
          ''
          'Meteors'
          
            'The meteor table has the input line, in wich you write entries. ' +
            'You shift'
          
            'throught fields with TAB key and to left fith TAB+shift. The fie' +
            'ld line number'
          
            'is automatically added. First meteor must have filled time. If n' +
            'ot, then'
          'first meteor will have time of start of the first interval.'
          
            'Meteor table is filled up with the time of meteors automatically' +
            '. You have to write'
          
            'down only new minute and new hour. If there is in field only hou' +
            'r and not '
          'minutes '
          'it'
          
            'will be added as minutes 00. Automatically not addable data is o' +
            'bserver and'
          
            'magnitude of meteor. Automatically addable data is shower, trace' +
            ', quality.'
          
            'Optional entry is altitude. You can assign joint meteors with sa' +
            'me chars.'
          
            'It is not important what the char is. The characters must not be' +
            ' repeated in'
          
            'different joint meteors. If meteor saw only one observer the fie' +
            'ld is empty.'
          
            'There is a key shorcut which allowed recording meteors in real t' +
            'ime on'
          
            'observation. It is Shift+F# where # is number of observer. It wr' +
            'ites down into'
          'the table imediately system time and observer.'
          ''
          'Data test'
          
            'In this section data are tested for logical and syntactic errors' +
            '. It improves'
          'accuracy of statistics and removes different errors.'
          
            'The second column contains the error ID. In the third column the' +
            're is written '
          'place where is'
          
            'error located. If there is an error in the meteor table then the' +
            ' number of row is '
          'placed in the third column.'
          ''
          'Error ID'
          '1 - Misssing value'
          '        Appears if the neccesary entry is not filled.'
          '2 - Invalid character'
          
            '        Appears if the char entry is written on place where is a' +
            'llowed only'
          '        number entry.'
          '3 - Wrong value'
          
            '        Appears if entered entry is not real, is negative, great' +
            'er or lesser'
          '        then normal.'
          '4 - No data'
          
            '        Appears if in table is not enough number of entries or n' +
            'o entries.'
          '5 - Duplicate value'
          
            '        Appears if in table is one ore more same entries. It app' +
            'ears only in'
          '        some tables (for example observers table).'
          '6 - Shower out of activity'
          
            '        Appears if the date of observation out is off the shower' +
            ' activity.'
          '7 - Same times'
          
            '        Appears if entered interval has the same times of start ' +
            'and end.'
          '8  - Interval out of observation'
          
            '        Appears if interval is not in time of observation in hea' +
            'der.'
          '9  - Event out of interval'
          '        Appears if some event is not in the time of interval.'
          '10 - Overlayed intervals'
          
            '        Appears if start or end of interval is in the other inte' +
            'rval. Intervals'
          '        are overlayed.'
          '11 - Observing array below horizont'
          
            '        Appears if center of field of view is lower than the val' +
            'ue of'
          '        horizont in settings.'
          '12 - Radiant below horizont'
          
            '        Appears if center of radiant trought interval is lower t' +
            'han value of'
          '        horizont.'
          '13 - Limit sqare below the horizont (it is not used anymore)'
          '14 - Missing observer'
          
            '        Appears if in meteor table is written number of observer' +
            ' who is not'
          '        in table of observers.'
          '15 - Meteor out of interval'
          
            '        Appears if in table of meteor is assigned time which is ' +
            'not in any'
          '        interval'
          '16 - Observer out of interval'
          
            '        Appears if in meteor table is entered observer who is no' +
            't in interval'
          '        when meteor was observed.'
          '17 - Incorrect time sequence'
          
            '        Appears if in meteor table are times of meteors which ar' +
            'e not one after'
          '        another.'
          '18 - Joined meteor in a different times'
          
            '        Appears if in meteor table are joint meteors in differen' +
            't times.'
          '19 - Joined meteor to same observer'
          
            '        Appears if in meteor table are joint meteors to that sam' +
            'e observer'
          '20 - Absent shower'
          
            '        Appears if if in meteor table is shower ID which is not ' +
            'in shower table.'
          '21 - Incorrect unround form'
          
            '        Appears if in meteor table magnitude or altitude have in' +
            'correct form.'
          
            '        Magnitude has correct form rounded on 0.5 and altitude r' +
            'ounded at 10.'
          '22'
          '23 - Meteor below horizont'
          
            '        Appears if in meteor table is meteor which has lower ali' +
            'tude then'
          '        horizont set in settings.'
          '24 - Meteor below the limit magnitude'
          
            '        Appears if in meteor table is lower magnitude than limit' +
            ' magnitude of'
          '        observer.'
          '25 - No meteor in interval'
          '        Appears if in interval is no meteor.'
          '26 - Only one joined meteor'
          
            '        Appears if in meteor table is only one meteor which has ' +
            'a mark of'
          '        joined meteor.'
          '27'
          '28 - Event during a break'
          
            '        Appears if som event (meteor, clouds, limit magnitude) i' +
            's set during'
          '        break.'
          '29 - Unused observer'
          
            '        Appears if in table of observers is observer, who does n' +
            'ot have any'
          '        meteor.'
          ''
          'Summary report'
          
            'This section has many parts. You can choose which part will be i' +
            'n summary '
          'report.'
          
            'You can change it in settings. First part is header. There are i' +
            'nformations'
          'which you wrote at the start of observation.'
          
            'Report contains summary statistics of the whole group. There are' +
            ' ZHR of all '
          'observed'
          
            'showers including sporadic meteors, sum of effective observing t' +
            'ime and '
          'average'
          
            'value of teff (effective observing time). There are numbers of s' +
            'poradic and'
          
            'shower meteors too. Average limit magnitude and amount of clouds' +
            ' on the sky.'
          
            'Next part is information about recorder. Name, surname and IMO c' +
            'ode. Max.'
          'frequency of entries and number of observers.'
          'Information about shower has graph of radiant altitude and'
          
            'information about the shower. Shower data are taken from www.imo' +
            '.net.'
          
            'Next thing are charts which you can choose if they will be shown' +
            ' or not.'
          
            'On ZHR graph are values of ZHR for each interval once. Graph of ' +
            'limit '
          'magnitudes'
          
            'includes maginutdes for whole observation. Minute frequency of m' +
            'eteors shows'
          'how'
          'many meteors was appeared during one minute.'
          
            'Pie graphs show comparison of amount of meteors and comparison o' +
            'f teff and '
          'breaks.'
          
            'In next section are report for each observer separately. There a' +
            're name,'
          
            'IMO code and number. Average of limit magnitude, clouds, breaks ' +
            'and teff.'
          ''
          'IMO form'
          
            'IMO formula is customized according to IMO requarments. Applicat' +
            'ion evaluates'
          
            'form for each observer spearately. There are information about o' +
            'bserver,'
          
            'information about locality and information about start and end o' +
            'bservation.'
          
            'It includes magnitude distribution of observed meteors in the in' +
            'terval.'
          ''
          'Export'
          
            'Export option is located in main menu. It is possible to export ' +
            'to HTML and TXT.'
          
            'In TXT files are not pictures and graphs. You can export three t' +
            'ypes of files.'
          
            'Input data from header, information about intervals and meteor d' +
            'ata table.'
          
            'Summary report includes data from statistics of the whole group.' +
            ' IMO protocol is'
          
            'sent to IMO organization in HTML or TXT form. For each observer ' +
            'there is '
          'different'
          'file.'
          'It includes header, table of periods and magnitude distribution.'
          ''
          'Settings'
          
            'In settings you can choose what application will automatically f' +
            'ill up to'
          
            'meteor table. You can choose the ID of shower, from shower table' +
            ' or sporadic,'
          
            'trace or quality. You can set here a value of horizont. In setti' +
            'ng you can'
          
            'dynamicaly change the content of statistics and if limit magnitu' +
            'de will be'
          
            'entered by limit squares or like a number. You can turn on the r' +
            'ed filter which'
          'is used for real time recording. You have to save the settings.')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Verzie'
      ImageIndex = 2
      object Memo3: TMemo
        Left = 0
        Top = 0
        Width = 401
        Height = 413
        Align = alClient
        Lines.Strings = (
          '1.00 - Prva stabilna verzia'
          
            '1.20 - opraven'#233' chyby pri vypocte vazeneho priemeru limitnej mag' +
            'nitudy'
          '1.21 - opraveny trojuholnik 16'
          '1.22 - do IMO formulara pridane okrem imo cisla aj IMO skratka'
          '1.23 - V exporte statistiky opravene slovicko state na country'
          '1.24 - opravena chyba pri vyberani grafov do statistiky'
          '1.25 - prelozene nastavenia'
          
            '1.26 - opraveny preklad slova stat na couuntry v pridavani pozor' +
            'vatela'
          '1.27 - opravena chyba v HTML exporte IMO formularu'
          '1.28 - prelozeny help'
          
            '1.29 - opravena chyba v HTML exporte IMO formularu, pridany tent' +
            'o text'
          
            '1.30 - odstranena chyba testu dat, magnituda musi byt vzdy zaokr' +
            'uhlena na 0.5')
        TabOrder = 0
      end
    end
  end
end
