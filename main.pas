unit Main;

interface

uses StdCtrls, Clipbrd, Szukam, Memo1, Child, sel, dsu, dania,
  RxCtrls,  SysUtils, WinTypes, WinProcs, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, Placemnt, SpeedBar, DB, RxMenus,
  ExtCtrls, AppEvent, Gauges, DBCtrls, RXDBCtrl, Math,
  Mask, ToolEdit, RxCalc, DBGrids, ObjStr, VCLUtils, FileUt,
  FileCtrl, StrUtils, RxShell, Menus, mddbgrid, buttons,
  adsdata, adsfunc, adstable, adscnnct, adsset, ace, aceunpub, adsdictionary,
  RxMemDS, ComCtrls, StdActns, DBActns, ActnList, ImgList, ToolWin, StrHlder, Grids,
  FR_RRect, FR_Chart, FR_Shape, FR_BarC, FR_Rich, FR_Cross,
  FR_DCtrl, FR_ADSDB, FR_Desgn, FR_DSet, FR_DBSet, FR_Class,
  FR_ChBox, FR_OLE, frFunction, frRtfExp, FR_E_RTF, FR_E_TXT, FR_E_HTM,
  FR_E_HTML2, frHTMExp, frOLEExl, frXMLExl;

type
  TChildClass = class of TChildForm;
  TMainForm = class(TForm)
    baza: TAdsConnection;
    init: TAdsConnection;
    ROsJob: TAdsTable;
    DSuJob: TAdsTable;
    SElJob: TAdsTable;
    ROsJobKOD_OSOBY: TStringField;
    ROsJobDATA: TDateField;
    ROsJobPOSILEK: TStringField;
    ROsJobPOZYCJA: TStringField;
    OsobyFlagi: TStringField;
    DReJob: TAdsTable;
    OReJob: TAdsTable;
    SReJob: TAdsTable;
    SDaJob: TAdsTable;
    ESuJob: TAdsTable;
    OReJobKOD_OSOBY: TStringField;
    DReJobDANIE: TStringField;
    SReJobSKLADNIK: TStringField;
    SDaJobSKLADNIK: TStringField;
    DSuJobDANIE: TStringField;
    ESuJobELEMENT: TStringField;
    SElJobSKLADNIK: TStringField;
    DSuJobSKLADNIK: TStringField;
    SElJobELEMENT: TStringField;
    RSuJob: TAdsTable;
    RSuJobData: TDateField;
    RSuJobPosilek: TStringField;
    RSuJobPozycja: TStringField;
    RSuJobSkladnik: TStringField;
    RDaJob: TAdsTable;
    RDaJobDanie: TStringField;
    RDaJobPosilek: TStringField;
    RDaJobPozycja: TStringField;
    RDaJobData: TDateField;
    EleJob: TAdsTable;
    EleJobELEMENT: TStringField;
    EleJobJEDN: TStringField;
    EleJobNAZWA: TStringField;
    SurJob: TAdsTable;
    SurJobGRAM: TFloatField;
    SurJobINDX_MAT: TStringField;
    SurJobJEDN: TStringField;
    SurJobJMAG: TStringField;
    SurJobNAZWA: TStringField;
    SurJobPRZEL: TSmallintField;
    SurJobSKLADNIK: TStringField;
    DanJob: TAdsTable;
    DanJobDANIE: TStringField;
    DanJobDIETA: TStringField;
    DanJobGRAMATURA: TStringField;
    DanJobJEDN: TStringField;
    DanJobNAZWA: TStringField;
    DanJobPOSILEK: TStringField;
    OsoJob: TAdsTable;
    OsoJobDIETA: TStringField;
    OsoJobGRUPA: TStringField;
    OsoJobKOD_OSOBY: TStringField;
    OsoJobNAZWISKO: TStringField;
    OsoJobSTANOWISKO: TStringField;
    RelJob: TAdsTable;
    RelJobCena: TFloatField;
    RelJobDIETA: TStringField;
    RelJobILE_POS: TFloatField;
    RelJobPOSILEK: TStringField;
    Dania: TAdsTable;
    DaniaDANIE: TStringField;
    DaniaDIETA: TStringField;
    DaniaGRAMATURA: TStringField;
    DaniaJEDN: TStringField;
    DaniaNAZWA: TStringField;
    DaniaPOSILEK: TStringField;
    Diety: TAdsTable;
    dRelewy: TAdsTable;
    dRelewyDANIE: TStringField;
    dRelewyDATA: TDateField;
    dRelewyDIETA: TStringField;
    dRelewyPOSILEK: TStringField;
    dSurowce: TAdsTable;
    dSurowceDANIE: TStringField;
    dSurowceDIETA: TStringField;
    dSurowceGram: TFloatField;
    dSurowceILOSC: TFloatField;
    dSurowceJedn: TStringField;
    dSurowceNazwa: TStringField;
    dSurowceSKLADNIK: TStringField;
    dSurowcePozycja: TStringField;
    Elementy: TAdsTable;
    ElementyELEMENT: TStringField;
    ElementyJEDN: TStringField;
    ElementyNAZWA: TStringField;
    eSurowce: TAdsTable;
    eSurowceELEMENT: TStringField;
    eSurowceGram: TFloatField;
    eSurowceILOSC: TFloatField;
    eSurowceJedn: TStringField;
    eSurowceNazwa: TStringField;
    eSurowceSKLADNIK: TStringField;
    Grupy: TAdsTable;
    oRelewy: TAdsTable;
    oRelewyCena: TFloatField;
    oRelewyDATA: TDateField;
    oRelewyDIETA: TStringField;
    oRelewyGRUPA: TStringField;
    oRelewyILE_POS: TFloatField;
    oRelewyKOD_OSOBY: TStringField;
    oRelewyPOSILEK: TStringField;
    oRelewyWartosc: TFloatField;
    Osoby: TAdsTable;
    OsobyDIETA: TStringField;
    OsobyGRUPA: TStringField;
    OsobyKOD_OSOBY: TStringField;
    OsobyNAZWISKO: TStringField;
    OsobySTANOWISKO: TStringField;
    Posilki: TAdsTable;
    rDania: TAdsTable;
    rDaniaDANIE: TStringField;
    rDaniaDATA: TDateField;
    rDaniaDIETA: TStringField;
    rDaniaIle_p: TFloatField;
    rDaniaNazwa: TStringField;
    rDaniaPOSILEK: TStringField;
    rDaniaPOZYCJA: TStringField;
    Relewy: TAdsTable;
    RelewyCena: TFloatField;
    RelewyDATA: TDateField;
    RelewyDIETA: TStringField;
    RelewyFlagi: TStringField;
    RelewyILE_POS: TFloatField;
    RelewyPOSILEK: TStringField;
    rOsoby: TAdsTable;
    rOsobyCena: TFloatField;
    rOsobyDATA: TDateField;
    rOsobyDIETA: TStringField;
    rOsobyGRUPA: TStringField;
    rOsobyILE_POS: TFloatField;
    rOsobyKOD_OSOBY: TStringField;
    rOsobyNazwisko: TStringField;
    rOsobyPOSILEK: TStringField;
    rOsobyPOZYCJA: TStringField;
    rOsobyWartosc: TFloatField;
    rSurowce: TAdsTable;
    rSurowceDANIE: TStringField;
    rSurowceDATA: TDateField;
    rSurowceDIETA: TStringField;
    rSurowcegram: TFloatField;
    rSurowceIle_pos: TFloatField;
    rSurowceILOSC: TFloatField;
    rSurowceJedn: TStringField;
    rSurowcejmag: TStringField;
    rSurowceNazwa: TStringField;
    rSurowceNazwaDania: TStringField;
    rSurowcePOSILEK: TStringField;
    rSurowcePOZYCJA: TStringField;
    rSurowceSKLADNIK: TStringField;
    sDania: TAdsTable;
    sDaniaDANIE: TStringField;
    sDaniaDIETA: TStringField;
    sDaniaILOSC: TFloatField;
    sDaniaNazwa: TStringField;
    sDaniaSKLADNIK: TStringField;
    sElementy: TAdsTable;
    sElementyELEMENT: TStringField;
    sElementyILOSC: TFloatField;
    sElementyJedn: TStringField;
    sElementyNazwa: TStringField;
    sElementySKLADNIK: TStringField;
    sElementyPozycja: TStringField;
    sRelewy: TAdsTable;
    sRelewyDANIE: TStringField;
    sRelewyDATA: TDateField;
    sRelewyDIETA: TStringField;
    sRelewyILOSC: TFloatField;
    sRelewyNazwaDania: TStringField;
    sRelewyPOSILEK: TStringField;
    sRelewySKLADNIK: TStringField;
    Surowce: TAdsTable;
    SurowceGRAM: TFloatField;
    SurowceINDX_MAT: TStringField;
    SurowceJEDN: TStringField;
    SurowceJMAG: TStringField;
    SurowceNAZWA: TStringField;
    SurowcePRZEL: TSmallintField;
    SurowceSKLADNIK: TStringField;
    DSOsoby: TDataSource;
    DSElementy: TDataSource;
    DSSurowce: TDataSource;
    DSDania: TDataSource;
    DSRelewy: TDataSource;
    DSRDania: TDataSource;
    DSPosilki: TDataSource;
    DSLabel: TDataSource;
    DBStatusLabel1: TDBStatusLabel;
    MsgBar: TPanel;
    SpeedBar1: TSpeedBar;
    RxMainMenu1: TRxMainMenu;
    SpeedbarSection1: TSpeedbarSection;
    BtnRelewy: TSpeedItem;
    BtnrOsoby: TSpeedItem;
    BtnrDania: TSpeedItem;
    BtnrSurowce: TSpeedItem;
    BtnOsoby: TSpeedItem;
    BtnoRelewy: TSpeedItem;
    BtnDania: TSpeedItem;
    BtndRelewy: TSpeedItem;
    BtndSurowce: TSpeedItem;
    BtnSurowce: TSpeedItem;
    BtnsRelewy: TSpeedItem;
    BtnsDania: TSpeedItem;
    BtnsElementy: TSpeedItem;
    BtnElementy: TSpeedItem;
    BtneSurowce: TSpeedItem;
    FormStorage1: TFormStorage;
    SpeedbarSection2: TSpeedbarSection;
    BtnCascade: TSpeedItem;
    BtnHor: TSpeedItem;
    BtnVert: TSpeedItem;
    Plik1: TMenuItem;
    Okno1: TMenuItem;
    Kaskada1: TMenuItem;
    Poziomo1: TMenuItem;
    Pionowo1: TMenuItem;
    BtnReindex: TSpeedItem;
    BtnClose: TSpeedItem;
    Koniec1: TMenuItem;
    Odtwrzskorowidze1: TMenuItem;
    N1: TMenuItem;
    Otwrz1: TMenuItem;
    Posiki1: TMenuItem;
    Osoby1: TMenuItem;
    Dania1: TMenuItem;
    Surowce1: TMenuItem;
    Elementy1: TMenuItem;
    Ktojad1: TMenuItem;
    Jadospis1: TMenuItem;
    Zapotrzebowanie1: TMenuItem;
    BtnKopiuj: TSpeedItem;
    BtnWytnij: TSpeedItem;
    BtnWklej: TSpeedItem;
    AppEvents1: TAppEvents;
    Zamknijwszystkie1: TMenuItem;
    BtnCloseAll: TSpeedItem;
    BtnSelectAll: TSpeedItem;
    Nawigacja1: TMenuItem;
    Anuluj1: TMenuItem;
    Zatwierd1: TMenuItem;
    Edycja2: TMenuItem;
    Usu1: TMenuItem;
    Wstaw1: TMenuItem;
    N3: TMenuItem;
    Odwie1: TMenuItem;
    Ostatni1: TMenuItem;
    Nastpny1: TMenuItem;
    Poprzedni1: TMenuItem;
    Pierwszy1: TMenuItem;
    DaniaFlagi: TStringField;
    SurowceStringField: TStringField;
    ElementyStringField: TStringField;
    BtnKalkul: TSpeedItem;
    RxCalculator1: TRxCalculator;
    DSuJobIlosc: TFloatField;
    DSuJobDieta: TStringField;
    dSurowcePrzel: TFloatField;
    RDaJobDIETA: TStringField;
    eSurowcePrzel: TFloatField;
    SElJobILOSC: TFloatField;
    DSuJobPOZYCJA: TStringField;
    SElJobPOZYCJA: TStringField;
    BtnRenumber: TSpeedItem;
    eSurowcePOZYCJA: TStringField;
    sDaniaPOZYCJA: TStringField;
    ElementyIGNORUJ: TBooleanField;
    EleJobIGNORUJ: TBooleanField;
    ESuJobSKLADNIK: TStringField;
    ESuJobILOSC: TFloatField;
    BtnIZZ: TSpeedItem;
    Importujsurowce1: TMenuItem;
    DietyDIETA: TStringField;
    DietyOPIS: TStringField;
    DietyNAZWA: TStringField;
    PosilkiPOSILEK: TStringField;
    GrupyGRUPA: TStringField;
    GrupyOPIS: TStringField;
    BtnArch: TSpeedItem;
    Archiwizuj1: TMenuItem;
    BtnIK: TSpeedItem;
    Importujkoszty1: TMenuItem;
    ROsJobDIETA: TStringField;
    ROsJobILE_POS: TFloatField;
    ROsJobGRUPA: TStringField;
    BtnDruk: TSpeedItem;
    PrintDlg: TOpenDialog;
    RelJobDATA: TDateField;
    rSurowcePrzel: TSmallintField;
    AdsSettings1: TAdsSettings;
    Indeks: TAdsTable;
    PosilkiOPIS: TStringField;
    Gauge1: TGauge;
    ActionList1: TActionList;
    DataSetCancel1: TDataSetCancel;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetFirst1: TDataSetFirst;
    DataSetInsert1: TDataSetInsert;
    DataSetLast1: TDataSetLast;
    DataSetNext1: TDataSetNext;
    DataSetPost1: TDataSetPost;
    DataSetPrior1: TDataSetPrior;
    DataSetRefresh1: TDataSetRefresh;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    SpeedbarSection3: TSpeedbarSection;
    BtnFirst: TSpeedItem;
    BtnPrior: TSpeedItem;
    BtnNext: TSpeedItem;
    BtnLast: TSpeedItem;
    BtnRefresh: TSpeedItem;
    BtnInsert: TSpeedItem;
    BtnDelete: TSpeedItem;
    BtnDataEdit: TSpeedItem;
    BtnPost: TSpeedItem;
    BtnCancel: TSpeedItem;
    BtnUndo: TSpeedItem;
    EditUndo1: TEditUndo;
    WindowCloseAll: TAction;
    DaniaOPIS: TMemoField;
    rOsobyDieLookup: TStringField;
    rOsobyGruLookup: TStringField;
    OsobyDieLookup: TStringField;
    OsobyGruLookup: TStringField;
    DaniaPosLookup: TStringField;
    frReport1: TfrReport;
    DSGrupy: TDataSource;
    DSrOsoby: TDataSource;
    DSDiety: TDataSource;
    DSrSurowce: TDataSource;
    DSdSurowce: TDataSource;
    DSsElementy: TDataSource;
    DSsDania: TDataSource;
    DSeSurowce: TDataSource;
    DSoRelewy: TDataSource;
    DSdRelewy: TDataSource;
    DSsRelewy: TDataSource;
    frRelewy: TfrDBDataSet;
    frOsoby: TfrDBDataSet;
    frDania: TfrDBDataSet;
    frSurowce: TfrDBDataSet;
    frElementy: TfrDBDataSet;
    froRelewy: TfrDBDataSet;
    frdRelewy: TfrDBDataSet;
    frsRelewy: TfrDBDataSet;
    frGrupy: TfrDBDataSet;
    frrOsoby: TfrDBDataSet;
    frPosilki: TfrDBDataSet;
    frrDania: TfrDBDataSet;
    frDiety: TfrDBDataSet;
    frrSurowce: TfrDBDataSet;
    frdSurowce: TfrDBDataSet;
    frsDania: TfrDBDataSet;
    freSurowce: TfrDBDataSet;
    frsElementy: TfrDBDataSet;
    BtnRestruct: TSpeedItem;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    BtnOdtw: TSpeedItem;
    ssssss1: TMenuItem;
    frADSComponents1: TfrADSComponents;
    frDialogControls1: TfrDialogControls;
    frCrossObject1: TfrCrossObject;
    frRichObject1: TfrRichObject;
    frBarCodeObject1: TfrBarCodeObject;
    frShapeObject1: TfrShapeObject;
    frChartObject1: TfrChartObject;
    frRoundRectObject1: TfrRoundRectObject;
    IndeksBAZA: TStringField;
    IndeksNAZWA: TStringField;
    IndeksKLUCZ: TStringField;
    IndeksUNIQUE: TBooleanField;
    IndeksFOR: TStringField;
    IndeksPATH: TStringField;
    IndeksDESCEND: TBooleanField;
    frCheckBoxObject1: TfrCheckBoxObject;
    frOLEObject1: TfrOLEObject;
    RelewyD_WARTOSC: TFloatField;
    RelJobD_WARTOSC: TFloatField;
    frRtfAdvExport1: TfrRtfAdvExport;
    DSeRelewy: TDataSource;
    eRelewy: TAdsTable;
    eRelewyELEMENT: TStringField;
    eRelewyDATA: TDateField;
    eRelewyPOSILEK: TStringField;
    eRelewyILOSC: TFloatField;
    eRelewyDIETA: TStringField;
    BtneRelewy: TSpeedItem;
    EReJob: TAdsTable;
    EReJobELEMENT: TStringField;
    eRelewyJEDN: TStringField;
    eRelewyFlagi: TStringField;
    RSuJobDIETA: TAdsStringField;
    RSuJobILOSC: TFloatField;
    RSuJobIle_pos: TFloatField;
    eRelewyILE_POS: TFloatField;
    eRelewyCena: TFloatField;
    eRelewyD_WARTOSC: TFloatField;
    DaniaILOSC: TFloatField;
    DaniaELEMENT: TStringField;
    DaniaEJM: TStringField;
    freRelewy: TfrDBDataSet;
    Kiedyjad1: TMenuItem;
    Kiedywjadospisie1: TMenuItem;
    Receptura1: TMenuItem;
    Kiedyzapotrzebowane1: TMenuItem;
    Wjakichdaniach1: TMenuItem;
    Wczymskadnik1: TMenuItem;
    Wartoodywczaposiku1: TMenuItem;
    Zawartoskadnikwpokarmowych1: TMenuItem;
    rDaniaGram: TStringField;
    rDaniaJedn: TStringField;
    RelewyWART_TOT: TFloatField;
    RelJobWART_TOT: TFloatField;
    rSurowceil_tot: TFloatField;
    SReJobDATA: TDateField;
    SReJobPOSILEK: TAdsStringField;
    SReJobPOZYCJA: TAdsStringField;
    SReJobDANIE: TAdsStringField;
    SReJobILOSC: TFloatField;
    SReJobDIETA: TAdsStringField;
    rDaniaile_pos: TCurrencyField;
    sRelewyile_pos: TCurrencyField;
    dRelewyile_pos: TCurrencyField;
    dRelewyIle_p: TFloatField;
    RDaJobile_pos: TCurrencyField;
    RDaJobIle_p: TFloatField;
    RDaJobNazwa: TStringField;
    DReJobIle_p: TFloatField;
    DReJobile_pos: TCurrencyField;
    DReJobDateField: TDateField;
    DReJobStringField: TStringField;
    DReJobPOZYCJA: TAdsStringField;
    DReJobDIETA: TAdsStringField;
    DanJobOPIS: TMemoField;
    frHTMLTableExport1: TfrHTMLTableExport;
    procedure OknaItemClick(Sender: TObject);
    procedure SpeedBar1DblClick(Sender: TObject);
    procedure OpenDatabases(Sender: TObject);
    procedure IlePosCalc(DataSet: TDataset);
    procedure RelewyCalcFields(DataSet: TDataset);
    procedure RxMainMenu1GetItemParams(Sender: TMenu; Item: TMenuItem;
      State: TMenuOwnerDrawState; AFont: TFont; var Color: TColor;
      var Graphic: TGraphic; var NumGlyphs: Integer);
    procedure MenuToolClick(Sender: TObject);
    procedure BtnReindexClick(Sender: TObject);
    procedure DSRDaniaDataChange(Sender: TObject; Field: TField);
    procedure LpBeforeInsert(DataSet: TDataset);
    procedure LpOnNewRecord(DataSet: TDataset);
    procedure DIETASetText(Sender: TField; const Text: String);
    procedure OsobyDIETASetText(Sender: TField; const Text: String);
    procedure OsobyGRUPASetText(Sender: TField; const Text: String);
    procedure rOsobyAfterEdit(DataSet: TDataset);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure POSILEKSetText(Sender: TField; const Text: String);
    procedure Otwrz1Click(Sender: TObject);
    procedure BtnKopiujClick(Sender: TObject);
    procedure BtnWytnijClick(Sender: TObject);
    procedure BtnWklejClick(Sender: TObject);
    procedure BtnSelectAllClick(Sender: TObject);
    procedure DANIESetText(Sender: TField; const Text: String);
    procedure UniqueBeforePost(DataSet: TDataset);
    procedure SlaveBeforeEdit(DataSet: TDataset);
    procedure Wyraeniefiltra1Click(Sender: TObject);
    procedure SaveAfterPost(DataSet: TDataset);
    procedure FlagiValidate(Sender: TField);
    procedure FlagiBeforeDelete(DataSet: TDataset);
    procedure BtnKalkulClick(Sender: TObject);
    procedure RxCalculator1CalcKey(Sender: TObject; var Key: Char);
    procedure AppEvents1ActiveFormChange(Sender: TObject);
    procedure KOD_OSOBYSetText(Sender: TField; const Text: String);
    procedure SKLADNIKSetText(Sender: TField; const Text: String);
    procedure ELEMENTSetText(Sender: TField; const Text: String);
    procedure BtnRenumberClick(Sender: TObject);
    procedure BtnIZZClick(Sender: TObject);
    procedure SpeedBar1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rOsobyBeforeDelete(DataSet: TDataset);
    procedure BtnArchClick(Sender: TObject);
    procedure GetTextPlusNazwa(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure rSurowceDANIEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure POSILEKGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure KOD_OSOBYGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ELEMENTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SurowceSKLADNIKGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure RelewyBeforeDelete(DataSet: TDataset);
//    procedure BtnChildClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure rSurowcegramSetText(Sender: TField; const Text: String);
    procedure rSurowceILOSCSetText(Sender: TField; const Text: String);
    procedure WindowCloseAllUpdate(Sender: TObject);
    procedure BtnIKClick(Sender: TObject);
    procedure DIETAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure GRUPAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TableBeforeOpen(DataSet: TDataSet);
    procedure BtnDrukClick(Sender: TObject);
    procedure frReport1UserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure BtnCloseAllClick(Sender: TObject);
    procedure EditSelectAll1Update(Sender: TObject);
    procedure EditPaste1Update(Sender: TObject);
    procedure EditCopy1Update(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnOdtwClick(Sender: TObject);
    procedure FormStorage1RestorePlacement(Sender: TObject);
    procedure BtndSurowceClick(Sender: TObject);
    procedure BtnsElementyClick(Sender: TObject);
    procedure RelewyDATAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FlagiCalcFields(DataSet: TDataSet);
    procedure rOsobyCalcFields(DataSet: TDataSet);
    procedure eRelewyCalcFields(DataSet: TDataSet);
    procedure DSElementyDataChange(Sender: TObject; Field: TField);
    procedure DaniaCalcFields(DataSet: TDataSet);
    procedure BtnDaniaClick(Sender: TObject);
    procedure rSurowceCalcFields(DataSet: TDataSet);
    procedure rSurowceIle_posSetText(Sender: TField; const Text: String);
    procedure rSurowcegramGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure rXBeforeEdit(DS: TDataSet);
    procedure rSurowceBeforeOpen(DataSet: TDataSet);
    procedure rDaniaile_posGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure rDaniaile_posSetText(Sender: TField; const Text: String);
    procedure rSurowceDANIESetText(Sender: TField; const Text: String);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure ElementyJEDNGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
//    procedure Reindex(N: TFileName);overload;
    procedure Reindex(DataSet: TADSTable);overload;
    function Expand(text: string): string;
    procedure ChildClick(Sender: TObject; ChildClass: TChildClass);
    procedure IntLiczDanie(di: String; var list: Array of Extended; memo: TStrings);
    function LiczDanie(Danie, Element, dieta: String): Extended;
  end;

type TProcEn = record
  src: string;
  waga: Extended;
  dest: string;
  job: Extended;
end;

var
  MainForm: TMainForm;
  DietyStr, PosStr, GrStr: String;
  DietyLst, PosLst, GrLst, GrExLst: TStringList;
  GrEx: Boolean;
  aProcEn: array of TProcEn;

function dind(d, di: string):boolean;
procedure SetFilter(DataSet: TDataSet; const Text: String);
function GetTablePath(Table: TADSTable): TFileName;

implementation

{$R *.DFM}

function TMainForm.Expand(text: string): string;
var i: Cardinal;
begin
    Result := Text;
    if Copy(Text,1,2)='&:' Then Exit;
    with FormStorage1.StoredValues do
    For i:=Count-1 downto 0 do
      with Items[i] do
      Result:=StringReplace(Result, '&'+Name+'.', Value, [rfReplaceAll, rfIgnoreCase]);
end;

function GetDataPath(DataBase: TADSConnection): TFileName;
var usLength : Word;
 aucProperty : array[ 0..ADS_DD_MAX_OBJECT_NAME_LEN ] of char;
begin
  if DataBase.IsDictionaryConn
  then with TADSDictionary.Create(nil) do
  try
    AdsServerTypes:=DataBase.AdsServerTypes;
    ConnectPath:=DataBase.ConnectPath;
    UserName:=DataBase.UserName;
    LoginPrompt:=DataBase.LoginPrompt;
    Connect;
    usLength := ADS_DD_MAX_OBJECT_NAME_LEN;
    GetDatabaseProperty(ADS_DD_DEFAULT_TABLE_PATH,@aucProperty,usLength);
    Result:=copy(aucProperty,0,usLength-1);
  finally
    Free;
  end else Result:=DataBase.ConnectPath;
end;

function GetTablePath(Table: TADSTable): TFileName;
var usLength : Word;
 aucProperty : array[ 0..ADS_DD_MAX_OBJECT_NAME_LEN ] of char;
begin
  if (Table.AdsConnection<>nil) and Table.AdsConnection.IsDictionaryConn
  then with TADSDictionary.Create(nil) do
  try
    AdsServerTypes:=Table.AdsConnection.AdsServerTypes;
    ConnectPath:=Table.AdsConnection.ConnectPath;
    UserName:=Table.AdsConnection.UserName;
    LoginPrompt:=Table.AdsConnection.LoginPrompt;
    Connect;
    usLength := ADS_DD_MAX_OBJECT_NAME_LEN;
    GetTableProperty( ChangeFileExt(Table.TableName,''),ADS_DD_TABLE_PATH,@aucProperty,usLength);
    Result:=ExpandUNCFileName(copy(aucProperty,0,usLength-1));
  finally
    Free;
  end else
    Result:=ExpandUNCFileName(FileSearch(ChangeFileExt(Table.TableName,'.dbf'),Table.GetDatabasePath));

end;

procedure TMainForm.ChildClick(Sender: TObject; ChildClass: TChildClass);
var c: TChildForm;
begin
   {CildForm.Tag=RxSpeedButton, RxSpeedButton.Tag=ChildForm}

   if TComponent(Sender).Tag=0 Then
   begin
     c:=ChildClass.Create2(Application,TComponent(Sender));
     c.FormStyle:=fsMDIChild; {zamiast show}
     if c.WindowState=wsMinimized Then c.WindowState:=wsNormal;
   end
   else
    if (LongInt(ActiveMDIChild)=TComponent(Sender).Tag)
    and (ActiveMDIChild.WindowState<>wsMinimized)
    Then ActiveMDIChild.WindowState:=wsMinimized
    else with TChildForm(TComponent(Sender).Tag) do
    begin
      if WindowState = wsMinimized then WindowState:=wsNormal;
      show;
    end;
end;

procedure TMainForm.OknaItemClick(Sender: TObject);
begin
   Diety.Open;
   Elementy.Open;
   ChildClick(Sender,TChildForm);
end;

procedure TMainForm.SpeedBar1DblClick(Sender: TObject);
begin
  Application.ProcessMessages;
  TSpeedBar(Sender).Customize(0);
end;

function MyCallbackFunc( usPercent: Word; ulCallbackID: Longint ): Longint; stdcall;
const autoon: Boolean = False;
begin
    with MainForm.Gauge1 do
    begin
    if (ulCallbackID = 0) and not visible Then
    begin
     Progress:=0;
     Show;
     autoon:=True;
    end;
    Progress := usPercent;
    Application.ProcessMessages;
    if Progress=100 Then
    begin
      if autoon Then Hide;
      autoon:=False;
    end;
    if Application.Terminated
    Then Result:=1 Else Result := 0;
    end;
end;

function iif(a:boolean;b,c:UNSIGNED32):UNSIGNED32; overload;
begin
  if a then iif:=b else iif:=c
end;

function iif(a:boolean;b,c:string):string; overload;
begin
  if a then iif:=b else iif:=c
end;

function iif(a:boolean;b,c:boolean):boolean; overload;
begin
  if a then iif:=b else iif:=c
end;

procedure TMainForm.TableBeforeOpen(DataSet: TDataSet);
var i: Cardinal;
    f: TField;
    b,s,t: String;
    l: Boolean;
    ds: TAdsTable;

begin
  with TADSTable(DataSet) do
  begin
    if (Tag<>0) Then Exit;

    if (AdsConnection=nil) or not AdsConnection.IsDictionaryConn Then begin
      s:='';
      b:=ChangeFileExt(ExtractFileName(TableName),'');
      if (DataSet<>Indeks) Then
      begin
        Indeks.Open;
        if Indeks.Locate('baza',b,[loCaseInsensitive]) Then
           s:=Expand(IndeksPath.AsString);
      end;

      if (s<>'') then
      begin
        if (FileSearch(ChangeFileExt(b,'.dbf'),s)<>'')
            Then DataBaseName:=s;
      end else begin
        s:=FileSearch(ChangeFileExt(b,'.dbf'),GetDataPath(AdsConnection));
        if s='' Then
          s:=FileSearch(ChangeFileExt(b,'.dbf'),GetDataPath(Baza)+';'+GetDataPath(Init));
        if s<>'' Then begin
           s:=ExtractFilePath(s);
           if s='' Then GetDir(0,s);
           DatabaseName:=s;
        end;
      end;


      ds:=TADSTable.Create(nil);
      ds.AdsConnection:=AdsConnection;
      ds.TableName:=TableName;
      if FormStorage1.StoredValue['CDX'] then begin
        ds.TableType:=ttAdsVFP
      end else begin
        ds.TableType:=ttAdsNTX;
      end;
      ds.DatabaseName:=DatabaseName;

      ds.ReadOnly:=True;
      ds.AdsTableOptions.AdsCharType:=AdsTableOptions.AdsCharType;
      ds.AdsTableOptions.AdsCollation:=AdsTableOptions.AdsCollation;
      ds.AdsTableOptions.AdsLockType:=AdsTableOptions.AdsLockType;
      try
        ds.Open;
        ds.Close;
      except
        on e:EADSDatabaseError do
        if (e.ACEErrorCode=5016) or (e.ACEErrorCode=7041)
        then begin
           Reindex(ds);
        end else
        if e.ACEErrorCode=5025
        then begin
           if TableType=ttAdsNTX
             then TableType:=ttAdsVFP
             else TableType:=ttAdsNTX;
           ds.TableType:=TableType;
           FormStorage1.StoredValue['CDX']:=(ds.TableType <> ttAdsNTX );
        end else raise;
      end;

      TableType:=ds.TableType;
      if (DataSet<>Indeks) and AnsiSameText(Indeksbaza.AsString,b)
      then if TableType<>ttAdsNTX then begin
        if not IndeksNazwa.IsNull
         and not FileExists(ChangeFileExt(GetTablePath(TADSTable(DataSet)),'.cdx'))
         then Reindex(ds);
      end else begin
        l:=True;
        t:=ExtractFilePath(GetTablePath(TADSTable(DataSet)));
        IndexFiles.Clear;
        repeat
          s:=IndeksNazwa.AsString;
          IndexFiles.Add(s);
          l:=l and FileExists(ChangeFileExt(t+s,'.ntx'));
          Indeks.next;
        until Indeks.eof or not AnsiSameText(IndeksBaza.AsString,b);
        if not l Then begin
           Reindex(ds);
        end;
      end;
    end
    else ds:=TADSTable.Create(nil);
    AdsRegisterCallbackFunction(@MyCallbackFunc,555);
    with ds do
    try
        AdsConnection:=TADSTable(DataSet).AdsConnection;
        TableName:=TADSTable(DataSet).TableName;
        TableType:=TADSTable(DataSet).TableType;

        ReadOnly:=True;
        AdsTableOptions.AdsCharType:=TADSTable(DataSet).AdsTableOptions.AdsCharType;
        AdsTableOptions.AdsLockType:=TADSTable(DataSet).AdsTableOptions.AdsLockType;
        AdsTableOptions.AdsCollation:=TADSTable(DataSet).AdsTableOptions.AdsCollation;
        try
          Open;
        except
          on e:EADSDatabaseError do
          if (e.ACEErrorCode=5016) or (e.ACEErrorCode=7041)
          then begin
             Reindex(ds);
             Open;
          end else
          if e.ACEErrorCode=5025
          then begin
             if TableType=ttAdsNTX
               then TableType:=ttAdsVFP
               else TableType:=ttAdsNTX;
             TADSTable(DataSet).TableType:=TableType;
             Open;
          end else raise;
        end;

      //with FieldDefs do
      for i:=0 to FieldDefs.Count-1 do
      with FieldDefs.Items[i] do begin
        f:=TADSTable(DataSet).FindField(Name);
        if (f<>nil) and (Size<>0) then
        begin
          if (f.Size<>Size)
            Then f.Size:=Size;
          f.FieldKind:=fkData;
          //f.DataType:=DataType;
        end;
      end;
    for i:=TADSTable(DataSet).FieldCount-1 downto 0 do
      with TADSTable(DataSet).Fields[i] do
       case FieldKind of
        fkLookup: if (DataType=ftString) Then
          begin
            LookupDataSet.Open;
            Size:=LookupDataSet.FieldByName(LookupResultField).Size;
          end;
        fkData: if FindField(FieldName)=nil then
            Calculated:=True;
       end;

    finally
      free;
    end;

  end;
end;

procedure TMainForm.OpenDatabases(Sender: TObject);
var i,j: Integer;
    s: String;
    b: Boolean;
begin

  MsgBar.Caption:='Proszê chwilê poczekaæ, trwa otwieranie baz...';
  Application.ProcessMessages;
  Baza.Disconnect;
  Init.Disconnect;
//  try
  Baza.Connect;
  Init.Connect;

  //Indeks.Open;
(*
  s:=FormStorage1.StoredValue['defa'];
  ProcEnLst:=TStringList.Create;
  ProcEnLst.LoadFromFile(s+'\Proc_En.txt');
*)
  with Diety do begin
    Open;
    DietyStr:='';
    DietyLst:=TStringList.Create;
    while not eof do
    begin
      DietyStr:=DietyStr+DietyDieta.AsString;
      DietyLst.Add(DietyOpis.AsString);
      Next;
    end;
    FormStorage1.StoredValue['DietyStr']:=DietyStr;
  end;
  with Posilki do begin
    Open;
    PosStr:='';
    PosLst:=TStringList.Create;
    while not eof do
    begin
      PosStr:=PosStr+PosilkiPosilek.AsString;
      PosLst.Add(PosilkiOpis.AsString);
      Next;
    end;
    FormStorage1.StoredValue['PosStr']:=PosStr;
  end;
  with Grupy do begin
    Open;
    GrStr:='';
    GrLst:=TStringList.Create;
    while not eof do
    begin
      GrStr:=GrStr+GrupyGrupa.AsString;
      GrLst.Add(GrupyOpis.AsString);
      Next;
    end;
    FormStorage1.StoredValue['GrStr']:=GrStr;
  end;

  if grex then begin
    GrExLst:=TStringList.Create;
    for i:=1 to Length(GrStr) do
     for j:=1 to Length(DietyStr) do
      GrExLst.Add(DietyStr[j]+'/'+GrStr[i]+' '+DietyLst[j-1]+'/'+GrLst[i-1]);

    eRelewy.Filter:='dieta>="0" .and. substr(dieta,2,1)="/" .and. substr(dieta,3,1)>="0" .and. substr(dieta,4,1)=" "';
  end else eRelewy.Filter:='dieta>="0" .and. substr(dieta,2,1)=" "';

    RelJob.Open;
    DanJob.Open;
    Relewy.Open;
    Relewy.Last;

    ROsJob.Open;
    ROsJob.Last;
    RelJob.FindNearest([ROsJobData.Value,ROsJobPosilek.Value,ROsJobDieta.AsString]);
    if not ROsJob.IsEmpty and not ROsJobIle_pos.IsNull
      and (ROsJobData.Value=RelJobData.Value) and (ROsJobPosilek.Value=RelJobPosilek.Value)
      and (Copy(RelJobDieta.Value,1,1)=ROsJobDieta.Value)
    then begin
       b:=RelJob.FindKey([ROsJobData.Value,ROsJobPosilek.Value,ROsJobDieta.AsString+'/'+ROsJobGrupa.AsString]);
       if b<>grex Then begin
         FormStorage1.StoredValue['GrEx']:=b;
         grex:=b;
       end;
    end;

    ROsJob.Close;

    eRelewy.Filtered:=True;

    eRelewy.Open;
    eRelewy.Last;

    with Elementy do try
      Filter:='Left(jedn,2)="%" .and. Len(Trim(jedn))>1';
      Filtered:=True;
      Open;
      SetLength(aProcEn,3);
      i:=0;
      while not eof do begin
         inc(i);
         if Length(aProcEn)<i then SetLength(aProcEn,i);
         with aProcEn[i-1] do begin
           dest:=ElementyElement.AsString;
           src:=copy(ElementyJedn.AsString,2,ElementyElement.Size);
           if Pos('uszcz',ElementyNazwa.AsString)<>0
             Then Waga:=9
             Else Waga:=4;
         end;
         Next;
      end;
      SetLength(aProcEn,i);
    finally
      Filtered:=False;
    end;

    Elementy.FindKey([Format('%*d',[ElementyElement.Size,StrToInt(FormStorage1.StoredValue['Element'])])]);
    //DanJob.Open;
    SurJob.Open;
    EleJob.Open;
    RDaJob.Open;
    DReJob.Open;

  with Baza do
    for i:=DataSetCount-1 downto 0 do with TAdsTable(DataSets[i]) do if Tag<>0
     Then Open;
{
  except
   on e:EADSDatabaseError do
   if e.ACEErrorCode=iif(FormStorage1.StoredValue['CDX'],5016,7041)
    then BtnReindex.Click
    else raise;
  end;
  }
  MsgBar.Caption:='';
end;

function dind(d, di: string):boolean;
var i,j: Integer;
    g,gi,s: String;
begin
   Result:=False;
   if GrEx Then begin
     i:=pos('/',d);
     if i<>0 Then Begin
        g:=copy(d,i+1,maxint);
        d:=copy(d,1,i-1);
        if (g<>'') and (g[1]<'0') Then Exit;
     end else g:='';
     if di='' Then Result:=True else
     for j:=1 to wordcount(di,[',']) do begin
       s:=ExtractWord(j,di,[',']);
       i:=pos('/',s);
       if i<>0 Then Begin
         gi:=copy(s,i+1,maxint);
         di:=copy(s,1,i-1);
         if not ((g='') or (gi='') or ((gi[1]='-') xor (Pos(g[1],gi)<>0))) Then Continue;
       end;
       if (d<>'') and (d[1]<'0') Then Continue;
       Result:=(d='') or (di='') or ((di[1]='-') xor (Pos(d[1],di)<>0));
       if Result Then Exit;
     end;
   end else begin
     if (d<>'') and (d[1]<'0') Then Exit;
     Result:=(d='') or (di='') or ((di[1]='-') xor (Pos(d[1],di)<>0));
   end;

end;

procedure TMainForm.DSRDaniaDataChange(Sender: TObject; Field: TField);
begin
  with RSurowce do
    if (RSurowceDanie.FieldKind=fkData)
   and (tag<>0)
   and (RDania.State=dsBrowse)
   and (RSurowce.State=dsBrowse)
   and (RSurowceDanie.Value<>RDaniaDanie.Value)
  then
    RSurowce.Locate('Danie',RDaniaDanie.Value,[]);
end;

procedure TMainForm.rSurowceCalcFields(DataSet: TDataSet);
var i: Currency;
begin
  IlePosCalc(DataSet);
  with sReJob do begin
    Open;
    SetRange([rSurowceSkladnik.Value,rSurowceData.Value],[rSurowceSkladnik.Value,rSurowceData.Value]);
    First;
    i:=rSurowceilosc.AsCurrency;
    while not eof do begin
      if (rSurowcePosilek.Value<>sReJobPosilek.Value) or (rSurowcePozycja.Value<>sReJobPozycja.Value)
       Then i:=i+sReJobIlosc.AsCurrency;
      Next;
    end;
    CancelRange;
  end;
  rSurowceil_tot.AsCurrency:=i;
end;

procedure TMainForm.IlePosCalc(DataSet: TDataset);
var da: TDateTime;
    p,d: String;
    i: Currency;
    f,g: TField;
begin
  f:= DataSet.FindField('Ile_p');
                      // bo wywo³ywane przez liczenie zapotrzebowania
  g:= DataSet.FieldByName('Ile_pos');

  //if not DataSet.InheritsFrom(TRxMemoryData) and (f.FieldKind=fkData) {and (f.AsCurrency=0)} Then Exit;

  if (f<>nil) and (g.FieldKind=fkData) and (g.AsCurrency<>0) Then begin
     f.AsCurrency:=g.AsCurrency;
     Exit;
  end;

  if (f=nil) Then
    if (g.FieldKind=fkData)
      Then Exit
      Else f:=g;

  da:=DataSet.FieldByName('Data').AsDateTime;
  p:= DataSet.FieldByName('Posilek').AsString;
  d:= DataSet.FieldByName('Dieta').AsString;

  with RelJob do
  begin
    CancelRange;
    if FindKey([da,p,d])
    Then i:=RelJobIle_Pos.AsCurrency
    else try
      SetRange([da,p,'0'],[da,p]);
      First;
      i:=0;
      while not eof do begin
        if (grex and (copy(RelJobDieta.Value,2,1)='/') and (Length(RelJobDieta.Value)=3)
        or not grex and (Length(RelJobDieta.Value)=1))
        and dind(RelJobDieta.Value,d) Then
           i:=i+RelJobIle_Pos.AsCurrency;
        Next;
      end;
    finally;
      CancelRange;
    end;
    if i<>0 Then begin
       f.AsCurrency:=i;
    end;
  end;
end;

procedure TMainForm.GetTextPlusNazwa(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=Sender.AsString;
  if DisplayText Then
    Text:=Text+' '+Sender.DataSet.FieldByName('Nazwa').AsString;
end;

procedure TMainForm.rSurowceDANIEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=Sender.AsString;
  if DisplayText Then Text:={Text+' '+}Sender.DataSet.FieldByName('NazwaDania').AsString;
end;

procedure TMainForm.RelewyCalcFields(DataSet: TDataset);
var c: Currency;
begin
  if DataSet=Relewy
    Then FlagiCalcFields(DataSet);
  with TAdsTable(DataSet) do begin
      c:=FieldByName('Ile_pos').AsCurrency;
      if c<>0 Then c:=FieldByName('D_WARTOSC').AsFloat/c;
      FieldByName('Cena').AsCurrency:=c;
  end;
end;

procedure TMainForm.RxMainMenu1GetItemParams(Sender: TMenu;
  Item: TMenuItem; State: TMenuOwnerDrawState; AFont: TFont;
  var Color: TColor; var Graphic: TGraphic; var NumGlyphs: Integer);
var s: TSpeedItem;
begin
  s:=nil;
  if ActiveMDIChild <> nil Then
     s:=TSpeedItem(ActiveMDIChild.FindComponent(Item.Hint));
  if not (s is TSpeedItem) Then s:=TSpeedItem(FindComponent(Item.Hint));
  if not (s is TSpeedItem) Then Exit;
  Graphic:=s.Glyph;
  NumGlyphs:=s.NumGlyphs;
end;

procedure TMainForm.MenuToolClick(Sender: TObject);
var s: TSpeedItem;
begin
  s:=TSpeedItem(FindComponent(TMenuItem(Sender).Hint));
  if s is TSpeedItem Then
     s.ButtonClick;
end;

procedure TMainForm.Reindex(DataSet: TADSTable);
var o: tADSIndexOptions;
    k,f: String;
    a,b,c: Boolean;
    i: Integer;
begin
    a:=DataSet.Exclusive;
    b:=DataSet.Readonly;
    c:=DataSet.Active;
    with DataSet do
    try
      Close;
      AdsRegisterCallbackFunction(@MyCallbackFunc,0);
      Exclusive:=True;
      Readonly:=False;
      k:=ExtractFilePath(GetTablePath(DataSet));
      if TableType<>ttAdsNTX then
         SysUtils.DeleteFile(ChangeFileExt(GetTablePath(DataSet),'.cdx'))
      else begin
         For i:=IndexFiles.Count-1 Downto 0 do
           SysUtils.DeleteFile(k+ChangeFileExt(IndexFiles[i],'.ntx'));
         IndexFiles.Clear;
      end;

      if (AdsConnection<>nil) and adsConnection.IsDictionaryConn then
      begin
        AdsConnection:=nil;
        DatabaseName:=k;
      end;
      Open;

      Gauge1.Progress:=0;
      //AdsPackTable;
      Indeks.Open;
      if Indeks.Locate('baza',TableName,[]) Then
      repeat
        Application.ProcessMessages;
        if Application.Terminated Then Exit;
        if TableType<>ttAdsNTX //FormStorage1.StoredValue['CDX']
         then o:=[optCompound]
         else o:=[];
        if IndeksDescend.AsBoolean
         Then o:=o+[optDescending];
        if IndeksUnique.AsBoolean
         Then o:=o+[optUnique];
        Gauge1.Progress:=0;
        k:=Expand(IndeksKlucz.AsString);
        f:=Expand(IndeksFor.AsString);
        MsgBar.Caption:=TableName+'/'+IndeksNazwa.AsString+': '+k;
        if TableType<>ttAdsNTX //FormStorage1.StoredValue['CDX']
         then AdsCreateIndex( '', IndeksNazwa.AsString, k, f, '', o)
         else AdsCreateIndex( IndeksNazwa.AsString, '', k, f, '', o);
        indeks.Next;
      until Indeks.Eof or (IndeksBaza.AsString<>TableName);
    finally
      Close;
      Exclusive:=a;
      Readonly:=b;
      Active:=c;
    end;
end;

procedure TMainForm.BtnReindexClick(Sender: TObject);
const job: boolean = False;
var i,j: Integer; k,s: String;
begin
  TRxSpeedButton(Sender).Down:=True;
  if job Then Exit;
  try
    job:=True;
    TRxSpeedButton(Sender).Down:=True;
    For i:=MDIChildCount-1 downto 0
        do MDIChildren[i].close;

    DBStatusLabel1.Hide;
    Gauge1.Show;
    Application.ProcessMessages;
    Baza.Disconnect;
    Init.Disconnect;


    if baza.IsDictionaryConn Then begin
      with baza do for j:=0 to DataSetCount-1 do
      with TADSTable(DataSets[j]) do
      if (Copy(Name,4,3)='Job') {and (DataSets[j]<>RSuJob)} Then
      try
        Exclusive:=True;
        Open;
        MsgBar.Caption:='Odtwarzam skorowidze: '+Name;
        AdsReindex;
        Close;
        Exclusive:=False;
        Open;
      except
        Exclusive:=False;
      end;
      Baza.Disconnect;
      MsgBar.Caption:='Gotowe!';
    end else begin
      with baza do for j:=DataSetCount-1 Downto 0 do with TADSTable(DataSets[j]) do
      begin
        Tag:=0;
        if TableType<>ttAdsNTX then begin
           SysUtils.DeleteFile(ChangeFileExt(GetTablePath(TADSTable(Baza.DataSets[j])),'.cdx'))
        end else begin
           k:=ExtractFilePath(GetTablePath(TADSTable(DataSets[j])));
           For i:=IndexFiles.Count-1 Downto 0 do begin
             s:=IndexFiles[i];
             //CloseIndexFile(s);
             SysUtils.DeleteFile( k+ChangeFileExt(s,'.ntx'));
           end;
           IndexFiles.Clear;
        end;
      end;
      with baza do for j:=0 to DataSetCount-1 do
      if (Copy(Name,4,3)='Job') Then
        TableBeforeOpen(DataSets[j]);

    end;
  finally
    if not Application.Terminated Then
      OpenDatabases(Self);
    Gauge1.Hide;
    DBStatusLabel1.Show;
    TRxSpeedButton(Sender).Down:=False;
    job:=False;
  end;
end;

procedure TMainForm.LpBeforeInsert(DataSet: TDataset);
var i,j: Integer;
    t,d: TAdsTable;
begin
  if (@DataSet.BeforeEdit<>nil)
    Then DataSet.BeforeEdit(DataSet); //SlaveBeforeEdit(DataSet);
  t:=TAdsTable(FindComponent(Copy(DataSet.Name,1,3)+'Job'));
  d:=TAdsTable(DataSet);
  if t<>nil Then
  With t do
  begin
    Open;
    SetRangeStart;
    For i:=0 to FieldCount-1 Do
    with fields[i] do
     if Visible then break else Assign(d.FieldByName(FieldName));
    SetRangeEnd;
    For i:=0 to FieldCount-1 Do
    with fields[i] do
     if Visible then
     begin
       AsString:=MaxChar;
       break;
     end else Assign(d.FieldByName(FieldName));
    ApplyRange;
    Last;
    for i:=0 to FieldCount-1 do
    with Fields[i] do
    if Visible Then
    with d.fieldByName(FieldName) do
    begin
      if IsNull Then j:=1 else j:=StrToIntDef(t.Fields[i].AsString,0)+1;
      Tag:=j;
      break;
    end;
  end
end;

procedure TMainForm.LpOnNewRecord(DataSet: TDataset);
var i: Integer;
    t,d: TAdsTable;
begin
  t:=TAdsTable(FindComponent(Copy(DataSet.Name,1,3)+'Job'));
  d:=TAdsTable(DataSet);
  t.Open;
  with t do
  for i:=0 to FieldCount-1 do
  with d.fieldByName(Fields[i].FieldName) do
  if Visible Then
  begin
    AsString:=Format('%*d',[Size,Tag]);
    break
  end
  Else Assign(d.MasterSource.DataSet.FieldByName(FieldName));
end;

procedure TMainForm.DIETASetText(Sender: TField;
  const Text: String);
var i,j: Integer;
    t,d: String;
    g: TAdsTable;
begin
  if Text=Sender.AsString Then Exit;
  t:=AnsiUpperCase(TrimRight(Text));
  g:=Diety;
  d:=DietyStr;
  if (T='') or (Length(t)=1) and (t[1] in ['+','-','/',',']) then begin
    Sender.Clear;
    Exit;
  end;
  j:=1;
  for i:=1 to Length(T) do
  begin
    if grex then begin
      if (t[i]=',') and (i>1)
      then begin
         g:=Diety;
         j:=i+1;
         Continue;
      end;
      if (t[i]='/') and (g=Diety)
      then begin
        g:=Grupy;
        d:=GrStr;
        j:=i+1;
        Continue;
      end;
    end;
    if not ((T[i] in ['+','-']) and (i=j))
       and (StrScan(PChar(d),T[i])=nil)
    Then with TSzukamForm.Create(g) do
      try
         Caption:='Brak takiej diety: '+T[i];
         if showmodal=mrOK Then t[i]:=PChar(g.Fields[0].AsString)^
         Else Raise Exception.Create('Brak takiej diety: '+T[i]);
      finally
        DataSource1.DataSet.Filtered:=False;
        Release;
      end;
  end;
  if not grex Then
    for i:=1 to Length(T) do
      if pos(t[i],t)<>i Then Delete(t,i,1);
  Sender.AsString:=T;
  if Sender.DataSet=rSurowce then begin
     //IlePosCalc(rSurowce);
     rSurowceGramSetText(rSurowceGram,rSurowceGram.Text);
  end;
end;

procedure TMainForm.OsobyDIETASetText(Sender: TField; const Text: String);
var c: Char;
begin
  if Trim(Text)<>''
      Then c:=UpCase(PChar(Text)^)
      Else c:=#0;
  if StrScan(PChar(DietyStr),c)=nil
  Then with TSzukamForm.Create(Diety) do
   try
     Caption:='Brak takiej diety: '+Text;
     if showmodal=mrOK Then c:=PChar(DietyDieta.AsString)^
     Else Raise Exception.Create('Brak takiej diety: '+Text);
   finally
     DataSource1.DataSet.Filtered:=False;
     Release;
   end;
  Sender.AsString:=c;
end;

procedure TMainForm.OsobyGRUPASetText(Sender: TField; const Text: String);
var c: Char;
begin
  if Trim(Text)<>''
      Then c:=UpCase(PChar(Text)^)
      Else c:=#0;
  if StrScan(PChar(GrStr),c)=nil
  Then with TSzukamForm.Create(Grupy) do
   try
     Caption:='Brak takiej grupy: '+Text;
     if showmodal=mrOK Then c:=PChar(GrupyGrupa.AsString)^
     Else Raise Exception.Create('Brak takiej grupy: '+Text);
   finally
     DataSource1.DataSet.Filtered:=False;
     Release;
   end;
  Sender.AsString:=c;
end;

procedure TMainForm.rOsobyAfterEdit(DataSet: TDataset);
const il:Currency = 0;
      di:String = '';
      gr:String = '';
var   fil : Currency;
      fdi,fgr,fpo: String;
      fda: TDateTime;

procedure fixil;
begin
  if (il=0) or (di='') or (gr='') Then Exit;
  with RelJob Do
  begin
    SetKey;
    RelJobData.AsDateTime:=fda;
    RelJobPosilek.AsString:=fpo;
    if grex then RelJobDieta.AsString:=di+'/'+gr
            else RelJobDieta.AsString:=di;
    if not GotoKey Then
    begin
      Append;
      RelJobData.AsDateTime:=fda;
      RelJobPosilek.AsString:=fpo;
      if grex then RelJobDieta.AsString:=di+'/'+gr
              else RelJobDieta.AsString:=di;
    end;
    First;
    While not eof do
    begin
      if grex and dind(di+'/'+gr,RelJobDieta.AsString)
      or not grex and dind(di,RelJobDieta.AsString) Then
      begin
        Edit;
        RelJobIle_Pos.AsCurrency:=RelJobIle_Pos.AsCurrency-il;
      end;
      Next;
    end;
  end;
end;

procedure fixrel;
  var a, b : array of string;
      c, d, g : array of Extended;
      e: String; f: Extended;
      i,j: Integer;
begin
  with RelJob Do
  begin
    First;
    While not eof do begin
       if (RelJobDieta.AsString <'0') or grex and
       ((copy(RelJobDieta.AsString,2,1)<>'/')
       or (copy(RelJobDieta.AsString,3,1)<'0')
       or (copy(RelJobDieta.AsString,4,MaxInt)<>''))
       or not grex and (copy(RelJobDieta.AsString,2,MaxInt)<>'')
       then begin
          setlength(a,length(a)+1);
          a[High(a)]:=RelJobDieta.AsString;
          setlength(c,length(c)+1);

          if RelJobIle_Pos.AsFloat<>0
           Then c[High(c)]:=RelJobWart_Tot.AsFloat/RelJobIle_Pos.AsFloat
           Else c[High(c)]:=0;
       end else begin
          setlength(b,length(b)+1);
          b[High(b)]:=RelJobDieta.AsString;
          setlength(d,length(d)+1);
          d[High(d)]:=RelJobWart_Tot.AsFloat;
          setlength(g,length(g)+1);
          g[High(g)]:=RelJobIle_Pos.AsFloat;
       end;
       Next;
    end;
    First;
    for i:=Low(b) To High(b) do
      for j:=Low(a) To High(a) do
         if dind(b[i],a[j]) then d[i]:=d[i]+g[i] * c[j];
    While not eof
    do begin
       e:=RelJobDieta.AsString;
       f:=0;
       for i:=Low(b) To High(b) do
         if dind(b[i],e) then f:=f+d[i];
       Edit;
       RelJobD_Wartosc.AsFloat:=f;
       Next;
    end;
  end;
end;

begin
  fil:=DataSet.FieldByName('Ile_pos').AsCurrency;
  fdi:=DataSet.FieldByName('Dieta').AsString;
  fgr:=DataSet.FieldByName('Grupa').AsString;
  If DataSet.State in [dsEdit,dsInsert] Then
  begin
    il:=fil;
    di:=fdi;
    gr:=fgr;
  end else
  begin
      with Relewy do if State in dsEditModes Then Post;
      SaveAfterPost(DataSet);
      if (il<>fil) or ((di<>fdi) or (gr<>fgr)) and (il<>0) Then
      with RelJob do
      try
        fda:=DataSet.FieldByName('Data').AsDateTime;
        fpo:=DataSet.FieldByName('Posilek').AsString;
        SetRange([fda,fpo],[fda,fpo]);
        First;
        fixil;
        il:=-fil;
        di:=fdi;
        gr:=fgr;
        fixil;
        fixrel;
      finally
        CancelRange;
        SaveAfterPost(DataSet);
        Relewy.Refresh;
        with ORelewy do if Active Then Refresh;
      end;
  end;
end;

procedure TMainForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.POSILEKGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var i: Integer;
begin
  if DisplayText Then Begin
   i:=Pos(Sender.AsString,PosStr)-1;
   if i>=0 Then Text:=PosLst[i];
  end Else
   Text:=Sender.AsString;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  SetLength(aProcEn,0);
  DietyLst.Free;
  PosLst.Free;
  GrLst.Free;
  GrExLst.Free;
end;

procedure TMainForm.KOD_OSOBYGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=Sender.AsString;
  if DisplayText Then Text:=Text+' '+Sender.DataSet.FieldByName('Nazwisko').AsString;
end;

procedure TMainForm.ELEMENTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=Sender.AsString;
  if DisplayText Then
    Text:=Text+' '+Sender.DataSet.FieldByName('Nazwa').AsString
              +' ['+Trim(Sender.DataSet.FieldByName('Jedn').DisplayText)+']';
end;

procedure TMainForm.POSILEKSetText(Sender: TField;
  const Text: String);
var c: Char;
begin
  if Trim(Text)<>''
      Then c:=UpCase(PChar(Text)^)
      Else c:=#0;
  If (Text='') or (Text<>'') and (StrScan(PChar(PosStr),C)=nil)
  Then with TSzukamForm.Create(Posilki) do
   try
     Caption:='Brak takiejgo posi³ku: '+Text;
     Posilki.Locate('POSILEK',Sender.Value,[]);
     if showmodal=mrOK Then c:=PChar(PosilkiPosilek.AsString)^
     Else begin
      if Sender.isnull then Raise Exception.Create('Brak takiejgo posi³ku: '+Text);
      Exit; //abort;
     end;
   finally
     DataSource1.DataSet.Filtered:=False;
     Release;
   end;
  Sender.AsString:=C;
end;

procedure TMainForm.Otwrz1Click(Sender: TObject);
var i: Integer;
    c: TSpeedItem;
begin
  for i:=0 To TMenuItem(Sender).Count-1 do
  with TMenuItem(Sender).Items[i] do begin
     c:=TSpeedItem(Self.FindComponent(Hint));
     if c is TSpeedItem
      Then Checked:=c.Down;
  end;
end;

procedure TMainForm.BtnKopiujClick(Sender: TObject);
begin

  if (Screen.ActiveForm.ActiveControl=nil) Then Exit;
  with Screen.ActiveForm do if ActiveControl is TRxDBGrid Then
  begin
     if TRxDBGrid(ActiveControl).EditorMode
     and (TRxDBGrid(ActiveControl).InplaceEditor<>nil)
     Then TRxDBGrid(ActiveControl).InplaceEditor.CopyToClipboard
     Else Activecontrol.Perform(WM_COPY,0,0)
  end else Activecontrol.Perform(WM_COPY,0,0)
end;

procedure TMainForm.BtnWytnijClick(Sender: TObject);
begin
  if (Screen.ActiveForm.ActiveControl=nil) Then Exit;
  with Screen.ActiveForm do if ActiveControl is TRxDBGrid Then
  begin
    Activecontrol.Perform(WM_CUT,0,0);
  end else begin
   if ActiveControl is TDBEdit
    Then TDBEdit(ActiveControl).DataSource.Edit;
   Activecontrol.Perform(WM_CUT,0,0);
  end;
end;

procedure TMainForm.BtnWklejClick(Sender: TObject);
begin
  if (Screen.ActiveForm.ActiveControl=nil) Then Exit;
  with Screen.ActiveForm do if ActiveControl is TRxDBGrid Then
  begin
    Activecontrol.Perform(WM_PASTE,0,0)
  end else begin
   if ActiveControl is TDBEdit
    Then TDBEdit(ActiveControl).DataSource.Edit;
   Activecontrol.Perform(WM_PASTE,0,0);
  end;
end;

procedure TMainForm.BtnSelectAllClick(Sender: TObject);
begin
  if (Screen.ActiveForm.ActiveControl=nil) Then Exit;
  Screen.ActiveForm.ActiveControl.Perform(EM_SETSEL, 0, -1);
end;

procedure FilterDeactivate(Sender: TDataSet);
var b: String;
begin
  with TADSTable(Sender) do
  if Filtered then
  try
    if Sender.InheritsFrom(TADSTable)
    and Filtered
    and not IsEmpty Then
    begin
      b:=AdsExtractKey;
      Filtered:=False;
      AdsSeek(b,stSOFT);
    end Else Filtered:=False;
  except
  end;
end;

procedure TMainForm.DANIESetText(Sender: TField; const Text: String);
var c:string;
    p: TField;
begin
  if (TrimRight(Text)='') and  (Sender.DataSet<>rDania) Then
  begin
    Sender.Clear;
    Exit;
  end;
  if Text='' Then c:=Sender.Text Else c:=Text;
  c:=UpperCase(c);
  DanJob.IndexFieldNames:='DANIE';
  DanJob.Open;
  if (Text='') or not DanJob.FindKey([Text])
  then begin
   if Dania.Tag<>0 Then With TDaniaForm(Dania.Tag), MdDBGrid1 do
   begin
     Klucz:='';
     FilterDeactivate(Dania);
     If BtnLink.Down Then BtnLink.ButtonClick;
     Application.ProcessMessages;
   end;
   with TDaniaForm.Create2(Application,Dania) do
   try
     WindowState:=wsNormal;
     MdDbGrid1.SelectedField:=DaniaNazwa;
     if strtointdef(c,0)<>0 then begin
       Dania.IndexName:='DAN_KOD';
       Dania.FindKey([c]);
       Dania.IndexName:='DAN_NAZ';
     end else begin
       Dania.IndexName:='DAN_NAZ';
       p:=Sender.DataSet.FindField('Posilek');
       if p<>nil Then
       begin
         Dania.CancelRange;
         Dania.SetKey;
         DaniaPosilek.Assign(p);
         DaniaNazwa.AsString:=c;
         Dania.GotoNearest;
         MdDbGrid1.CanUseIndex:=True;
         MdDBGrid1.TitleButtons:=True;
         MdDbGrid1.SelectedField:=DaniaNazwa;
         MdDbGrid1.Klucz:=TrimRight(Text);
       end Else MdDbGrid1.SelectedField:=DaniaPosilek;
     end;
     Caption:='Brak takiego dania: '+Text;

     if showmodal=mrOK Then c:=DaniaDanie.AsString
     Else begin
       MsgBar.Caption:='Brak takiego dania: '+Text;
       MessageBeep(MB_ICONHAND);
       Abort;
     end;
     DanJob.FindKey([c]);
   finally
     Release;
     Dania.IndexFieldNames:='DANIE';
     Dania.CancelRange;
   end;
  end;
  Sender.AsString:=c;
  with Sender.DataSet.fieldByName('Posilek') do
    if AsString <> DanJobPosilek.AsString Then
    begin
      DanJob.Edit;
      DanJobPosilek.AsString:=AsString;
      DanJob.Post;
      if Dania.Active Then Dania.Refresh;
    end;

end;

procedure TMainForm.UniqueBeforePost(DataSet: TDataset);
var t: TAdsTable;
    i: Integer;
    n: TComponentName;
    f: TField;
begin
  n:=Copy(DataSet.Name,1,3)+'Job';
  t:=FindComponent(n) as TAdsTable;
  if t=nil Then Exit;
  t.Open;
  t.SetKey;
  //n:='Istnieje ju¿';
  For i:=0 To 3 Do
  begin
   f:=t.fields[i];
   if f.Visible
    Then if i=0 Then Exit else break
    else f.Assign(DataSet.Fields[i]);
  end;
  if t.GotoKey and (t.RecNo<>DataSet.RecNo)
   Then Raise Exception.Create('Istnieje ju¿ taki zapis');

end;

procedure TMainForm.SlaveBeforeEdit(DataSet: TDataset);
begin
  if TAdsTable(dataSet).MasterSource=nil Then Exit;
  with TAdsTable(dataSet).MasterSource, DataSet do
  begin
    if (State=dsInsert) or Modified Then Post;
      Edit;
  end;
end;

procedure TMainForm.Wyraeniefiltra1Click(Sender: TObject);
begin
  if (ActiveMDIChild is TChildForm) Then
   with TChildForm(ActiveMDIChild) do
    BtnFilteMouseUp(BtnFilter,mbRight,[],0,0);
end;

procedure TMainForm.SaveAfterPost(DataSet: TDataset);
begin
  with TAdsTable(DataSet) do
  begin
//    AdsFlushFileBuffers;
    if MasterSource<>nil then
    with MasterSource, DataSet do
      if State in dsEditModes Then Post;
  end;
end;

procedure TMainForm.FlagiValidate(Sender: TField);
var f:TField;
begin
   f:=Sender.DataSet.FieldByName('Flagi');
   if not f.isnull Then
      Raise Exception.Create('Nie wolno zmieniaæ, gdy istnieje '+f.AsString+#13'dla tego wiersza');
end;

procedure TMainForm.FlagiBeforeDelete(DataSet: TDataset);
var f:TField;
begin
   f:=DataSet.FieldByName('Flagi');
   if not f.isnull Then
      Raise Exception.Create('Nie wolno usuwaæ, gdy istnieje '+f.AsString+#13'dla tego wiersza');
end;

procedure TMainForm.BtnKalkulClick(Sender: TObject);
begin
  RxCalculator1.Title:='Kalkulator';
  try
  if Screen.ActiveControl=nil Then Exit;
  with Screen.ActiveControl do
  begin
    if InheritsFrom(TDBGrid) Then
    with TRxDBGrid(Screen.ActiveControl) do
    try
      EditorMode:=True;
      RxCalculator1.Value:=StrToFloat(Selectedfield.Text);
    except
    end
    else if InheritsFrom(TCustomEdit) Then
    with TCustomEdit(Screen.ActiveControl) do
    try
      RxCalculator1.Value:=StrToFloat(Text);
    except
    end;

   if RxCalculator1.Execute Then
   Begin
   if InheritsFrom(TDBEdit) Then
   with TDBEdit(Screen.ActiveControl) do
   begin
      DataSource.Edit;
      EditText:=FloatToStr(RxCalculator1.Value);
   end
   else if InheritsFrom(TRxDBGrid) Then
   with TRxDBGrid(Screen.ActiveControl) do
   begin
      DataSource.Edit;
      SelectedField.Text:=FloatToStr(RxCalculator1.Value);
   end
  end;
 end;
 finally
   TRxSpeedButton(Sender).Down:=False;
 end;
end;

procedure TMainForm.RxCalculator1CalcKey(Sender: TObject; var Key: Char);
begin
  if key=' ' Then RxCalculator1.Calculator.ModalResult:=mrOK;
end;

procedure TMainForm.AppEvents1ActiveFormChange(Sender: TObject);
begin
  if (ActiveMDIChild is TChildForm) Then
  with TChildForm(ActiveMDIChild) do
  if TComponent(tag) is TRxSpeedButton then
  begin
     Self.MsgBar.Caption:=Msgtxt;
     TRxSpeedButton(Tag).Down:=True;
     if ActiveControl is TCustomEdit
     then Self.DSLabel.DataSet:=DataSource2.DataSet
     else Self.DSLabel.DataSet:=DataSource1.DataSet;
  end;
end;

procedure TMainForm.KOD_OSOBYSetText(Sender: TField;
  const Text: String);
var c:string;
begin
  if Text='' Then begin
     Sender.Clear;
     Exit;
  end;
  c:=UpperCase(Text);
  OsoJob.IndexFieldNames:='Kod_osoby';
  OsoJob.Open;
  if not OsoJob.FindKey([Text]) then begin
   if Osoby.Tag<>0 Then With TChildForm(Osoby.Tag), MdDBGrid1 do
   begin
     Klucz:='';
     FilterDeactivate(Osoby);
     If BtnLink.Down Then BtnLink.ButtonClick;
     Application.ProcessMessages;
   end;
   with TChildForm.Create2(Application,Osoby) do
   try
     Osoby.IndexFieldNames:='Kod_osoby';
     if Text=' '
       Then Osoby.FindKey([Sender.Text]);
     if StrToIntDef(c,0)=0
      Then MdDbGrid1.SelectedField:=OsobyNazwisko
      else MdDbGrid1.SelectedField:=OsobyKod_Osoby;
     MdDbGrid1.SetIndex(MdDbGrid1.SelectedField);
     MdDbGrid1.CanUseIndex:=True;
     MdDBGrid1.TitleButtons:=True;
     MdDbGrid1.Klucz:=TrimRight(Text);

     Caption:='Brak takiej osoby: '+Text;

     if showmodal<>mrOK Then begin
       MsgBar.Caption:='Brak takiej osoby: '+Text;
       MessageBeep(MB_ICONHAND);
       Abort;
     end;
     c:=OsobyKod_osoby.AsString;
     OsoJob.FindKey([c]);
   finally
     Release;
     Osoby.IndexFieldNames:='Kod_osoby';
     Osoby.CancelRange;
   end;
  end;
  with Sender.DataSet.FieldByName('Dieta') do if isnull Then Assign(OsoJobDieta);
  with Sender.DataSet.FieldByName('Grupa') do if isnull Then Assign(OsoJobGrupa);
  with Sender.DataSet.FieldByName('Ile_pos') do if isnull Then AsInteger:=1;
  Sender.AsString:=c;
end;

procedure TMainForm.SKLADNIKSetText(Sender: TField;
  const Text: String);
var c:string;
begin
  c:=UpperCase(Text);
  SurJob.IndexFieldNames:='Skladnik';
  SurJob.Open;
  if (Text='') or not SurJob.FindKey([Text])
  then begin
   if Surowce.Tag<>0 Then With TChildForm(Surowce.Tag), MdDBGrid1 do
   begin
     Klucz:='';
     FilterDeactivate(Surowce);
     If BtnLink.Down Then BtnLink.ButtonClick;
     Application.ProcessMessages;
   end;
   with TChildForm.Create2(Application,Surowce) do
   try
     Surowce.IndexFieldNames:='Skladnik';
     if Text=' '
        Then Surowce.FindKey([Sender.Text]);
     if StrToIntDef(c,0)=0
      Then MdDbGrid1.SelectedField:=SurowceNazwa
      else MdDbGrid1.SelectedField:=SurowceSkladnik;
     MdDbGrid1.CanUseIndex:=True;
     MdDBGrid1.TitleButtons:=True;
     MdDbGrid1.SetIndex(MdDbGrid1.SelectedField);
     MdDbGrid1.Klucz:=TrimRight(Text);

     Caption:='Brak takiego surowca: '+Text;

     if showmodal=mrOK Then c:=SurowceSkladnik.AsString
     Else begin
       MsgBar.Caption:='Brak takiego surowca: '+Text;
       MessageBeep(MB_ICONHAND);
       Abort;
     end;
   finally
     Release;
     Surowce.IndexFieldNames:='Skladnik';
     Surowce.CancelRange;
   end;
  end;
  Sender.AsString:=c;
end;

procedure TMainForm.ELEMENTSetText(Sender: TField;
  const Text: String);
var c:string;
begin
  c:=UpperCase(Text);
  EleJob.IndexFieldNames:='Element';
  EleJob.Open;
  if Text=' '
     Then EleJob.FindKey([Sender.Text]);
  if (Text='') or not EleJob.FindKey([Text])
  then begin
   if Elementy.Tag<>0 Then With TChildForm(Elementy.Tag), MdDBGrid1 do
   begin
     Klucz:='';
     FilterDeactivate(Elementy);
     If BtnLink.Down Then BtnLink.ButtonClick;
     Application.ProcessMessages;
   end;
   with TChildForm.Create2(Application,Elementy) do
   try
     Elementy.IndexFieldNames:='Element';
     if Text=' '
       Then Elementy.FindKey([Sender.Text]);
     if StrToIntDef(c,0)=0
      Then MdDbGrid1.SelectedField:=ElementyNazwa
      else MdDbGrid1.SelectedField:=ElementyElement;
     MdDbGrid1.SetIndex(MdDbGrid1.SelectedField);
     MdDbGrid1.CanUseIndex:=True;
     MdDBGrid1.TitleButtons:=True;
     MdDbGrid1.Klucz:=TrimRight(Text);

     Caption:='Brak takiego elementu pokarmowego: '+Text;

     if showmodal=mrOK Then c:=ElementyElement.AsString
     Else begin
       MsgBar.Caption:='Brak takiego elementu pokarmowego: '+Text;
       MessageBeep(MB_ICONHAND);
       Abort;
     end;
   finally
     Release;
     Elementy.IndexFieldNames:='Element';
     Elementy.CancelRange;
   end;
  end;
  Sender.AsString:=c;
end;

procedure TMainForm.BtnRenumberClick(Sender: TObject);
var s: String;
    i,j: Longint;

begin
  if Screen.ActiveControl is TRxDBGrid Then
  with TRxDBGrid(Screen.ActiveControl) do
  if SelectedField.CanModify
    and (SelectedField.DataType=ftString)
    and (SelectedField.DataSize<=Sizeof(s))
    and (SelectedRows.Count>0) then
  begin
    s:=SelectedField.AsString;
    if not InputQuery(TForm(Owner).Caption, 'Przenumeruj '+SelectedField.DisplayLabel+' od:',s) then Exit;
    j:=StrToInt(s);
    For i:=0 To SelectedRows.Count-1 Do
    begin
      Gotoselection(i);
      Datasource.Edit;
      with SelectedField do Text:=Format('%*d',[Size,j+i]);
      DataSource.DataSet.Post;
    end;
    UnselectAll;
  end;
end;

procedure TMainForm.BtnIZZClick(Sender: TObject);
const katalog: TFileName = '';
      job: boolean = False;
var t: TAdsTable;
    o: TOpenDialog;
    s: String;
    i: Integer;
    f: TField;
begin
  TRxSpeedButton(Sender).Down:=True;
  if job Then Exit;
  TRxSpeedButton(Sender).Down:=True;
  t:=nil;
  o:=nil;
  try
    job:=True;
    o:=TOpenDialog.Create(nil);
    o.Title:='Podaj lokalizacjê bazy danych Instytutu ¯ywienia i Dietetyki';
    o.Filter:='Pliki Baz danych|wop*.dbf';
    o.InitialDir:=ExtractFilePath(Katalog);
    o.FileName:=ExtractFileName(Katalog);
    o.Options:=[ofReadOnly];
    if not o.Execute then Exit;
    Screen.Cursor:=crSQLWait;
    DBStatusLabel1.Hide;
    baza.Disconnect;

    Katalog:=o.fileName;
    t:=TAdsTable.Create(Self);
    t.DatabaseName:=ExtractFilePath(Katalog);
    t.TableName:='skladnik';
    t.TableType:=Relewy.TableType;
    t.AdsTableOptions.AdsCharType:=Relewy.AdsTableOptions.AdsCharType;
    t.AdsTableOptions.AdsCollation:=Relewy.AdsTableOptions.AdsCollation;
    t.AdsTableOptions.AdsLockType:=Relewy.AdsTableOptions.AdsLockType;

    t.readonly:=True;
    t.Open;
    EleJob.Open;
    SurJob.Open;
    SElJob.Open;
    with t do
    While not eof do
    begin
      s:=Format('%*d',[EleJobElement.Size,t.FieldByName('Nr').AsInteger]);
      with EleJob do
      if FindKey([s]) Then Edit
      else begin
       Append;
       EleJobElement.AsString:=s;
      end;
      EleJobNazwa.Assign(t.FieldByName('Nazwa_Skl'));
      EleJobJedn.AsString:=Trim(t.FieldByName('Jednostka').AsString);
      Next;
    end;
    t.Close;
    t.TableName:=ExtractFileName(o.FileName);
    t.Open;
    with t do
    While not eof do
    begin
      s:=Format('%*d',[SurJobSkladnik.Size,t.FieldByName('Lp').AsInteger]);
      With SurJob do
      if FindKey([s]) Then
      begin
       with SElJob do
       begin
         SetRange([s],[s]);
         First;
         While not eof do
          Delete;
       end;
       Edit
      end
      else begin
       Append;
       SurJobSkladnik.AsString:=s;
       SurJobJmag.AsString:='kg';
       SurJobPrzel.AsInteger:=1000;
      end;
      SurJobJedn.AsString:='g';
      SurJobGram.AsInteger:=100;
      SurJobNazwa.AsString:=t.FieldByName('Naz_prod').AsString;
      SurJob.Post;
      SElJob.CancelRange;
      EleJob.First;
      i:=0;
      with EleJob do
      While not eof do
      begin
        f:=t.Fields[t.FieldByName('Naz_prod').Index+EleJobElement.AsInteger];
        if f.AsCurrency<>0 Then
        with SElJob do
        Begin
          inc(i);
          Append;
          SElJobSkladnik.Assign(SurJobSkladnik);
          SElJobElement.Assign(EleJobElement);
          SElJobPozycja.AsString:=Format('%*d',[SElJobPozycja.Size,i]);
          SElJobIlosc.AsCurrency:=f.AsCurrency;
        end;
        Next;
      end;
      SElJob.Post;
      MsgBar.Caption:=SurJobSkladnik.AsString+' '+SurJobNazwa.AsString;
      Application.ProcessMessages;
      if Application.Terminated Then Exit;
      Next;
    end;
  finally
    t.free;
    o.Free;
    baza.Disconnect;
    init.Disconnect;
    OpenDatabases(Self);
    Screen.Cursor:=crDefault;
    TRxSpeedButton(Sender).Down:=False;
    job:=False;
    DBStatusLabel1.Show;
  end;
  BtnReindexClick(Sender);
end;

procedure TMainForm.SpeedBar1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbRight Then SpeedBar1DblClick(Sender);
end;

procedure TMainForm.rOsobyBeforeDelete(DataSet: TDataset);
begin
  DataSet.Edit;
  DataSet.FieldByName('Ile_pos').Clear;
  DataSet.Post;
end;

procedure TMainForm.BtnArchClick(Sender: TObject);
var AFolderName: String;
begin
  AFolderName:=FormStorage1.StoredValues.Values['SavePath'].Value;
  if TRxSpeedButton(Sender).Down and
  (*
  SaveDlg.Execute
  *)

  SelectDirectory(AFolderName, [sdAllowCreate, sdPerformCreate, sdPrompt], 0)

  Then Try
  baza.Disconnect;
  init.Disconnect;
   if (CompareText(RemoveBackSlash(init.ConnectPath),RemoveBackSlash(AFolderName))<>0)
   Then FileExecuteWait('bejkap.bat',AFolderName, init.ConnectPath,esNormal)
   Else FileExecuteWait('bejkap.bat','', init.ConnectPath,esNormal);
   FormStorage1.StoredValues.Values['SavePath'].Value:=AFolderName;
  finally
    OpenDataBases(Self);
    TRxSpeedButton(Sender).down:=False;
  end else TRxSpeedButton(Sender).down:=False;
end;

procedure TMainForm.RelewyBeforeDelete(DataSet: TDataset);
begin
  if RelewyDieta.IsNull
   or (RelewyWART_TOT.AsCurrency<>0)
   or (RelewyDieta.AsString>='0')
     and (RelewyIle_pos.AsCurrency<>0)
   Then FlagiBeforeDelete(DataSet);
end;

procedure TMainForm.SurowceSKLADNIKGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=Sender.AsString;
  if DisplayText Then
    Text:=Text+' '+SurowceNazwa.AsString
              +' [ 1 '+SurowceJmag.AsString+' = '
              +SurowcePrzel.AsString+' '
              +SurowceJedn.AsString+']';
end;
(*
procedure TMainForm.BtnChildClick(Sender: TObject);
begin
  if not (ActiveMDIChild is TChildForm) Then Exit;
  TChildForm(ActiveMDIChild).SpeedBar1.Sections[0].Items[TRxSpeedButton(Sender).Tag-1].ButtonClick;
end;
*)
procedure TMainForm.BtnEditClick(Sender: TObject);
var g: TMdDBGrid;
begin
  if ActiveMDIChild is TChildForm Then
    g:=TChildForm(ActiveMDIChild).MDDBGrid1
  Else if Screen.ActiveControl is TMdDBGrid
  Then g:=TMdDBGrid(Screen.ActiveControl)
  Else Exit;
   g.CanModify:=TRxSpeedButton(Sender).Down;
  if ActiveMDIChild is TChildForm Then
  TChildForm(ActiveMDIChild).BtnEdit.Down:=TRxSpeedButton(Sender).Down;
end;

procedure SetFilter(DataSet: TDataSet; const Text: String);
var b: String;
begin
  if (DataSet.Filter=Text) and DataSet.Filtered
    Then Exit;
  with TADSTable(DataSet) do
  try
    DisableControls;
    try
      b:=AdsExtractKey;
      Filter:=Text;
      if not Filtered Then Filtered:=True;
      AdsSeek(b,stSOFT);
    except
    end;
  finally
    EnableControls;
  end;
end;

procedure FilterActivate(Sender: TDataSet);
var b: String;
begin
  with TADSTable(Sender) do
  if not Filtered then
  try
    if Sender.InheritsFrom(TADSTable)
    Then
    begin
      b:=AdsExtractKey;
      Filtered:=True;
      AdsSeek(b,stSOFT);
    end Else Filtered:=True;
  except
  end;
end;

procedure TMainForm.rSurowcegramGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if (RSurowceIle_pos.AsCurrency<>0) and (RSurowcePrzel.AsCurrency<>0) and (RSurowceIlosc.AsCurrency<>0)
   Then Text:=FloatToStrF(RSurowceIlosc.AsFloat*RSurowcePrzel.AsFloat/RSurowceIle_pos.AsFloat,ffFixed,6,2)
   Else Text:=Sender.AsString;
end;

procedure TMainForm.rSurowcegramSetText(Sender: TField;
  const Text: String);
begin
  RSurowceGram.AsString:=Text;
  if (RSurowceIle_pos.AsCurrency<>0) and
   (RSurowcePrzel.AsCurrency<>0)
  Then begin
     RSurowceIlosc.AsFloat:=RSurowceIle_pos.AsFloat*RSurowceGram.AsFloat/RSurowcePrzel.AsFloat;
     rSurowceCalcFields(rSurowce);
  end;
end;

procedure TMainForm.rSurowceIle_posSetText(Sender: TField;
  const Text: String);
begin
  RSurowceIle_pos.AsString:=Text;
  if (RSurowceIle_pos.AsCurrency<>0)
  and (RSurowcePrzel.AsCurrency<>0)
  Then begin
     rSurowceGramSetText(rSurowceGram,rSurowceGram.Text);
     RSurowceIlosc.AsFloat:=RSurowceIle_pos.AsFloat*RSurowceGram.AsFloat/RSurowcePrzel.AsFloat;
     //rSurowceCalcFields(rSurowce);
  end;
end;

function Round(x: Extended; y: Integer): Currency;
var z: Currency;
begin
//  Set8087CW(Default8087CW);
  z:=intpower(10,Abs(y));
  if x<0 Then z:=-z;
  //Result:=iif(y>=0,Int(x*z+0.5)/z,Int(x/z+0.5)*z);

  if y>=0 Then Result:=Int(x*z+0.5)/z
          Else Result:=Int(x/z+0.5)*z

end;

procedure TMainForm.rSurowceILOSCSetText(Sender: TField;
  const Text: String);
var a: String;
    i: Integer;
    c: Currency;
begin
  if Text='=' Then begin
     a:=rSurowceIl_tot.DisplayText;
     For i:=0 to 2 do
     if a[Length(a)-i]<>'0' Then begin
        c:=Round(rSurowceIl_tot.AsFloat,2-i);
        rSurowceILOSC.AsCurrency:=rSurowceILOSC.AsCurrency+c-rSurowceIl_tot.AsCurrency;
        break;
     end;
  end Else
     rSurowceIlosc.AsCurrency:=rSurowceIlosc.AsCurrency+StrToCurr(Text)-Sender.AsCurrency;
{
  if (RSurowceIle_pos.AsCurrency<>0)
  and (RSurowcePrzel.AsCurrency<>0)
  Then RSurowceGram.AsFloat:=RSurowceIlosc.AsFloat*RSurowcePrzel.AsFloat/RSurowceIle_pos.AsFloat;
}
end;

procedure TMainForm.WindowCloseAllUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=MDIChildCount>0;
end;

procedure TMainForm.BtnIKClick(Sender: TObject);
begin
  if TRxSpeedButton(Sender).Down Then
   TMemoForm1.Create(Application);
  TRxSpeedButton(Sender).Down:=True;
end;

procedure TMainForm.DIETAGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
var i: Integer;
begin
  i:=Pos(Sender.AsString,DietyStr)-1;
  if DisplayText and (i>=0)
  Then Text:=DietyLst[i]
  Else Text:=Sender.AsString;
end;

procedure TMainForm.GRUPAGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
var i: Integer;
begin
  if DisplayText Then Begin
   i:=Pos(Sender.AsString,GrStr)-1;
   if i>=0 Then Text:=GrLst[i];
  end Else
   Text:=Sender.AsString;
end;

procedure TMainForm.BtnDrukClick(Sender: TObject);
begin
  with frReport1 do
  if PrintDlg.Execute Then
  begin
    LoadFromFile(PrintDlg.FileName);
    PrepareReport;
    //PrintPreparedReport('',1,False,frAll);
    ShowPreparedReport;
  end
  else DesignReport;
end;

procedure TMainForm.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if parname='GRSTR' then ParValue:=GrStr
  else if parname='DIETYSTR' then ParValue:=DietyStr
  else if parname='POSSTR' then ParValue:=PosStr
end;

procedure TMainForm.frReport1UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
const wart_odz: array of Extended = (0);
var t: TDataSet;
    d,s: String;
    v: variant;
    l: array of Extended;
    i: Integer;
    r: Extended;
begin
  if name = 'OPEN' then
  begin
    t:=TDataSet(FindComponent(ExtractQuotedString(p1,'''')));
    if t<>nil Then with t do
      if InheritsFrom(TDataSet) and not Active Then Open;
  end else
  if name = 'SEEK' then
  begin
    t:=TDataSet(FindComponent(ExtractQuotedString(p1,'''')));
    if t<>nil Then with TADSTable(t) do begin
      if not InheritsFrom(TADSTable) Then Exit;
      if not Active Then Open;
      d:=frParser.calc(p2);
      val:=ADSSEEK(d,stSOFT);
    end;
  end else
  if name = 'LOCATE' then //dataset ,key fields, key values
  begin
    t:=TDataSet(FindComponent(ExtractQuotedString(p1,'''')));
    if t<>nil Then with TDataSet(t) do begin
      if not Active Then Open;
      d:=frParser.calc(p2);
      v:=frParser.calc(p3);
      val:=Locate(d,v,[loCaseInsensitive, loPartialKey]);
    end;
  end else
  if name = 'GETKEY' then
  begin
    t:=TDataSet(FindComponent(ExtractQuotedString(p1,'''')));
    if t<>nil Then with TADSTable(t) do begin
      if not InheritsFrom(TADSTable) Then Exit;
      if not Active Then Open;
      val:=AdsExtractKey;
    end;
  end else
  if name = 'SETSCOPE' then
  begin
    t:=TDataSet(FindComponent(ExtractQuotedString(p1,'''')));
    if t<>nil Then with TADSTable(t) do begin
      if not InheritsFrom(TADSTable) Then Exit;
      if not Active Then Open;
      ScopeBegin:=frParser.calc(p2);
      ScopeEnd:=frParser.calc(p3);
      Scoped:=True;
    end;
  end else
  if name = 'SETFILTER' then
  begin
    t:=TDataSet(FindComponent(ExtractQuotedString(p1,'''')));
    if t<>nil Then with TADSTable(t) do begin
      if not InheritsFrom(TADSTable) Then Exit;
      if not Active Then Open;
      Filter:=frParser.calc(p2);
      Filtered:=filter<>'';
    end;
  end else
  if name = 'CLRSCOPE' then
  begin
    t:=TDataSet(FindComponent(ExtractQuotedString(frParser.calc(p1),'''')));
    if t<>nil Then with TADSTable(t) do begin
      if not InheritsFrom(TADSTable) Then Exit;
      if not Active Then Open;
      Scoped:=False;
    end;
  end else
  if name = 'POSID' then
  begin
    val:=pos(frParser.calc(p1),PosStr);
  end else
  if name = 'DIND' then
  begin
    val:=dind(frParser.calc(p1),frParser.calc(p2));
  end else
  if name = 'LICZDANIE' then //danie,element,dieta
  begin
    val:=LiczDanie(frParser.calc(p1),frParser.calc(p2),frParser.calc(p3));
  end else
  if name = 'LICZZERO' then
  begin
    EleJob.Open;
    EleJob.CancelRange;
    EleJob.Last;
    SetLength(wart_odz,EleJobElement.AsInteger+1);
    //wart_odz:=VarArrayCreate([0,EleJobElement.AsInteger], varVariant);
    for i:=0 to EleJobElement.AsInteger Do
      wart_odz[i]:=0.0;
    val:=EleJobElement.AsInteger;
  end else
  if name = 'WART_ODZ' then
  begin
    i:=frParser.calc(p1);
    val:=wart_odz[i];
  end else
  if name = 'LICZPOSILEK' then
  begin
    EleJob.Open;
    EleJob.CancelRange;
    EleJob.Last;
    d:='';
    if Length(wart_odz) = EleJobElement.AsInteger+1
    then begin
      r:=0;
      For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do begin
        job:=waga*wart_odz[StrToInt(src)];
        r:=r+job;
      end;
      For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do
        if r=0
           Then wart_odz[StrToInt(dest)]:=0.0
           Else wart_odz[StrToInt(dest)]:=100 * job / r;
          //-------

      For i:=0 To Length(wart_odz)-1 do
         if (wart_odz[i]<>0) and EleJob.FindKey([Format('%*d',[EleJobElement.Size,i])])
            and not EleJobIgnoruj.AsBoolean Then begin
             s:=EleJobNazwa.AsString;
             if EleJobJedn.AsString='%' then
               s:=Format('%-*s: %10.4f %s',[EleJobNazwa.Size,s,wart_odz[i]/wart_odz[0],EleJobJedn.DisplayText])
             else if EleJobJedn.DisplayText<>'' then
               s:=Format('%-*s: %10.4f %s',[EleJobNazwa.Size,s,wart_odz[i],EleJobJedn.DisplayText]);

             if d<>'' Then d:=d+chr(13)+chr(10);
             d:=d+s;
         end;
    end;
    val:=d;
  end else
  if name = 'LICZDANIEMEMO' then //danie,dieta
  begin
    EleJob.Open;
    SElJob.Open;
    ESuJob.Open;
    SurJob.Open;
    DSuJob.Open;
    DanJob.IndexFieldNames:='DANIE';
    DanJob.Open;
    EleJob.CancelRange;
    EleJob.Last;
    SetLength(l,EleJobElement.AsInteger+1);
    for i:=0 to Length(l)-1 Do l[i]:=0.0;
    SElJob.CancelRange;
    ESuJob.CancelRange;
    SurJob.CancelRange;
    DSuJob.CancelRange;
    DanJob.CancelRange;
    DanJob.FindKey([frParser.calc(p1)]);
    IntLiczDanie(frParser.calc(p2),l,nil);

    r:=0;
    For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do begin
      job:=waga*l[StrToInt(src)];
      r:=r+job;
    end;
    For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do
      if r=0
         Then l[StrToInt(dest)]:=0.0
         Else l[StrToInt(dest)]:=100 * job / r;
        //-------


    d:='';
    For i:=1 To Length(l)-1 do
       if (l[i]<>0) and EleJob.FindKey([Format('%*d',[EleJobElement.Size,i])])
          and not EleJobIgnoruj.AsBoolean Then begin
             s:=EleJobNazwa.AsString;
             if EleJobJedn.AsString='%' then
               s:=Format('%-*s: %10.4f %s',[EleJobNazwa.Size,s,l[i]/l[0],EleJobJedn.DisplayText])
             else if EleJobJedn.DisplayText<>'' then
               s:=Format('%-*s: %10.4f %s',[EleJobNazwa.Size,s,l[i],EleJobJedn.DisplayText]);

             if d<>'' Then d:=d+chr(13)+chr(10);
             d:=d+s;
       end;

    val:=d;
    if Length(wart_odz) = Length(l) then
      for i:=0 to Length(l)-1 Do wart_odz[i]:=l[i]+wart_odz[i];
  end;
end;

procedure TMainForm.BtnCloseAllClick(Sender: TObject);
var i: Integer;
begin
  For i:=MDIChildCount-1 downto 0
  do MDIChildren[i].close;
end;

procedure TMainForm.EditSelectAll1Update(Sender: TObject);
begin
  if Screen.ActiveControl=nil Then
      TCustomAction(Sender).Enabled:=False
  else if Screen.ActiveControl.InheritsFrom(TCustomEdit)
  or Screen.ActiveControl.InheritsFrom(TCustomDBGrid) Then
      TCustomAction(Sender).Enabled:=True
  else TCustomAction(Sender).Enabled:=False;
end;

procedure TMainForm.EditPaste1Update(Sender: TObject);
begin
  if Screen.ActiveControl=nil Then
      TCustomAction(Sender).Enabled:=False
  else if Screen.ActiveControl.InheritsFrom(TCustomEdit) Then
      TCustomAction(Sender).Enabled:=Clipboard.HasFormat(CF_TEXT)
  else if Screen.ActiveControl.InheritsFrom(TCustomDBGrid) Then
    with TCustomDBGrid(Screen.ActiveControl) do
    begin
      TCustomAction(Sender).Enabled:=DataSource.DataSet.CanModify
      and Clipboard.HasFormat(CF_TEXT)
    end
  else TCustomAction(Sender).Enabled:=False;
end;

procedure TMainForm.EditCopy1Update(Sender: TObject);
begin
  if Screen.ActiveControl=nil Then
     TCustomAction(Sender).Enabled:=False
  else if Screen.ActiveControl.InheritsFrom(TCustomEdit) Then
  with TCustomEdit(Screen.ActiveControl) do
    TCustomAction(Sender).Enabled:=(SelLength>0)
  else if Screen.ActiveControl.InheritsFrom(TCustomDBGrid) Then
    with TRxDBGrid(Screen.ActiveControl) do
      TCustomAction(Sender).Enabled:= (InplaceEditor=nil) or (InplaceEditor.SelLength>0)
  else TCustomAction(Sender).Enabled:=False;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var t: string;
begin
  GetDir(0,t);
  t:=RemoveBackSlash(ExpandUNCFileName(t));
  FormStorage1.IniFileName:=t+'\dietaw.ini';
end;

procedure TMainForm.BtnOdtwClick(Sender: TObject);
var AFolderName: String;
begin
  AFolderName:=FormStorage1.StoredValues.Values['SavePath'].Value;
  if TRxSpeedButton(Sender).Down and
  SelectDirectory(AFolderName, [sdAllowCreate, sdPerformCreate, sdPrompt], 0)
  Then Try
  baza.Disconnect;
  init.Disconnect;
   if (CompareText(RemoveBackSlash(init.ConnectPath),RemoveBackSlash(AFolderName))<>0)
   Then FileExecuteWait('odtworz.bat',AFolderName, init.ConnectPath,esNormal)
   Else FileExecuteWait('odtworz.bat','', init.ConnectPath,esNormal);
   FormStorage1.StoredValues.Values['SavePath'].Value:=AFolderName;
  finally
    OpenDataBases(Self);
    TRxSpeedButton(Sender).down:=False;
  end else TRxSpeedButton(Sender).down:=False;
end;

procedure TMainForm.FormStorage1RestorePlacement(Sender: TObject);
var s,t: String;
    i,j: Integer;
    v:   Variant;

  procedure setv(s: string; t: Variant);
  begin
    v:=FormStorage1.StoredValue[s];
    if v=null Then FormStorage1.StoredValue[s]:=t;
  end;

begin
  if WindowState=wsMinimized Then WindowState:=wsNormal;
  {if (WindowState=wsMaximized)
  Then begin
      Left:=0;
      Top:=0;
      Height:=Screen.Height;
      Width:=Screen.Width;
  end;}

  for i:=1 To ParamCount do
  begin
    s:=ParamStr(i);
    j:=pos('=',s);
    if j=0 Then Continue;
    t:=copy(s,j+1,maxint);
    s:=copy(s,1,j-1);
    FormStorage1.StoredValue[s]:=t;
  end;

  grex:=FormStorage1.StoredValue['GrEx'];

  s:='DIETADEF';
  s:=RemoveBackSlash((GetEnvVar(s)));
  if (s<>'') and  DirExists(s+'\ROBOCZY')
    Then FormStorage1.StoredValue['defa']:=s;

  GetDir(0,s);
  s:=RemoveBackSlash(s);

  t:=FormStorage1.StoredValue['defa'];
  if t='' Then begin
     t:=s;
     FormStorage1.StoredValue['defa']:=t;
  end;

  s:=FormStorage1.StoredValue['path'];
  if s='' Then begin
    s:=t;
    FormStorage1.StoredValue['path']:=s;
  end;

  if FileExists(t+'\ROBOCZY\Roboczy.add')
    Then baza.ConnectPath:=t+'\ROBOCZY\Roboczy.add'
    Else if FileExists(t)
       Then baza.ConnectPath:=t
       Else baza.ConnectPath:=t+'\ROBOCZY';


  s:='MAGDEF';
  t:=RemoveBackSlash(GetEnvVar(s));
  if (t<>'') and  DirExists(t+'\ROBOCZY')
  Then setv(s,t);

  t:=ExpandUNCFileName(FormStorage1.StoredValue['defa']+'\..\MAGAZYN');
  if (t<>'') and  DirExists(t+'\ROBOCZY')
  Then setv(s,t);

  t:=FormStorage1.StoredValue['path'];
  init.ConnectPath:=t;
  for i:=1 to WordCount(t,[';']) do begin
     s:=RemoveBackSlash(ExtractWord(i,t,[';']));
     if FileExists(s+'\Dieta.add')
     Then begin
       init.ConnectPath:=s+'\Dieta.add';
       break;
     end Else if FileExists(s)
       Then begin
          init.ConnectPath:=s;
          break
       end;
  end;

  s:='magazyn';
  t:=' 1';
  setv(s,t);

  s:='zlecenie';
  t:='W';
  setv(s,t);

  t:=GetTablePath(dania);
  if FileExists(ChangeFileExt(t,'.fpt'))
   Then FormStorage1.StoredValue['CDX']:=True
  else if FileExists(ChangeFileExt(t,'.dbt'))
   Then FormStorage1.StoredValue['CDX']:=False
end;

procedure TMainForm.BtndSurowceClick(Sender: TObject);
begin
   ChildClick(Sender,TdSurowceForm);
end;

procedure TMainForm.BtnsElementyClick(Sender: TObject);
begin
   ChildClick(Sender,TsElementyForm);
end;

procedure TMainForm.RelewyDATAGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if DisplayText Then Text:=Sender.AsString+' '+RelewyPosilek.DisplayText+' '+RelewyDieta.AsString
  else Text:=Sender.AsString;
end;

procedure Flaga(DS, D: TDataSet; f: TField);
var     b: Boolean;
        j: Integer;
begin
    with TAdsTable(D) do begin
          Open;
          CancelRange;
          SetKey;
          For J:=0 To FieldCount-1 do with Fields[j] do
            if Visible Then Break else Assign(DS.FieldByName(FieldName));
          GotoNearest;
          b:=True;

          For J:=0 To FieldCount-1 do with Fields[j] do
            if not b or Visible Then Break
            else b:=(AsString=DS.FieldByName(FieldName).AsString);

          if b Then f.AsString:=f.AsString+Name[2]

    end;
end;

procedure TMainForm.FlagiCalcFields(DataSet: TDataset);
var i: Integer;
    f: TField;
begin
   f:=DataSet.FieldByName('Flagi');
   if f<>nil Then With TADSDataset(DataSet).AdsConnection do
   begin
     f.Clear;
     For i:=0 To DataSetCount-1 do
       with TAdsTable(DataSets[i]) do
       if (Name[1]=DataSet.Name[1])
        and (Name[2]<'a')
        and (Name[4]='J')
       then Flaga(DataSet,DataSets[i],f)
   end;
end;

procedure TMainForm.rOsobyCalcFields(DataSet: TDataSet);
begin
  with TAdsTable(DataSet) do begin
    if GREX
     Then FieldValues['Cena']:=RelJob.Lookup('DATA;POSILEK;DIETA',VarArrayOf([FieldValues['Data'],FieldValues['Posilek'],FieldValues['Dieta']+'/'+FieldValues['Grupa']]),'Cena')
     Else FieldValues['Cena']:=RelJob.Lookup('DATA;POSILEK;DIETA',VarArrayOf([FieldValues['Data'],FieldValues['Posilek'],FieldValues['Dieta']]),'Cena');
    FieldByName('Wartosc').AsFloat:=FieldByName('Cena').AsFloat*FieldByName('Ile_pos').AsFloat;
  end;
end;

procedure TMainForm.IntLiczDanie(di: String; var list: Array of Extended; memo: TStrings);
var i,j: Integer;
    r,s: Extended;
    t: String;
begin
  with MainForm,DSuJob do
  begin
    if memo<>nil then
    begin
      Memo.Add('Danie: '+DanJobNazwa.AsString+' '+DanJobGramatura.AsString+' '+DanJobJedn.AsString);
      if grex
         Then Memo.Add('Dieta: '+di)
         Else Memo.Add('Dieta: '+DietyLst[Pos(di,DietyStr)-1]);
      Memo.Add('');
    end;
    SetRange([DanJobDanie.Value],[DanJobDanie.Value]);
    First;
    i:=0;
    While not eof do
    begin
      with SElJob do
      if dind(di,DSuJobDieta.AsString)
          and SurJob.FindKey([DSuJobSkladnik.Value])
          and (SurJobGram.AsFloat<>0) then
      begin
        inc(i);
        if memo<>nil then
         Memo.Add(format('%3d',[i])+'. '
          +Format('%-*s',[SurJobNazwa.Size,SurJobNazwa.AsString])
          +Format('%8.2f',[DSuJobIlosc.AsFloat])+' '+Trim(SurJobJedn.AsString));
        SetRange([DSuJobSkladnik.Value],[DSuJobSkladnik.Value]);
        First;
        //base for % calc
        List[0]:=List[0]+DSuJobIlosc.AsFloat/SurJobGram.AsFloat;
        While not eof do
        begin
          //EleJob.FindKey([SelJobElement.Value]);
          //if not EleJobIgnoruj.AsBoolean Then begin
            j:=SelJobElement.AsInteger;
            if j>0 Then
              List[j]:=List[j]+SElJobIlosc.AsFloat*DSuJobIlosc.AsFloat/SurJobGram.AsFloat;
          //end;
          Next;
        end;
      end;
      Next;
    end;
    if memo<>nil then
     Memo.Add('');
  end;
end;

function TMainForm.liczDanie(Danie, Element, dieta: String): Extended;
var a,b,r: Extended;
    i,j: Integer;
  function Licz(Danie, Element, dieta: String): Extended;
  begin
    Result:=0;
    with DSuJob do begin
      SetRange([Danie],[Danie]);
      First;
      while not eof do begin
        if dind(Dieta,DSuJobDieta.AsString)
          and SurJob.FindKey([DSuJobSkladnik.AsString])
          and (SurJobGram.AsFloat<>0.0)
        then
          if Element='' then Result:=Result+DSuJobIlosc.AsFloat/SurJobGram.AsFloat
          else if ESuJob.FindKey([Element,DSuJobSkladnik.AsString])
            then Result:=Result+ESuJobIlosc.AsFloat*DSuJobIlosc.AsFloat/SurJobGram.AsFloat;
        Next;
      end;
    end;
  end;
begin
    Result:=0;
    DSuJob.Open;
    SurJob.Open;
    SurJob.CancelRange;
    ESuJob.Open;
    ESuJob.CancelRange;
    EleJob.Open;
    ESuJob.CancelRange;
    EleJob.FindKey([Element]);
    if EleJobJedn.AsString='%'
    then begin
      Result:=Licz(Danie,Element,dieta);
      if Result<>0 Then Result:=Result/Licz(Danie,'',dieta)
    end else if Copy(EleJobJedn.AsString,1,1)='%' then begin
      r:=0;
      j:=-1;
      For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do begin
        if dest=Element Then j:=i;
        job:=waga*Licz(Danie,src,dieta);
        r:=r+job;
      end;
      if (r<>0) and (j<>-1)
         Then Result:=100 * aProcEn[j].Job / r;
    end Else Result:=Licz(Danie, Element, dieta);
end;

procedure TMainForm.eRelewyCalcFields(DataSet: TDataSet);
var i,j: Integer;
    r: Extended;
function licz(Element: string): Extended;
var a,b,r: Extended;
begin
    Result:=0;
    r:=0;
    if pos('S',eRelewyFlagi.AsString)>0 Then
    with RSuJob do begin
       Open;
       SetRange([eRelewyData.Value,eRelewyPosilek.Value],[eRelewyData.Value,eRelewyPosilek.Value]);
       First;
       while not eof do begin
          if (RSuJobIle_pos.AsFloat<>0) and dind(eRelewyDieta.AsString,RSuJobDieta.AsString)
             and SurJob.FindKey([RSuJobSkladnik.AsString])
             and (SurJobGram.AsFloat<>0.0)
             then begin
                if Element='' then Result:=Result+RSuJobIlosc.AsFloat*SurJobPrzel.AsFloat/SurJobGram.AsFloat/RSuJobIle_pos.AsFloat
                else if ESuJob.FindKey([Element,RSuJobSkladnik.AsString])
                  then Result:=Result+ESuJobIlosc.AsFloat*RSuJobIlosc.AsFloat*SurJobPrzel.AsFloat/SurJobGram.AsFloat/RSuJobIle_pos.AsFloat;
             end;
          Next;
       end;
    end else with RDaJob do begin
       Open;
       SetRange([eRelewyData.Value,eRelewyPosilek.Value],[eRelewyData.Value,eRelewyPosilek.Value]);
       First;
       while not eof do begin
          if dind(eRelewyDieta.AsString,RDaJobDieta.AsString)
          Then with DSuJob do begin
            SetRange([RDaJobDanie.Value],[RDaJobDanie.Value]);
            First;
            while not eof do begin
              if dind(eRelewyDieta.AsString,DSuJobDieta.AsString)
                and SurJob.FindKey([DSuJobSkladnik.AsString])
                and (SurJobGram.AsFloat<>0.0) then begin
                  if Element='' then Result:=Result+DSuJobIlosc.AsFloat/SurJobGram.AsFloat
                  else if ESuJob.FindKey([Element,RSuJobSkladnik.AsString])
                     then Result:=Result+ESuJobIlosc.AsFloat*DSuJobIlosc.AsFloat/SurJobGram.AsFloat;
              end;
              Next;
            end;
          end;
          Next;
       end;
    end;
end;

begin
    if eRelewyIle_pos.AsFloat<>0 Then
      eRelewyCena.AsFloat:=eRelewyD_WARTOSC.AsFloat/eRelewyIle_pos.AsFloat;
    eRelewyJedn.AsString:=ElementyJedn.DisplayText;
    eRelewyElement.AsString:=ElementyElement.AsString;
    if  (eRelewyDieta.AsString<'0') or grex and (
      (copy(eRelewyDieta.AsString,2,1)<>'/')
      or (copy(eRelewyDieta.AsString,3,1)<'0')
      or (copy(eRelewyDieta.AsString,4,maxint)<>'')
      ) or not grex and (copy(eRelewyDieta.AsString,2,maxint)<>'') Then Exit;
    Flaga(DataSet,RSuJob,eRelewyFlagi);
    Flaga(DataSet,RDaJob,eRelewyFlagi);
    if eRelewyFlagi.isNull Then Exit;
    DSuJob.Open;
    SurJob.Open;
    SurJob.CancelRange;
    ESuJob.Open;
    ESuJob.CancelRange;

    if ElementyJedn.AsString='%' then begin
      eRelewyIlosc.AsFloat:=Licz(eRelewyElement.AsString);
      if eRelewyIlosc.AsFloat<>0 Then
         eRelewyIlosc.AsFloat:=eRelewyIlosc.AsFloat/Licz('');
    end else if eRelewyJedn.AsString='%' then begin
      r:=0;
      j:=-1;
      For i:=0 To Length(aProcEn)-1 do with aProcEn[i] do begin
        if dest=eRelewyElement.AsString Then j:=i;
        job:=waga*Licz(src);
        r:=r+job;
      end;
      if (r<>0) and (j<>-1)
         Then eRelewyIlosc.AsFloat:=100 * aProcEn[j].Job / r;
    end Else eRelewyIlosc.AsFloat:=Licz(eRelewyElement.AsString);

end;

procedure TMainForm.DSElementyDataChange(Sender: TObject; Field: TField);
begin
  if eRelewy.Active Then eRelewy.Refresh;
  if Dania.Active Then Dania.Refresh;
end;


procedure TMainForm.DaniaCalcFields(DataSet: TDataSet);
begin
  FlagiCalcFields(DataSet);
  if Pos('S',DaniaFlagi.AsString)=0 Then Exit;
    DaniaEjm.AsString:=ElementyJedn.DisplayText;
    DaniaIlosc.AsFloat:=LiczDanie(DaniaDanie.AsString,ElementyElement.AsString,FormStorage1.StoredValue['EleDieta']);
end;

procedure TMainForm.BtnDaniaClick(Sender: TObject);
begin
   ChildClick(Sender,TDaniaForm);
end;

procedure TMainForm.rXBeforeEdit(DS: TDataSet);
begin
  if TAdsTable(dS).MasterSource=nil Then Exit;
  with TAdsTable(dS).MasterSource, TAdsTable(DataSet) do
  begin
    if (State=dsInsert) or Modified Then Post;
      //locate('data;posilek;dieta',VarArrayOf([DataSet['data'],DataSet['posilek'],'']),[]);
      FindKey([DataSet['data'],DataSet['posilek'],'']);
      Edit;
  end;
end;

procedure TMainForm.rSurowceBeforeOpen(DataSet: TDataSet);
begin
  TableBeforeOpen(DataSet);
  With RSurowceDanie do if Calculated
    Then Visible:=False;
end;

procedure TMainForm.rDaniaile_posGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if DisplayText
     Then Text:=Sender.DataSet.FieldByName('ile_p').DisplayText
     Else Text:=Sender.DataSet.FieldByName('ile_p').Text;
end;

procedure TMainForm.rDaniaile_posSetText(Sender: TField;
  const Text: String);
var c: Currency;
begin
  try
    c:=StrToCurr(Text);
  except
    c:=0;
  end;
  if (c=0) or (Sender.DataSet.FieldByName('ile_p').AsCurrency=c)
     Then Sender.Clear
     Else Sender.AsCurrency:=c;
end;

procedure TMainForm.rSurowceDANIESetText(Sender: TField;
  const Text: String);
var c:string;
begin
  c:=UpperCase(Text);
  DanJob.IndexFieldNames:='DANIE';
  DanJob.Open;
  if (c<>'') and not DanJob.FindKey([c]) then begin
    RDaJob.Open;
    c:=TrimRight(c);
    if RDaJob.FindKey([rSurowceData.Value,rSurowcePosilek.Value,c]) Then begin
       if (RDaJobIle_Pos.FieldKind=fkData) and (RDaJobIle_Pos.AsCurrency<>0)
         Then c:=RDaJobPozycja.AsString
         Else c:=RDaJobDanie.AsString;
    end else begin
       if text[1]>'@' Then begin
          DanieSetText(Sender,c);
          Exit;
       end;
       if rDania.Tag<>0 Then With TChildForm(rDania.Tag), MdDBGrid1 do
       begin
         Klucz:='';
         FilterDeactivate(rDania);
         If BtnLink.Down Then BtnLink.ButtonClick;
         Application.ProcessMessages;
       end;
       //rDania.Open;
       with TChildForm.Create2(Application,rDania) do
       try
     RxDBComboEdit1.Visible:=False;
     RxDBLookupCombo1.Visible:=False;
       rDania.IndexFieldNames:='Data;Posilek;Pozycja';
       rDania.FindKey([rSurowceData.Value,rSurowcePosilek.Value]);
       MdDbGrid1.SelectedField:=rDaniaPOZYCJA;
     MdDbGrid1.CanUseIndex:=True;
     MdDBGrid1.TitleButtons:=True;
     MdDbGrid1.Klucz:=c;

     Caption:='Brak takiej pozycji: '+Text;

     if showmodal=mrOK Then begin
        if (rDaniaIle_Pos.FieldKind=fkData) and (rDaniaIle_Pos.AsCurrency<>0)
         Then c:=rDaniaPozycja.AsString
         Else c:=rDaniaDANIE.AsString;
     end Else begin
       MsgBar.Caption:='Brak takiej pozycji: '+Text;
       MessageBeep(MB_ICONHAND);
       Abort;
     end;
   finally
     Release;
     rDania.CancelRange;
   end;
  end;
  end;
  Sender.AsString:=c;
end;

procedure TMainForm.ElementyJEDNGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  //is Sender.IsNull Then Exit;
  Text:=Sender.AsString;
  if DisplayText and (Length(Text)>1) and (Text[1]='%') Then SetLength(Text,1);
end;

end.
