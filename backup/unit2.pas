unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Unit7;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button2: TButton;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure ColorDialog1Close(Sender: TObject);
    procedure FontDialog1Close(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton3Change(Sender: TObject);
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
  //FontDialog1.Execute;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  If ComboBox1.Caption='English' then
  begin
    language:='EN';
    Rewrite(languageFile);
    write(languageFile, language);
    CloseFile(languageFile);
  end;
  If ComboBox1.Caption='Русский' then
  begin
    language:='RU';
    Rewrite(languageFile);
    write(languageFile, language);
    CloseFile(languageFile);
  end;
  If ComboBox1.Caption='Український' then
  begin
    language:='UA';
    Rewrite(languageFile);
    write(languageFile, language);
    CloseFile(languageFile);
  end;
  Form2.close();
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  //ColorDialog1.Execute;
end;

procedure TForm2.CheckBox1Change(Sender: TObject);
begin
  If CheckBox1.Checked = true then
  begin
    Form1.Memo1.WordWrap:=true;
    rewrite(wordwrapfile);
    write(wordwrapfile, 'true');
    closefile(wordwrapfile);
    end
  else
  begin
    Form1.Memo1.WordWrap:=false;
    rewrite(wordwrapfile);
    write(wordwrapfile, 'false');
    closefile(wordwrapfile);
  end;
end;

procedure TForm2.ColorDialog1Close(Sender: TObject);
begin
  //Form1.Memo1.Color:=ColorDialog1.Color;
  //backgroundColor:=ColorToString(ColorDialog1.color);
  Rewrite(backgroundColorFile);
  Write(backgroundColorFile, backgroundColor);
  CloseFile(backgroundColorFile);
end;

procedure TForm2.FontDialog1Close(Sender: TObject);
begin
   //Form1.Memo1.Font := FontDialog1.Font;

   Rewrite(fontfamilyFile);
   //Write(fontfamilyFile, FontDialog1.Font.Name);
   //CloseFile(fontfamilyFile);

   rewrite(fontSizeFile);
   //Write(fontSizeFile, FontDialog1.Font.size);
   //CloseFile(fontSizeFile);

   //textColor:=ColorToString(FontDialog1.Font.Color);
   rewrite(textColorFile);
   Write(textColorFile, textColor);
   CloseFile(textColorFile);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: char);
begin
  If (key=#27) then Form2.Close;
end;

procedure TForm2.RadioButton1Change(Sender: TObject);
begin

end;

procedure TForm2.RadioButton3Change(Sender: TObject);
begin
    Form7.ShowModal;
end;

end.

