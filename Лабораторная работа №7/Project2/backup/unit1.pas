unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    Quit: TBitBtn;
    Retry: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1KeyPress(Sender: TObject; var Key: char);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox2KeyPress(Sender: TObject; var Key: char);
    procedure RetryClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
var Num1, Num2, CountR, CountC, CountN:byte;
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  CountN:=4;
  CountC:=0;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  Num1:=ListBox1.ItemIndex;
  ListBox2.Enabled:=True;

  ListBox1.Items.Delete(Num1);
  ListBox1.Items.Insert(Num1, '');

  Form1.ActiveControl:=ListBox2;
  ListBox1.Enabled:=False;

end;

procedure TForm1.ListBox1KeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
  begin
    Num1:=ListBox1.ItemIndex;
    ListBox2.Enabled:=True;

    ListBox1.Items.Delete(Num1);
    ListBox1.Items.Insert(Num1, '');

    Form1.ActiveControl:=ListBox2;
    ListBox1.Enabled:=False;
  end;
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
   case ListBox2.ItemIndex of
            0: Num2:=2;
            1: Num2:=1;
            2: Num2:=3;
            3: Num2:=0;
       end;

      if Num1=Num2 then
      Begin
          Label4.Caption:='Верно';
          CountR:=CountR+1;
      end
      else Label4.Caption:='Ошибка!';

      CountC:=CountC+1;

      if CountC=CountN then
      begin
          ShowMessage('Тест окончен. Баллы: ' + FloatToStr(CountR/CountN * 5) + '. Правильных ответов: ' + IntToStr(CountR));
      end;

      ListBox2.ItemIndex:=-1;

      ListBox1.Enabled:=True;
      Form1.ActiveControl:=ListBox1;
      ListBox2.Enabled:=False;
end;

procedure TForm1.ListBox2KeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
  Begin
       case ListBox2.ItemIndex of
            0: Num2:=2;
            1: Num2:=1;
            2: Num2:=3;
            3: Num2:=0;
       end;

      if Num1=Num2 then
      Begin
          Label4.Caption:='Верно';
          CountR:=CountR+1;
      end
      else Label4.Caption:='Ошибка!';

      CountC:=CountC+1;

      if CountC=CountN then
      begin
          ShowMessage('Тест окончен. Баллы: ' + FloatToStr(CountR/CountN * 5) + '. Правильных ответов: ' + IntToStr(CountR));
      end;

      ListBox2.ItemIndex:=-1;

      ListBox1.Enabled:=True;
      Form1.ActiveControl:=ListBox1;
      ListBox2.Enabled:=False;
  end;
end;

procedure TForm1.RetryClick(Sender: TObject);
begin
  CountC:=0;
  CountR:=0;
  Num1:=-1;
  Num2:=-1;

  ListBox1.ItemIndex:=-1;
  ListBox2.ItemIndex:=-1;
end;

end.

