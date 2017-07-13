unit Unit3;

interface

uses
 Vcl.Forms,
  SysUtils,
  Vcl.Controls,
  Vcl.Graphics,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  Winapi.messages,
  System.Classes,
  unit1,
  Winapi.windows;


  type
  TMyControl = class(TControl)
        procedure DDetect();
        procedure CheckOk();
        function GetLocaleSS():string;
  end;

  var
  MyControl1: TMyControl;
  MForms: array[0..30] of TForm1;
  previewmode:boolean = false;
  const cfgfile:string = '\unswfscr.cfg';



implementation

procedure TMyControl.CheckOk;
var configsl:TStringList; cconf:TextFile; usrpath:string; I:integer; TargetHandle:hwnd; //colorst:string;
begin

configsl:=TStringList.Create;
//ShowMessage(GetEnvironmentVariable('USERPROFILE'));

usrpath:=GetEnvironmentVariable('USERPROFILE');

if FileExists(usrpath+cfgfile) then
  begin
    configsl.LoadFromFile(usrpath+cfgfile);
    //ShowMessage(configsl.Strings[1]);
    if configsl.Strings[0]='1' then form1.ShockwaveFlash1.BGColor:=configsl.Strings[1];
    if FileExists(configsl.Strings[2])
    then
      begin

           if previewmode then
            begin
                Application.CreateForm(TForm1, Form1);
                TargetHandle:=StrToInt(ParamStr(2));
                Application.MainFormOnTaskbar := False;
                Form1.ParentWindow:=TargetHandle;
                Form1.ShockwaveFlash1.Movie:=configsl.Strings[2];
                Form1.ShockwaveFlash1.Play;
                Form1.Show;
                Form1.WindowState:=wsMaximized;
                Form1.ShockwaveFlash1.Align:=alCustom;
                Form1.ShockwaveFlash1.Left:= -(strtoint(configsl.Strings[4]) div 2);
                Form1.ShockwaveFlash1.Top:= -(strtoint(configsl.Strings[5]) div 2);
                Form1.ShockwaveFlash1.Width:=Form1.Width+strtoint(configsl.Strings[4]);
                Form1.ShockwaveFlash1.Height:= Form1.Height+strtoint(configsl.Strings[5]);
            end else begin

          if configsl.Strings[6]='0' then
          begin
            Application.CreateForm(TForm1, Form1);
            Form1.ShockwaveFlash1.Movie:=configsl.Strings[2];
            Form1.ShockwaveFlash1.Play;

            Form1.Show;
            Form1.MakeFullyVisible(Screen.Monitors[0]);
            Form1.WindowState:=wsMaximized;

            Form1.ShockwaveFlash1.Align:=alCustom;
            Form1.ShockwaveFlash1.Left:= -(strtoint(configsl.Strings[4]) div 2);
            Form1.ShockwaveFlash1.Top:= -(strtoint(configsl.Strings[5]) div 2);
            Form1.ShockwaveFlash1.Width:=Form1.Width+strtoint(configsl.Strings[4]);
            Form1.ShockwaveFlash1.Height:=Form1.Height+strtoint(configsl.Strings[5]);

            //Form1.Color:=StringToColor();

          end else begin
            for I := 1 to Screen.MonitorCount do
             begin
              Application.CreateForm(TForm1, MForms[i]);
              MForms[i].ShockwaveFlash1.Movie:=configsl.Strings[2];
              MForms[i].ShockwaveFlash1.Play;

              MForms[i].Show;
              MForms[i].MakeFullyVisible(Screen.Monitors[i-1]);
              MForms[i].WindowState:=wsMaximized;

              MForms[i].ShockwaveFlash1.Align:=alCustom;
              MForms[i].ShockwaveFlash1.Left:= -(strtoint(configsl.Strings[4]) div 2);
              MForms[i].ShockwaveFlash1.Top:= -(strtoint(configsl.Strings[5]) div 2);
              MForms[i].ShockwaveFlash1.Width:=MForms[i].Width+strtoint(configsl.Strings[4]);
              MForms[i].ShockwaveFlash1.Height:= MForms[i].Height+strtoint(configsl.Strings[5]);
            end;
         end;
        {
        Application.CreateForm(TForm1, Form1);
        Application.MainFormOnTaskbar := False;
        form1.Show;
        form1.ShockwaveFlash1.Movie:=configsl.Strings[2];
        form1.ShockwaveFlash1.Play;
        form1.ShockwaveFlash1.Align:=alCustom;
        form1.ShockwaveFlash1.Left:= -(strtoint(configsl.Strings[4]) div 2);
        form1.ShockwaveFlash1.Top:= -(strtoint(configsl.Strings[5]) div 2);
        form1.ShockwaveFlash1.Width:=Screen.Width+strtoint(configsl.Strings[4]);
        form1.ShockwaveFlash1.Height:=Screen.Height+strtoint(configsl.Strings[5]);}
            end;
      end
    else
      begin{
      if GetLocaleSS='Russian' then MessageDlg('Выбранный SWF-файл не существует!'+#13+'Пожалуйста, откройте настройки заставки, и проверьте путь к нему!',mtError,[mbOK],0,mbOK)
      else MessageDlg('Selected SWF doesn''t exists!'+#13+'Pease, go to ScreenSaver config and check its path!',mtError,[mbOK],0,mbOK);
      Application.Terminate;}
      MessageDlg('Selected SWF doesn''t exists!'+#13+'Pease, go to ScreenSaver config and check its path!!'+#13+
      '---------------------------------------------------------------------------'+#13+
      'Выбранный SWF-файл не существует!'+#13+'Пожалуйста, откройте настройки заставки, и проверьте путь к нему!'
      ,mtError,[mbOK],0,mbOK);
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
    configsl.Add('0');
    configsl.Add('0');
    configsl.Add('0');
    configsl.SaveToFile(usrpath+cfgfile);

    MessageDlg('Похоже, что вызапустили заставку в первый раз...'+#13+'Программа создала пустой файл настроек,'+#13+
      'но Вам следует открыть Натройки заставки, и указать путь, к вашему SWF-файлу'+#13+'Программа будет закрыта!'+#13+
      '-------------------------------------------------------------------------------------------'+#13+
      'It seemed, like you started ScreenSaver first time...'+#13+'The app created default config file,'+#13+
      'But you shoud open Screensaver Configuratrion, and set path to your SWF'+#13+'Application Closed!'
      ,mtWarning,[mbOK],0,mbOK);
    Application.Terminate;
  end;

    //SystemParametersInfo(SPI_SCREENSAVERRUNNING,1,@Dummy,0);
    //SetCapture(Self.Handle);

    //Application.OnException:=CException;

end;

function TMyControl.GetLocaleSS():string;
var lbuf:pchar; bufmem:integer;
begin
bufmem:=GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SENGLANGUAGE, nil, 0);
GetMem(lbuf, bufmem);
GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SENGLANGUAGE, lbuf, bufmem);
Result:=lbuf;
end;

procedure TMyControl.DDetect();
begin
  previewmode:=true;
  CheckOk;
end;

end.
