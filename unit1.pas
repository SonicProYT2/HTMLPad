unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  Menus, ExtDlgs, ExtCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    CalculatorDialog1: TCalculatorDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure OpenDialog1Close(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  openedFile: string;
  savedFile: string;
  fileNotFound: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  CalculatorDialog1.Execute;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  openedFile:='';
  savedFile:='';
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  ShowMessage('JustPad 1.0'+#13+#13+'JustPad - is a very simple text editor written on Free Pascal.'+#13+#13+'Created by KATAR'+#13+'My site: https://katar7.do.am/'+#13+'My GitHub: https://github.com/users/KATAR-github');
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin

  if OpenDialog1.Execute then
     begin
       openedFile:= OpenDialog1.FileName;
       Memo1.Lines.LoadFromFile(openedFile);
       Form1.Caption:=openedFile + ' | JustPad 1.0';
     end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  If (savedFile='') then
  begin
      if SaveDialog1.Execute then
     begin
       savedFile:= SaveDialog1.FileName;
       Memo1.Lines.SaveToFile(savedFile);
       Form1.Caption:=savedFile + ' | JustPad 1.0';
     end;
  end
  else
  begin
       Memo1.Lines.SaveToFile(savedFile);
  end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
     begin
       savedFile:= SaveDialog1.FileName;
       Memo1.Lines.SaveToFile(savedFile);
       Form1.Caption:=savedFile + ' | JustPad 1.0';
     end;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.OpenDialog1Close(Sender: TObject);
begin

end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
begin

end;

end.

