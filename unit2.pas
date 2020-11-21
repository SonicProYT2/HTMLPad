unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    FontDialog1: TFontDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure FontDialog1Close(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
uses Unit1;
{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  FontDialog1.Execute;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form2.close();
end;

procedure TForm2.CheckBox1Change(Sender: TObject);
begin
  If CheckBox1.Checked = true then Form1.Memo1.WordWrap:=true else Form1.Memo1.WordWrap:=false;
end;

procedure TForm2.FontDialog1Close(Sender: TObject);
begin
   Form1.Memo1.Font := FontDialog1.Font;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

end.

