unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Head: TLabel;
    RedLabel: TLabel;
    GreenLabel: TLabel;
    BlueLabel: TLabel;
    RedPanel: TPanel;
    GreenPanel: TPanel;
    BluePanel: TPanel;
    FinalColorPanel: TPanel;
    RedBar: TScrollBar;
    GreenBar: TScrollBar;
    BlueBar: TScrollBar;
    procedure BlueBarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GreenBarChange(Sender: TObject);
    procedure RedBarChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  BluePanel.Color:=RGBToColor(0,0,BlueBar.Position);
  BlueLabel.Caption:=IntToStr(BlueBar.Position)+','+IntToHex(BlueBar.Position,2);

  GreenPanel.Color:=RGBToColor(0,GreenBar.Position,0);
  GreenLabel.Caption:=IntToStr(GreenBar.Position)+','+IntToHex(GreenBar.Position,2);

  RedPanel.Color:=RGBToColor(RedBar.Position,0,0);
  RedLabel.Caption:=IntToStr(RedBar.Position)+','+IntToHex(RedBar.Position,2);

   FinalColorPanel.Color:=RGBToColor(RedBar.Position,GreenBar.Position,BlueBar.Position);
end;

procedure TForm1.BlueBarChange(Sender: TObject);
begin
  BluePanel.Color:=RGBToColor(0,0,BlueBar.Position);
  BlueLabel.Caption:=IntToStr(BlueBar.Position)+','+IntToHex(BlueBar.Position,2);
  FinalColorPanel.Color:=RGBToColor(RedBar.Position,GreenBar.Position,BlueBar.Position);
end;

procedure TForm1.GreenBarChange(Sender: TObject);
begin
  GreenPanel.Color:=RGBToColor(0,GreenBar.Position,0);
  GreenLabel.Caption:=IntToStr(GreenBar.Position)+','+IntToHex(GreenBar.Position,2);
  FinalColorPanel.Color:=RGBToColor(RedBar.Position,GreenBar.Position,BlueBar.Position);
end;

procedure TForm1.RedBarChange(Sender: TObject);
begin
  RedPanel.Color:=RGBToColor(RedBar.Position,0,0);
  RedLabel.Caption:=IntToStr(RedBar.Position)+','+IntToHex(RedBar.Position,2);
  FinalColorPanel.Color:=RGBToColor(RedBar.Position,GreenBar.Position,BlueBar.Position);
end;

end.

