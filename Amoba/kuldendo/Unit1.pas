unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ScktComp, ComCtrls, StdCtrls, MMSystem, Jpeg, ShellAPI;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    mnuConnect: TMenuItem;
    mnuAbout: TMenuItem;
    ClientSocket1: TClientSocket;
    ServerSocket1: TServerSocket;
    StatusBar1: TStatusBar;
    lstUzenetek: TListBox;
    Label1: TLabel;
    txtUzenet: TEdit;
    cmdKuldes: TButton;
    mnuNewgame: TMenuItem;
    Jtk1: TMenuItem;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mnuConnectClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure Status(s: string);
    procedure mnuAboutClick(Sender: TObject);
    procedure Delay(Seconds, MilliSec: word);
    procedure txtUzenetKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmdKuldesClick(Sender: TObject);
    procedure lstUzenetekMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    function CheckIfWin: string;
    procedure mnuNewgameClick(Sender: TObject);
    procedure StartNewGame;
    procedure ClientSocket1Disconnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TAmobaServer = record
   AcceptedIP: string;
   ClientConnected: boolean;
  end;

var
  Form1: TForm1;
  Map: array[1..20,1..20] of string;
  kep_Gomb, kep_X, kep_O, kep_Friss_O, kep_Friss_X: TBitmap;
  AmobaServer: TAmobaServer = (AcceptedIP: '';ClientConnected :false);
  ItIsYourTurn: boolean = false;
  IAmTheServer: boolean = false;
  Gaming: boolean = false;
  Nyertes: TRect;
  VanNyertes: boolean = false;
  FrissLepes: TPoint;

const
  ProgramName: string = 'Putra Net�d�l�';

implementation

{$R *.DFM}
{$R 'kepek.res'}

procedure TForm1.FormPaint(Sender: TObject);
var i,k: integer;
begin
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[i,k] = '-' then
    Image1.Canvas.Draw(i*16-16,k*16-16,kep_Gomb)
   else if Map[i,k] = 'x' then
    Image1.Canvas.Draw(i*16-16,k*16-16,kep_X)
   else if Map[i,k] = 'o' then
   Image1.Canvas.Draw(i*16-16,k*16-16,kep_O);

 if FrissLepes.X <> -1 then
  Image1.Canvas.Draw((FrissLepes.X*16)-16,(FrissLepes.Y*16)-16,kep_Friss_O);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i,k: integer;
begin
 Width := 335;

 for i := 1 to 20 do
  for k := 1 to 20 do
   Map[i,k] := '-';

 FrissLepes := point(-1,-1);

 kep_Gomb := TBitmap.Create;
 kep_X := TBitmap.Create;
 kep_O := TBitmap.Create;
 kep_Friss_O := TBitmap.Create;
 kep_Friss_X := TBitmap.Create;

 kep_Gomb.LoadFromResourceName(HInstance,'GOMB');
 kep_X.LoadFromResourceName(HInstance,'LENYOMOTT_X');
 kep_O.LoadFromResourceName(HInstance,'LENYOMOTT_O');
 kep_Friss_O.LoadFromResourceName(HInstance,'FRISS_O');
 kep_Friss_X.LoadFromResourceName(HInstance,'FRISS_X');

 FormPaint(Sender);

 Caption := ProgramName;

 ServerSocket1.Port := 1465;
 ClientSocket1.Port := 1465;
 ServerSocket1.Active := true;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var posX, posY: integer;
    i, SockNo: integer;
    s: string;
begin
 if not Gaming then
 begin
  Status('Nem folyik j�t�k!');
  Abort;
 end;
 if not ItIsYourTurn then
 begin
  Status('Nem te j�ssz!');
  Abort;
 end;

 Status('L�p�s feldolgoz�sa...');
// Delay(0,500);

 posX := (X div 16) + 1;
 posY := (Y div 16) + 1;
 if Map[posX,posY] <> '-' then
 begin
  Status('Ott m�r van valaki!');
  Abort;
 end;

{-------------------H�L�-KEZDETE-----------}
 Status('L�p�s k�ld�se...');
 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel, val�sz�n�leg megszakadt a kapcsolat.',PChar(ProgramName),mb_Ok + mb_IconStop);
   Abort;
  end;
 end
 else
 begin                            //ha kliens
  if not ClientSocket1.Active then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni a szerverrel!',PChar(ProgramName),mb_Ok + mb_IconError);
   Abort;
  end;
  s := 'L';
  if Length(IntToStr(posX)) = 1 then s := s + '0';
  s := s + IntToStr(posX);
  if Length(IntToStr(posY)) = 1 then s := s + '0';
  s := s + IntToStr(posY);
  ClientSocket1.Socket.SendText(s);
 end;
{-------------------H�L�-V�GE--------------}

 Status('');

 Map[posX,posY] := 'x';
 ItIsYourTurn := false;
 FormPaint(Sender);
 if (CheckIfWin <> '')or(VanNyertes) then
 begin
  VanNyertes := true;
  Status('Nyert�l!');
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Pen.Style := psSolid;
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.MoveTo((Nyertes.Left*16)-8,(Nyertes.Top*16)-8);
  Image1.Canvas.LineTo((Nyertes.Right*16)-8,(Nyertes.Bottom*16)-8);
  Gaming := false;
 end;
end;

procedure TForm1.mnuConnectClick(Sender: TObject);
var temp: string;
    i, SockNo: integer;
begin
 if mnuConnect.Caption = 'Ellenf�l megad�sa' then
 begin
  temp := InputBox('Azonos�t�','K�rem az ellenf�l IP c�m�t:','169.254.196.170');
  if trim(temp) = '' then
   Abort;
  ClientSocket1.Address := temp;
  AmobaServer.AcceptedIP := temp;
  Status('Kapcsolatfelv�tel');
  ClientSocket1.Active := true;
  IAmTheServer := false;
  mnuConnect.Caption := 'Kapcsolat megsz�ntet�se';
  Status('Enged�lyk�r�s');
// Delay(10,0);
  Application.MessageBox('Most az ellenf�l v�lasz�ra kell v�rni, ez eltarthat egy darabig.',PCHar(ProgramName),mb_Ok + mb_IconInformation);
  ClientSocket1.Socket.SendText('QUERYOKAY');
 end
 else
 begin
  Status('Lecsatlakoz�s');
  if IAmTheServer then
  begin
   SockNo := -1;
   for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
    if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
     SockNo := i;
   if SockNo <> -1 then
    ServerSocket1.Socket.Connections[SockNo].Close;
  end
  else
   ClientSocket1.Close;
  mnuConnect.Caption := 'Ellenf�l megad�sa';
  IAmTheServer := false;
  Gaming := false;
 end;
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
 IAmTheServer := true;
 if not AmobaServer.ClientConnected then
 begin
  AmobaServer.ClientConnected := true;
  AmobaServer.AcceptedIP := Socket.RemoteAddress;
  Status('Ellenf�l csatlakozott');
 end
 else
  Status('Csatlakoz�s, de m�r van ellenf�l');

 mnuConnect.Caption := 'Kapcsolat megsz�ntet�se';
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
 if Socket.RemoteAddress = AmobaServer.AcceptedIP then
 begin
  AmobaServer.AcceptedIP := '';
  AmobaServer.ClientConnected := false;
  mnuConnect.Caption := 'Ellenf�l megad�sa';
  IAmTheServer := false;
  Status('Az ellenf�llel megszakadt a kapcsolat.');
  Gaming := false;
 end;
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var posX, posY: integer;
    s: string;
begin
 s := Socket.ReceiveText;
 if s = 'QUERYOKAY' then //kapcsolatra enged�lyk�r�s
  if Socket.RemoteAddress = AmobaServer.AcceptedIP then //ha megengedj�k
  begin
   Status('Ellenf�llel val� kommunik�ci�');
   Delay(1,0);
   Socket.SendText('OKAY');
   Delay(1,0);
   Status('Az ellenf�l bejelentkezett');
   Application.MessageBox('Az ellenf�l bejelentkezett, kezdheted a j�t�kot.',PChar(ProgramName),mb_Ok + mb_IconInformation);
   ItIsYourTurn := true;
   IAmTheServer := true;
   Gaming := true;
  end
  else                                                 //ha nem
  begin
   Status('K�r�s elutas�t�sa');
   Socket.SendText('NOTOKAY');
  end;
 if s[1] = 'L' then                                   //l�p�s
 begin
  posX := StrToInt(Copy(s,2,2));
  posY := StrToInt(Copy(s,4,2));
  Map[posX,posY] := 'o';
  FrissLepes := point(posX,posY);
  ItIsYourTurn := true;
  FormPaint(Sender);
  Status('Az ellenf�l l�pett, te j�ssz');
  if (CheckIfWin <> '')or(VanNyertes) then
  begin
   VanNyertes := true;
   Status('Az ellenf�l nyert!');
   Image1.Canvas.Pen.Color := clBlack;
   Image1.Canvas.Pen.Style := psSolid;
   Image1.Canvas.Pen.Width := 2;
   Image1.Canvas.MoveTo((Nyertes.Left*16)-8,(Nyertes.Top*16)-8);
   Image1.Canvas.LineTo((Nyertes.Right*16)-8,(Nyertes.Bottom*16)-8);
   Gaming := false;
  end;
 end;
 if s[1] = 'U' then                                   //�zenet j�tt
 begin
  lstUzenetek.Items.Add('Ellen: ' + Copy(s,2,Length(s)));
  Status('�zenet j�tt');
//  lstUzenetek.SetFocus;
  lstUzenetek.ItemIndex := lstUzenetek.Items.Count-1;
 end;
 if s = 'QUERYNEW' then           //�j j�t�k
 begin
  posX := Application.MessageBox('Azz ellenf�l �j j�t�kot szeretne kezdeni.'#13#10#13#10'Beleegyezel?',PChar(ProgramName),mb_YesNo + mb_IconQuestion);
  if posX = id_No then
  begin
   Socket.SendText('NEWNO')       //nem OK
  end
  else
  begin
   Socket.SendText('NEWYES');     //OK
   StartNewGame;
   ItIsYourTurn := true;
   Gaming := true;
   Status('Te kezdesz');
  end;
 end;
 if s = 'NEWNO' then
  Application.MessageBox('Az ellenf�l visszautas�totta az �j j�t�kot.',PChar(ProgramName),mb_Ok + mb_IconInformation);
 if s = 'NEWYES' then
 begin
  StartNewGame;
  Application.MessageBox('Az ellenf�l elfogadta az �j j�t�kot. � kezd.',PChar(ProgramName),mb_Ok + mb_IconInformation);
  if Pos(',te j�ssz',StatusBar1.Panels[0].Text) < 0 then
   ItIsYourTurn := false;
  Gaming := true;
  Status('Az ellenf�l kezd.');
 end;
end;

procedure TForm1.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var posX, posY: integer;
    s: string;
begin
 s := Socket.ReceiveText;
 if s = 'NOTOKAY' then //kapcsolat elutas�tva
 begin
  Application.MessageBox('Az ellenf�l visszautas�totta a kapcsolatot.',PChar(ProgramName),mb_Ok + mb_IconStop);
  Status('Kapcsolat lez�r�sa');
  ClientSocket1.Close;
  IAmTheServer := false;
  Gaming := false;
  mnuConnect.Caption := 'Ellenf�l megad�sa';
 end;
 if s = 'OKAY' then //kapcsolat enged�lyezve
 begin
  Application.MessageBox('Az ellenf�l elfogadta a kapcsolatot, � kezd.',PChar(ProgramName),mb_Ok + mb_IconInformation);
  ItIsYourTurn := false;
  IAmTheServer := false;
  Gaming := true;
 end;
 if s[1] = 'L' then //l�p�s
 begin
  Status('Az ellen l�p�s�nek feldolgoz�sa');
  posX := StrToInt(Copy(s,2,2));
  posY := StrToInt(Copy(s,4,2));
  Map[posX,posY] := 'o';
  FrissLepes := point(posX,posY);
  ItIsYourTurn := true;
  FormPaint(Sender);
  Status('Az ellenf�l l�pett, te j�ssz');
  if (CheckIfWin <> '')or(VanNyertes) then
  begin
   VanNyertes := true;
   Status('Az ellenf�l nyert!');
   Image1.Canvas.Pen.Color := clBlack;
   Image1.Canvas.Pen.Style := psSolid;
   Image1.Canvas.Pen.Width := 2;
   Image1.Canvas.MoveTo((Nyertes.Left*16)-8,(Nyertes.Top*16)-8);
   Image1.Canvas.LineTo((Nyertes.Right*16)-8,(Nyertes.Bottom*16)-8);
   Gaming := false;
  end;
 end;
 if s[1] = 'U' then //�zenet j�tt
 begin
  lstUzenetek.Items.Add('Ellen: ' + Copy(s,2,Length(s)));
  Status('�zenet j�tt');
//   lstUzenetek.SetFocus;
  lstUzenetek.ItemIndex := lstUzenetek.Items.Count-1;
 end;
 if s = 'QUERYNEW' then           //�j j�t�k
 begin
  posX := Application.MessageBox('Azz ellenf�l �j j�t�kot szeretne kezdeni.'#13#10#13#10'Beleegyezel?',PChar(ProgramName),mb_YesNo + mb_IconQuestion);
  if posX = id_No then
  begin
   Socket.SendText('NEWNO')      //nem OK
  end
  else
  begin
   Socket.SendText('NEWYES');    //OK
   StartNewGame;
   ItIsYourTurn := true;
   Gaming := true;
   Status('Te kezdesz');
  end;
 end;
 if s = 'NEWNO' then
  Application.MessageBox('Az ellenf�l visszautas�totta az �j j�t�kot.',PChar(ProgramName),mb_Ok + mb_IconInformation);
 if s = 'NEWYES' then
 begin
  StartNewGame;
  Application.MessageBox('Az ellenf�l elfogadta az �j j�t�kot. � kezd.',PChar(ProgramName),mb_Ok + mb_IconInformation);
  if Pos(',te j�ssz',StatusBar1.Panels[0].Text) < 0 then
   ItIsYourTurn := false;
  Gaming := true;
  Status('Az ellenf�l kezd.');
 end;
end;

procedure TForm1.Status(s: string);
begin
 StatusBar1.Panels[0].Text := s;
end;

procedure TForm1.mnuAboutClick(Sender: TObject);
var s: string;
begin
 s := ProgramName + #13#10#13#10;
 s := s + 'Programmed by: Putra Ware'#13#10;
 s := s + 'http://putraware.ini.hu'#13#10;
 s := s + 'televonzsinor@yahoo.com';
 Application.MessageBox(PChar(s),'N�vjegy',mb_Ok + mb_IconInformation);
end;

procedure TForm1.Delay(Seconds, MilliSec: word);
var TimeOut: TDateTime;
begin
 TimeOut := Now + EncodeTime(0,Seconds div 60,Seconds mod 60,MilliSec);
 while Now < TimeOut do
  Application.ProcessMessages;
end;

procedure TForm1.txtUzenetKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = 13 then
 begin
  Key := 0;
  cmdKuldesClick(Sender);
 end;
end;

procedure TForm1.cmdKuldesClick(Sender: TObject);
var i, SockNo: integer;
    s: string;
begin
 if trim(txtUzenet.Text) = '' then
  Abort;

 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni a szerverrel!',PChar(ProgramName),mb_Ok + mb_IconExclamation);
   Abort;
  end;
  s := 'U' + txtUzenet.Text;
  ServerSocket1.Socket.Connections[SockNo].SendText(s);
 end
 else
 begin
  s := 'U' + txtUzenet.Text;
  ClientSocket1.Socket.SendText(s);
 end;
 lstUzenetek.Items.Add('Te: ' + txtUzenet.Text);
// txtUzenet.SelectAll;
 txtUzenet.Clear;
 txtUzenet.SetFocus;
 lstUzenetek.ItemIndex := lstUzenetek.Items.Count-1;
end;

procedure TForm1.lstUzenetekMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var lXPoint, lYPoint, lIndex: longint;
begin
 lXPoint := X;
 lYPoint := Y;

 lIndex := SendMessageA(lstUzenetek.Handle,lb_ItemFromPoint,0,(lYPoint * 65536)+lXPoint);
 if (lIndex >= 0) and (lIndex < lstUzenetek.Items.Count) then
  lstUzenetek.Hint := lstUzenetek.Items[lIndex]
 else
 begin
  lstUzenetek.Hint := '';
  Application.HideHint;
 end;
end;

function TForm1.CheckIfWin: string;
var Egybe: integer;
    i, k: integer;
begin
 Result := '';
 Egybe := 0;
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[i,k] = 'x' then
   begin
    Inc(Egybe);
    if Egybe = 5 then
    begin
     Result := 'x';
     Nyertes.Left := i;
     Nyertes.Top := k - 4;
     Nyertes.Bottom := k;
     Nyertes.Right := i;
    end;
   end
   else
    Egybe := 0;
//f�gg�leges, o-ra
 Egybe := 0;
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[i,k] = 'o' then
   begin
    Inc(Egybe);
    if Egybe = 5 then
    begin
     Result := 'o';
     Nyertes.Left := i;
     Nyertes.Top := k - 4;
     Nyertes.Bottom := k;
     Nyertes.Right := i;
    end;
   end
   else
    Egybe := 0;
//v�zszintes, x-re
 Egybe := 0;
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[k,i] = 'x' then
   begin
    Inc(Egybe);
    if Egybe = 5 then
    begin
     Result := 'x';
     Nyertes.Left := k - 4;
     Nyertes.Top := i;
     Nyertes.Bottom := i;
     Nyertes.Right := k;
    end;
   end
   else
    Egybe := 0;
//v�zszintes, o-ra
 Egybe := 0;
 for i := 1 to 20 do
  for k := 1 to 20 do
   if Map[k,i] = 'o' then
   begin
    Inc(Egybe);
    if Egybe = 5 then
    begin
     Result := 'o';
     Nyertes.Left := k - 4;
     Nyertes.Top := i;
     Nyertes.Bottom := i;
     Nyertes.Right := k;
    end;
   end
   else
    Egybe := 0;
//balfentr�l jobbrale �tl�, x-re
 for i := 1 to 16 do
  for k := 1 to 16 do
   if Map[i,k] = 'x' then
    if Map[i+1,k+1] = 'x' then
     if Map[i+2,k+2] = 'x' then
      if Map[i+3,k+3] = 'x' then
       if Map[i+4,k+4] = 'x' then
       begin
        Result := 'x';
        Nyertes.Left := i;
        Nyertes.Top := k;
        Nyertes.Bottom := k + 4;
        Nyertes.Right := i + 4;
       end;
//balfentr�l jobbrale �tl�, o-ra
 for i := 1 to 16 do
  for k := 1 to 16 do
   if Map[i,k] = 'o' then
    if Map[i+1,k+1] = 'o' then
     if Map[i+2,k+2] = 'o' then
      if Map[i+3,k+3] = 'o' then
       if Map[i+4,k+4] = 'o' then
       begin
        Result := 'o';
        Nyertes.Left := i;
        Nyertes.Top := k;
        Nyertes.Bottom := k + 4;
        Nyertes.Right := i + 4;
       end;
//ballentr�l jobbrafel �tl�, x-re
 for i := 1 to 20 do
  for k := 20 downto 1 do
   if Map[i,k] = 'x' then
    if Map[i-1,k+1] = 'x' then
     if Map[i-2,k+2] = 'x' then
      if Map[i-3,k+3] = 'x' then
       if Map[i-4,k+4] = 'x' then
       begin
        Result := 'x';
        Nyertes.Left := i;
        Nyertes.Top := k;
        Nyertes.Bottom := k + 4;
        Nyertes.Right := i - 4;
       end;
//ballentr�l jobbfentre �tl�, o-ra
 for i := 1 to 20 do
  for k := 20 downto 1 do
   if Map[i,k] = 'o' then
    if Map[i-1,k+1] = 'o' then
     if Map[i-2,k+2] = 'o' then
      if Map[i-3,k+3] = 'o' then
       if Map[i-4,k+4] = 'o' then
       begin
        Result := 'o';
        Nyertes.Left := i;
        Nyertes.Top := k;
        Nyertes.Bottom := k + 4;
        Nyertes.Right := i - 4;
       end;
end;

procedure TForm1.mnuNewgameClick(Sender: TObject);
var i, SockNo: integer;
begin
 if Application.MessageBox('T�nyleg �j j�t�kot akarsz kezdeni?','NetAm�ba',mb_YesNo + mb_IconQuestion) = id_No then
  Abort;

 if mnuConnect.Caption = 'Ellenf�l megad�sa' then
 begin
  StartNewGame;
  Abort;
 end;

 if IAmTheServer then
 begin
  SockNo := -1;
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
   if ServerSocket1.Socket.Connections[i].RemoteAddress = AmobaServer.AcceptedIP then
    SockNo := i;
  if SockNo = -1 then
  begin
   Application.MessageBox('Nem siker�lt kommunik�lni az ellenf�llel.','NetAm�ba',mb_Ok + mb_IconExclamation);
   Abort;
  end;
  Status('Ellenf�l megk�rdez�se');
  ServerSocket1.Socket.Connections[SockNo].SendText('QUERYNEW');
 end
 else
 begin
  if not ClientSocket1.Active then
  begin
   Application.MessageBox('Az ellenf�llel nem siker�lt felvenni a kapcsolatot.','NetAm�ba',mb_Ok + mb_IconExclamation);
   Abort;
  end;
  Status('Ellenf�l megk�rdez�se');
  ClientSocket1.Socket.SendText('QUERYNEW');
 end;
end;

procedure TForm1.StartNewGame;
var i, k: integer;
begin
 for i := 1 to 20 do
  for k := 1 to 20 do
   Map[i,k] := '-';

 FrissLepes := point(-1,-1);

 VanNyertes := false;

 FormPaint(Application);
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
 Gaming := false;
 mnuConnect.Caption := 'Ellenf�l megad�sa';
 Status('Az ellenf�llel megszakadt a kapcsolat');
end;

end.
