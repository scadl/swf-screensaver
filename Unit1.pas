unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ShockwaveFlashObjects_TLB, Vcl.OleCtrls,
  Vcl.StdCtrls, Vcl.AppEvnts;

type
  TForm1 = class(TForm)
    ShockwaveFlash1: TShockwaveFlash;
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CException(Sender: TObject; E:Exception);
    function GetLocaleSS():string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  const cfgfile:string = '\unswfscr.cfg';

implementation

{$R *.dfm}



procedure TForm1.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin

// Flash created?
If Not Assigned (ShockwaveFlash1) Then Begin
// No? Let VCL handle messages
Handled := False;
Exit;
End;

// Message handle equal to Flash's handle?
If (Msg.Hwnd<>ShockwaveFlash1.Handle) Then Begin
Handled := False; // Let VCL handle all other messages
Exit;
End;

//If Msg.Message = WM_LBUTTONUP Then Begin ShowMessage('Shockwave Flash clicked!'); Handled := False; End;
If Msg.Message = WM_LBUTTONUP Then
  Begin
    Close;
    ShockwaveFlash1.Playing:=false;
    ShockwaveFlash1.Stop;
    ShockwaveFlash1.Movie:=' ';
    Handled := False;
  End;
If Msg.Message = WM_MOUSEHOVER Then
  Begin
    Close;
    ShockwaveFlash1.Playing:=false;
    ShockwaveFlash1.Stop;
        ShockwaveFlash1.Movie:=' ';
    Handled := False;
  End;
If Msg.Message = WM_KEYDOWN Then
  Begin
    Close;
    ShockwaveFlash1.Playing:=false;
    ShockwaveFlash1.Stop;
    ShockwaveFlash1.Movie:=' ';
    Handled := False;
  End;

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TForm1.FormCreate(Sender: TObject);
//var configsl:TStringList; cconf:TextFile; usrpath:string;
begin



//configsl:=TStringList.Create;
//ShowMessage(GetEnvironmentVariable('USERPROFILE'));
{
usrpath:=GetEnvironmentVariable('USERPROFILE');

if FileExists(usrpath+cfgfile) then
  begin
    configsl.LoadFromFile(usrpath+cfgfile);
    ShowMessage(configsl.Strings[1]);
    if configsl.Strings[0]='1' then ShockwaveFlash1.BGColor:=configsl.Strings[1];
    if FileExists(configsl.Strings[2])
    then
      begin
        ShockwaveFlash1.Movie:=configsl.Strings[2];
        ShockwaveFlash1.Play;
      end
    else
      begin
      if GetLocaleSS='Russian' then MessageDlg('Выбранный SWF-файл не существует!'+#13+'Пожалуйста, откройте настройки заставки, и проверьте путь к нему!',mtError,[mbOK],0,mbOK)
      else MessageDlg('Selected SWF doesn''t exists!'+#13+'Pease, go to ScreenSaver config and check its path!',mtError,[mbOK],0,mbOK);
      Application.Terminate;
      end;
  end else begin
    AssignFile(cconf,usrpath+cfgfile);
    Rewrite(cconf);
    CloseFile(cconf);
    configsl.Add('0');
    configsl.Add('C1C1C1');
    configsl.Add('<your_swf_ssaver.swf>');
    configsl.Add('ENGMUI');
    configsl.SaveToFile(usrpath+cfgfile);
      
    if GetLocaleSS='Russian' then
    MessageDlg('Похоже, что вызапустили заставку в первый раз...'+#13+
      'Программа создала пустой файл настроек, но'+#13+
      'Вам следует открыть Натройки заставки,'+#13+
      'и указать путь, к вашему SWF-файлу'+#13+#13+'Программа будет закрыта!',mtWarning,[mbOK],0,mbOK)
    else
    MessageDlg('It seemed, like you started ScreenSvaer first time...'+#13+
      'The app created default config file,'+#13+
      'But you shoud open Screensaver Configuratrion,'+#13+
      'and set path to your SWF'+#13+#13+'Application Closed!',mtWarning,[mbOK],0,mbOK);      
    Application.Terminate;    
  end;

    //SystemParametersInfo(SPI_SCREENSAVERRUNNING,1,@Dummy,0);
    //SetCapture(Self.Handle);

    //Application.OnException:=CException;  
 }  

end;

procedure Tform1.CException(Sender: TObject; E:Exception);
begin
      ShowMessage('It seemed, like you started ScreenSvaer first time...'+#13+
      'The app created default config file,'+#13+
      'But you shoud open Screensaver Configuratrion,'+#13+
      'and set path to your SWF'+#13+#13+'Application Closed!'+
      #13+E.ClassName+' '+E.Message);
      Application.Terminate;
end;
             
procedure TForm1.FormShow(Sender: TObject);
begin
ShowWindow(Application.Handle, SW_HIDE);
end;

function TForm1.GetLocaleSS():string;
var lbuf:pchar; bufmem:integer;
begin
bufmem:=GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SENGLANGUAGE, nil, 0);
GetMem(lbuf, bufmem);
GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SENGLANGUAGE, lbuf, bufmem);
Result:=lbuf;
end;

end.
