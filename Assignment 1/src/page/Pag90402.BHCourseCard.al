page 90402 "BH Course Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Course Card';
    SourceTable = "BH Course";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Code) { ApplicationArea = All; }
                field(Name; Name) { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
                field(Duration; Duration) { ApplicationArea = All; }
                field(Price; Price) { ApplicationArea = All; }
                field(Type; Type) { ApplicationArea = All; }
                field(Active; Active) { ApplicationArea = All; }
                field("Instructor Code"; "Instructor Code") { ApplicationArea = All; }
                field("Instructor Name"; "Instructor Name") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Resource Card")
            {
                ApplicationArea = All;
                RunObject = page "Resource Card";
                RunPageLink = "No." = field("Instructor Code");
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
        }
    }
}