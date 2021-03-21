unit Results;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzPrgres, RzBckgnd, ExtCtrls, RzPanel,
  RzButton;

type
  TForm3 = class(TForm)
    btnClose: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    Separator: TRzSeparator;
    ProgressBar: TRzProgressBar;
    lbMark: TRzLabel;
    lbMark_num: TRzLabel;
    lbPercent: TRzLabel;
    lbProc: TRzLabel;
    lbNeprav: TRzLabel;
    lbWA: TRzLabel;
    lbPrav: TRzLabel;
    lbCA: TRzLabel;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btnCloseClick(Sender: TObject);
begin
  Form3.Close;
end;

end.
