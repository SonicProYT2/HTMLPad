unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  Menus, ExtDlgs, ExtCtrls, Unit2, Unit4, Unit5, Unit7;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem110: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
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

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    //procedure MenuItem19Click(Sender: TObject);
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
  languageFile: text;
  languageCheck: string;
  language: string;
  fontfamilyFile: text;
  fontfamily: string;
  fontSizeFile: text;
  fontSize: string;
  isLanguageCfgExists: boolean;
  editingTranslation: string;
  backgroundColorFile: text;
  backgroundColor: string;
  textColorFile:text;
  textColor: string;
  wordwrapfile: text;
  wordwrap: string;
  themeFile: text;
  theme: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  editableFile:='';
  Memo1.Text:='';
  OpenDialog1.FileName:='';
  SaveDialog1.FileName:='';
  If (language = 'EN') then Form1.Caption:='New File | JustPad 1.3';
  If (language = 'UA') then Form1.Caption:='Новий файл | JustPad 1.3';
  If (language = 'RU') then Form1.Caption:='Новый файл | JustPad 1.3';
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  Memo1.Text:='<html>'+#13+#9+'<head>'+#13+#9+#9+'<title>TITLE<title>'+#13+#9+#9+'<meta charset="utf-8">'+#13+#9+'<style>'+#13+#9+#9+#9+''+#13+#9+'</style>'+#13+#9+'<script>'+#13+#9+#9+''+#13+#9+'</script>'+#13+#9+'</head>'+#13+#9+'<body>'+#13+#9+#9+''+#13+#9+'</body>'+#13+'</html>';
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  Memo1.Text:='@echo off'+#13+'title >> WINDOWS TITLE <<'+#13+'color >> COLOR (for help use "color help" in cmd) <<';
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  Memo1.Text:='program Project;'+#13+#9+'begin'+#13+#9+#9+''+#13+#9+'end.';
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
begin
  Memo1.Text:='[autorun]'+#13+'open=Application.exe'+#13+'label=Drive'+#13+'shellexecute=Readme.txt'+#13+'action=Open My program'+#13+'icon=Application.exe';
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  theme:='dark';
  editableFile:='';
  languageCheck:='';
  language:='';
  fontfamily:='';
  fontSize:='';
  backgroundColor:='';
  textColor:='';
  isLanguageCfgExists:=false;

  AssignFile(fontfamilyFile, 'font.conf');
  AssignFile(fontSizeFile, 'fontSize.conf');
  AssignFile(languageFile, 'language.conf');
  AssignFile(backgroundColorFile, 'bgColor.conf');
  AssignFile(textColorFile, 'txColor.conf');
  AssignFile(wordWrapFile, 'isWordWrap.conf');
  AssignFile(themeFile, 'theme.conf');

  //configuring word wrap
  If FileExists('isWordWrap.conf') then
  begin
     Reset(wordwrapfile);
     Read(wordwrapfile, Wordwrap);
     closefile(wordwrapfile);
     If (wordwrap = 'true') then memo1.WordWrap:=true else memo1.WordWrap:=false;
     end;

  //configuring theme
  if FileExists('bgColor.conf') then
  begin
      Reset(backgroundColorFile);
      Read(backgroundColorFile, backgroundColor);
      CloseFile(backgroundColorFile);
      Memo1.Color:=StringToColor(backgroundColor);
      Form7.ColorDialog1.Color := StringToColor(backgroundColor);
  end;

  //configuring font
  If (FileExists('txColor.conf')) then
  begin
      Reset(textColorFile);
      Read(textColorFile, textColor);
      CloseFile(textColorFile);
      Memo1.Font.Color:=StringToColor(textColor);
      Form7.FontDialog1.Font.Color := StringToColor(textColor);
  end;
  //lang file check
  if not FileExists('language.conf') then
  begin
           while language='' do
           begin
                Form5.ShowModal;
           end;

           Rewrite(languageFile);
           write(languageFile, language);
           closefile(languageFile);
           end;
  If FileExists('language.conf') then
      begin
         Reset(languageFile);
         Read(languageFile, languageCheck);
         If (languageCheck = 'RU') then language:='RU';
         If (languageCheck = 'EN') then language:='EN';
         If (languageCheck = 'UA') then language:='UA';


         If (languageCheck <> 'RU') and (languageCheck <> 'EN') and (languageCheck <> 'UA') then
             begin
                language:='EN';
             end;


         //ukrainian translation
         if (language = 'UA') then
             begin
      MenuItem1.Caption:= 'Файл';
      MenuItem4.Caption:='Відкрити';
      MenuItem5.Caption:='Зберегти';
      MenuItem6.Caption:='Зберегти як';
      MenuItem8.Caption:='Закрити';
      MenuItem9.Caption:='Інструменти';
      MenuItem10.Caption:='Налаштування';
      MenuItem3.Caption:='Про програму';
      MenuItem2.Caption:='Про JustPad';
      SaveDialog1.Title := 'Зберегти файл як ';
      OpenDialog1.Title:='Відкрити файл';
      Form2.CheckBox1.Caption:='Перенесення рядків';
      //Form2.Button1.Caption:='Шрифт';
      //Form2.Button3.Caption:='Колір фону';
      //Form2.FontDialog1.title:='Шрифт ';
      //Form2.ColorDialog1.title:='Колір фону';
      //Form2.Button3.Caption:='Колір фону';
      Form2.Label1.Caption:='Для зміни мови'+#13+'перезавантажте JustPad.';
      Form2.Caption:='Налаштування';
      Form1.Caption:='Новий файл ';
      MenuItem12.Caption:='Завантажити шаблон для...';
      MenuItem14.Caption:='Документа HTML';
      MenuItem15.Caption:='Скрипта Batch';
      MenuItem16.Caption:='Файлу вихідного коду Pascal';
      editingTranslation:='Редагую ';
      Form4.Button15.Caption:='Ліцензія';
      StatusBar1.Panels.Items[0].Text:='Символів: 0';
      Form4.Button14.Caption:='Закрити';
      Form4.Caption:='Про JustPad';
      Form4.Button1.Caption:='Автор іконки';
      MenuItem110.Caption:='Новий';
      Form4.Label2.Caption:='JustPad - це дуже простий текстовий редактор написаний на Free Pascal.'+#13+#13+'Зробив KATAR і egfilin'+#13+'Репозиторій на GitHub: https://github.com/KATAR-github/'+#13+'Наші Discord''і:SHCHEGLAKOF#4920 і egfilin#0657'+#13+#13+'Дата складання: 23.11.2020';
             end;

         If (language = 'RU') then
            begin
                 //russian translation

      MenuItem1.Caption:= 'Файл';
      MenuItem4.Caption:='Открыть';
      MenuItem5.Caption:='Сохранить';
      MenuItem6.Caption:='Сохранить как';
      MenuItem8.Caption:='Закрыть';
      MenuItem9.Caption:='Инструменты';
      MenuItem10.Caption:='Настройки';
      MenuItem110.Caption:='Новый';
      MenuItem3.Caption:='О программе';
      MenuItem2.Caption:='О JustPad';
      MenuItem12.Caption:='Загрузить шаблон для...';
      MenuItem14.Caption:='Документа HTML';
      MenuItem15.Caption:='Скрипта Batch';
      MenuItem16.Caption:='Файла исходного кода Pascal';
      SaveDialog1.Title := 'Сохранить файл как';
      OpenDialog1.Title:='Открыть файл';
      Form2.CheckBox1.Caption:='Перенос строк';
      //Form2.Button1.Caption:='Шрифт';
      //Form2.Button3.Caption:='Цвет фона';
      //Form2.FontDialog1.title:='Шрифт';
      //Form2.ColorDialog1.title:='Цвет фона';
      //Form2.Button3.Caption:='Цвет фона';
      Form2.Label1.Caption:='Для смены языка'+#13+'перезагрузите JustPad.';
      StatusBar1.Panels.Items[0].Text:='Символов: 0';
      Form2.Caption:='Настройки';
      Form1.Caption:='Новый файл ';
      Form4.Caption:='О JustPad';
      Form4.Button14.Caption:='Закрыть';
      editingTranslation:='Редактирую ';
      Form4.Button15.Caption:='Лицензия';
      Form4.Button1.Caption:='Автор иконки';
      Form4.Label2.Caption:='JustPad - очень простой текстовый редактор написанный на Free Pascal.'+#13+#13+'Разаработали KATAR и egfilin'+#13+'Репозиторий на GitHub: https://github.com/KATAR-github/JustPad'#10#13'Наши Discord''ы: SHCHEGLAKOF#4920 и egfilin#0657'+#13+#13+'Дата сборки: 23.11.2020';
            end



         else
            begin

        //chinese will appear wildly, we all don't know when
            end;
      end
        else
      begin


      end;

      //font check
                 //font check type
                 If FileExists('font.conf') then
                    begin
                       Reset(fontfamilyFile);
                       read(fontfamilyFile, fontfamily);
                       CloseFile(fontfamilyFile);
                       Memo1.Font.name := fontfamily;
                       Form7.FontDialog1.Font.Name:=fontfamily;
                    end;


                    //font check size
                    If FileExists('fontSize.conf') then
                       begin
                          Reset(fontSizeFile);
                          read(fontSizeFile, fontSize);
                          CloseFile(fontSizeFile);
                          Memo1.Font.Size := StrToInt(fontSize);
                          Form7.FontDialog1.font.size := StrToInt(fontsize);
                       end;


      if paramcount=1 then
     begin
      memo1.lines.loadfromfile(paramstr(1));
      editableFile:=ParamStr(1);
      Form1.Caption:=editingTranslation+ParamStr(1)
     end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    editingTranslation:='Editing ';
end;


procedure TForm1.Memo1Change(Sender: TObject);
begin
    If (language = 'RU') then StatusBar1.Panels.Items[0].Text:='Символов: '+inttostr(Length(Memo1.text));
    If (language = 'UA') then StatusBar1.Panels.Items[0].Text:='Символів:'+inttostr(Length(Memo1.text));
    If (language = 'EN') then StatusBar1.Panels.Items[0].Text:='Characters: '+inttostr(Length(Memo1.text));
end;

procedure TForm1.Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
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
       editableFile:= OpenDialog1.FileName;
       Memo1.Lines.LoadFromFile(editableFile);
       Form1.Caption:=editingTranslation+editableFile;
     end;
end;
procedure MenuItem19Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  If (editableFile='') then
  begin
      if SaveDialog1.Execute then
     begin
       editableFile:= SaveDialog1.FileName;
       Memo1.Lines.SaveToFile(editableFile);
       Form1.Caption:=editingTranslation+editableFile;
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
       editableFile:= SaveDialog1.FileName;
       Memo1.Lines.SaveToFile(editableFile);
       Form1.Caption:=editingTranslation+editableFile;
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

