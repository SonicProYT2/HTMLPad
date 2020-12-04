unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button3: TButton;
    ComboBox1: TComboBox;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;

implementation
uses Unit1;
{$R *.lfm}

{ TForm5 }

procedure TForm5.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TForm5.FormCreate(Sender: TObject);
begin

end;

procedure TForm5.FormKeyPress(Sender: TObject; var Key: char);
begin
  If (key=#13) then Button3Click(Sender);
end;

procedure TForm5.Label1Click(Sender: TObject);
begin

end;

procedure TForm5.Button1Click(Sender: TObject);
begin

end;

procedure TForm5.Button2Click(Sender: TObject);
begin

end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  If (ComboBox1.Caption = 'English') then
  begin
       language:='EN';
       Form5.Close;
  end;
  If (ComboBox1.Caption = 'Русский') then
  begin
       language:='RU';
       Form5.close;
  end;
  If (ComboBox1.Caption = 'Український') then
  begin
       language:='UA';
       Form5.close;
  end;
end;

end.

