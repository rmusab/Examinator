program Examinator;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  DataMod in 'DataMod.pas' {DataModule1: TDataModule},
  TestForm in 'TestForm.pas' {Form2},
  Results in 'Results.pas' {Form3},
  About in 'About.pas' {Form4},
  Loading in 'Loading.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Form5 := TForm5.Create(Application);
  Form5.Show;
  Form5.Update;
  while Form5.Timer1.Enabled do
    Application.ProcessMessages;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Form5.Hide;
  Form5.Free;
  Application.Run;
end.
