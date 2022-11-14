unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    Quit: TBitBtn;
    Ex1: TLabel;
    Ex2: TLabel;
    Ex3: TLabel;
    Ex4: TLabel;
    Ex5: TLabel;
    Ex1Answer: TRadioGroup;
    Ex2Answer: TRadioGroup;
    Ex3Answer: TRadioGroup;
    Ex4Answer: TRadioGroup;
    Ex5Answer: TRadioGroup;
    MarkPanel: TPanel;
    procedure Ex1AnswerClick(Sender: TObject);
    procedure Ex2AnswerClick(Sender: TObject);
    procedure Ex3AnswerClick(Sender: TObject);
    procedure Ex4AnswerClick(Sender: TObject);
    procedure Ex5AnswerClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

var SUM:byte;

{ TForm1 }

procedure TForm1.Ex1AnswerClick(Sender: TObject);
begin
  SUM:=0;

  If Ex1Answer.ItemIndex=0 then SUM:=SUM+1;
end;

procedure TForm1.Ex2AnswerClick(Sender: TObject);
begin
  If Ex2Answer.ItemIndex=2 then SUM:=SUM+1;
end;

procedure TForm1.Ex3AnswerClick(Sender: TObject);
begin
  If Ex3Answer.ItemIndex=1 then SUM:=SUM+1;
end;

procedure TForm1.Ex4AnswerClick(Sender: TObject);
begin
  If Ex4Answer.ItemIndex=3 then SUM:=SUM+1;
end;

procedure TForm1.Ex5AnswerClick(Sender: TObject);
begin
  If Ex5Answer.ItemIndex=2 then SUM:=SUM+1;

  Case SUM of
  0:MarkPanel.Caption:='0. Плохо!';
  1:MarkPanel.Caption:='1. Плохо!';
  2:MarkPanel.Caption:='2. Плохо!';
  3:MarkPanel.Caption:='3. Удволетворительно!';
  4:MarkPanel.Caption:='4. Хорошо!';
  5:MarkPanel.Caption:='5. Отлично!';
  end;

  ShowMessage('Конец теста');
end;

end.

