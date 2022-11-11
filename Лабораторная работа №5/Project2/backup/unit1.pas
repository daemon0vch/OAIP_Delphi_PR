unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    bb1: TBitBtn;
    bodyWeightIndexMessage: TLabel;
    Retry: TBitBtn;
    Calculate: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    WeightLabel: TLabel;
    RostLabel: TLabel;
    Label3: TLabel;
    Head: TLabel;
    procedure CalculateClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RetryClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
var bodyWeightIndex,factW,optW,Rost,Delta:Real;
procedure TForm1.CalculateClick(Sender: TObject);
begin
  Edit1.Enabled:=False;
  Edit2.Enabled:=False;

  try factW:=StrToFloat(Edit1.Text) except
      ShowMessage('Вес введен неверно');
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      Form1.ActiveControl:=Edit1;
      Exit;
  end;

  try Rost:=StrToFloat(Edit2.Text) except
      ShowMessage('Рост введен неверно');
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      Form1.ActiveControl:=Edit2;
      Exit;
  end;

  if factW<0 then
     begin
        ShowMessage('Вес не может быть меньше 0!');
        Edit1.Enabled:=True;
        Edit2.Enabled:=True;
        Form1.ActiveControl:=Edit1;
        Exit;
     end;

  if Rost<0 then
     Begin
       ShowMessage('Рост не может быть меньше 0!');
       Edit1.Enabled:=True;
       Edit2.Enabled:=True;
       Form1.ActiveControl:=Edit2;
       Exit;
     end;

  optW:=Rost-100;
  Delta:=abs(factW-optW);

  if optW=factW then Label3.Caption:='Ваш вес идеален';
  if optW>factW then Label3.Caption:='Вам надо поправиться на '+ FloatToStr(Delta)+ ' кг.'
  else Label3.Caption:='Вам надо похудеть на '+ FloatToStr(Delta)+ ' кг.';

  bodyWeightIndex:= factW / ((Rost/100) * (Rost/100));

  if bodyWeightIndex<18 then bodyWeightIndexMessage.Caption:='Большой недовес';
  if bodyWeightIndex >= 18 then
  begin
       if bodyWeightIndex < 20 then bodyWeightIndexMessage.Caption:='Маловато и небезопасно, можно получить истощение'
  end;
  if bodyWeightIndex >= 20 then
  begin
       if bodyWeightIndex <= 25 then bodyWeightIndexMessage.Caption:='Идеально';
  end;
  if bodyWeightIndex >= 26 then
  Begin
      if bodyWeightIndex <=30 then bodyWeightIndexMessage.Caption:='Легкий перебор';
  end;
  if bodyWeightIndex > 30 then bodyWeightIndexMessage.Caption:='Срочно нужно худеть';
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
    if Edit1.Text='' then
    begin
       Calculate.Enabled:=False;
       RostLabel.Visible:=False;
       Edit2.Visible:=False;
    end
    else
    begin
       Calculate.Enabled:=True;
       RostLabel.Visible:=True;
       Edit2.Visible:=True;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.RetryClick(Sender: TObject);
begin
  Label3.Caption:='';
  bodyWeightIndexMessage.Caption:='';

  Edit1.Enabled:=True;
  Edit1.Text:='';

  Edit2.Enabled:=True;
  Edit2.Text:='';
end;

end.

