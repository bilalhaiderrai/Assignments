page 90461 "BH Example setup"
{
    PageType = Card;
    Caption = 'Exmple Setup';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BH Example Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Example Nos."; "Example Nos.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage();
    begin
        IF NOT GET THEN INSERT;
    end;
}