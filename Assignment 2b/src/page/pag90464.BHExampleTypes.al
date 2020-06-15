page 90464 "BH Example Types"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Example Types';
    SourceTable = "BH Example Types";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Code) { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
            }
        }
    }

}