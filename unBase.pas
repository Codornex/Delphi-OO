unit unBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmBase = class(TForm)
    FadeIn: TTimer;
    FadeOut: TTimer;
    procedure FadeInTimer(Sender: TObject);
    procedure FadeOutTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetTitulo: String; virtual;abstract; //Infra para quando erdar ele pega a função da outra unit.
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

procedure TfrmBase.FadeInTimer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue + 15;
  FadeIn.Enabled := not(AlphaBlendValue = 255);
end;

procedure TfrmBase.FadeOutTimer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue - 15;
  if AlphaBlendValue = 0 then
    Close;
end;

procedure TfrmBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      FadeOut.Enabled := True;
    VK_RETURN:
      Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmBase.FormShow(Sender: TObject);
begin
  Caption := GetTitulo;
end;

end.


