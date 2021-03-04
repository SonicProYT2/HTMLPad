unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  Menus, ExtDlgs, ExtCtrls, CheckBoxThemed, ExtendedNotebook, Unit2, Unit4,
  Types;

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
    StatusBar1: TStatusBar;

    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
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
    procedure SaveDialog1Close(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  editableFile: string;
  fileNotFound: integer;
  languageFile: Text;
  languageCheck: string;
  language: string;
  fontfamilyFile: Text;
  fontfamily: string;
  fontSizeFile: Text;
  fontSize: string;
  isLanguageCfgExists: boolean;
  editingTranslation: string;
  backgroundColorFile: Text;
  backgroundColor: string;
  textColorFile: Text;
  textColor: string;
  wordwrapfile: Text;
  wordwrap: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  editableFile := '';
  if (language = 'RU') then
    Form1.Caption := 'Новый файл | JustPad 1.3';
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
end;



procedure TForm1.FormShow(Sender: TObject);
begin

  editableFile := '';
  languageCheck := '';
  language := '';
  fontfamily := '';
  fontSize := '';
  backgroundColor := '';
  textColor := '';
  isLanguageCfgExists := False;

  AssignFile(fontfamilyFile, 'font.conf');
  AssignFile(fontSizeFile, 'fontSize.conf');
  AssignFile(languageFile, 'language.conf');
  AssignFile(backgroundColorFile, 'bgColor.conf');
  AssignFile(textColorFile, 'txColor.conf');
  AssignFile(wordwrapfile, 'isWordWrap.conf');

  //перенос строки старт
  if FileExists('isWordWrap.conf') then
  begin
    Reset(wordwrapfile);
    Read(wordwrapfile, Wordwrap);
    closefile(wordwrapfile);
    if (wordwrap = 'true') then
      memo1.WordWrap := True
    else
      memo1.WordWrap := False;
  end;
  //перенос строки энд

  //конфиг цвет фона
  if FileExists('bgColor.conf') then
  begin
    Reset(backgroundColorFile);
    Read(backgroundColorFile, backgroundColor);
    CloseFile(backgroundColorFile);
    Memo1.Color := StringToColor(backgroundColor);
    Form2.ColorDialog1.Color := StringToColor(backgroundColor);
  end;
  //конфиг цвта фона кончается

  //конфиг цвета шрифта старт
  if (FileExists('txColor.conf')) then
  begin
    Reset(textColorFile);
    Read(textColorFile, textColor);
    CloseFile(textColorFile);
    Memo1.Font.Color := StringToColor(textColor);
    Form2.FontDialog1.Font.Color := StringToColor(textColor);
  end;
  //конец конфига цвета шрифта

  if not FileExists('language.conf') then
  begin//матерюсь на то, что конфиг для языка не найден
    if language = '' then
    begin
      language:='EN';
      Rewrite(languageFile);
      Write(languageFile, language);
      closefile(languageFile);
    end;
  end;
  if FileExists('language.conf') then
  begin
    Reset(languageFile);
    Read(languageFile, languageCheck);
    if (languageCheck = 'RU') then
      language := 'RU';
    if (languageCheck = 'EN') then
      language := 'EN';


    if (languageCheck <> 'RU') and (languageCheck <> 'EN') then
    begin
      language := 'EN';
    end;


    if (language = 'RU') then
    begin
      //установка русского стартует

      MenuItem1.Caption := 'Файл';
      MenuItem4.Caption := 'Открыть';
      MenuItem5.Caption := 'Сохранить';
      MenuItem6.Caption := 'Сохранить как';
      MenuItem8.Caption := 'Закрыть';
      MenuItem11.Caption := 'Новый';
      MenuItem9.Caption := 'Инструменты';
      MenuItem10.Caption := 'Настройки';
      MenuItem3.Caption := 'О программе';
      MenuItem2.Caption := 'О JustPad';
      SaveDialog1.Title := 'Сохранить файл как | JustPad 1.3';
      OpenDialog1.Title := 'Открыть файл | JustPad 1.3';
      Form2.CheckBox1.Caption := 'Перенос строк';
      Form2.Button1.Caption := 'Шрифт';
      Form2.Button3.Caption := 'Цвет фона';
      Form2.FontDialog1.title := 'Шрифт | JustPad 1.3';
      Form2.ColorDialog1.title := 'Цвет фона | JustPad 1.3';
      Form2.Button3.Caption := 'Цвет фона';
      Form2.Label1.Caption := 'Для смены языка' + #13 +
        'перезагрузите JustPad.';
      StatusBar1.Panels.Items[0].Text := 'Количество символов: 0';
      StatusBar1.Panels.Items[0].Width := 130;
      Form2.Caption := 'Настройки';
      Form1.Caption := 'Новый файл | JustPad 1.3';
      Form4.Caption := 'О JustPad';
      Form4.Button14.Caption := 'Закрыть';
      editingTranslation := 'Редактирую ';
      Form4.Label2.Caption :=
        'JustPad - очень простой текстовый редактор написанный на Free Pascal.'
        +
        #13 + #13 + 'Разаработали KATAR(-github) и egfilin' + #13 +
        'Сайта пока нет, но скоро будет!' + #13 +
        'Репозиторий на GitHub: https://github.com/workingDT/JustPad'#10#13'Пишите нам в Discord: KATAR#1674 и egfilin#0001';
      //установка русского окончена
    end
    else
    begin

    end;
  end
  else
  begin

  end;

  //проверка шрифта поехала!
  //гарнитура шрифта
  if FileExists('font.conf') then
  begin
    Reset(fontfamilyFile);
    Read(fontfamilyFile, fontfamily);
    CloseFile(fontfamilyFile);
    Memo1.Font.Name := fontfamily;
    Form2.FontDialog1.Font.Name := fontfamily;
  end;
  //конец гарнитуры

  //проверка размера
  if FileExists('fontSize.conf') then
  begin
    Reset(fontSizeFile);
    Read(fontSizeFile, fontSize);
    CloseFile(fontSizeFile);
    Memo1.Font.Size := StrToInt(fontSize);
    Form2.FontDialog1.font.size := StrToInt(fontsize);
  end;

  //проверка размера конец
  //конец проферки шрифта

  // параметр запуска (например - C:\>justpad.exe text.txt)
  if paramcount = 1 then
  begin
    memo1.Lines.loadfromfile(ParamStr(1));
    editableFile := ParamStr(1);
    Form1.Caption := editingTranslation + ParamStr(1);
  end;
  // параметров конец
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  editingTranslation := 'Editing ';
end;

procedure TForm1.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin

end;

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of String
  );
begin
  Memo1.Lines.LoadFromFile(FileNames[0]);
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    Rewrite(fontSizeFile);
    write(fontSizeFile, Memo1.Font.Size);
    CloseFile(fontSizeFile);
end;

procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if (ssCtrl in Shift) then
  begin
    Memo1.Font.Size:=Memo1.Font.Size-2;
  end;
end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if (ssCtrl in Shift) then
  begin
    Memo1.Font.Size:=Memo1.Font.Size+2;
  end;
end;


procedure TForm1.Memo1Change(Sender: TObject);
begin
  if (language = 'EN') then
    StatusBar1.Panels.Items[0].Text := 'Total symbols: ' + IntToStr(Length(Memo1.Text));
  if (language = 'RU') then
    StatusBar1.Panels.Items[0].Text :=
      'Количество символов: ' + IntToStr(Length(Memo1.Text));
end;


procedure TForm1.Memo1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin

end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin

  if OpenDialog1.Execute then
  begin
    editableFile := OpenDialog1.FileName;
    Memo1.Lines.LoadFromFile(editableFile);
    Form1.Caption := editingTranslation + editableFile;
  end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  if (editableFile = '') then
  begin
    if SaveDialog1.Execute then
    begin
      editableFile := SaveDialog1.FileName;
      Memo1.Lines.SaveToFile(editableFile);
      Form1.Caption := editingTranslation + editableFile;
    end;
  end
  else
  begin
    Memo1.Lines.SaveToFile(editableFile);
  end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    editableFile := SaveDialog1.FileName;
    Memo1.Lines.SaveToFile(editableFile);
    Form1.Caption := editingTranslation + editableFile;
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

procedure TForm1.SaveDialog1Close(Sender: TObject);
begin

end;

end.
