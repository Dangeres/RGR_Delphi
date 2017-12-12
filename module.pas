unit NumEdit2;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls,Windows, Messages, Graphics, Forms, Dialogs;

type
  TIntEdit = class(TEdit)
  private
    { Private declarations }
    function getvalue:Double;
    procedure setvalue(NewVal:Double);
  protected
    { Protected declarations }
    procedure Change;override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property Value: Double read GetValue write SetValue;
  end;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MyShit', [TIntEdit]);
end;

constructor TIntEdit.create(Aowner:TComponent);
begin
  inherited create(aowner);
  Text:='0,0';
end;

function TIntEdit.getvalue: Double;
begin
  try
  result:=StrToFloat(Text);
  except
    on E : Exception do
      result := 0.0;
  end;
end;

procedure TIntEdit.Setvalue(Newval:Double);
begin
  Text := FloatToStr(newval);
end;

procedure TIntEdit.Change;
var
i:integer;
dot:boolean;
temp:string;
begin
  dot:=false;
  temp := Text;
  if Length(temp)>0 then
  if temp[1]='-' then
  for i:=2 to Length(temp) do begin
    if not CharInSet(temp[i],['0'..'9',',']) then  begin
      temp[i] := #0;
    end;
    if temp[i]=',' then begin
      if not dot then dot:=true
      else temp[i] := #0;
    end;
  end
  else
  for i:=1 to Length(Text) do begin
    if not CharInSet(temp[i],['0'..'9',',']) then  begin
      temp[i] := #0;
    end;
    if temp[i]=',' then begin
      if not dot then dot:=true
      else temp[i] := #0;
    end;
  end;

  Text := temp;
end;

end.
