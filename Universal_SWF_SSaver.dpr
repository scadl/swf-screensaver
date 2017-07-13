program Universal_SWF_SSaver;

uses
  Vcl.Forms,
  SysUtils,
  Vcl.Controls,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas';

var paramst, cfgfile:string;

{$R *.res}
{$E scr}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.ShowMainForm:=false;
  paramst:=ParamStr(1);
  //Application.MessageBox(pchar(paramst+' '+inttostr(Length(paramst))+' '+paramst[2]), 'parastr');

  //if (ParamCount > 0) and (UpperCase(ParamStr(1))='/S') then begin
  if (paramst[2] = 's') then begin
    //Application.CreateForm(TForm1, Form1);
    //Form1.Visible:=true;
    MyControl1.CheckOk;
  //Application.CreateForm(TForm2, Form2);
  end;
  if (paramst[2] = 'c') then begin
    Application.CreateForm(TForm2, Form2);
    Form2.Visible:=true;
    //Application.CreateForm(TForm1, Form1);
  end;
  if (paramst[2] = 'p') then begin
    //Application.CreateForm(TForm1, Form1);
    //Application.CreateForm(TForm2, Form2);
    //Application.MessageBox('Preview Mode','Detector');
    MyControl1.DDetect();
  end;
  //Application.MessageBox(pchar(ParamStr(2)),'cmd params2');
  //Control1.DDetect();
  //Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TForm2, Form2);
  //Application.CreateForm(TForm1, Form1);
  Application.Run;
end.



