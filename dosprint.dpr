{  Esc(sFONTNAME@  - nazwa fontu}
program dosprint;
{$APPTYPE CONSOLE}
uses
  printers,
  sysutils,
  windows,
  forms,
  graphics,
  controls,
  extctrls,
  classes,
  viewer in 'viewer.pas' {view};

var fname, s: string;
    d: longint;
    start: boolean;

procedure draw;
var fh: file of Char;
    fp,ff: string;
    dp, np, lpifix, pcl: boolean;
    n, lField, tField, dw, strona: Word;
    k: Char;
    l,lpi, cond, cpi: Real;
    push: tPoint;
    palette, a, ds: ShortInt;
    e,f: Longint;
    Metrics: TTextMetric;
    fs: TFontStyles;
    ap: array [1..512] of Integer;
    pap: pInteger;
    w: WideString;
    sz: TSize;

function CharHeight: Word;
begin
    Result := Round(canv.font.pixelsperinch / lpi);
end;

function CharWidthR: Real;
begin
    if start and dp Then begin
      //fs:=Canv.Font.Style;
      //if not dp then Canv.Font.Style:=fs-[fsBold,fsItalic];
      GetTextMetrics(Canv.Handle, Metrics);
      //Canv.Font.Style:=fs;
      Result := Metrics.tmAveCharWidth;
    end
    else Result:= Canv.Font.Pixelsperinch * cond / 120 * dw / cpi;
end;

function StringWidth(l: Integer): Word;
var p,i: Word;
begin
  if dp
   then Result:=Round(CharWidthR * abs(l))
   else begin
     Result:=0;
     p:=Round((canv.PenPos.X-lfield) / CharWidthR);
     if l>0
      then for i:=p+1 to p+l do inc(Result,ap[i])
      else for i:=p downto p+l+1 do inc(Result,ap[i]);
   end;
end;

function CharWidth: Word;
begin
   Result:=StringWidth(1);
end;


procedure setlpi;
begin
 GetTextMetrics(Canv.Handle, Metrics);
 lpi := canv.font.pixelsperinch / Metrics.tmHeight;
 lpi:=lpi*dw; //podw¢jna wysoko˜† na drukarce Epson
 if lpi>6.4 then lpi:=6.4;
end;

function checkstart: Boolean;
begin
  Result:= False;
  with Canv do begin
       if not start then begin
         if isprinter then begin
            Printer.BeginDoc;
         end;
         SetBkMode( canv.handle, TRANSPARENT );
         //SetTextAlign(canv.handle, TA_BASELINE or TA_LEFT or TA_NOUPDATECP);
         if not lpifix then setlpi;
         MoveTo(lfield,tfield);
         inc(strona);
       end else if np Then begin
         if isprinter then begin
            Printer.NewPage;
         end else begin
            if strona=View.Tag
              Then Exit;
            FillRect(ClipRect);
         end;
         MoveTo(lfield,tfield);
         inc(strona);
       end;
       start := true;
       np:=False;
  end;
  Result:=True;
end;

function readval: Real;
var d: Char;
begin
  Result:=0;
  s:='';
  read(fh,k);
  if eof(fh) or (k='@') Then Exit;
  if k in ['A'..'Z','a'..'z'] Then
     repeat
        s:=s+k;
        read(fh,k);
     until eof(fh) or (k='@')
  else begin
     repeat
        s:=s+k;
        read(fh,k);
     until eof(fh) or (k in ['@'..'Z','a'..'z']);
     d:=DecimalSeparator;
     DecimalSeparator:='.';
     try
       Result:=strtofloat(s);
     Finally
       DecimalSeparator:=d;
     end;
  end;
end;

procedure setsize;
var l: Real;
    i,g: Integer;
begin

  canv.Font.Height:= Round(cond / cpi * dw * canv.Font.PixelsPerInch ) div 72;

  if not dp then begin
    l:=CharWidthR;
    g:=0;
    for i:=1 to 512 do begin
      ap[i]:=Round(l*i-g);
      g:=g+ap[i];
    end;
  end;

  if start and not lpifix then begin
    l:=lpi;
    setlpi;
    if lpi>l Then lpi:=l;
  end;
end;

begin
 start := false;
 strona := 0;
 lfield := 0;
 tfield := 0;
 dw := 1;
 dp:=False; //proportional
 np:=False; //new page
 ds:=0; //superscript
 cpi:=10;
 cond:=120;
 palette:=-4;
 lpifix:= False;
 lpi:=99;
 pcl:=True; //EscE - reset

// writeln('Drukowanie na: ',Printer.Printers[Printer.PrinterIndex]);

 canv.CopyMode:=cmNotSrcErase;
 //SetBkMode( canv.handle, TRANSPARENT );
 //SetTextAlign(canv.handle, TA_BASELINE or TA_LEFT or TA_NOUPDATECP);

 ff:='Lucida Console'; //'Consolas';//'Courier New';
 fp:='Verdana'; //'Tahoma'; //'Trebuchet MS'; //'Verdana';//'Times New Roman';

 with canv.font do begin
{$ifndef UTF8}
   charset := OEM_CHARSET;
{$endif}
   name := ff;
 end;

 setsize;

 if isprinter
  then BEGIN
    Printer.orientation := poPortrait;
    printer.title := 'Dos '+fname
  END else begin
     view.caption :=' Dos '+fname;
     canv.FillRect(canv.ClipRect);
  end;

 AssignFile(fh,fname);
 reset(fh);
 s:='';
 while (not eof(fh) or (s<>'')) and not (isprinter and Printer.Aborted) do with canv do begin;
     read(fh,k); //eof -> #26 #$1A
     if k in [#33..#255] -
{$ifdef UTF8}
     ['_','|',#$e2] //#$e2#$94#$82 'â”‚'
{$else}
     ['_','|',#$b3] //#$b3 '³'
{$endif}
     Then begin
        s:=s+k;
        if not eof(fh) Then Continue;
     end;
     if s<>'' Then begin
         if not checkstart Then Break;
         n:=Length(s);
{$ifdef UTF8}
         n:=MultiByteToWideChar(CP_UTF8,MB_PRECOMPOSED,PAnsiChar(s),n+1,nil,0)-1;
         if n>Length(w) then
            SetLength(w,n);
         MultiByteToWideChar(CP_UTF8,MB_PRECOMPOSED,PAnsiChar(s),Length(s)+1,PWideChar(w),n+1);
{$endif}
         fs:=Font.Style;
         if ds=0 Then // sup/super script
            Font.Style := fs - [fsUnderline]
         else
            Font.Height:= Round(cond / cpi * dw * canv.Font.PixelsPerInch / 108); //72* 3/2
         //pap:=nil;{
         if dp Then
            pap:=nil
         else begin
            pap:=@ap;
            inc(pap,Round((PenPos.X-lfield) / CharWidthR));
         end;

         d:=PenPos.X;
         e:=PenPos.Y;
         GetTextMetrics(Handle, Metrics);
         case ds of
          -1: f := Round(Font.PixelsPerInch / lpi ) - Metrics.tmAscent; //subscript
           1: f := 0; //superscript
         else
           f := Round( 72 / 96 * Canv.Font.PixelsPerInch / lpi ) - Metrics.tmAscent;
         end;
         if e+f<0
              Then f:=-e;
{$ifdef UTF8}
         Windows.ExtTextOutW(handle,d,e + f , 0, nil ,PWideChar(w), n, pap);
         if dp then begin
            sz.cX := 0;
            sz.cY := 0;
            Windows.GetTextExtentPoint32W(Handle, PWideChar(w), n, sz);
            MoveTo(d+sz.cx,e)
         end
{$else}
         Windows.ExtTextOut(handle,d,e + f , 0, nil, PChar(s), n, pap);
         if dp then MoveTo(d+TextWidth(s),e)
{$endif}
         else MoveTo(d+StringWidth(n),e);
         if (ds=0) then begin
           if (fsUnderline in fs) then begin
                     e:=PenPos.X;
                     n:=80 * CharHeight div 96;
                     Pen.Width:=4 * CharHeight div 96;
                     MoveTo(d,PenPos.Y + n);
                     LineTo(e,PenPos.Y);
                     MoveTo(PenPos.X ,PenPos.Y - n);
                     Font.Style := fs;
           end;
         end else Font.Height:= Round(cond / cpi * dw * canv.Font.PixelsPerInch ) div 72;
       s:='';
     end;
     case k of
          #8 {BS}: begin
                  if not checkstart Then Break;
                  MoveTo(PenPos.X - StringWidth(-1) ,PenPos.Y);
               end;
          #9 {HT}: begin
                  if not checkstart Then Break;
                  n:=Round((PenPos.X-lfield) / CharWidthR) div 8 +1;
                  n:=n* 8; // * CharWidth + lfield;
                  if fsUnderline in Font.Style then begin
                     d:=80 * CharHeight div 96;
                     Pen.Width:=4 * CharHeight div 96;
                     MoveTo(PenPos.X ,PenPos.Y + d);
                     LineTo(Round(n * CharWidthR) + lfield,PenPos.Y);
                     MoveTo(PenPos.X ,PenPos.Y - d);
                  end;
                  MoveTo(lfield ,PenPos.Y);
                  MoveTo(StringWidth(n)+ lfield,PenPos.Y);
               end;
          #10 {LF}: if not np then begin
                  if not checkstart Then Break;
                  if not lpifix then setlpi;
                  if (PenPos.Y+2*CharHeight>canv.ClipRect.Bottom) //PageHeight
                   Then np:=True
                   else MoveTo(lfield,PenPos.Y+CharHeight);
               end;
          #12 {FF}: begin
                  if np and not checkstart Then Break;
                  if start and not lpifix then setlpi;
                  np:=True;
               end;
          #13 {CR}: if not np then begin
                  if not checkstart Then Break;
                  MoveTo(lfield,PenPos.Y);
               end;
          #15 {SI}: begin
                  pcl:=False;
                  cond:=72;
                  setsize;
               end;
          #18: begin
                  pcl:=False;
                  cond:=120;
                  setsize;
               end;
          #26 : if eof(fh) then Break;
          #27 : begin
                 read(fh,k);
                 case k of
                 '*': begin
                         pcl:=True;
                         read(fh,k);
                         case k of
                           'r': repeat
                                  a:=Round(readval);
                                  case UpCase(k) of
                                    'U': palette:=a
                                  end;
                                until k in ['@'..'Z'];
                           'v': repeat
                                  d:=Round(readval);
                                  case UpCase(k) of
                                    'B': Brush.Color:=d;
                                    'P': Brush.Style:=TBrushStyle(d);
                                    'C': begin
                                         Font.Color:=d;
                                         Pen.Color:=d;
                                         end;
                                    'S': begin
                                            a:=d;
                                            d:=$FF;
                                            e:=0;
                                            if abs(palette)=4 then begin
                                               if (a and 1)<>0
                                                Then a:=3
                                                else a:=a shr 1;
                                            end;
                                            while a<>0 do begin
                                               if (a and 1)<>0
                                                Then e:=e or d;
                                               d:=d shl 8;
                                               a:=a shr 1;
                                            end;
                                            if palette<0 Then e:=not e;
                                            Font.Color:=e;
                                            Pen.Color:=e;
                                         end;
                                  end;
                                until k in ['@'..'Z'];
                         else repeat
                                  readval;
                                until k in ['@'..'Z'];
                         end;
                         s:='';
                      end;
                 '&': begin
                         pcl:=True;
                         read(fh,k);
                         case k of
                           'a': repeat
                                  l:=readval;
                                  case UpCase(k) of
                                    'L': begin
                                            n:=lField;
                                            lField:=Round(l*CharWidthR);
                                            if start and (n=PenPos.X) Then MoveTo(lField,PenPos.Y);
                                         end;
                                    'R': begin
                                           MoveTo(PenPos.X,Round(l))
                                         end;
                                    'V': begin
                                           MoveTo(PenPos.X,Round(l*font.pixelsperinch /120))
                                         end;
                                    'C': begin
                                           MoveTo(Round(l*font.pixelsperinch / 25),PenPos.Y)
                                         end;
                                    'H': begin
                                           MoveTo(Round(l*font.pixelsperinch /120),PenPos.Y)
                                         end;
                                  end;
                                until k in ['@'..'Z'];
                           'd': repeat
                                  n:=Round(readval);
                                  case UpCase(k) of
                                    '@': begin
                                         Font.Style:=Font.Style-[fsUnderline,fsStrikeout];
                                        end;
                                    'D': case n of
                                          0,1: begin
                                              Font.Style:=Font.Style+[fsUnderline];
                                            end;
                                          3: Font.Style:=Font.Style+[fsStrikeout];
                                        else begin
                                            Font.Style:=Font.Style-[fsUnderline,fsStrikeout];
                                          end;
                                        end;
                                  end;
                                until k in ['@'..'Z'];
                           'f': repeat
                                  l:=readval;
                                  case UpCase(k) of
                                    'S': begin
                                           if l=0 Then push:=PenPos
                                           else MoveTo(push.X,push.Y)
                                         end;
                                  end;
                                until k in ['@'..'Z'];
                           'l': repeat
                                  l:=readval;
                                  case UpCase(k) of
                                    'O': if (ClipRect.Bottom>ClipRect.Right) xor (l=0) then begin
                                           if isprinter then begin
                                             if start and not Printer.Aborted then begin
                                                Printer.EndDoc;
                                             end;
                                             if l=0 Then Printer.Orientation:=poPortrait
                                                  Else Printer.Orientation:=poLandscape;
                                             Start := False;
                                           end else with view.image1 do begin
                                               {if start Then begin
                                                 np := True;
                                                 if not checkstart Then Break;
                                               end;
                                               start := False;}
                                               clientheight:= view.pixelsperinch * 2101875 div 254000;
                                               clientwidth := view.pixelsperinch * 29725 div 2540;
                                               picture.bitmap.height:=clientheight;
                                               picture.bitmap.width:=clientwidth;
                                           end;
                                         end;
                                    'E': begin
                                            n:=tField;
                                            tField:=Round(l*CharHeight);
                                            if start and (n=PenPos.Y) then MoveTo(PenPos.X,tfield);
                                         end;
                                    'H': begin
                                            if np and not checkstart Then Break;
                                            np:=True;
                                         end;
                                    'C': begin
                                            if start then MoveTo(PenPos.X,PenPos.Y+CharHeight);
                                            lpifix:=l<>0;
                                            if lpifix Then lpi:=48 /l else setlpi;
                                            if start then MoveTo(PenPos.X,PenPos.Y-CharHeight);
                                         end;
                                    'D': begin
                                            if start then MoveTo(PenPos.X,PenPos.Y+CharHeight);
                                            lpifix:=l<>0;
                                            if lpifix Then lpi:=l else setlpi;
                                            if start then MoveTo(PenPos.X,PenPos.Y-CharHeight);
                                         end;
                                    'X': begin
                                            if isprinter then Printer.Copies:=Round(l);
                                         end;
                                  end;
                                until k in ['@'..'Z'];
                           'k': repeat
                                  l:=readval;
                                  case UpCase(k) of
                                    'S': case Byte(Round(l)) of
                                            0: begin
                                                    cond:=120;
                                                    cpi:=10;
                                                    dw:=1;
                                                    setsize;
                                                 end;
                                            2: begin
                                                    cond:=72;
                                                    cpi:=10;
                                                    dw:=1;
                                                    setsize;
                                                 end;
                                            4: begin
                                                    cond:=120;
                                                    cpi:=12;
                                                    dw:=1;
                                                    setsize;
                                                 end;
                                         end;
                                  end;
                                until k in ['@'..'Z'];
                           else repeat
                                  readval;
                                until k in ['@'..'Z'];
                         end;
                         s:='';
                      end;
                 '(': begin
                         pcl:=True;
                         read(fh,k);
                         case k of
                           's': repeat
                                  l:=readval;
                                  case UpCase(k) of
                                    '@': begin
                                           if dp Then fp:=s
                                                 Else ff:=s;
                                           Font.Name:=s;
                                           s:='';
                                         end;
                                    'H': begin
                                           //font.Size:= Round(120 / l);
                                           cond:=120;
                                           cpi:=l;
                                           dw:=1;
                                           while cpi<9 do begin
                                             cpi:=cpi*2;
                                             dw:=dw*2;
                                           end;
                                           if Round(cpi-50/3)=0 Then begin
                                             cond:=72;
                                             cpi:=10;
                                           end else if Round(cpi-20)=0 Then begin
                                             cond:=72;
                                             cpi:=12;
                                           end;
                                           setsize;
                                         end;
                                    'V': if dp then begin
                                           //font.Size:= Round(l);
                                           cond:=l * cpi / dw;
                                           setsize;
                                         end;
                                    'P': begin
                                           if not dp and (l=1) Then
                                           begin
                                            Font.Name:=fp;
                                            //Font.Size:=Round( (cond div cpi * dw * Abs(Font.Height)) / (Metrics.tmHeight + Metrics.tmExternalLeading));
                                           end
                                           Else if dp and (l=0) Then
                                           begin
                                            Font.Name:=ff;
                                            //font.Size := cond div cpi * dw;
                                           end;
                                           dp:=(l=1);
                                         end;
                                    'S': case Byte(Round(l)) of
                                           0: font.Style:=font.Style - [fsItalic];
                                           1: font.Style:=font.Style + [fsItalic];
                                         end;
                                    'B': if l>0
                                         Then font.Style:=font.Style + [fsBold]
                                         else font.Style:=font.Style - [fsBold];
                                  end;
                                until k in ['@'..'Z'];
                           else repeat
                                  readval;
                                until k in ['@'..'Z'];
                         end;
                         s:='';
                      end;
                 #15 {SI}: begin
                         pcl:=False;
                         cond:=72;
                         setsize;
                      end;
                 '!','k','x','w': begin
                        pcl:=False;
                        read(fh,k);
                      end;
                 'S': begin
                        pcl:=False;
                        read(fh,k);
                        case byte(k) mod 2 of
                           0: ds:=1; //superscript
                           1: ds:=-1; //subscript
                        end;
                      end;
                 'T': begin
                        pcl:=False;
                        ds:=0;
                      end;
                 '-': begin
                        pcl:=False;
                        read(fh,k);
                        case byte(k) mod 2 of
                           1: Font.Style:=Font.Style+[fsUnderline]
                           Else Font.Style:=Font.Style-[fsUnderline]
                        end;
                      end;
                 '0': begin
                        pcl:=False;
                        if start then MoveTo(PenPos.X,PenPos.Y+CharHeight);
                        lpi:=8;
                        lpifix:=True;
                        if start then MoveTo(PenPos.X,PenPos.Y-CharHeight);
                      end;
                 '1': begin
                        pcl:=False;
                        if start then MoveTo(PenPos.X,PenPos.Y+CharHeight);
                        lpi:=72 / 7;
                        lpifix:=True;
                        if start then MoveTo(PenPos.X,PenPos.Y-CharHeight);
                      end;
                 '2': begin
                        pcl:=False;
                        if start then MoveTo(PenPos.X,PenPos.Y+CharHeight);
                        lpi:=6;
                        lpifix:=True;
                        if start then MoveTo(PenPos.X,PenPos.Y-CharHeight);
                      end;
                 '3': begin
                        pcl:=False;
                        read(fh,k);
                        if start then MoveTo(PenPos.X,PenPos.Y+CharHeight);
                        lpifix:=k<>#0;
                        if lpifix Then lpi:=216/byte(k) else setlpi;
                        if start then MoveTo(PenPos.X,PenPos.Y-CharHeight);
                      end;
                 '4': begin
                        pcl:=False;
                        Font.Style:=Font.Style+[fsItalic]
                      end;
                 '5': begin
                        pcl:=False;
                        Font.Style:=Font.Style-[fsItalic]
                      end;
                 '@': begin
                        pcl:=False;
                        font.Style:=[];
                        cond:=120;
                        if start and (PenPos.X=lField) Then MoveTo(0,PenPos.Y);
                        if start and (PenPos.y=tField) Then MoveTo(PenPos.X,0);
                        lfield := 0;
                        tfield := 0;
                        dw := 1;
                        lpifix:= False;
                        lpi:=99;
                        cpi:=10;
                        setsize;
                      end;
                 'A': begin
                        pcl:=False;
                        read(fh,k);
                        if start then MoveTo(PenPos.X,PenPos.Y+CharHeight);
                        lpifix:=k<>#0;
                        if lpifix then lpi:=72 / byte(k) else setlpi;
                        if start then MoveTo(PenPos.X,PenPos.Y-CharHeight);
                      end;
                 'E': if pcl then begin
                        //if np Then checkstart;
                        if start and not lpifix then setlpi;
                        if start and ((PenPos.X>lField) or (PenPos.Y>tField))
                           Then np:=True
                           else MoveTo(0,0);
                        font.Style:=[];
                        cond:=120;
                        lfield := 0;
                        tfield := 0;
                        dw := 1;
                        lpifix:= False;
                        lpi:=99;
                        cpi:=10;
                        setsize;
                      end else begin
                        font.Style:=font.Style + [fsBold];
                      end;
                 'G': begin
                        pcl:=False;
                        font.Style:=font.Style + [fsBold];
                      end;
                 'F','H': begin
                        font.Style:=font.Style - [fsBold];
                        pcl:=False;
                      end;
                 'M': begin
                        pcl:=False;
                        cpi:=12;
                        setsize;
                      end;
                 'P': begin
                        pcl:=False;
                        cpi:=10;
                        setsize;
                      end;
                 'W': begin
                        pcl:=False;
                        read(fh,k);
                        dw:=byte(k) mod 2 + 1;
                        setsize;
                      end;
                 'g': begin
                        pcl:=False;
                        cpi:=15;
                        setsize;
                      end;
                 'l': begin
                        pcl:=False;
                        read(fh,k);
                        n:=lField;
                        lfield:=Round(byte(k) * CharWidthR);
                        if start and (n=PenPos.X) Then MoveTo(lField,PenPos.Y);
                      end;
                 'p': begin
                        pcl:=False;
                        read(fh,k);
                        if not dp and (byte(k) mod 2=1) Then
                        begin
                          Font.Name:=fp;
                          //Font.Size:=Round( (cond div cpi * dw * Abs(Font.Height)) / (Metrics.tmHeight + Metrics.tmExternalLeading));
                        end
                        Else if dp and (byte(k) mod 2=0) Then
                        begin
                          Font.Name:=ff;
                          //font.Size := cond div cpi * dw;
                        end;
                        dp:=Boolean(byte(k) mod 2);
{$ifdef WIN32}
//                        font.charset := OEM_CHARSET;
{$endif}
                      end;
                 'r': begin
                        pcl:=False;
                        read(fh,k);
                        case byte(k) mod 8 of
                        0: Font.Color:=$000000;
                        1: Font.Color:=$FF00FF;
                        2: Font.Color:=$FFFF00;
                        3: Font.Color:=$FF0000;
                        4: Font.Color:=$00FFFF;
                        5: Font.Color:=$0000FF;
                        6: Font.Color:=$00FF00;
                        7: Font.Color:=$FFFFFF;
                        end;
                        Pen.Color:=Font.Color;
                      end;
                 '$' : begin
                        pcl:=False;
                        if not checkstart Then Break;
                        read(fh,k);
                        n:=Byte(k);
                        read(fh,k);
                        n:=n+Byte(k)*256;
                        {Absolute print poz}
                        MoveTo(lfield+n * font.pixelsperinch div 60,PenPos.Y);
                      end;
                 'J': begin
                        pcl:=False;
                        if not checkstart Then Break;
                        read(fh,k);
                        MoveTo(PenPos.X,PenPos.Y+ Byte(k) * font.pixelsperinch div 216);
                      end;
                 end;
               end;
          #32: begin
                  if not checkstart Then Break;
                  if fsUnderline in Font.Style then begin
                     n:=80 * CharHeight div 96;
                     Pen.Width:=4 * CharHeight div 96;
                     MoveTo(PenPos.X ,PenPos.Y + n);
                     LineTo(PenPos.X+ CharWidth ,PenPos.Y);
                     MoveTo(PenPos.X ,PenPos.Y - n);
                  end else if dp
                     then s:=k
                     else MoveTo(PenPos.X+ CharWidth ,PenPos.Y);
               end;
          '_': begin
                  if not checkstart Then Break;
                  n:=80 * CharHeight div 96;
                  Pen.Width:=4 * CharHeight div 96;
                  MoveTo(PenPos.X ,PenPos.Y + n);
                  LineTo(PenPos.X+ CharWidth ,PenPos.Y);
                  MoveTo(PenPos.X ,PenPos.Y - n);
               end;
          '|'
{$ifdef UTF8}
          ,#$e2
{$else}
          ,#$b3
{$endif}
                : begin
{$ifdef UTF8}
                  if k=#$e2 then begin
                     s:=k;
                     read(fh,k);
                     s:=s+k;
                     read(fh,k);
                     s:=s+k;
                     if s<>#$e2#$94#$82 then Continue;
                     s:='';
                  end;
{$endif}
                  if not checkstart Then Break;
                  n:=CharWidth;
                  Pen.Width:=4 * CharHeight div 96;
                  MoveTo(PenPos.X + n div 2 ,PenPos.Y);
                  LineTo(PenPos.X, PenPos.Y + CharHeight);
                  MoveTo(PenPos.X - n div 2 + n, PenPos.Y - CharHeight);
                  if fsUnderline in Font.Style then begin
                     n:=80 * CharHeight div 96;
                     Pen.Width:=4 * CharHeight div 96;
                     MoveTo(PenPos.X- n ,PenPos.Y + n);
                     LineTo(PenPos.X+ n ,PenPos.Y);
                     MoveTo(PenPos.X ,PenPos.Y - n);
                  end;
               end;
     end;
 end;

   closefile(fh);
   if isprinter and start and not Printer.Aborted Then
     Printer.EndDoc;
   if assigned(view) then with View do begin
      Tag:=strona;
      UpDown1.Position:=strona;
   end;
end;

begin
 if paramcount < 1 then begin
    writeln('Brak parametru - nazwy pliku do wydrukowania');
    exit;
 end;
 fname := paramstr(1);
 if not fileexists(fname) then begin
    writeln('Zˆy parametr - podany plik nie istnieje');
    exit;
 end;
 s:=Paramstr(2);
 if s='SCREEN' then begin
    isprinter:=False;
    Application.Initialize;
    Application.CreateForm(Tview, view);
    with view.image1 do begin
      //GetTextMetrics(canvas.Handle, Metrics);
      Printer.orientation := poPortrait;
      clientheight:=Round(view.pixelsperinch * Printer.PageHeight / getdevicecaps(Printer.handle,LOGPIXELSY));
      clientwidth:=Round(view.pixelsperinch * Printer.PageWidth / getdevicecaps(Printer.handle,LOGPIXELSX));
      picture.bitmap.height:=clientheight;
      picture.bitmap.width:=clientwidth;
      canv:=Canvas;
      canv.Font.PixelsPerInch:=view.pixelsperinch;
      pdraw:=@draw;
    end;
    Application.Run;
 end else begin
   isprinter:=True;
   if s<>'' Then begin
   d:=StrToIntDef(s,-1);
   if d=-1
    Then Printer.PrinterIndex:=Printer.Printers.IndexOf(s)
    Else Printer.PrinterIndex:=d;
   end;
   canv:=Printer.Canvas;
   canv.font.pixelsperinch:=getdevicecaps(Printer.handle,LOGPIXELSX);
   draw;
 end;

end.
