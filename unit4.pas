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
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TForm4.Button1Click(Sender: TObject);
begin

    Form4.Close;
end;

end.

