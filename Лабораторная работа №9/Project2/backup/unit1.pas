unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    ButtonMatrixCreate: TButton;
    ButtonMatrixFill: TButton;
    ButtonMatrixClear: TButton;
    ElementSumName: TLabel;
    MaxElementName: TLabel;
    MinElementName: TLabel;
    ElementSum: TLabel;
    MaxElement: TLabel;
    MinElement: TLabel;
    NEdit: TEdit;
    MEdit: TEdit;
    MatrixSizeLabel: TLabel;
    Matrix: TStringGrid;
    ColsSums: TStringGrid;
    procedure ButtonMatrixCreateClick(Sender: TObject);
    procedure MatrixKeyPress(Sender: TObject; var Key: char);
    procedure MEditKeyPress(Sender: TObject; var Key: char);
    procedure NEditKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

var N,M,matr_max,matr_min,matr_sum:Integer;

procedure TForm1.ButtonMatrixCreateClick(Sender: TObject);
Var I,J:Byte;
begin
If (NEdit.Text<>'') and (MEdit.Text<>'') then
begin
  NEdit.Enabled:=False;
  MEdit.Enabled:=False;
  ButtonMatrixCreate.Enabled:=False;
  ButtonMatrixFill.Enabled:=True;
  ButtonMatrixClear.Enabled:=True;

  N:=StrToInt(NEdit.Text);
  M:=StrToInt(MEdit.Text);

  Matrix.RowCount:=N+1;
  Matrix.ColCount:=M+1;
  //Matrix.Height:=(Matrix.DefaultRowHeight+2) * (N+1);
  //Matrix.Width:=(Matrix.DefaultColWidth+2) * (M+1);

  ColsSums.ColCount:=Matrix.ColCount - 1;

  Matrix.Visible:=True;
  ColsSums.Visible:=True;

  For I:=1 to N do
  Matrix.Cells[0,I]:=IntToStr(I);

  For J:=1 to M do
  begin
    Matrix.Cells[J,0]:=IntToStr(J);
    ColsSums.Cells[(J-1),0]:=IntToStr(J);
    ColsSums.Cells[(J-1),1]:='0';
  end;
end
else ShowMessage('Заполните размеры матрицы');
end;

procedure TForm1.MatrixKeyPress(Sender: TObject; var Key: char);
Var I,I_T,J:Byte;
begin
Case Key of '0'..'9':;
#8:;
#13:
  If Matrix.Col<Matrix.ColCount-1 then
  Matrix.Col:=Matrix.Col+1; else Key:=Chr(0);
end;

matr_max:=StrToInt(Matrix.Cells[1,1]);
matr_min:=StrToInt(Matrix.Cells[1,1]);
matr_sum:=0;

For I:=1 to N do
    For J:=1 to M do
    begin
      matr_sum:=matr_sum + StrToInt(Matrix.Cells[J,I]);
      If StrToInt(Matrix.Cells[J,I])>matr_max then matr_max:=StrToInt(Matrix.Cells[J,I]);
      If StrToInt(Matrix.Cells[J,I])<matr_min then matr_min:=StrToInt(Matrix.Cells[J,I]);

      For I_T:=1 to N do
      ColsSums.Cells[(J-1), 1]:=IntToStr(StrToInt(ColsSums.Cells[(J-1), 1]) + StrToInt(Matrix.Cells[J,I]));
    end;

ElementSum.Caption:=IntToStr(matr_sum);
MaxElement.Caption:=IntToStr(matr_max);
MinElement.Caption:=IntToStr(matr_min);
end;

procedure TForm1.MEditKeyPress(Sender: TObject; var Key: char);
begin
 case Key of '0'..'9': ;
  #13: ButtonMatrixCreate.SetFocus;
  else Key:=Chr(0);
  end;
end;



procedure TForm1.NEditKeyPress(Sender: TObject; var Key: char);
begin
  case Key of '0'..'9': ;
  #13: MEdit.SetFocus;
  else Key:=Chr(0);
  end;
end;

end.

