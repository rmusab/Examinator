unit TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzButton, ImgList, RzPrgres, RzStatus, ExtCtrls,
  StdCtrls, DBCtrls, RzDBEdit, ABSMain, DB, Menus, RzRadGrp, RzRadChk,
  Mask, RzEdit;

type
  TForm2 = class(TForm)
    StatusBar: TRzStatusBar;
    StatusPane2: TRzStatusPane;
    StatusPane1: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    ProgressBar4: TRzProgressBar;
    Panel2: TRzPanel;
    ProgressBar1: TRzProgressBar;
    ProgressBar2: TRzProgressBar;
    ProgressBar3: TRzProgressBar;
    Toolbar: TRzToolbar;
    ImageList1: TImageList;
    Spacer1: TRzSpacer;
    btnNext: TRzToolButton;
    btnFinish: TRzToolButton;
    btnCheck: TRzToolButton;
    Panel1: TRzPanel;
    Memo: TRzDBMemo;
    BtnExit: TRzToolButton;
    DataSource: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Spacer2: TRzSpacer;
    CheckBox: TRzCheckBox;
    GroupBox1: TRzGroupBox;
    etAnswer: TRzEdit;
    Panel3: TRzPanel;
    Answer_1: TRzButton;
    Answer_2: TRzButton;
    Answer_3: TRzButton;
    Answer_4: TRzButton;
    Answer_5: TRzButton;
    procedure btnNextClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Answer_1Click(Sender: TObject);
    procedure Answer_2Click(Sender: TObject);
    procedure Answer_3Click(Sender: TObject);
    procedure Answer_4Click(Sender: TObject);
    procedure Answer_5Click(Sender: TObject);
  private
    { Private declarations }
    procedure ShowVariants;
  public
    { Public declarations }
    procedure Start;
    procedure Delay;
  end;

var
  Form2: TForm2;
  list: tstringlist;
  mass: array of integer;
  otv, pers: string;
  prav, neprav, per, ppr, pnpr, n, count, btn_id: integer;
  btn: boolean;

implementation
Uses Main, DataMod, Results;

{$R *.dfm}

procedure MassRand(range: integer; var inputMass: array of integer);
function Unic(var flag: array of boolean; range: integer): integer;
begin
  result := random(range);
  while flag[result] do
    result := random(range);
  flag[result] := true;
end;
var
  i: integer;
  bm: array of boolean;
begin
  SetLength(bm, length(inputMass));
  for i := 0 to length(inputMass) - 1 do
  begin
    inputMass[i] := Unic(bm, range) + 1;
  end;
end;

procedure TForm2.ShowVariants;
var mas_q: array of integer;
    i,j: integer;
begin
  if n = count then begin
    StatusPane1.Caption := '';
    StatusPane2.Caption := '';
    btnNext.Enabled := false;
    btnFinish.Enabled := false;
    btnCheck.Enabled := true;
    Memo.DataField := '';
    Panel3.Visible := false;
    btn:=false;
    etAnswer.Clear;
  end
  else
  begin
    n:=n+1;
    Memo.DataField := 'Vopros';
    StatusPane1.Caption := 'Question '+IntToStr(n)+' of '+IntToStr(count);
    ProgressBar1.Percent := Trunc((n*100)/count);
    per:=Trunc((prav*100)/count);
    case per of
    0..39: pers := '2 (poorly)';
    40..59: pers := '3 (satisfactorily)';
    60..89: pers := '4 (good)';
    90..100: pers := '5 (perfectly)';
    end;
    StatusPane2.Caption := 'Ñorrect answers - '+IntToStr(prav)+
    ', wrong answers - '+IntToStr(neprav)+', mark '+Pers;
    DataModule1.ABSTable1.Locate('ID',StrToInt(List.Strings[n-1]),[loCaseInsensitive,loPartialKey]);
    Panel3.Visible := true;
    Answer_1.Font.Color := clBlack;
    Answer_2.Font.Color := clBlack;
    Answer_3.Font.Color := clBlack;
    Answer_4.Font.Color := clBlack;
    Answer_5.Font.Color := clBlack;
    for j:=0 to ComponentCount-1 do Components[j].Tag := 0;
    btn := true;
    Randomize;
    SetLength(mas_q,5);
    MassRand(5,mas_q);
    for i:=0 to length(mas_q)-1 do
      for j:=0 to ComponentCount-1 do
     if Components[j].name = ('Answer_'+IntToStr(i+1)) then begin
       TRzButton(Components[j]).Caption :=
        DataModule1.ABSTable1.FieldByName(IntToStr(mas_q[i])).Text;
       if TRzButton(Components[j]).Caption = DataModule1.ABSTable1.FieldByName('Otvet').Text
         then Components[j].Tag := 1;
     end;
  end;
end;

Procedure TForm2.Start;
var i:integer;
begin
  Randomize;
  List := TStringList.Create;
  n:=0; prav:=0; neprav:=0; ppr:=0; pnpr:=0;
  StatusPane1.Caption := '';
  StatusPane2.Caption := '';
  ProgressBar1.Percent := 0;
  ProgressBar2.Percent := 0;
  ProgressBar3.Percent := 0;
  ProgressBar4.BarColor := clBtnFace;
  etAnswer.Clear;
  Memo.DataField := '';
  btnFinish.Enabled := false;
  btnCheck.Enabled := false;
  btnNext.Enabled := false;
  count := StrToInt(Form1.Number.Text);
  List.Clear;
  SetLength(mass, DataModule1.ABSTable1.RecordCount);
  MassRand(DataModule1.ABSTable1.RecordCount, mass);
  for i:=0 to length(mass)-1 do
  begin
    List.Add(IntToStr(mass[i]));
  end;
  btnNext.Enabled := true;
  btnFinish.Enabled := true;
  btnCheck.Enabled := false;
  ShowVariants;
end;

procedure TForm2.btnNextClick(Sender: TObject);
begin
  if otv = DataModule1.ABSTable1.FieldByName('Otvet').Text then
  begin
    Inc(prav);
    ppr:=Trunc((prav*100)/count);
    ProgressBar3.Percent := ppr;
    ProgressBar4.BarColor := $0017CE09;
    etAnswer.Clear;
    ShowVariants;
  end
  else
  begin
    Inc(neprav);
    pnpr:=Trunc((neprav*100)/count);
    ProgressBar2.Percent := pnpr;
    ProgressBar4.BarColor := $000333F3;
    ShowVariants;
  end;
  etAnswer.Clear;
end;

procedure TForm2.btnFinishClick(Sender: TObject);
begin
  StatusPane1.Caption := '';
  StatusPane2.Caption := '';
  btnNext.Enabled := false;
  btnFinish.Enabled := false;
  btnCheck.Enabled := true;
  Memo.DataField := '';
  Panel3.Visible := false;
  btn:=false;
  etAnswer.Clear;
  n:=n-1;
end;

procedure TForm2.btnCheckClick(Sender: TObject);
begin
  btnCheck.Enabled := false;
  per:=Trunc((prav*100)/count);
  case per of
  0..39: pers := '2 (poorly)';
  40..59: pers := '3 (satisfactorily)';
  60..89: pers := '4 (good)';
  90..100: pers := '5 (perfectly)';
  end;
  with Form3 do begin
  lbPrav.Caption := IntToStr(prav);
  lbNeprav.Caption := IntToStr(neprav);
  lbProc.Caption := IntToStr(per)+'%';
  ProgressBar.Percent := per;
  lbMark_num.Caption :=  pers;
  end;
  Form3.ShowModal;
end;

procedure TForm2.BtnExitClick(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.N7Click(Sender: TObject);
begin
  if btnNext.Enabled = true then
  btnNext.Click;
end;

procedure TForm2.N8Click(Sender: TObject);
begin
  if BtnFinish.Enabled = true then
  BtnFinish.Click;
end;

procedure TForm2.N9Click(Sender: TObject);
begin
  if btnCheck.Enabled = true then
  btnCheck.Click;
end;

procedure TForm2.Delay;
var j: integer;
begin
  btn:=false;
  for j:=0 to ComponentCount-1 do begin
    if Components[j].Name = ('Answer_'+IntToStr(btn_id)) then begin
      TRzButton(Components[j]).Font.Color := clNavy;
    end;
    if Components[j].tag = 1 then
      TRzButton(Components[j]).Font.Color := clGreen;
  end;
  if CheckBox.Checked then
      etAnswer.Text := DataModule1.ABSTable1.FieldByName('Otvet').Text;
end;

procedure TForm2.Answer_1Click(Sender: TObject);
begin
  if not(btn) then Exit;
  otv := Answer_1.Caption;
  btn_id := 1;
  Delay;
end;

procedure TForm2.Answer_2Click(Sender: TObject);
begin
  if not(btn) then Exit;
  otv := Answer_2.Caption;
  btn_id := 2;
  Delay;
end;

procedure TForm2.Answer_3Click(Sender: TObject);
begin
  if not(btn) then Exit;
  otv := Answer_3.Caption;
  btn_id := 3;
  Delay;
end;

procedure TForm2.Answer_4Click(Sender: TObject);
begin
  if not(btn) then Exit;
  otv := Answer_4.Caption;
  btn_id := 4;
  Delay;
end;

procedure TForm2.Answer_5Click(Sender: TObject);
begin
  if not(btn) then Exit;
  otv := Answer_5.Caption;
  btn_id := 5;
  Delay;
end;

end.
