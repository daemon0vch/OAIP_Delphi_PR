unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if Key=#13 then
  Begin
  Label2.Caption:=Edit1.Text + ', ты любишь читать?';

  Button1.Visible:=True;
  Button2.Visible:=True;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  
  Edit1.Enabled:=False;

  Label3.Caption:='Почему же? Надо читать.';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Caption:='';
  Edit1.Enabled:=True;

  Label1.Caption:='';
  Label2.Caption:='';

  Button1.Visible:=False;
  Button2.Visible:=False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  
  Edit1.Enabled:=False;

  Label3.Caption:='Молодец!';
end;

end.

