page 90463 "BH Example List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "BH Example Master Data";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.") { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
                field("Example Type Code"; "Example Type Code") { ApplicationArea = All; }
            }
        }
    }
}