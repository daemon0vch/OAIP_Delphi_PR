unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListBox1: TListBox;
    procedure ListBox1KeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ListBox1KeyPress(Sender: TObject; var Key: char);
begin
    if key=#13 then
       Case Listbox1.ItemIndex of
            0: Label3.Caption:='черный 000000';
            1: Label3.Caption:='белый FFFFFF';
            2: Label3.Caption:='красный FF0000';
            3: Label3.Caption:='зеленый 00FF00';
            4: Label3.Caption:='бирюзовый 00FFFF';
            5: Label3.Caption:='синий 0000FF';
            6: Label3.Caption:='фиолетовый FF00FF';
            7: Label3.Caption:='желтый FFFF00';
            8: Label3.Caption:='коричневый 996633';
            9: Label3.Caption:='оранжевый FF8000';
            10: Label3.Caption:='лиловый FF0008';
            11: Label3.Caption:='серый 999999';
       end;
end;

end.

