unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button14: TButton;
    Image1: TImage;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin

end;

procedure TForm4.FormKeyPress(Sender: TObject; var Key: char);
begin
  If (key=#27) then Form4.Close;
end;

procedure TForm4.Image1Click(Sender: TObject);
begin

end;

procedure TForm4.Button1Click(Sender: TObject);
begin

    Form4.Close;
end;

end.

