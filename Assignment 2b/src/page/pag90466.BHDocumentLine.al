page 90466 "BH Document Line"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "BH Document Line";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.") { ApplicationArea = All; }
                field("Example Description"; "Example Description") { ApplicationArea = All; }
                field("Example No."; "Example No.") { ApplicationArea = All; }
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