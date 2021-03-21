unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, RzAnimtr, ExtCtrls, RzPanel,
  StdCtrls, RzLabel, RzButton;

type
  TForm4 = class(TForm)
    btnClose: TRzBitBtn;
    Panel1: TPanel;
    LabelProductName: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    LabelLicense: TLabel;
    LabelUserName: TLabel;
    LabelCompany: TLabel;
    LabelSerialNumber: TLabel;
    Label5: TLabel;
    UserName: TLabel;
    Company: TLabel;
    SerialNumber: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
