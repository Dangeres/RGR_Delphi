unit NumEdit2;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls,Windows, Messages, Graphics, Forms, Dialogs;

type
  TIntEdit = class(TEdit)
  private
    { Private declarations }
    function getvalue:int64;
    procedure setvalue(NewVal:Int64);
  protected
    { Protected declarations }
    procedure Change; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; proto:TEdit); reintroduce;
  published
    { Published declarations }
    property Value: Int64 read GetValue write SetValue;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BiDiMode;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property Ctl3D;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property MaxLength;
    property OEMConvert;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MyShit', [TIntEdit]);
end;

constructor TIntEdit.create(Aowner:TComponent; proto:TEdit);
begin
  inherited create(aowner);
  proto.Text:='0';
  {assign TEdit prototype to self}
  value:=strtoint(proto.text);
  anchors:=proto.anchors;
  height:=proto.height;
  width:=proto.width;
  left:=proto.left;
  top:=proto.top;
  parent:=proto.parent;
  font:=proto.font;
  color:=proto.color;
  proto.visible:=false;
  OnChange:=proto.onchange;
  OnClick:=proto.onclick;
  OnContextPopup:=proto.oncontextpopup;
  OnDblClick:=proto.OnDblClick;
  OnDragDrop:=proto.ondragdrop;
  OnDragOver:=proto.ondragover;
  OnEndDock:=proto.onenddock;
  OnEndDrag:=proto.onenddrag;
  OnEnter:=proto.onenter;
  OnExit:=proto.onexit;
  OnKeyDown:=proto.onkeydown;
  OnKeyPress:=proto.onkeypress;
  OnKeyUp:=proto.onkeyup;
  OnMouseDown:=proto.onmousedown;
  OnMouseMove:=proto.onmousemove;
  OnMouseUp:=proto.onmouseup;
  OnStartDock:=proto.onstartdock;
  OnStartDrag:=proto.onstartdrag;
end;

function TIntEdit.getvalue:int64;
begin
  try
  result:=StrToInt(text);
  except
    on E : Exception do
      result := 0;
  end;
end;

procedure TIntEdit.Setvalue(Newval:int64);
begin
  text:=IntToStr(newval);
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
    if not CharInSet(temp[i],['0'..'9','.']) then  begin
      temp[i] := #0;
    end;
    if temp[i]='.' then begin
      if not dot then dot:=true
      else temp[i] := #0;
    end;
    Text := temp;
  end
  else
  for i:=1 to Length(Text) do begin
    if not CharInSet(temp[i],['0'..'9','.']) then  begin
      temp[i] := #0;
    end;
    if temp[i]='.' then begin
      if not dot then dot:=true
      else temp[i] := #0;
    end;
    Text := temp;
  end;
end;

end.
