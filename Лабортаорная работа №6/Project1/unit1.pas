unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
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

end;

procedure TForm1.BlueBarChange(Sender: TObject);
begin
  BluePanel.Color:=RGBToColor(0,0,BlueBar.Position);
  BlueLabel.Caption:=IntToStr(BlueBar.Position);
  FinalColorPanel.Color:=RGBToColor(RedBar.Position,GreenBar.Position,BlueBar.Position);
end;

procedure TForm1.GreenBarChange(Sender: TObject);
begin
  GreenPanel.Color:=RGBToColor(0,GreenBar.Position,0);
  GreenLabel.Caption:=IntToStr(GreenBar.Position);
  FinalColorPanel.Color:=RGBToColor(RedBar.Position,GreenBar.Position,BlueBar.Position);
end;

procedure TForm1.RedBarChange(Sender: TObject);
begin
  RedPanel.Color:=RGBToColor(RedBar.Position,0,0);
  RedLabel.Caption:=IntToStr(RedBar.Position);
  FinalColorPanel.Color:=RGBToColor(RedBar.Position,GreenBar.Position,BlueBar.Position);
end;

end.

