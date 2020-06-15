page 90403 "BH Course List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "BH Course";
    Caption = 'Course List';
    Editable = false;
    CardPageId = "BH Course Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field(Code; Code) { }
                field(Name; Name) { }
                field(Description; Description) { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}