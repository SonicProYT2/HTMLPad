unit Unit4;

{$mode objfpc}{$H+}

interface
    //KATAR, what the fridge did you do with the space of the about window???
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, LCLintf;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button14: TButton;
    Button15: TButton;
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation
uses Unit6;
{$R *.lfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin

end;

procedure TForm4.Button1Click(Sender: TObject);
begin

    Form4.Close;
end;
procedure TForm4.Button2Click(Sender: TObject);
begin

    OpenURL('http://www.flaticon.com/authors/freepik');
end;

procedure TForm4.Button15Click(Sender: TObject);
begin
     Form6.ShowModal;
end;

end.

