unit viewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Printers, Buttons;

type
  Tview = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    TrackBar1: TTrackBar;
    PrintDialog1: TPrintDialog;
    UpDown1: TUpDown;
    BitBtn1: TBitBtn;
    procedure TrackBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  view: Tview;
  canv: TCanvas;
  pdraw: procedure;
  isprinter: boolean;

implementation

{$R *.DFM}

procedure Tview.TrackBar1Change(Sender: TObject);
begin
    canv.FillRect(canv.ClipRect);
    Self.pixelsperinch:=96 * TrackBar1.Position div 10;
    with Image1 do begin
      clientheight:= Self.pixelsperinch * 29725 div 2540;
         //Round(printer.PageHeight * Self.pixelsperinch / getdevicecaps(Printer.handle,LOGPIXELSY));
      clientwidth := Self.pixelsperinch * 2101875 div 254000;
          //Round(printer.PageWidth * Self.pixelsperinch / getdevicecaps(Printer.handle,LOGPIXELSX));
      picture.bitmap.height:=clientheight;
      picture.bitmap.width:=clientwidth;
      Canvas.Font.PixelsPerInch:=Self.pixelsperinch;
    end;
    pDraw;
end;

procedure Tview.Button1Click(Sender: TObject);
begin
  if PrintDialog1.Execute then begin
    Tag:=0;
    isprinter:=True;
    canv:=Printer.Canvas;
    canv.font.pixelsperinch:=getdevicecaps(Printer.handle,LOGPIXELSX);
    pDraw;
  end;
end;

procedure Tview.FormShow(Sender: TObject);
begin
  pDraw;
end;

procedure Tview.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  If Tag=UpDown1.Position Then Exit;
  Tag:=UpDown1.Position;
  pDraw;
end;

end.
