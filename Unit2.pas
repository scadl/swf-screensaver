unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Unit1, Vcl.Controls, Vcl.Buttons, Unit3, Vcl.Samples.Spin, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    ColorDialog1: TColorDialog;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Button3: TButton;
    Button4: TButton;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    ENGMUI1: TMenuItem;
    RUMUI1: TMenuItem;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Button5: TButton;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    SpeedButton1: TSpeedButton;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);


    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Button5Click(Sender: TObject);

    procedure Russify(Sender: TObject);
    procedure EnglishUI(Sender: TObject);
    procedure ENGMUI1Click(Sender: TObject);
    procedure RUMUI1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Form1: TForm1;

  MForms: array[0..30] of TForm1;

  var configsl:TStringList; cconf:TextFile;
  usrpath:string;
  muilang:string;
  fileerr:string;
  colorwarn:string;
  syncscale:boolean;
  spemain:boolean;

  const cfgfile:string = '\unswfscr.cfg';

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var hexcolor, dcolor:string; clconst:boolean;
begin

clconst:=false;
if (ColorDialog1.Execute) then
begin

ShowMessage(ColorToString(ColorDialog1.Color));

if ColorToString(ColorDialog1.Color)='clAqua' then begin hexcolor:='00FFFF'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clBlack' then begin hexcolor:='000000'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clBlue' then begin hexcolor:='0000FF'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clCream' then begin hexcolor:='FFFBF0'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clDkGray ' then begin hexcolor:='808080'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clFuchsia' then begin hexcolor:='FF00FF'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clGray' then begin hexcolor:='808080'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clGreen' then begin hexcolor:='008000'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clLime' then begin hexcolor:='00FF00'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clLtGray' then begin hexcolor:='C0C0C0'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clMaroon' then begin hexcolor:='800000'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clMedGray' then begin hexcolor:='A0A0A4'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clMoneyGreen' then begin hexcolor:='C0DCC0'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clNavy' then begin hexcolor:='000080'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clOlive' then begin hexcolor:='808000'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clPurple' then begin hexcolor:='800080'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clRed' then begin hexcolor:='FF0000'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clSilver' then begin hexcolor:='C0C0C0'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clSkyBlue' then begin hexcolor:='A6CAF0'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clTeal' then begin hexcolor:='008080'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clWhite' then begin hexcolor:='FFFFFF'; clconst:=true; end;
if ColorToString(ColorDialog1.Color)='clYellow' then begin hexcolor:='FFFF00'; clconst:=true; end;


if not clconst then
begin
dcolor:=ColorToString(ColorDialog1.Color);
hexcolor:=dcolor[8]+dcolor[9]+dcolor[6]+dcolor[7]+dcolor[4]+dcolor[5];
//ShowMessage(dcolor[8]+dcolor[9]+dcolor[6]+dcolor[7]+dcolor[4]+dcolor[5]);
end;

Edit1.Text:=hexcolor;

end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  //presentationForms: array of Tform1;
  i:integer;
  //sform: array of tform;
begin

        //ShowMessage(inttostr(Screen.MonitorCount));
        //SetLength(presentationForms, Screen.MonitorCount);
        //for i := 0 to Screen.MonitorCount do
       // begin
          //Application.CreateForm(TForm1, Form1);

          //presentationForms[i].Visible := true;
          //presentationForms[i].BoundsRect := Screen.Monitors[i].BoundsRect;
        //end;
//Application.CreateForm(TForm1, Form1);
{
Form1.ShockwaveFlash1.BGColor:=Edit1.Text;
if FileExists(edit2.Text) then
  begin
    form1.ShockwaveFlash1.Movie:=edit2.Text;
    form1.ShockwaveFlash1.Play;

    form1.ShockwaveFlash1.Align:=alCustom;
    form1.ShockwaveFlash1.Left:= -(SpinEdit1.Value div 2);
    form1.ShockwaveFlash1.Top:= -(SpinEdit2.Value div 2);
    form1.ShockwaveFlash1.Width:=Screen.Width+SpinEdit1.Value;
    form1.ShockwaveFlash1.Height:=Screen.Height+SpinEdit2.Value;

  end
else ShowMessage(fileerr);
}
//Form1.Show;
         {
          Application.CreateForm(Tform1, Form3);
          form3.ShockwaveFlash1.Movie:=edit2.Text;
          form3.ShockwaveFlash1.Play;
          form3.Show;
          form3.MakeFullyVisible(Screen.Monitors[1]);}


if not CheckBox1.Checked then
begin
      Application.CreateForm(TForm1, Form1);
      Form1.ShockwaveFlash1.Movie:=edit2.Text;
      Form1.ShockwaveFlash1.Play;

      Form1.ShockwaveFlash1.BGColor:=Edit1.Text;

      Form1.Show;
      Form1.MakeFullyVisible(Screen.Monitors[0]);
      Form1.WindowState:=wsMaximized;

      Form1.ShockwaveFlash1.Align:=alCustom;
      Form1.ShockwaveFlash1.Left:= -(SpinEdit1.Value div 2);
      Form1.ShockwaveFlash1.Top:= -(SpinEdit2.Value div 2);
      Form1.ShockwaveFlash1.Width:=Form1.Width+SpinEdit1.Value;
      Form1.ShockwaveFlash1.Height:= Form1.Height+SpinEdit2.Value;

      //ShowMessage('$00'+edit1.Text[5]+edit1.Text[6]+edit1.Text[3]+edit1.Text[4]+edit1.Text[1]+edit1.Text[2]);
      //Form1.Color:=StringToCursor('$00'+edit1.Text[5]+edit1.Text[6]+edit1.Text[3]+edit1.Text[4]+edit1.Text[1]+edit1.Text[2]);
end else begin
if FileExists(edit2.Text) then
  begin
    for I := 1 to Screen.MonitorCount do
    begin
      Application.CreateForm(TForm1, MForms[i]);
      MForms[i].ShockwaveFlash1.Movie:=edit2.Text;
      MForms[i].ShockwaveFlash1.Play;

      MForms[i].ShockwaveFlash1.BGColor:=Edit1.Text;

      MForms[i].Show;
      MForms[i].MakeFullyVisible(Screen.Monitors[i-1]);
      MForms[i].WindowState:=wsMaximized;

      MForms[i].ShockwaveFlash1.Align:=alCustom;
      MForms[i].ShockwaveFlash1.Left:= -(SpinEdit1.Value div 2);
      MForms[i].ShockwaveFlash1.Top:= -(SpinEdit2.Value div 2);
      MForms[i].ShockwaveFlash1.Width:=MForms[i].Width+SpinEdit1.Value;
      MForms[i].ShockwaveFlash1.Height:= MForms[i].Height+SpinEdit2.Value;
      //ShowMessage(inttostr(i));
  end;
end else ShowMessage(fileerr);
end;


end;

procedure TForm2.Button3Click(Sender: TObject);
begin

configsl.Strings[0]:=IntToStr(RadioGroup1.ItemIndex);
configsl.Strings[1]:=Edit1.Text;
configsl.Strings[2]:=edit2.Text;
if PopupMenu1.Items[0].Checked then configsl.Strings[3]:='ENGMUI';
if PopupMenu1.Items[1].Checked then configsl.Strings[3]:='RUMUI';
configsl.Strings[4]:=inttostr(SpinEdit1.Value);
configsl.Strings[5]:=inttostr(SpinEdit1.Value);
if CheckBox1.Checked then configsl.Strings[6]:='1' else configsl.Strings[6]:='0';
configsl.SaveToFile(usrpath+cfgfile);
Form2.Close;
Application.Terminate;

end;

procedure TForm2.Button4Click(Sender: TObject);
begin
Form2.Close;
Application.Terminate;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
if OpenDialog1.Execute then edit2.Text:=OpenDialog1.FileName;
end;

procedure TForm2.ENGMUI1Click(Sender: TObject);
begin
EnglishUI(form2);
PopupMenu1.Items[0].Checked:=true;
PopupMenu1.Items[1].Checked:=false;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

fileerr:='Selected SWF doesn''t exists!';
colorwarn:='Background fill color set to "Absolute Black"';
syncscale:=true;

configsl:=TStringList.Create;
usrpath:=GetEnvironmentVariable('USERPROFILE');
if FileExists(usrpath+cfgfile) then
  begin
    configsl.LoadFromFile(usrpath+cfgfile);
    //ShowMessage(inttostr(configsl.Count));
    RadioGroup1.ItemIndex:=StrToInt(configsl.Strings[0]);
    Edit1.Text:=configsl.Strings[1];
    Edit2.Text:=configsl.Strings[2];
    SpinEdit1.Value:=strtoint(configsl.Strings[4]);
    SpinEdit2.Value:=strtoint(configsl.Strings[5]);
    if strtoint(configsl.Strings[4]) <> strtoint(configsl.Strings[4]) then syncscale:=false;
    if configsl[6]='1' then CheckBox1.Checked:=true else CheckBox1.Checked:=false;


    if configsl.Strings[3]='ENGMUI' then {do nothing}
    else
      begin
      if configsl.Strings[3]='RUMUI' then
        begin
          PopupMenu1.Items[1].Checked:=false;
          PopupMenu1.Items[1].Checked:=true;
          Russify(form2);
        end;
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
end;

label1.Caption:='Язык интерфейса'+#13+'Inteface Language';

end;

procedure TForm2.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
PopupMenu1.Popup(form2.Left+Label1.Left+x, form2.Top+Label1.Top+Label1.Height+(form2.Height-form2.ClientHeight));
end;

procedure TForm2.Label1MouseEnter(Sender: TObject);
begin
label1.fONT.Color:=clBlue;
//label1.Font.Style:=[fsItalic,fsBold];
Cursor:=crHandPoint;
end;

procedure TForm2.Label1MouseLeave(Sender: TObject);
begin
label1.font.Color:=clDefault;
//label1.Font.Style:=[fsBold];
Cursor:=crDefault;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin

if RadioGroup1.ItemIndex=1 then
begin
GroupBox1.Enabled:=true;
Label2.Enabled:=true;
Edit1.Enabled:=true;
Button1.Enabled:=true;
Edit1.Text:='000000';
//if Edit1.Text='000000' then ShowMessage(colorwarn);
end else begin
GroupBox1.Enabled:=false;
Label2.Enabled:=false;
Edit1.Enabled:=false;
Button1.Enabled:=false;
Edit1.Text:='C1C1C1';
end;

end;

procedure TForm2.RUMUI1Click(Sender: TObject);
begin
Russify(form2);
PopupMenu1.Items[0].Checked:=false;
PopupMenu1.Items[1].Checked:=true;
end;

procedure TForm2.Russify(Sender: TObject);
begin
  Button1.Caption:='Задать цвет';
  Button2.Caption:='Проверить';
  Button4.Caption:='Отмена';
  GroupBox1.Caption:=' Фон - цвет ';
  GroupBox2.Caption:=' Путь к вашему SWF-ролику ';
  RadioGroup1.Caption:=' Фон - тип ';
  RadioGroup1.Items[0]:=' Прозрачный ';
  RadioGroup1.Items[1]:=' Закрашеный ';
  fileerr:='SWF-Файл не существует!';
  colorwarn:='Цвет заливики фона установлен на "Абсолютный чёрный"';
  GroupBox3.Caption:=' Масшатбировние SWF-полотна (+ пикс) ';
  label3.Caption:='Ширина ->';
  label4.Caption:='<- Высота';
  SpeedButton1.Hint:='Синхронизировать значения (позволит сохранить пропорции)';
  GroupBox4.Caption:=' Дополнительные опции ';
  CheckBox1.Caption:='Поддержка нескольких мониторов (возможны "тормоза")';
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  if syncscale then begin
    SpeedButton1.Font.Color:=clRed;
    SpeedButton1.Caption:='F';
    syncscale:=false;
  end else begin
    SpeedButton1.Font.Color:=clGreen;
    SpeedButton1.Caption:='D';
    syncscale:=true;
  end;
end;

procedure TForm2.SpinEdit1Change(Sender: TObject);
begin
  if syncscale then begin Timer1.Enabled:=true; spemain:=true; end;
end;

procedure TForm2.SpinEdit2Change(Sender: TObject);
begin
  if syncscale then begin Timer1.Enabled:=true; spemain:=false; end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  if spemain then SpinEdit2.Value:=SpinEdit1.Value
  else SpinEdit1.Value:=SpinEdit2.Value;
  timer1.Enabled:=false;
end;

Procedure Tform2.EnglishUI(Sender: TObject);
begin
  Button1.Caption:='Set Color';
  Button2.Caption:='Test';
  Button4.Caption:='Cancel';
  GroupBox1.Caption:=' Background - Color ';
  GroupBox2.Caption:=' Path to your SWF-file ';
  RadioGroup1.Caption:=' Background - Type ';
  RadioGroup1.Items[0]:=' Transparent ';
  RadioGroup1.Items[1]:=' Filled ';
  fileerr:='Selected SWF doesn''t exists!';
  colorwarn:='Background fill color set to "Absolute Black"';
  GroupBox3.Caption:=' Scale SWF-Canvas (+ pixels) ';
  label3.Caption:='Width ->';
  label4.Caption:='<- Height';
  SpeedButton1.Hint:='Sync Values (preserv aspect ratio)';
  GroupBox4.Caption:=' Additional Options ';
  CheckBox1.Caption:='MultiMonitor Support (may cause sgnificant lags)';
end;

end.
