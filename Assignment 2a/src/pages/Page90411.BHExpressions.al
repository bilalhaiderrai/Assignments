page 90411 "BH Expressions"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Expressions';
    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(Value1; Value1)
                {
                    ApplicationArea = All;
                }
                field(Value2; Value2)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                field(Result; Result)
                {
                    ApplicationArea = All;
                }

            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'Execute';
                trigger OnAction()
                begin
                    If Value1 > Value2 then
                        Result := true
                    else
                        Result := false;
                end;
            }
        }
    }
    var
        Value1: Integer;
        Value2: Integer;
        Result: Boolean;
}