unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
var factW,optW,Rost,Delta:Real;
procedure TForm1.Button1Click(Sender: TObject);
begin
  try factW:=StrToFloat(Edit1.Text) except
      ShowMessage('Вес введен неверно');
      Form1.ActiveControl:=Edit1;
  end;

  try Rost:=StrToFloat(Edit2.Text) except
      ShowMessage('Рост введен неверно');
      Form1.ActiveControl:=Edit2;
  end;

  optW:=Rost-100;
  Delta:=abs(factW-optW);

  if optW=factW then Label3.Caption:='Ваш вес идеален';
  if optW>factW then Label3.Caption:='Вам надо поправиться на '+ FloatToStr(Delta)+ ' кг.'
  else Label3.Caption:='Вам надо похудеть на '+ FloatToStr(Delta)+ ' кг.';


end;

end.

